{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppFLnkEd;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppForms, ExtCtrls, StdCtrls, ppDB, ppTypes, ppUtils;

type


  TppMasterFieldLinkEditor = class(TppCustomMasterFieldLinkEditor)
    btnAdd: TButton;
    btnClear: TButton;
    btnDelete: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    lbxDetail: TListBox;
    lbxMaster: TListBox;
    lbxJoin: TListBox;
    lblDetail: TLabel;
    lblMaster: TLabel;
    lblJoin: TLabel;
    Bevel1: TBevel;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);

  private
    FDetailPipeline: TppDataPipeline;
    FMasterPipeline: TppDataPipeline;
    FNewLinks: TStringList;
    FDeletedLinks: TStringList;

    procedure EnableValidButtons;
    procedure DeleteFieldLink(aFieldLink: TppMasterFieldLink);
 
  protected
    procedure LanguageChanged; override;
    procedure SetDataPipeline(aDataPipeline: TComponent); override;

    function GetDataPipeline: TComponent; override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean; override;

  end;


var
  ppMasterFieldLinkEditor: TppMasterFieldLinkEditor;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.Create}

constructor TppMasterFieldLinkEditor.Create(aOwner: TComponent);
begin
  inherited Create(Owner);

  FNewLinks     := TStringList.Create;
  FDeletedLinks := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.Destroy}

destructor TppMasterFieldLinkEditor.Destroy;
begin

  FNewLinks.Free;
  FDeletedLinks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.Execute}

function TppMasterFieldLinkEditor.Execute: Boolean;
begin
  Result := (ShowModal = mrOK);
end; {destructor, Execute}


{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.SetDataPipeline}

procedure TppMasterFieldLinkEditor.SetDataPipeline(aDataPipeline: TComponent);
var
  liLink: Integer;
  liFieldIndex: Integer;
  lsJoinDesc: String;
  lMasterFieldLink: TppMasterFieldLink;
  lsDetailAlias: String;
  lsMasterAlias: String;
  
begin

  if not (aDataPipeline is TppDataPipeline) then Exit;

  FDetailPipeline :=  TppDataPipeline(aDataPipeline);
  FMasterPipeline := FDetailPipeline.MasterDataPipeline;

  {get field lists}
  FDetailPipeline.GetFieldAliases(lbxDetail.Items);

  if FMasterPipeline <> nil then
    FMasterPipeline.GetFieldAliases(lbxMaster.Items);

  {get current master field links}
  for liLink := 0 to FDetailPipeline.MasterFieldLinkCount - 1 do
    begin
      lMasterFieldLink := FDetailPipeline.MasterFieldLinkItems[liLink];
      lsDetailAlias := FDetailPipeline.FieldAliasForFieldName(lMasterFieldLink.DetailFieldName);
      lsMasterAlias := FMasterPipeline.FieldAliasForFieldName(lMasterFieldLink.MasterFieldName);
      lsJoinDesc := lsDetailAlias + ' -> ' + lsMasterAlias;

      lbxJoin.Items.AddObject(lsJoinDesc, lMasterFieldLink);


      liFieldIndex := lbxDetail.Items.IndexOf(lsDetailAlias);
      if liFieldIndex >= 0 then
        lbxDetail.Items.Delete(liFieldIndex);

      liFieldIndex := lbxMaster.Items.IndexOf(lsMasterAlias);
      if liFieldIndex >= 0 then
        lbxMaster.Items.Delete(liFieldIndex);


    end;

  EnableValidButtons;

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.GetDataPipeline}

function TppMasterFieldLinkEditor.GetDataPipeline: TComponent;
begin
  Result := FDetailPipeline;
end; {procedure, GetDataPipeline}


{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.LanguageChanged}

procedure TppMasterFieldLinkEditor.LanguageChanged;
begin

 { Caption := ppLoadStr(??); }

 {lblMaster.Caption :=  ppLoadStr(??);
 lblDetail.Caption :=  ppLoadStr(??);
 lblJoin.Caption :=  ppLoadStr(??);  }

  btnAdd.Caption    := ppLoadStr(260);
  btnDelete.Caption := ppLoadStr(124);
{  btnClear.Caption  :=  ppLoadStr(??);}

  btnOK.Caption     := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

end; {procedure, LanguageChanged}



{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.EnableValidButtons}

procedure TppMasterFieldLinkEditor.EnableValidButtons;
begin

  btnAdd.Enabled := (FMasterPipeline <> nil) and
                    (lbxDetail.ItemIndex >= 0) and (lbxMaster.ItemIndex >= 0) and
                    (lbxDetail.Selected[lbxDetail.ItemIndex]) and
                    (lbxMaster.Selected[lbxMaster.ItemIndex]);

  btnDelete.Enabled := (lbxJoin.Items.Count > 0) and (lbxJoin.ItemIndex >= 0) and
                       (lbxJoin.Selected[lbxJoin.ItemIndex]);
                       
  btnClear.Enabled  := (lbxJoin.Items.Count > 0);

end; {procedure, EnableValidButtons}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.ListBoxClick}

procedure TppMasterFieldLinkEditor.ListBoxClick(Sender: TObject);
begin
  EnableValidButtons;
end; {procedure, ListBoxClick}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.btnAddClick}

procedure TppMasterFieldLinkEditor.btnAddClick(Sender: TObject);
var
  lsJoinDesc: String;
  lFieldLink: TppMasterFieldLink;
  lsFieldAlias: String;

begin

  if (lbxDetail.ItemIndex < 0) or (lbxDetail.ItemIndex > lbxDetail.Items.Count-1) then Exit;

  if (lbxMaster.ItemIndex < 0) or (lbxMaster.ItemIndex > lbxMaster.Items.Count-1) then Exit;

  {create a new field link }
  lFieldLink := TppMasterFieldLink.Create(nil);
  lFieldLink.DetailDataPipeline := FDetailPipeline;

  {assign the detail field name}
  lsFieldAlias := lbxDetail.Items[lbxDetail.ItemIndex];
  lFieldLink.DetailFieldName := FDetailPipeline.FieldNameForFieldAlias(lsFieldAlias);

  {assign the master field name}
  lsFieldAlias := lbxMaster.Items[lbxMaster.ItemIndex];
  lFieldLink.MasterFieldName := FMasterPipeline.FieldNameForFieldAlias(lsFieldAlias);

  {add to the 'new' list}
  FNewLinks.AddObject(lFieldLink.MasterFieldName, lFieldLink);

  {add item to the list box}
  lsJoinDesc := lbxDetail.Items[lbxDetail.ItemIndex] + ' -> ' +
                lbxMaster.Items[lbxMaster.ItemIndex];


  lbxDetail.Items.Delete(lbxDetail.ItemIndex);
  lbxMaster.Items.Delete(lbxMaster.ItemIndex);

  lbxJoin.Items.AddObject(lsJoinDesc, lFieldLink);

  EnableValidButtons;
  
end; {procedure, btnAddClick}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.btnDeleteClick}

procedure TppMasterFieldLinkEditor.btnDeleteClick(Sender: TObject);
var
  lFieldLink: TppMasterFieldLink;

begin

  if (lbxJoin.ItemIndex < 0) or (lbxJoin.ItemIndex > lbxJoin.Items.Count-1) then Exit;

  {get the field link and delete it}
  lFieldLink := TppMasterFieldLink(lbxJoin.Items.Objects[lbxJoin.ItemIndex]);

  DeleteFieldLink(lFieldLink);

  lbxJoin.Items.Delete(lbxJoin.ItemIndex);

  EnableValidButtons;

end; {procedure, btnDeleteClick}

{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.DeleteFieldLink}

procedure TppMasterFieldLinkEditor.DeleteFieldLink(aFieldLink: TppMasterFieldLink);
var
  liIndex: Integer;
  lsDetailAlias: String;
  lsMasterAlias: String;

begin

  {add fields to list boxes}
  lsDetailAlias := FDetailPipeline.FieldAliasForFieldName(aFieldLink.DetailFieldName);
  lsMasterAlias := FMasterPipeline.FieldAliasForFieldName(aFieldLink.MasterFieldName);

  lbxDetail.Items.Add(lsDetailAlias);
  lbxMaster.Items.Add(lsMasterAlias);


  liIndex := FNewLinks.IndexOfObject(aFieldLink);

  {delete from the 'new' list if needed, otherwise add to the 'deleted' list}
  if (liIndex >= 0) and (liIndex < FNewLinks.Count) then
    begin
      aFieldLink.Free;
      FNewLinks.Delete(liIndex);
    end
  else
    FDeletedLinks.AddObject(aFieldLink.MasterFieldName, aFieldLink);

end; {procedure, DeleteFieldLink}


{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.btnClearClick}

procedure TppMasterFieldLinkEditor.btnClearClick(Sender: TObject);
var
  lFieldLink: TppMasterFieldLink;
  liIndex: Integer;

begin

  for liIndex := 0 to lbxJoin.Items.Count-1 do
    begin
      lFieldLink := TppMasterFieldLink(lbxJoin.Items.Objects[liIndex]);

      DeleteFieldLink(lFieldLink);
    end;

  lbxJoin.Items.Clear;
  EnableValidButtons;

end; {procedure, btnClearClick}


{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.btnOKClick}

procedure TppMasterFieldLinkEditor.btnOKClick(Sender: TObject);
var
  lFieldLink: TppMasterFieldLink;
  liIndex: Integer;

begin

  {apply deletes }
  for liIndex := 0 to FDeletedLinks.Count-1 do
    begin
      lFieldLink := TppMasterFieldLink(FDeletedLinks.Objects[liIndex]);
      FDetailPipeline.RemoveMasterFieldLink(lFieldLink);
      lFieldLink.Free;
    end;

end; {procedure, btnOKClick}


{------------------------------------------------------------------------------}
{ TppMasterFieldLinkEditor.btnCancelClick}

procedure TppMasterFieldLinkEditor.btnCancelClick(Sender: TObject);
var
  lFieldLink: TppMasterFieldLink;
  liIndex: Integer;

begin

  {user cancelled, therefore need to delete new links}
  for liIndex := 0 to FNewLinks.Count-1 do
    begin
      lFieldLink := TppMasterFieldLink(FNewLinks.Objects[liIndex]);
      lFieldLink.Free;
    end;

end;   {procedure, btnCancelClick}


end.
