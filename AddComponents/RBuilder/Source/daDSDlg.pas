{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDSDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ppComm, ppForms, ppDB, ppTypes, ppUtils,
  ppWizard, ppDsgnDB, daDataVw, daDB;


type

  { TdaDataSettingsDialog }
  TdaDataSettingsDialog = class(TppCustomDataSettingsDialog)
    cbxSessionType: TComboBox;
    lblSessionType: TLabel;
    lblDatabaseName: TLabel;
    cbxDatabaseName: TComboBox;
    lblDataAccess: TLabel;
    ckbEditSQLAsText: TCheckBox;
    cbxSQLType: TComboBox;
    lblSQLType: TLabel;
    Bevel1: TBevel;
    lblDataConnection: TLabel;
    cbxDataDictionary: TComboBox;
    btnOK: TButton;
    btnCancel: TButton;
    Bevel3: TBevel;
    ckbDataDictionary: TCheckBox;
    lblUseDataDictionary: TLabel;
    lblEditSQLAsText: TLabel;
    lblDatabaseType: TLabel;
    cbxDatabaseType: TComboBox;
    Bevel2: TBevel;
    procedure cbxSessionTypeChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ckbDataDictionaryClick(Sender: TObject);
    procedure lblUseDataDictionaryClick(Sender: TObject);
    procedure lblEditSQLAsTextClick(Sender: TObject);
    procedure cbxDatabaseNameChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxDatabaseTypeChange(Sender: TObject);
  private
    FDataSettings: TppDataSettings;
    FSession: TdaSession;

    procedure BuildDatabaseNameList;
    procedure BuildDatabaseTypeList;
    procedure BuildDataDictionaryList;
    procedure BuildSQLTypeList;
    function  GetDataDictionary: TppDataDictionary;
    function  GetDatabaseType: TppDatabaseType;
    procedure SelectSession(const aSessionName: String);
    procedure SelectDatabaseName(const aDatabaseName: String);
    procedure SelectDatabaseType(aDatabaseType: TppDatabaseType);

  protected
    function  GetDataSettings: TPersistent; override;
    procedure LanguageChanged; override;
    procedure SetDataSettings(aDataSettings: TPersistent); override;

  public
    procedure Initialize; override;

  end; {class, TdaDataSettingsDialog}

var
  daDataSettingsDialog: TdaDataSettingsDialog;

implementation

{$R *.DFM}

{******************************************************************************
 *
 **  F O R M   E V E N T   H A N D L E R S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.FormCreate }

procedure TdaDataSettingsDialog.FormCreate(Sender: TObject);
begin
  FSession := nil;
  FDataSettings := nil;
end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.FormDestroy }

procedure TdaDataSettingsDialog.FormDestroy(Sender: TObject);
begin
  FSession.Free;
end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.cbxSessionTypeChange }

procedure TdaDataSettingsDialog.cbxSessionTypeChange(Sender: TObject);
begin
  SelectSession(cbxSessionType.Text);
end; {procedure, cbxSessionTypeChange}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.cbxDatabaseNameChange }

procedure TdaDataSettingsDialog.cbxDatabaseNameChange(Sender: TObject);
begin
  SelectDatabaseName(cbxDatabaseName.Text);
end; {procedure, cbxDatabaseNameChange}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.cbxDatabaseTypeChange }

procedure TdaDataSettingsDialog.cbxDatabaseTypeChange(Sender: TObject);
begin
  SelectDatabaseType(TppDatabaseType(cbxDatabaseType.Items.Objects[cbxDatabaseType.ItemIndex]));
end; {procedure, cbxDatabaseTypeChange}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.ckbDataDictionaryClick }

procedure TdaDataSettingsDialog.ckbDataDictionaryClick(Sender: TObject);
begin
  cbxDataDictionary.Enabled := ckbDataDictionary.Checked;
end; {procedure, ckbDataDictionaryClick}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.lblUseDataDictionaryClick }

procedure TdaDataSettingsDialog.lblUseDataDictionaryClick(Sender: TObject);
begin
  ckbDataDictionary.Checked := not(ckbDataDictionary.Checked);
  cbxDataDictionary.Enabled := ckbDataDictionary.Checked;
end; {procedure, lblUseDataDictionaryClick}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.lblEditSQLAsTextClick }

procedure TdaDataSettingsDialog.lblEditSQLAsTextClick(Sender: TObject);
begin
  ckbEditSQLAsText.Checked := not(ckbEditSQLAsText.Checked);
end; {procedure, lblEditSQLAsTextClick}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.btnOKClick }

procedure TdaDataSettingsDialog.btnOKClick(Sender: TObject);
begin
  FDataSettings.AllowEditSQL := ckbEditSQLAsText.Checked;
  FDataSettings.SessionType := cbxSessionType.Text;
  FDataSettings.DatabaseName := cbxDatabaseName.Text;
  FDataSettings.DatabaseType := GetDatabaseType;
  FDataSettings.SQLType := TppSQLType(cbxSQLType.ItemIndex);
  FDataSettings.UseDataDictionary := ckbDataDictionary.Checked;
  FDataSettings.DataDictionary := GetDataDictionary;
end; {procedure, btnOKClick}

{******************************************************************************
 *
 **  R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.SetDataSettings }

procedure TdaDataSettingsDialog.SetDataSettings(aDataSettings: TPersistent);
begin
  FDataSettings := TppDataSettings(aDataSettings);

  Initialize;
end; {procedure, SetDataSettings}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.GetDataSettings }

function TdaDataSettingsDialog.GetDataSettings: TPersistent;
begin
  Result := FDataSettings;
end; {function, GetDataSettings}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.Initialize }

procedure TdaDataSettingsDialog.Initialize;
var
  lbEnableDictionary: Boolean;
begin

  {get list of supported sessions}
  daGetDataViewSessionClasses(cbxSessionType.Items);

  {set session name}
  SelectSession(FDataSettings.SessionType);

  {set database name}
  SelectDatabaseName(FDataSettings.DatabaseName);

  {set database type}
  SelectDatabaseType(FDataSettings.DatabaseType);

  {set SQL type}
  BuildSQLTypeList;

  cbxSQLType.ItemIndex := Ord(FDataSettings.SQLType);

  ckbEditSQLAsText.Checked := FDataSettings.AllowEditSQL;

  {get list of any available data dictionary components}
  BuildDataDictionaryList;

  lbEnableDictionary := (cbxDataDictionary.Items.Count > 0);
  ckbDataDictionary.Enabled := lbEnableDictionary;
  lblUseDataDictionary.Enabled := lbEnableDictionary;

  if lbEnableDictionary then
    ckbDataDictionary.Checked := FDataSettings.UseDataDictionary
  else
    ckbDataDictionary.Checked := False;

  cbxDataDictionary.Enabled := ckbDataDictionary.Checked;

end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.GetDatabaseType }

function TdaDataSettingsDialog.GetDatabaseType: TppDatabaseType;
begin

  if (cbxDatabaseType.ItemIndex = -1) then
    Result := dtOther
  else
    Result := TppDatabaseType(cbxDatabaseType.Items.Objects[cbxDatabaseType.ItemIndex]);

end; {function, GetDatabaseType}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.GetDataDictionary }

function TdaDataSettingsDialog.GetDataDictionary: TppDataDictionary;
begin

  if ckbDataDictionary.Checked and (cbxDataDictionary.ItemIndex <> -1) then
    Result := TppDataDictionary(cbxDataDictionary.Items.Objects[cbxDataDictionary.ItemIndex])
  else
    Result := nil;

end; {function, GetDataDictionary}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.BuildDatabaseNameList }

procedure TdaDataSettingsDialog.BuildDatabaseNameList;
begin

  if (FSession = nil) then Exit;

  daGetDatabaseNames(TdaSessionClass(FSession.ClassType), cbxDatabaseName.Items, DataModule.Owner);

end; {procedure, BuildDatabaseNameList}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.BuildDatabaseTypeList }

procedure TdaDataSettingsDialog.BuildDatabaseTypeList;
var
  lDatabaseType: TppDatabaseType;
  lsItem: String;
begin

  cbxDatabaseType.Items.Clear;

  if (FSession = nil) then Exit;

  for lDatabaseType := Low(TppDatabaseType) to High(TppDatabaseType) do
    begin
      if (lDatabaseType in FSession.ValidDatabaseTypes) then
        begin
          lsItem := ppGetEnumName(TypeInfo(TppDatabaseType), Ord(lDatabaseType));

          lsItem := Copy(lsItem, 3, Length(lsItem));

          cbxDatabaseType.Items.AddObject(lsItem, TObject(lDatabaseType));
        end;
    end;

end; {procedure, BuildDatabaseTypeList}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.BuildDataDictionaryList }

procedure TdaDataSettingsDialog.BuildDataDictionaryList;
var
  lComponentList: TppCommunicatorPickList;
begin

  lComponentList := TppCommunicatorPickList.Create(TppCommunicator(DataModule), TppDataDictionary);

  cbxDataDictionary.Items.Assign(lComponentList);

  if FDataSettings.DataDictionary = nil then
    cbxDataDictionary.ItemIndex := 0
  else
    cbxDataDictionary.ItemIndex := cbxDataDictionary.Items.IndexOf(FDataSettings.DataDictionary.UserName);

  lComponentList.Free;

end; {procedure, BuildDataDictionaryList}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.BuildSQLTypeList }

procedure TdaDataSettingsDialog.BuildSQLTypeList;
begin

  cbxSQLType.Items.Clear;

  cbxSQLType.Items.Add('Local SQL');
  cbxSQLType.Items.Add('SQL1');
  cbxSQLType.Items.Add('SQL2');

end; {procedure, BuildSQLTypeList}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.SelectSession }

procedure TdaDataSettingsDialog.SelectSession(const aSessionName: String);
var
  lSessionClass: TdaSessionClass;
begin

  if (FSession <> nil) and (CompareText(FSession.ClassName, aSessionName) = 0) then Exit;

  if (FSession <> nil) then
    begin
      FSession.Free;
      
      FSession := nil;
    end;

  lSessionClass := daGetSessionClass(aSessionName);

  if (lSessionClass <> nil) then
    FSession := lSessionClass.Create(Self);

  BuildDatabaseTypeList;
  BuildDatabaseNameList;

  cbxSessionType.ItemIndex := cbxSessionType.Items.IndexOf(aSessionName);

  SelectDatabaseName('');

end; {procedure, SelectSession}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.SelectDatabaseName }

procedure TdaDataSettingsDialog.SelectDatabaseName(const aDatabaseName: String);
var
  lDatabaseType: TppDatabaseType;
begin

  cbxDatabaseName.Text := '';
  cbxDatabaseName.ItemIndex := cbxDatabaseName.Items.IndexOf(aDatabaseName);

  if (FSession <> nil) then
    lDatabaseType := FSession.GetDatabaseType(aDatabaseName)
  else
    lDatabaseType := dtOther;

  SelectDatabaseType(lDatabaseType);

end; {procedure, SelectDatabaseName}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.SelectDatabaseType }

procedure TdaDataSettingsDialog.SelectDatabaseType(aDatabaseType: TppDatabaseType);
var
  lbFound: Boolean;
  liIndex: Integer;
begin

  lbFound := False;
  liIndex := 0;
  
  while not(lbFound) and (liIndex < cbxDatabaseType.Items.Count) do
    begin
      if (aDatabaseType = TppDatabaseType(cbxDatabaseType.Items.Objects[liIndex])) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if (lbFound) then
    cbxDatabaseType.ItemIndex := liIndex
  else
    cbxDatabaseType.ItemIndex := -1;

  if (FSession <> nil) then
  cbxSQLType.ItemIndex := Ord(FSession.DefaultSQLType(aDatabaseType));

end; {procedure, SelectDatabaseType}

{------------------------------------------------------------------------------}
{ TdaDataSettingsDialog.LanguageChanged }

procedure TdaDataSettingsDialog.LanguageChanged;
begin

  Caption := ppLoadStr(748); {Database Settings}

  lblSessionType.Caption := ppLoadStr(825); {Session Type}
  lblDataConnection.Caption:= ppLoadStr(744); {Data Connection}
  lblDatabaseName.Caption := ppLoadStr(747); {Database Name}
  lblDataAccess.Caption:= ppLoadStr(743); {Data Access}
  lblSQLType.Caption := ppLoadStr(831); {SQL Type}
  lblUseDataDictionary.Caption := ppLoadStr(745); {Data Dictionary}
  lblEditSQLAsText.Caption := ppLoadStr(720); {Allow Edit SQL As Text}

  lblDatabaseType.Caption := ppLoadStr(843); {Database Type}

  btnOK.Caption := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

end; {procedure, LanguageChanged}






end.
