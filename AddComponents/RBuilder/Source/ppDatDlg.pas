{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDatDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, TypInfo, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppForms, ppTypes, ppDsIntf, ppDB, ppComm, ppUtils;

type
  TppDataDialog = class(TppCustomDataDialog)
    btnOK: TButton;
    btnCancel: TButton;
    lblMaster: TLabel;
    lbxMasterData: TListBox;
    lblDetail: TLabel;
    lbxDetailData: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbxMasterDataClick(Sender: TObject);
    procedure lbxMasterDataDblClick(Sender: TObject);
    procedure lbxDetailDataClick(Sender: TObject);
    procedure lbxDetailDataDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);

  private
    FNoneString: String;
    FDataNames: TppDataPipelineList;
    FMasterDataName: String;
    FDetailDataName: String;

  protected
    procedure Activate; override;
    procedure LanguageChanged; override;

  public

  end;


var
  ppDataDialog: TppDataDialog;

implementation


{$R *.DFM}

{------------------------------------------------------------------------------}
{ TppDataDialog.FormCreate }

procedure TppDataDialog.FormCreate(Sender: TObject);
begin

  FMasterDataName  := '';
  FDetailDataName  := '';

end;

{------------------------------------------------------------------------------}
{ TppDataDialog.FormDestroy }

procedure TppDataDialog.FormDestroy(Sender: TObject);
begin
  FDataNames.Free;
end;

{------------------------------------------------------------------------------}
{ TppDataDialog.Activate }

procedure TppDataDialog.Activate;

begin

  if Report = nil then Exit;

  FDataNames := TppDataPipelineList.Create(Report);

  {initialize master list box}
  lbxMasterData.Items := FDataNames;
  lbxMasterData.Items.Insert(0, FNoneString);

  if MasterDataPipeline <> nil then
    FMasterDataName := TppCommunicator(MasterDataPipeline).UserName;

  lbxMasterData.ItemIndex := lbxMasterData.Items.IndexOf(FMasterDataName);

  if lbxMasterData.ItemIndex < 0 then
    begin
      lbxMasterData.ItemIndex := 0;
      FMasterDataName := FNoneString;
    end;

  {initialize detail list box}
  lbxDetailData.Items := FDataNames;
  lbxDetailData.Items.Insert(0, FNoneString);

  if DetailDataPipeline <> nil then
    FDetailDataName := TppCommunicator(DetailDataPipeline).UserName ;

  lbxDetailData.ItemIndex :=  lbxDetailData.Items.IndexOf(FDetailDataName);

  if lbxDetailData.ItemIndex < 0 then
    begin
      lbxDetailData.ItemIndex := 0;
      FDetailDataName := FNoneString;
    end;

end;

{------------------------------------------------------------------------------}
{ TppDataDialog.LanguageChanged }

procedure TppDataDialog.LanguageChanged;
begin

  Caption := ppLoadStr(141); {Data}

  FNoneString := ppLoadStr(343);

  lblMaster.Caption := ppLoadStr(395);
  lblDetail.Caption := ppLoadStr(396);

  btnOK.Caption := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

end; {procedure, LanguageChanged}


{------------------------------------------------------------------------------}
{ TppDataDialog.btnOKClick }

procedure TppDataDialog.btnOKClick(Sender: TObject);
var
  liIndex: Integer;

begin

  {get the master data pipeline}
  if FMasterDataName = FNoneString then
    MasterDataPipeline := nil

  else
    begin
      liIndex := FDataNames.IndexOf(FMasterDataName);
      if liIndex >= 0 then
        MasterDataPipeline := TppDataPipeline(FDataNames.Objects[liIndex]);
    end;


  {get the detail data pipeline}
  if FDetailDataName = FNoneString then
    DetailDataPipeline := nil

  else
    begin
      liIndex := FDataNames.IndexOf(FDetailDataName);
      if liIndex >= 0 then
        DetailDataPipeline := TppDataPipeline(FDataNames.Objects[liIndex]);
    end;


end;


{------------------------------------------------------------------------------}
{ TppDataDialog.lbxMasterDataClick }

procedure TppDataDialog.lbxMasterDataClick(Sender: TObject);
begin
  FMasterDataName := lbxMasterData.Items[lbxMasterData.ItemIndex];
end;


{------------------------------------------------------------------------------}
{ TppDataDialog.lbxMasterDataDblClick }
procedure TppDataDialog.lbxMasterDataDblClick(Sender: TObject);
begin
  FMasterDataName := lbxMasterData.Items[lbxMasterData.ItemIndex];
  btnOKClick(Self);
end;


{------------------------------------------------------------------------------}
{ TppDataDialog.lbxDetailDataClick }

procedure TppDataDialog.lbxDetailDataClick(Sender: TObject);
begin
  FDetailDataName := lbxDetailData.Items[lbxDetailData.ItemIndex];
end;

{------------------------------------------------------------------------------}
{ TppDataDialog.lbxDetailDataDblClick }

procedure TppDataDialog.lbxDetailDataDblClick(Sender: TObject);
begin
  FDetailDataName := lbxDetailData.Items[lbxDetailData.ItemIndex];
  btnOKClick(Self);
end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomDataDialog, TppDataDialog);

finalization

  ppUnRegisterForm(TppCustomDataDialog);

end.
