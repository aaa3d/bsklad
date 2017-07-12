{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppGrpDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, Forms, Controls, Buttons, StdCtrls, Dialogs, SysUtils, ExtCtrls, Mask,
  ppForms, ppTypes, ppUtils;

type

  { TppGroupDialog }
  TppGroupDialog = class(TppCustomGroupDialog)
    lblGroups: TLabel;
    cbxBreakDescriptions: TComboBox;
    lstGroups: TListBox;
    btnAdd: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    gbxBreakOn: TGroupBox;
    rdbDataField: TRadioButton;
    rdbCustomField: TRadioButton;
    gbxOnGroupBreak: TGroupBox;
    cbxNewColumn: TCheckBox;
    cbxNewPage: TCheckBox;
    cbxResetPageNo: TCheckBox;
    lblNewColumnThreshold: TLabel;
    lblNewPageThreshold: TLabel;
    edtNewColumnThreshold: TEdit;
    edtNewPageThreshold: TEdit;
    cbxReprintOnColumn: TCheckBox;
    cbxReprintOnPage: TCheckBox;
    bvlWindow: TBevel;
    btnOK: TButton;
    btnCancel: TButton;
    cbxKeepTogether: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure lstFieldsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lstGroupsClick(Sender: TObject);
    procedure cbxBreakDescriptionsChange(Sender: TObject);
    procedure lstGroupsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstGroupsEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure cbxNewPageClick(Sender: TObject);
    procedure cbxResetPageNoClick(Sender: TObject);
    procedure cbxReprintOnPageClick(Sender: TObject);
    procedure edtNewPageThresholdChange(Sender: TObject);
    procedure rdbBreakOnClick(Sender: TObject);
    procedure cbxNewColumnClick(Sender: TObject);
    procedure cbxReprintOnColumnClick(Sender: TObject);
    procedure edtNewColumnThresholdChange(Sender: TObject);
    procedure cbxKeepTogetherClick(Sender: TObject);

  private
    FCustomFieldDescriptions: TStringList;
    FCustomFieldNames: TStringList;
    FDataFieldNames: TStringList;
    FDataFieldDescriptions: TStringList;

    procedure CreateNewGroup(aIndex: Integer);
    function  GetBreakDescription(aIndex: Integer): String;
    procedure UpdateDescriptions;
    procedure SetBreakDescription(aBreakDescription: String);

    procedure AddGroupToReport(aGroupOptions: TObject);
    procedure GetFieldForAlias(const FieldAlias: String; var aDataPipeline: TObject; var aDataField: String);

  protected
    procedure Activate; override;
    procedure LanguageChanged; override;
    procedure ReportAssigned; override;

    function GetFieldAliases: TStrings; override;
    procedure SetFieldAliases(aFieldAliases: TStrings); override;

  end; {class, TppGroupDialog}


var
  ppGroupDialog: TppGroupDialog;

implementation

uses ppClass, ppBands, ppDB, ppClasUt;

{$R *.DFM}

type

 { TppGroupOptions }
  TppGroupOptions = class(TObject)
    public
      BreakDescription: String;
      BreakName: String;
      BreakType: TppBreakType;
      DataPipeline: TppDataPipeline;
      Group: TppGroup;
      KeepTogether: Boolean;
      NewColumn: Boolean;
      NewColumnThreshold: Single;
      NewPage: Boolean;
      NewPageThreshold: Single;
      ReprintOnColumn: Boolean;
      ReprintOnPage: Boolean;
      ResetPageNo: Boolean;
  end; {class, TGroupOptions}

{------------------------------------------------------------------------------}
{ TppGroupDialog.FormCreate }

procedure TppGroupDialog.FormCreate(Sender: TObject);
begin
  FDataFieldNames          := TStringList.Create;
  FCustomFieldNames        := TStringList.Create;
  FDataFieldDescriptions   := TStringList.Create;
  FCustomFieldDescriptions := TStringList.Create;

  FDataFieldNames.Sorted          := False;
  FCustomFieldNames.Sorted        := False;
  FDataFieldDescriptions.Sorted   := False;
  FCustomFieldDescriptions.Sorted := False;
end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TppGroupDialog.FormClose }

procedure TppGroupDialog.FormClose(Sender: TObject; var Action: TCloseAction);
var
  liGroup : Integer;

begin

  {destroy group options objects}
  for liGroup := 0 to lstGroups.Items.Count-1 do
    TppGroupOptions(lstGroups.Items.Objects[liGroup]).Free;

  lstGroups.Items.Clear;

  FDataFieldNames.Free;
  FCustomFieldNames.Free;
  FDataFieldDescriptions.Free;
  FCustomFieldDescriptions.Free;

  Action := caFree;

end; {procedure, FormClose}


{------------------------------------------------------------------------------}
{ TppGroupDialog.Activate }

procedure TppGroupDialog.Activate;
var
  liGroups: Integer;
  liGroup: Integer;
  lGroup: TppGroup;
  lGroupOptions: TppGroupOptions;
  lsFieldAlias: String;
  lsFieldName: String;
  lDataPipeline: TObject;
  liField: Integer;
  lReport: TppCustomReport;

begin
  if (Report = nil) or not (Report is TppCustomReport) then Exit;


  lReport := TppCustomReport(Report);


  {get group break descriptions}
  ppGetCustomTextComponents(lReport, FCustomFieldNames, False);
  ppGetCustomTextComponents(lReport, FCustomFieldDescriptions, True);

  if (FieldAliases.Count = 0) then
    begin
      cbxBreakDescriptions.Sorted := True;

      ppGetFields(lReport, FDataFieldNames, False);
      ppGetFields(lReport, FDataFieldDescriptions, True)
    end

  else {use field aliases }
    begin
      cbxBreakDescriptions.Sorted := False;

      for liField := 0 to FDataFieldDescriptions.Count - 1 do
        begin
          lsFieldAlias := FDataFieldDescriptions[liField];

          GetFieldForAlias(lsFieldAlias, lDataPipeline, lsFieldName);

          FDataFieldNames.AddObject(lsFieldName, lDataPipeline);
        end;

    end;

  {save group settings, load group list box}
  lstGroups.Clear;

  liGroups := lReport.GroupCount - 1 ;

  for liGroup := 0 to liGroups do
    begin

      lGroupOptions := TppGroupOptions.Create;

      lGroup := lReport.Groups[liGroup];

      lGroupOptions.BreakName          := lGroup.BreakName;
      lGroupOptions.BreakType          := lGroup.BreakType;
      lGroupOptions.DataPipeline       := lGroup.DataPipeline;
      lGroupOptions.Group              := lGroup;
      lGroupOptions.NewPage            := lGroup.NewPage;
      lGroupOptions.NewPageThreshold   := lGroup.NewPageThreshold;
      lGroupOptions.KeepTogether       := lGroup.KeepTogether;
      lGroupOptions.NewColumn          := lGroup.NewColumn;
      lGroupOptions.NewColumnThreshold := lGroup.NewColumnThreshold;
      lGroupOptions.ReprintOnColumn    := lGroup.ReprintOnSubsequentColumn;
      lGroupOptions.ReprintOnPage      := lGroup.ReprintOnSubsequentPage;
      lGroupOptions.ResetPageNo        := lGroup.ResetPageNo;

      lstGroups.Items.AddObject(lGroup.Description, lGroupOptions);

    end;

  UpdateDescriptions;

  {initialize list box and associated group options}
  if (lstGroups.Items.Count > 0) then
    begin
      lstGroups.ItemIndex := 0;
      lstGroupsClick(Self);
    end

  else {initialize to empty}
    begin

      if FDataFieldNames.Count > 0 then
        begin
          rdbDataField.Checked := True;
          cbxBreakDescriptions.Items.Assign(FDataFieldDescriptions);
        end
      else
        begin
          rdbCustomField.Checked := True;
          cbxBreakDescriptions.Items.Assign(FCustomFieldDescriptions);
        end;

      {default control values}
      lstGroups.ItemIndex := -1;
      cbxBreakDescriptions.ItemIndex := 0;
      cbxReprintOnColumn.Checked := True;
      cbxReprintOnPage.Checked := True;

    end;

end;

{------------------------------------------------------------------------------}
{ TppGroupDialog.ReportAssigned }

procedure TppGroupDialog.ReportAssigned;
var
  liBottomSpacer: Integer;
  lReport: TppCustomReport;

begin

  if (Report = nil) or not (Report is TppCustomReport) then Exit;

  lReport := TppCustomReport(Report);


  if (lReport.Columns <= 1) then
    begin

      lblNewColumnThreshold.Visible := False;
      edtNewColumnThreshold.Visible := False;
      cbxReprintOnColumn.Visible := False;
      cbxNewColumn.Visible := False;

      liBottomSpacer := Trunc(ppFromMMThousandths(2381, utScreenPixels, pprtVertical, nil));

      gbxOnGroupBreak.Height := lblNewPageThreshold.Top + lblNewPageThreshold.Height + liBottomSpacer;
      cbxKeepTogether.Top := gbxOnGroupBreak.Top + gbxOnGroupBreak.Height + liBottomSpacer;
      cbxReprintOnPage.Top := cbxKeepTogether.Top + cbxKeepTogether.Height + liBottomSpacer;
      bvlWindow.Height := cbxReprintOnPage.Top + cbxReprintOnPage.Height + liBottomSpacer;
      btnOK.Top := bvlWindow.Height + liBottomSpacer;
      btnCancel.Top := bvlWindow.Height + liBottomSpacer;

      ClientHeight := btnOK.Top + btnOK.Height + liBottomSpacer;
    end;

end; {procedure, ReportAssigned}

{------------------------------------------------------------------------------}
{ TppGroupDialog.GetFieldAliases }

function TppGroupDialog.GetFieldAliases: TStrings;
begin
  Result := FDataFieldDescriptions;
end; {procedure, GetFieldAliases}

{------------------------------------------------------------------------------}
{ TppGroupDialog.SetFieldAliases }

procedure TppGroupDialog.SetFieldAliases(aFieldAliases: TStrings);
begin
  FDataFieldDescriptions.Assign(aFieldAliases);
end; {procedure, SetFieldAliases}

{------------------------------------------------------------------------------}
{ TppGroupDialog.GetFieldForAlias }

procedure TppGroupDialog.GetFieldForAlias(const FieldAlias: String;
                                             var aDataPipeline: TObject; var aDataField: String);
begin
  DoGetFieldForAlias(FieldAlias, aDataPipeline, aDataField);
end; {procedure, GetFieldForAlias}

{------------------------------------------------------------------------------}
{ TppGroupDialog.spbOKClick }

procedure TppGroupDialog.btnOKClick(Sender: TObject);
var
  liGroups: Integer;
  liGroup: Integer;
  lGroup: TppGroup;
  lGroupOptions: TppGroupOptions;
  lReport: TppCustomReport;
begin

  lReport := TppCustomReport(Report);

  liGroups := lstGroups.Items.Count;

  {process each group in list box}
  for liGroup := 0 to liGroups - 1 do
    begin

      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liGroup]);

      {create new group}
      if (lGroupOptions.Group = nil) then
        AddGroupToReport(lGroupOptions);

      lGroup := lGroupOptions.Group;

      {set group position}
      lReport.SetGroupPosition(lGroup, liGroup);

      {set group properties}
      lGroup.BreakName                 := lGroupOptions.BreakName;
      lGroup.BreakType                 := lGroupOptions.BreakType;
      lGroup.DataPipeline              := lGroupOptions.DataPipeline;
      lGroup.KeepTogether              := lGroupOptions.KeepTogether;
      lGroup.NewColumn                 := lGroupOptions.NewColumn;
      lGroup.NewColumnThreshold        := lGroupOptions.NewColumnThreshold;
      lGroup.NewPage                   := lGroupOptions.NewPage;
      lGroup.NewPageThreshold          := lGroupOptions.NewPageThreshold;
      lGroup.ReprintOnSubsequentColumn := lGroupOptions.ReprintOnColumn;
      lGroup.ReprintOnSubsequentPage   := lGroupOptions.ReprintOnPage;
      lGroup.ResetPageNo               := lGroupOptions.ResetPageNo;

    end; {for, each group}

  {set liGroups to number of groups in report writer}
  liGroups := lReport.GroupCount - 1;

  {delete any groups beyond current list}
  for liGroup :=  liGroups downto lstGroups.Items.Count do
    lReport.Groups[liGroup].Free;

end;  {procedure, spbOKClick }


{------------------------------------------------------------------------------}
{ TppGroupDialog.AddGroupToReport}

procedure TppGroupDialog.AddGroupToReport(aGroupOptions: TObject);
var
  lReport: TppCustomReport;
  lGroup: TppGroup;
  lGroupBand: TppGroupBand;
  lGroupOptions: TppGroupOptions;

begin

  if (Report = nil) then Exit;

  lGroupOptions := TppGroupOptions(aGroupOptions);

  lReport := TppCustomReport(Report);

  {add group to report}
  lGroup := TppGroup(ppComponentCreate(lReport, TppGroup));

  lGroup.Report := lReport;

  lGroup.BreakType    :=  lGroupOptions.BreakType;
  lGroup.BreakName    :=  lGroupOptions.BreakName;
  lGroup.DataPipeline :=  lGroupOptions.DataPipeline;

  {add group header and footer bands }
  lGroupBand := TppGroupBand(ppComponentCreate(lReport,TppGroupHeaderBand));
  lGroupBand.Group := lGroup;

  lGroupBand := TppGroupBand(ppComponentCreate(lReport,TppGroupFooterBand));
  lGroupBand.Group := lGroup;

  {add new object reference to the group options}
  lGroupOptions.Group := lGroup;


end; {procedure, AddGroupToReport}

{------------------------------------------------------------------------------}
{ TppGroupDialog.lstFieldsMouseDown - set dragging}

procedure TppGroupDialog.lstFieldsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lPoint   : TPoint;
  liIndex  : Integer;
  lbExists : Boolean;

begin
  lPoint.X := X;
  lPoint.Y := Y;
  lbExists := True;
  
  liIndex  := lstGroups.ItemAtPos(lPoint, lbExists);

  if (liIndex <> -1) then
    lstGroups.BeginDrag(False);
end;


{------------------------------------------------------------------------------}
{ TppGroupDialog.lstGroupsDragOver }

procedure TppGroupDialog.lstGroupsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  lPoint     : TPoint;
  liIndex    : Integer;
  lbSelected : Boolean;
  lbExists   : Boolean;

begin
  lPoint.X := X;
  lPoint.Y := Y;

  lbExists := True;

  liIndex := lstGroups.ItemAtPos(lPoint, lbExists);
  
  if (liIndex <> -1) then
    begin
      lbSelected := lstGroups.Selected[liIndex];
      if not(lbSelected) then
        Accept := True
      else
        Accept := False;
    end
  else
    Accept := False;

end; {procedure, lstGroupsDragOver}

{------------------------------------------------------------------------------}
{ TppGroupDialog.lstGroupsEndDrag }

procedure TppGroupDialog.lstGroupsEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  lPoint : TPoint;
  lbExists : Boolean;
  liIndex : Integer;
  liGroup : Integer;

  begin
  if (Target <> nil) then
    begin
      {move selection to new position}
      lPoint.X := X;
      lPoint.Y := Y;
      lbExists := True;
      
      liIndex := lstGroups.ItemAtPos(lPoint, lbExists);

      for liGroup := 0 to lstGroups.Items.Count - 1  do
        if lstGroups.Selected[liGroup] then
            lstGroups.Items.Move(liGroup,liIndex);

      {re-number group descriptions}
      UpdateDescriptions;

      lstGroups.ItemIndex := liIndex;

    end;

end;  {procedure, lstGroupsEndDrag}


{------------------------------------------------------------------------------}
{ TppGroupDialog.lstGroupsClick }

procedure TppGroupDialog.lstGroupsClick(Sender: TObject);
var
  liIndex : Integer;
  lGroupOptions: TppGroupOptions;
begin

  lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[lstGroups.ItemIndex]);


  {set group option values}
  rdbDataField.Checked   := (lGroupOptions.BreakType = btDataField);
  rdbCustomField.Checked := (lGroupOptions.BreakType = btCustomField);

  if lGroupOptions.BreakType = btDataField then
    cbxBreakDescriptions.Items.Assign(FDataFieldDescriptions)
  else
    cbxBreakDescriptions.Items.Assign(FCustomFieldDescriptions);

 
  {set cbxBreakDescription to current item}
  liIndex := cbxBreakDescriptions.Items.IndexOf(GetBreakDescription(lstGroups.ItemIndex));

  cbxBreakDescriptions.ItemIndex := liIndex;


  {set controls based on group properties}
  cbxNewColumn.Checked        := lGroupOptions.NewColumn;
  edtNewColumnThreshold.Text  := FloatToStrF(lGroupOptions.NewColumnThreshold, ffGeneral,  7, 0);
  cbxNewPage.Checked          := lGroupOptions.NewPage;
  edtNewPageThreshold.Text    := FloatToStrF(lGroupOptions.NewPageThreshold, ffGeneral,  7, 0);
  cbxReprintOnColumn.Checked  := lGroupOptions.ReprintOnColumn;
  cbxReprintOnPage.Checked    := lGroupOptions.ReprintOnPage;


  {enable/disable reset page no. option}
  cbxResetPageNo.Checked := lGroupOptions.ResetPageNo;
  cbxResetPageNo.Enabled := cbxNewPage.Checked;

  cbxKeepTogether.Checked := lGroupOptions.KeepTogether;
  cbxKeepTogether.Enabled := not(cbxNewPage.Checked);

  {enable/disable new column threshold option}
  if lGroupOptions.NewColumn then
    edtNewColumnThreshold.Font.Color := clGray
  else
    edtNewColumnThreshold.Font.Color := clBlack;

  edtNewColumnThreshold.Enabled := not(lGroupOptions.NewColumn);


  {enable/disable new page threshold option}
  if lGroupOptions.NewPage then
    edtNewPageThreshold.Font.Color := clGray
  else
    edtNewPageThreshold.Font.Color := clBlack;

  edtNewPageThreshold.Enabled := not(lGroupOptions.NewPage);

end; {procedure, lstGroupsClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxBreakDescriptionsChange }

procedure TppGroupDialog.cbxBreakDescriptionsChange(Sender: TObject);
var
  lsBreakDescription : String;
  liIndex : Integer;
begin

  lsBreakDescription := cbxBreakDescriptions.Items[cbxBreakDescriptions.ItemIndex];

  liIndex := lstGroups.ItemIndex;

  if (liIndex > -1) and (liIndex <= lstGroups.Items.Count - 1) then
    SetBreakDescription(lsBreakDescription);

  lstGroups.ItemIndex := liIndex;

end; {procedure, cbxBreakDescriptionsChange}

{------------------------------------------------------------------------------}
{ TppGroupDialog.spbDeleteClick }

procedure TppGroupDialog.btnDeleteClick(Sender: TObject);
var
  liIndex : Integer;
  liItems : Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex <= lstGroups.Items.Count) then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);
      lGroupOptions.Free;
      lstGroups.Items.Delete(liIndex);
    end;

  UpdateDescriptions;

  liItems := lstGroups.Items.Count;

  Inc(liIndex);

  if (liItems > 0) then
    begin
      if (liIndex >= liItems) then
        lstGroups.ItemIndex := liItems - 1
      else
        lstGroups.ItemIndex := liIndex;

      lstGroupsClick(Self);
    end
  else
    lstGroups.ItemIndex := -1;


end; {procedure, spbDeleteClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.spbAddClick }

procedure TppGroupDialog.btnAddClick(Sender: TObject);
begin

  if cbxBreakDescriptions.Items.Count = 0 then
    begin

      if rdbDataField.Checked then
        MessageDlg(ppLoadStr(329), mtInformation,[mbOK],0)
      else
        MessageDlg(ppLoadStr(330), mtInformation,[mbOK],0);
        
    end

  else
    begin
      CreateNewGroup(lstGroups.Items.Count);

      lstGroups.ItemIndex := lstGroups.Items.Count - 1;

      {update controls to reflect group property values}
      lstGroupsClick(Self);
    end;

end; {procedure, spbAddClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.spbInsertClick }

procedure TppGroupDialog.btnInsertClick(Sender: TObject);
var
  liIndex: Integer;
begin
  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex <= lstGroups.Items.Count) then
    CreateNewGroup(liIndex);

  lstGroups.ItemIndex := liIndex;

  {update controls to reflect group property values}
  lstGroupsClick(Self);

end; {procedure, spbInsertClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.CreateNewGroup }

procedure TppGroupDialog.CreateNewGroup(aIndex: Integer);
var
  lsBreakDescription: String;
  lGroupOptions: TppGroupOptions;
  liBreakIndex: Integer;
begin
  lGroupOptions := TppGroupOptions.Create;

  lGroupOptions.Group := nil;

  {assign breakname property}
  lsBreakDescription := cbxBreakDescriptions.Items[cbxBreakDescriptions.ItemIndex];

  if rdbDataField.Checked then
    begin
      lGroupOptions.BreakType := btDataField;
      liBreakIndex := FDataFieldDescriptions.IndexOf(lsBreakDescription);
      lGroupOptions.BreakName := FDataFieldNames[liBreakIndex];
      lGroupOptions.DataPipeline := TppDataPipeline(FDataFieldNames.Objects[liBreakIndex]);
    end
  else
    begin
      lGroupOptions.BreakType := btCustomField;
      liBreakIndex := FCustomFieldDescriptions.IndexOf(lsBreakDescription);
      lGroupOptions.BreakName := FCustomFieldNames[liBreakIndex];
      lGroupOptions.DataPipeline := nil;
    end;

  {default remaining properties}
  lGroupOptions.KeepTogether        := True;
  lGroupOptions.NewColumn           := False;
  lGroupOptions.NewColumnThreshold  := 0;
  lGroupOptions.NewPage             := False;
  lGroupOptions.NewPageThreshold    := 0;
  lGroupOptions.ResetPageNo         := False;
  lGroupOptions.ReprintOnColumn     := True;
  lGroupOptions.ReprintOnPage       := True;

  lstGroups.Items.InsertObject(aIndex, ':' + lsBreakDescription, lGroupOptions);

  UpdateDescriptions;

end; {procedure, CreateNewGroup}

{------------------------------------------------------------------------------}
{ TppGroupDialog.UpdateDescriptions }

procedure TppGroupDialog.UpdateDescriptions;
var
  liGroups : Integer;
  liGroup : Integer;
begin

  liGroups := lstGroups.Items.Count - 1;

  {assign the group description}
  for liGroup := 0 to liGroups do
    begin
      lstGroups.Items[liGroup] := ppLoadStr(331) +
                                  '[' + IntToStr(liGroup) + ']:' +
                                  GetBreakDescription(liGroup);
    end;


end; {procedure, UpdateDescriptions}

{------------------------------------------------------------------------------}
{ TppGroupDialog.SetBreakDescription }

procedure TppGroupDialog.SetBreakDescription(aBreakDescription: String);
var
  lsGroup : String;
  liGroupIndex : Integer;
  liBreakIndex: Integer;
  lGroupOptions: TppGroupOptions;
begin
  liGroupIndex := lstGroups.ItemIndex;

  lsGroup := lstGroups.Items[liGroupIndex];

  {extract break description from full description}
  lsGroup := Copy(lsGroup, 1, Pos(':',lsGroup));

  {recreate the group description}
  lstGroups.Items[liGroupIndex] := lsGroup + aBreakDescription;

  lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liGroupIndex]);

  {assign breakname property}
  if lGroupOptions.BreakType = btDataField then
    begin
      liBreakIndex := FDataFieldDescriptions.IndexOf(aBreakDescription);
      lGroupOptions.BreakName := FDataFieldNames[liBreakIndex];
      lGroupOptions.DataPipeline := TppDataPipeline(FDataFieldNames.Objects[liBreakIndex]);
    end
  else
    begin
      liBreakIndex := FCustomFieldDescriptions.IndexOf(aBreakDescription);
      lGroupOptions.BreakName := FCustomFieldNames[liBreakIndex];
      lGroupOptions.DataPipeline := nil;
    end;

end; {procedure, SetBreakDescription}

{------------------------------------------------------------------------------}
{ TppGroupDialog.GetBreakDescription }

function TppGroupDialog.GetBreakDescription(aIndex: Integer): String;
var
  liBreakIndex: Integer;
  lGroupOptions: TppGroupOptions;
  lsDesc: String;
begin

  lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[aIndex]);

  if lGroupOptions.BreakType = btDataField then
    begin
      if (lGroupOptions.DataPipeline <> nil) then
        lsDesc := lGroupOptions.DataPipeline.UserName + '.' + lGroupOptions.BreakName
      else
        lsDesc := '';

      liBreakIndex := FDataFieldDescriptions.IndexOf(lsDesc);

      if (liBreakIndex = -1) then
        liBreakIndex := FDataFieldNames.IndexOf(lGroupOptions.BreakName);

      if (liBreakIndex >= 0) then
        Result := FDataFieldDescriptions[liBreakIndex]
      else
        Result := lGroupOptions.BreakName;
    end
  else
    begin
      liBreakIndex := FCustomFieldNames.IndexOf(lGroupOptions.BreakName);

      if liBreakIndex >= 0 then
        Result := FCustomFieldDescriptions[liBreakIndex]
      else
        Result := lGroupOptions.BreakName;
    end;

end; {function, GetBreakDescription}

{------------------------------------------------------------------------------}
{ TppGroupDialog.rdbBreakOnClick }

procedure TppGroupDialog.rdbBreakOnClick(Sender: TObject);
var
  liIndex: Integer;
  lGroupOptions: TppGroupOptions;
begin

  {set the group descriptions based on the type selected}
  if rdbDataField.Checked then
    cbxBreakDescriptions.Items.Assign(FDataFieldDescriptions)
  else
    cbxBreakDescriptions.Items.Assign(FCustomFieldDescriptions);

  {default the item index}
  if cbxBreakDescriptions.Items.Count > 0 then
    cbxBreakDescriptions.ItemIndex := 0
  else
    cbxBreakDescriptions.ItemIndex := -1;


  {update the group's breaktype property if necessary}
  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex < lstGroups.Items.Count) then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      if rdbDataField.Checked and (lGroupOptions.BreakType <> btDataField) and
         (FDataFieldDescriptions.Count > 0) then
        begin
          lGroupOptions.BreakType := btDataField;
          SetBreakDescription(FDataFieldDescriptions[0]);
        end

      else if rdbCustomField.Checked and (lGroupOptions.BreakType <> btCustomField) then
        begin
          lGroupOptions.BreakType := btCustomField;
          SetBreakDescription(FCustomFieldDescriptions[0]);
        end;

    end; {if, valid index}

  {restore focus to the list box}
  lstGroups.ItemIndex := liIndex;

end; {procedure, rdbBreakOnClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxNewColumnClick }

procedure TppGroupDialog.cbxNewColumnClick(Sender: TObject);
var
  liIndex : Integer;
  lGroupOptions: TppGroupOptions;
begin

  if cbxNewColumn.Checked then
    begin
      lblNewColumnThreshold.Font.Color := clGray;
      edtNewColumnThreshold.Text       := FloatToStrF( 0.0, ffGeneral,  7, 0);
      edtNewColumnThreshold.Enabled    := False;
    end
  else
    begin
      lblNewColumnThreshold.Font.Color := clBlack;
      edtNewColumnThreshold.Enabled    := True;
      {due to Delphi bug, need to force the Font.Color here, even though 'enabling' should do this}
      edtNewColumnThreshold.Font.Color := clBlack;
   end;

  liIndex := lstGroups.ItemIndex;

  if liIndex >= 0 then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      lGroupOptions.NewColumn := cbxNewColumn.Checked;

      if lGroupOptions.NewColumn then
        lGroupOptions.NewColumnThreshold := 0;

    end;

end;  {procedure, cbxNewColumnClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.edtNewColumnThresholdChange }

procedure TppGroupDialog.edtNewColumnThresholdChange(Sender: TObject);
var
  liIndex: Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

 if (liIndex >= 0) then
   begin
     lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

     try

       lGroupOptions.NewColumnThreshold := StrToFloat(edtNewColumnThreshold.Text);

     except on EConvertError do
       begin
         MessageDlg(ppLoadStr(332), mtWarning, [mbOK], 0);
         edtNewColumnThreshold.Text := FloatToStrF(lGroupOptions.NewColumnThreshold, ffGeneral,  7, 0);
         edtNewColumnThreshold.SelectAll;
       end;

     end; {try, except}

   end; {if, valid index}

end; {procedure, edtNewColumnThresholdChange}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxNewPageClick }

procedure TppGroupDialog.cbxNewPageClick(Sender: TObject);
var
  liIndex : Integer;
  lGroupOptions: TppGroupOptions;
begin

  if cbxNewPage.Checked then
    begin
      cbxResetPageNo.Enabled         := True;
      cbxKeepTogether.Enabled        := False;
      lblNewPageThreshold.Font.Color := clGray;
      edtNewPageThreshold.Text       := FloatToStrF(0.0, ffGeneral,  7, 0);
      edtNewPageThreshold.Enabled    := False;
    end
  else
    begin
      cbxResetPageNo.Checked := False;
      cbxResetPageNo.Enabled := False;

      cbxKeepTogether.Enabled := True;

      lblNewPageThreshold.Font.Color := clBlack;
      edtNewPageThreshold.Enabled    := True;
      {due to Delphi bug, need to force the Font.Color here, even though 'enabling' should do this}
      edtNewPageThreshold.Font.Color := clBlack;
   end;

  liIndex := lstGroups.ItemIndex;

  if liIndex >= 0 then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      lGroupOptions.NewPage := cbxNewPage.Checked;

      if lGroupOptions.NewPage then
        lGroupOptions.NewPageThreshold := 0;

    end;

end;  {procedure, cbxNewPageClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.edtNewPageThresholdChange }

procedure TppGroupDialog.edtNewPageThresholdChange(Sender: TObject);
var
  liIndex: Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

 if (liIndex >= 0) then
   begin
     lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

     try

       lGroupOptions.NewPageThreshold := StrToFloat(edtNewPageThreshold.Text);

     except on EConvertError do
       begin
         MessageDlg(ppLoadStr(332), mtWarning, [mbOK], 0);
         edtNewPageThreshold.Text := FloatToStrF(lGroupOptions.NewPageThreshold, ffGeneral,  7, 0);
         edtNewPageThreshold.SelectAll;
       end;

     end; {try, except}

   end; {if, valid index}

end; {procedure, edtNewPageThresholdChange}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxResetPageNoClick }

procedure TppGroupDialog.cbxResetPageNoClick(Sender: TObject);
var
  liIndex : Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex < lstGroups.Items.Count) then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      lGroupOptions.ResetPageNo := cbxResetPageNo.Checked;
    end;

end;  {procedure, cbxResetPageNoClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxReprintOnColumnClick }

procedure TppGroupDialog.cbxReprintOnColumnClick(Sender: TObject);
var
  liIndex : Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex < lstGroups.Items.Count) then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      lGroupOptions.ReprintOnColumn := cbxReprintOnColumn.Checked;
    end;

end; {procedure, cbxReprintOnColumnClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxKeepTogetherClick }

procedure TppGroupDialog.cbxKeepTogetherClick(Sender: TObject);
var
  liIndex : Integer;
  liIndex2: Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex < lstGroups.Items.Count) then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      lGroupOptions.KeepTogether := cbxKeepTogether.Checked;

      for liIndex2 := 0 to liIndex - 1 do
        begin
          lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex2]);

          if lGroupOptions.KeepTogether then
            lGroupOptions.KeepTogether := False;
         end;

    end;

end; {procedure, cbxKeepTogetherClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.cbxReprintOnPageClick }

procedure TppGroupDialog.cbxReprintOnPageClick(Sender: TObject);
var
  liIndex : Integer;
  lGroupOptions: TppGroupOptions;
begin

  liIndex := lstGroups.ItemIndex;

  if (liIndex >= 0) and (liIndex < lstGroups.Items.Count) then
    begin
      lGroupOptions := TppGroupOptions(lstGroups.Items.Objects[liIndex]);

      lGroupOptions.ReprintOnPage := cbxReprintOnPage.Checked;
    end;

end; {procedure, cbxReprintOnPageClick}

{------------------------------------------------------------------------------}
{ TppGroupDialog.LanguageChanged }

procedure TppGroupDialog.LanguageChanged;
var
  liNewLeft: Integer;
  liSpacer: Integer;
begin

  Caption := ppLoadStr(204);

  lblGroups.Caption := ppLoadStr(204);
  gbxBreakOn.Caption := ppLoadStr(201);
  rdbDataField.Caption := ppLoadStr(203);
  rdbCustomField.Caption := ppLoadStr(202);
  lblNewColumnThreshold.Caption := ppLoadStr(421);
  lblNewPageThreshold.Caption := ppLoadStr(205);
  cbxResetPageNo.Caption := ppLoadStr(209);
  cbxKeepTogether.Caption := ppLoadStr(506);
  cbxNewColumn.Caption := ppLoadStr(420);
  cbxNewPage.Caption := ppLoadStr(210);
  gbxOnGroupBreak.Caption := ppLoadStr(206);
  cbxReprintOnPage.Caption := ppLoadStr(208);
  cbxReprintOnColumn.Caption := ppLoadStr(422);

  btnAdd.Caption := ppLoadStr(260);
  btnDelete.Caption := ppLoadStr(124);
  btnInsert.Caption := ppLoadStr(265);

  btnOK.Caption := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

  {adjust positions for width of captions}
  liSpacer := Round(Screen.PixelsPerInch * 0.1333);

  if (lblGroups.Width > 34) then
    cbxBreakDescriptions.Left := cbxBreakDescriptions.Left + (lblGroups.Width - 34);

  rdbDataField.Width := Self.Canvas.TextWidth(rdbDataField.Caption) + 27;
  rdbCustomField.Width := Self.Canvas.TextWidth(rdbCustomField.Caption) + 27;

  if (rdbDataField.Width <> 71) then
    rdbCustomField.Left := rdbCustomField.Left + (rdbDataField.Width - 71);

  liNewLeft := lblNewPageThreshold.Left + lblNewPageThreshold.Width + liSpacer;

  if (lblNewColumnThreshold.Left + lblNewColumnThreshold.Width + liSpacer) > liNewLeft then
    liNewLeft := lblNewColumnThreshold.Left + lblNewColumnThreshold.Width + liSpacer;

  edtNewPageThreshold.Left := liNewLeft;
  edtNewColumnThreshold.Left := liNewLeft;

end; {procedure, LanguageChanged}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomGroupDialog, TppGroupDialog);

finalization

  ppUnRegisterForm(TppCustomGroupDialog);

end.
