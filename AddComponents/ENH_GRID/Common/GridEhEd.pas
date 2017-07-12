{*******************************************************}
{                                                       }
{                       EhLib v1.5                      }
{              Design window for TDBGridEh              }
{                                                       }
{   Copyright (c) 1998, 1999 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}


unit GridEhEd;

{$I EhLib.Inc}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
{$IFDEF EH_LIB_4} ImgList,{$ENDIF}
  StdCtrls, ComCtrls, ToolWin, Menus, DBGridEh, DBGrids,
  DsgnIntf, DsgnWnds, LibIntf {, dbugintf};

type
  TDBGridEhColumnsEditor = class(TDesignWindow)
    ToolBar1: TToolBar;
    tbAddNew: TToolButton;
    tbDeleteSelected: TToolButton;
    ToolButton3: TToolButton;
    tbAddAllFields: TToolButton;
    tbRestoreDefaults: TToolButton;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    miAddNew: TMenuItem;
    miDeleteSelected: TMenuItem;
    miAddAllFields: TMenuItem;
    miRestoreDefaults: TMenuItem;
    miSelectAll: TMenuItem;
    N1: TMenuItem;
    ListView1: TListView;
    tbMoveUp: TToolButton;
    tbMoveDown: TToolButton;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbAddNewClick(Sender: TObject);
    procedure tbDeleteSelectedClick(Sender: TObject);
    procedure tbAddAllFieldsClick(Sender: TObject);
    procedure tbRestoreDefaultsClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormResize(Sender: TObject);
    procedure miAddNewClick(Sender: TObject);
    procedure miDeleteSelectedClick(Sender: TObject);
    procedure miSelectAllClick(Sender: TObject);
    procedure miAddAllFieldsClick(Sender: TObject);
    procedure miRestoreDefaultsClick(Sender: TObject);
    procedure tbMoveUpClick(Sender: TObject);
    procedure tbMoveDownClick(Sender: TObject);
  private
    FDBGridEh:TDBGridEh;
    function CheckCollection: Boolean;
    procedure SetDBGridEh(const Value: TDBGridEh);
    procedure UpdateData;
    procedure Copy;
    procedure Cut;
    procedure Paste;
  protected
    function UniqueName(Component: TComponent): string; override;
    procedure Activated; override;
    { Private declarations }
  public
    procedure EditAction(Action: TEditAction); override;
    procedure FormModified; override;
    procedure FormClosed(Form: TCustomForm); override;
    function GetEditState: TEditState; override;
{$IFDEF EH_LIB_4} {Borland Delphi 4.0 or C++ Builder 4.0}
    procedure ComponentDeleted(Component: IPersistent); override;
{$ELSE}
    procedure ComponentDeleted(Component: TComponent); override;
{$ENDIF}

    property DBGridEh: TDBGridEh read FDBGridEh
         write SetDBGridEh;
    { Public declarations }
  end;


{ TDBGridEhColumnsProperty }

  TDBGridEhColumnsProperty = class(TPropertyEditor)
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

{ TDBGridEhEditor }

  TDBGridEhEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{ TDBGridEhFieldProperty }

  TDBGridEhFieldProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings);
    procedure GetValues(Proc: TGetStrProc); override;
  end;

var
  DBGridEhColumnsEditor: TDBGridEhColumnsEditor;

//procedure ShowItemsEditor({Designer: TDesigner;}
//  ADBGridEh: TDBGridEh);

implementation

{$R *.DFM}

{$IFDEF EH_LIB_4} {Borland Delphi 4.0 or C++ Builder 4.0}
type
  TDesigner = IDesigner;
  TFormDesigner = IFormDesigner;
{$ENDIF}

{$IFNDEF EH_LIB_5}
type
  TDesignerSelectionList = TComponentList;
{$ENDIF}


function FindEditor(ADBGridEh: TDBGridEh): TDBGridEhColumnsEditor;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do begin
    if Screen.Forms[I] is TDBGridEhColumnsEditor then begin
      if TDBGridEhColumnsEditor(Screen.Forms[I]).DBGridEh = ADBGridEh then
      begin
        Result := TDBGridEhColumnsEditor(Screen.Forms[I]);
        Break;
      end;
    end;
  end;
end;

procedure ShowItemsEditor(Designer: TDesigner;
  ADBGridEh: TDBGridEh);
var
  Editor: TDBGridEhColumnsEditor;
begin
  if ADBGridEh = nil then Exit;
  Editor := FindEditor(ADBGridEh);
  if Editor = nil then begin
    Editor := TDBGridEhColumnsEditor.Create(Application);
    try
      Editor.Designer := TFormDesigner(Designer);
      Editor.DBGridEh := ADBGridEh;
      Editor.Show;
    except
      Editor.Free;
      raise;
    end;
  end
  else begin
    Editor.Show;
    if Editor.WindowState = wsMinimized then
      Editor.WindowState := wsNormal;
  end;
end;


{ TDBGridColumnsEditor }

function TDBGridEhColumnsEditor.CheckCollection: Boolean;
begin
  Result := (DBGridEh <> nil) and (DBGridEh.Columns <> nil)
    and (Designer.Form <> nil);
end;

procedure TDBGridEhColumnsEditor.SetDBGridEh(const Value: TDBGridEh);
begin
  if FDBGridEh <> Value then begin
    FDBGridEh := Value;
    UpdateData;
  end;
end;

procedure TDBGridEhColumnsEditor.UpdateData;
var
  Empty,Modified: Boolean;
  i:Integer;
  ListItem: TListItem;
begin
  if CheckCollection then begin
    Caption := Format('Edition %s.Columns', [DBGridEh.Name]);
    Empty := DBGridEh.Columns.Count = 0;
  end
  else Empty := True;
  if Empty then begin
    ListView1.Items.Clear;
  end
  else begin
    Modified := False;
    if (DBGridEh.Columns.Count <> ListView1.Items.Count) then Modified := True;
    if (Modified = False) then
      for i := 0 to DBGridEh.Columns.Count - 1 do
        if (ListView1.Items[i].Data <> DBGridEh.Columns[i]) then begin
          Modified := True;
          Break;
        end;
    if (Modified = True) then begin
      ListView1.Items.BeginUpdate;
      ListView1.Items.Clear;
      try
        if (DBGridEh.Columns.State = csCustomized) then begin
           for i := 0 to DBGridEh.Columns.Count - 1 do begin
             ListItem := ListView1.Items.Add;
             ListItem.Caption := IntToStr(i) + ' - ' + DBGridEh.Columns[i].DisplayName;
             ListItem.Data := DBGridEh.Columns[i];
           end;
        end;
      finally
        ListView1.Items.EndUpdate;
      end;
    end else // Заголовок может поменяться когда меняют FieldName
      for i := 0 to DBGridEh.Columns.Count - 1 do ListView1.Items[i].Caption := IntToStr(i) + ' - ' + DBGridEh.Columns[i].DisplayName;
  end;
  ListView1Change(nil,nil,ctState);
end;

procedure TDBGridEhColumnsEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
  Free;
end;

procedure TDBGridEhColumnsEditor.FormCreate(Sender: TObject);
begin
  DBGridEh := nil;
  if NewStyleControls then Font.Style := [];
end;

procedure TDBGridEhColumnsEditor.tbAddNewClick(Sender: TObject);
begin
  DBGridEh.Columns.Add;
  UpdateData;
  Designer.Modified;
  ListView1.Items[ListView1.Items.Count-1].Selected := True;
  ListView1Change(nil,nil,ctState);
end;

procedure TDBGridEhColumnsEditor.tbDeleteSelectedClick(Sender: TObject);
var i,sel:Integer;
//  ListItem: TListItem;
  FComponents: TDesignerSelectionList;
begin
  sel := -1;
  if (ListView1.SelCount > 0) then begin
    FComponents := TDesignerSelectionList.Create;
    try
      DBGridEh.Columns.BeginUpdate;
      ListView1.Items.BeginUpdate;
      sel := ListView1.Items.IndexOf(ListView1.Selected);
      for i := ListView1.Items.Count - 1 downto 0 do
       if (ListView1.Items[i].Selected = True) and Assigned(ListView1.Items[i].Data) then begin
         FComponents.Add(TColumnEh(ListView1.Items[i].Data));
       end;
      ListView1.Items.Clear;

      for i := 0 to FComponents.Count - 1 do FComponents[i].Free;

    finally
      ListView1.Items.EndUpdate;
      DBGridEh.Columns.EndUpdate;
      FComponents.Free;
      Designer.Modified;
      if (ListView1.Items.Count > 0) then
        if (sel > ListView1.Items.Count - 1) then
           ListView1.Items[ListView1.Items.Count-1].Selected := True
        else
           ListView1.Items[sel].Selected := True;
      ListView1Change(nil,nil,ctState);
    end;
   end;
end;

procedure TDBGridEhColumnsEditor.tbAddAllFieldsClick(Sender: TObject);
var msgValue:Word;
    i:Integer;
    Col:TColumnEh;
begin
  if (DBGridEh.Columns.State = csDefault) then
    DBGridEh.Columns.State := csCustomized
  else begin
   if (DBGridEh.Columns.Count > 0) then begin
     msgValue := MessageDlg('Delete existing columns?',
                      mtConfirmation, [mbYes, mbNo, mbCancel], 0);
     case msgValue of
       mrYes: DBGridEh.Columns.Clear;
       mrCancel: Exit;
     end;
   end;
   for i := 0 to DBGridEh.DataSource.DataSet.FieldCount - 1 do begin
     Col := DBGridEh.Columns.Add;
     Col.FieldName := DBGridEh.DataSource.DataSet.Fields[i].FieldName;
   end;
  end;
  UpdateData;
  Designer.Modified;
end;

procedure TDBGridEhColumnsEditor.tbRestoreDefaultsClick(Sender: TObject);
var i:Integer;
  ListItem: TListItem;
begin
  if (ListView1.SelCount > 0) then begin
    ListItem := ListView1.Selected;
    for i := 0 to ListView1.SelCount - 1 do begin
      TColumnEh(ListItem.Data).RestoreDefaults;
      ListItem := ListView1.GetNextItem(ListItem,sdBelow,[isSelected]);
    end;
    ListView1Change(nil,nil,ctState);
    Designer.Modified;
  end;
end;

procedure TDBGridEhColumnsEditor.ListView1Change(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  FComponents: TDesignerSelectionList;
  i: Integer;
//  ListItem: TListItem;
begin
  if (Change <> ctState)  then Exit;
  tbDeleteSelected.Enabled := ListView1.SelCount > 0;
  tbRestoreDefaults.Enabled := ListView1.Items.Count > 0;

  miDeleteSelected.Enabled := ListView1.SelCount > 0;
  miRestoreDefaults.Enabled := ListView1.Items.Count > 0;
  miSelectAll.Enabled := ListView1.Items.Count > 0;
  tbMoveDown.Enabled := ListView1.Items.Count > 0;
  tbMoveUp.Enabled := ListView1.Items.Count > 0;
  tbAddAllFields.Enabled := Assigned(DBGridEh) and Assigned(DBGridEh.DataSource) and
    Assigned(DBGridEh.Datasource.Dataset) and (DBGridEh.Datasource.Dataset.FieldCount > 0);

  if CheckCollection and Active then begin
     FComponents := TDesignerSelectionList.Create;
    if (ListView1.SelCount > 0) then begin
      for i := ListView1.Items.Count - 1 downto 0 do
       if (ListView1.Items[i].Selected = True) and Assigned(ListView1.Items[i].Data) then
         FComponents.Add(TColumnEh(ListView1.Items[i].Data));
    end
    else FComponents.Add(DBGridEh.Columns);
    SetSelection(FComponents);
  end;
end;

procedure TDBGridEhColumnsEditor.Activated;
begin
  ListView1Change(nil,nil,ctState);
end;

function TDBGridEhColumnsEditor.UniqueName(Component: TComponent): string;
var
  Temp: string;
begin
  if (Component <> nil) then Temp := Component.ClassName
  else Temp := TColumnEh.ClassName;
  if (UpCase(Temp[1]) = 'T') and (Length(Temp) > 1) then
    System.Delete(Temp, 1, 1);
  Result := Designer.UniqueName(Temp);
end;

procedure TDBGridEhColumnsEditor.EditAction(Action: TEditAction);
begin
  case Action of
    eaCut: Cut;
    eaCopy: Copy;
    eaPaste: Paste;
    eaDelete: tbDeleteSelectedClick(Self);
  end;
end;

procedure TDBGridEhColumnsEditor.Copy;
var
  CompList: TDesignerSelectionList;
  ListItem: TListItem;
  i:Integer;
begin
  CompList := TDesignerSelectionList.Create;
  try
    if (ListView1.SelCount > 0) then begin
      ListItem := ListView1.Selected;
      for i := 0 to ListView1.SelCount - 1 do begin
        CompList.Add(TColumnEh(ListItem.Data));
        ListItem := ListView1.GetNextItem(ListItem,sdBelow,[isSelected]);
      end;
    end;
//    CopyComponents(DBGridEh.Columns, CompList);
  finally
    CompList.Free;
  end;
end;

procedure TDBGridEhColumnsEditor.Cut;
begin
  Copy;
  tbDeleteSelectedClick(Self);
end;

procedure TDBGridEhColumnsEditor.Paste;
var
  CompList: TDesignerSelectionList;
begin
  if CheckCollection then begin
    CompList := TDesignerSelectionList.Create;
    try
//      PasteComponents(DBGridEh.Columns, DBGridEh.Columns, CompList);
      UpdateData;
    finally
      CompList.Free;
    end;
  end;
end;

procedure TDBGridEhColumnsEditor.FormModified;
begin
  if not (csDestroying in ComponentState) then UpdateData;
end;

procedure TDBGridEhColumnsEditor.FormClosed(Form: TCustomForm);
begin
  if Form = Designer.Form then Close;
end;

{$IFDEF EH_LIB_4} {Borland Delphi 4.0 or C++ Builder 4.0}
procedure TDBGridEhColumnsEditor.ComponentDeleted(Component: IPersistent);
begin
  if ExtractPersistent(Component) = DBGridEh then begin
{$ELSE}
procedure TDBGridEhColumnsEditor.ComponentDeleted(Component: TComponent);
begin
  if Component = DBGridEh then begin
{$ENDIF}
    DBGridEh := nil;
    Close;
  end;
end;

function TDBGridEhColumnsEditor.GetEditState: TEditState;
begin
  Result := [];
  if tbDeleteSelected.Enabled then Result := [esCanDelete];
//  if tbDeleteSelected.Enabled then Result := [esCanDelete, esCanCut, esCanCopy];
//  if ClipboardComponents then Include(Result, esCanPaste);
end;

{ TDBGridEhColumnsProperty }

procedure TDBGridEhColumnsProperty.Edit;
begin
  ShowItemsEditor(Designer, TDBGridEh(GetComponent(0)));
end;

function TDBGridEhColumnsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TDBGridEhColumnsProperty.GetValue: string;
begin
  FmtStr(Result, '(%s)', [GetPropType^.Name]);
end;


{ TDBGridEhEditor }

procedure TDBGridEhEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowItemsEditor(Designer, TDBGridEh(Component));
  end;
end;

function TDBGridEhEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Columns Editor ...';
  end;
end;

function TDBGridEhEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TDBGridEhColumnsEditor.FormResize(Sender: TObject);
begin
  ListView1.Columns[0].Width := ListView1.ClientWidth;
end;

procedure TDBGridEhColumnsEditor.miAddNewClick(Sender: TObject);
begin
  tbAddNewClick(Sender);
end;

procedure TDBGridEhColumnsEditor.miDeleteSelectedClick(Sender: TObject);
begin
  tbDeleteSelectedClick(Sender);
end;

procedure TDBGridEhColumnsEditor.miSelectAllClick(Sender: TObject);
var i:Integer;
begin
  for i := 0 to ListView1.Items.Count - 1 do ListView1.Items[i].Selected := True;
end;

procedure TDBGridEhColumnsEditor.miAddAllFieldsClick(Sender: TObject);
begin
  tbAddAllFieldsClick(Sender);
end;

procedure TDBGridEhColumnsEditor.miRestoreDefaultsClick(Sender: TObject);
begin
  tbRestoreDefaultsClick(Sender);
end;

procedure TDBGridEhColumnsEditor.tbMoveUpClick(Sender: TObject);
var i:Integer;
    idxs: TList;
begin
  idxs := TList.Create;
  try
    DBGridEh.Columns.BeginUpdate;
    try
      for i := 1 to ListView1.Items.Count - 1 do
        if (ListView1.Items[i].Selected = True) then
          idxs.Add(Pointer(i));
      for i := 1 to ListView1.Items.Count - 1 do
        if (ListView1.Items[i].Selected = True) then
          DBGridEh.Columns[i].Index := i-1;
    finally
      DBGridEh.Columns.EndUpdate;
    end;

    ListView1.Items.BeginUpdate;
    try
      UpdateData;
      for i := 0 to idxs.Count - 1 do
        ListView1.Items[Integer(idxs.Items[i])-1].Selected := True;
     finally
       ListView1.Items.EndUpdate;
     end;
  finally
    idxs.Free;
  end;
end;

procedure TDBGridEhColumnsEditor.tbMoveDownClick(Sender: TObject);
var i:Integer;
    idxs: TList;
begin
  idxs := TList.Create;
  try
    DBGridEh.Columns.BeginUpdate;
    try
      for i := 0 to ListView1.Items.Count - 2 do
        if (ListView1.Items[i].Selected = True) then
          idxs.Add(Pointer(i));
      for i := ListView1.Items.Count - 2 downto 0 do
        if (ListView1.Items[i].Selected = True) then
          DBGridEh.Columns[i].Index := i+1;
    finally
      DBGridEh.Columns.EndUpdate;
    end;

    ListView1.Items.BeginUpdate;
    try
      UpdateData;
      for i := 0 to idxs.Count - 1 do
        ListView1.Items[Integer(idxs.Items[i])+1].Selected := True;
     finally
       ListView1.Items.EndUpdate;
     end;
  finally
    idxs.Free;
  end;
end;


{ TDBGridEhFieldProperty }

function TDBGridEhFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDBGridEhFieldProperty.GetValueList(List: TStrings);
var
  Ehg : TCustomDBGridEh;
begin
  if (GetComponent(0) = nil) then Exit;
  if (GetComponent(0) is TColumnEh) then
    Ehg := (GetComponent(0) as TColumnEh).Grid
  else if (GetComponent(0) is TColumnFooterEh) then
    Ehg := (GetComponent(0) as TColumnFooterEh).Column.Grid
  else Exit;

  if (Ehg <> nil) and (TDBGridEh(Ehg).DataSource <> nil) and (TDBGridEh(Ehg).DataSource.DataSet <> nil) then
       TDBGridEh(Ehg).DataSource.DataSet.GetFieldNames(List);
end;

procedure TDBGridEhFieldProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for i := 0 to Values.Count - 1 do Proc(Values[i]);
  finally
    Values.Free;
  end;
end;

end.
