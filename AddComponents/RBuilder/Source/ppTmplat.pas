{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppTmplat;

interface

{$I ppIfDef.pas}

uses SysUtils, Classes, Dialogs, ppDsIntf, ppTypes, ppUtils, ppDB, ppRTTI;

type

  TppTemplateClass = class of TppTemplate;

  { TppTemplateDBSettings }
  TppTemplateDBSettings = class(TPersistent)
    private
      FDataPipeline: TppDataPipeline;
      FName: String;
      FNameField: String;
      FTemplateField: String;
      FOnNameChange: TNotifyEvent;
      FOnDataPipelineChange: TNotifyEvent;

      procedure SetDataPipeline(aDataPipeline: TppDataPipeline);
      procedure SetName(aName: String);

    public
      constructor Create; virtual;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      property OnNameChange: TNotifyEvent read FOnNameChange write FOnNameChange;
      property OnDataPipelineChange: TNotifyEvent read FOnDataPipelineChange write FOnDataPipelineChange;

    published
      property DataPipeline: TppDataPipeline read FDataPipeline write SetDataPipeline;
      property Name: String read FName write SetName;
      property NameField: String read FNameField write FNameField;
      property TemplateField: String read FTemplateField write FTemplateField;

    end;

  { TppCustomTemplate }
  TppCustomTemplate = class(TPersistent)
  private
    FDatabaseSettings: TppTemplateDBSettings;
    FFileName: String;
    FFormat: TppFormatType;
    FOffset: Longint;
    FSaveTo: TppSaveToType;
    FOwner: TComponent;

  protected
    function  GetDescription: String; virtual;
    procedure SetDatabaseSettings(aDatabaseSettings: TppTemplateDBSettings); virtual;
    procedure SetFileName(aFileName: String); virtual;
    procedure SetDescription(aDescription: String); virtual;

  public
    constructor Create(aOwner: TComponent); virtual;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
    function CheckDatabaseSettings: Boolean; virtual;

    property DatabaseSettings: TppTemplateDBSettings read FDatabaseSettings write SetDatabaseSettings;
    property Description: String read GetDescription write SetDescription;
    property FileName: String read FFileName write SetFileName;
    property Format: TppFormatType read FFormat write FFormat default ftBinary;
    property Offset: Longint read FOffset write FOffset default 0;
    property Owner: TComponent read FOwner;
    property SaveTo: TppSaveToType read FSaveTo write FSaveTo default stFile;

  end; {class, TppCustomTemplate }

  { TppTemplate }
  TppTemplate = class(TppCustomTemplate)
    private
      FCurrentComponent: TComponent;
      FFileExtension: String;  {rap}
      FFileFilter: String;     {rap}
      FIgnoreErrors: Boolean;
    {  FMethods: TStringList;}
      FLanguageIndex: Longint;
      FOnCreateDialog: TppDialogEvent;
      FOnLoadEnd: TNotifyEvent;
      FOnLoadStart: TppStreamEvent;
      FOnLocateRecord: TppLocateEvent;
      FOnNew: TNotifyEvent;
      FOnSaveEnd: TppStreamEvent;
      FOnSaveStart: TNotifyEvent;
      FRoot: TComponent;
      FSaveTemplate: TppTemplate;

      {for use by the Report Explorer}
      FreOnCreateDialog: TppDialogEvent;
      FreOnNew: TNotifyEvent;
      FreOnLoadEnd: TNotifyEvent;
      FreOnLocateRecord: TppLocateEvent;
      FreOnSaveEnd: TppStreamEvent;

      procedure ComputeOffSetFromStream(aStream: TStream);
      procedure DBSettingsNameChangeEvent(Sender: TObject);
      procedure DBSettingsPipelineChangeEvent(Sender: TObject);
      procedure DoOnCreateDialog(Sender: TObject; aDialog: TObject);
      procedure DoOnNew(Sender: TObject);
      procedure DoOnSaveStart(Sender: TObject);
      procedure DoOnLoadEnd(Sender: TObject);
      function  DoOnLocateRecord(Sender: TObject; const aName: String): Boolean;
{$IFDEF OLD}
      function  GetMethodFromDesigner(const MethodName: string; var Address: Pointer): Boolean;
      procedure GetMethodsProc(const MethodName: String);
{$ENDIF}
      procedure LoadFromSource(aSaveToType: TppSaveToType);
      procedure SaveToSource(aSaveToType: TppSaveToType);

      function IsValidASCIISignature(aStream: TStream): Boolean;
      function IsValidBinarySignature(aStream: TStream): Boolean;

    protected

      procedure SetFileName(aFileName: String); override;

      procedure CheckObjectStream(aObjectStream: TMemoryStream); virtual;
      procedure DoOnLoadStart(aStream: TMemoryStream); virtual;
      procedure DoOnSaveEnd(aStream: TMemoryStream); virtual;
      function  BinaryStreamToTextStream(aBinaryStream: TMemoryStream): TMemoryStream;
      function  TextStreamToBinaryStream(aTextStream: TMemoryStream): TMemoryStream;

      function GetFormDesigner: TppFormDesigner; virtual;
      function GetReadOnly:Boolean; virtual;
      function StreamType(aStream: TStream): TppFormatType;

      {functions used by Reader during load }
      procedure LoadCallback(Component: TComponent); virtual;
      procedure LoadSetName(Reader: TReader; Component: TComponent; var Name: string); virtual;
      procedure LoadFindMethod(Reader: TReader; const MethodName: string;
                                var Address: Pointer; var Error: Boolean); virtual;
      procedure LoadError(Reader: TReader; const Message: string; var Handled: Boolean); virtual;

      function  LoadStart: Boolean; virtual;
      procedure ObjectTextToBinaryStart(aTextStream: TMemoryStream); virtual;
      procedure LoadEnd(aLoaded: Boolean); virtual;

      function  SaveStart: Boolean; virtual;
      procedure SaveEnd(aSaved: Boolean); virtual;
      procedure NameChanged; virtual;
      procedure DataPipelineChange(aDataPipeline: TObject); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure AssignWithEvents(Source: TPersistent);
      function  CheckDatabaseSettings: Boolean; override;
      procedure InitializeSettings(aTemplate: TppTemplate);
      procedure Load;  virtual;
      procedure LoadFromDatabase; virtual;
      procedure LoadFromFile; virtual;
      procedure Save; virtual;
      procedure SaveToDatabase; virtual;
      procedure SaveToFile; virtual;
      procedure New; virtual;

      function ShowOpenDialog: Boolean;
      function ShowSaveDialog: Boolean;
      function ShowDBOpenDialog: Boolean;
      function ShowDBSaveDialog: Boolean;
      function ShowFileOpenDialog: Boolean;
      function ShowFileSaveDialog: Boolean;

      function LocateRecord: Boolean;
      function LocateFile: Boolean;

      property FileExtension: String read FFileExtension write FFileExtension;
      property FileFilter: String read FFileFilter write FFileFilter;

      property LanguageIndex: Longint read FLanguageIndex write FLanguageIndex;
      property Root: TComponent read FRoot write FRoot;

      {for use by the Report Explorer}
      property reOnCreateDialog: TppDialogEvent read FreOnCreateDialog write FreOnCreateDialog;
      property reOnNew: TNotifyEvent read FreOnNew write FreOnNew;
      property reOnLoadEnd: TNotifyEvent read FreOnLoadEnd write FreOnLoadEnd;
      property reOnLocateRecord: TppLocateEvent read FreOnLocateRecord write FreOnLocateRecord;
      property reOnSaveEnd: TppStreamEvent read FreOnSaveEnd write FreOnSaveEnd;

      property OnCreateDialog: TppDialogEvent read FOnCreateDialog write FOnCreateDialog;
      property OnLoadStart: TppStreamEvent read FOnLoadStart write FOnLoadStart;
      property OnLoadEnd: TNotifyEvent read FOnLoadEnd write FOnLoadEnd;
      property OnLocateRecord: TppLocateEvent read FOnLocateRecord write FOnLocateRecord;
      property OnNew: TNotifyEvent read FOnNew write FOnNew;
      property OnSaveStart: TNotifyEvent read FOnSaveStart write FOnSaveStart;
      property OnSaveEnd: TppStreamEvent read FOnSaveEnd write FOnSaveEnd;

      property ReadOnly: Boolean read GetReadOnly;

    published
      property DatabaseSettings;
      property FileName;
      property Offset;
      property SaveTo default stFile;
      property Format default ftBinary;

  end; {class, TppTemplate }


  { TppReportTemplate }
  TppReportTemplate = class(TppTemplate)
    private
      FReport: TComponent;
      FNewReport: TComponent;
      FSaveReport: TComponent;
      FSaveViewer: TComponent;

      function VersionFromTextStream(aTextStream: TMemoryStream): Integer;


    protected

{$IFDEF WINDOWS}
      procedure CheckObjectStream(aObjectStream: TMemoryStream); override;
{$ENDIF}

      function  GetFormDesigner: TppFormDesigner; override;
      procedure NameChanged; override;
      procedure DataPipelineChange(aPipeline: TObject); override;

      {functions used by Reader during load }
      procedure LoadCallback(Component: TComponent); override;
      procedure LoadSetName(Reader: TReader; Component: TComponent; var Name: string); override;

      function LoadStart: Boolean; override;
      function SaveStart: Boolean; override;
      procedure ObjectTextToBinaryStart(aTextStream: TMemoryStream); override;
      procedure LoadEnd(aLoaded: Boolean); override;
      procedure SaveEnd(aSaved: Boolean); override;
      procedure SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure New; override;

      property Report: TComponent read FReport;

  end; {class, TppReportTemplate }

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppTemplateDBSettingsRTTI }
  TraTppTemplateDBSettingsRTTI = class(TraTObjectRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppTemplateDBSettingsRTTI}

  { TraTppCustomTemplateRTTI }
  TraTppCustomTemplateRTTI = class(TraTObjectRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomTemplateRTTI}

  { TraTppTemplateRTTI }
  TraTppTemplateRTTI = class(TraTppCustomTemplateRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppTemplateRTTI}

  { TraTppReportTemplateRTTI }
  TraTppReportTemplateRTTI = class(TraTppTemplateRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppReportTemplateRTTI}


implementation

uses
  Controls, ppClass, ppReport, ppViewr, Forms, TypInfo, ppTmDlg, ppForms;

const
  cBinarySignature: array[1..4] of Char = 'TPF0';
  cASCIISignature:  array[1..6] of Char = 'object';


{******************************************************************************
 *
 ** D B   T E M P L A T E   S E T T I N G S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTemplateDBSettings.Create }

constructor TppTemplateDBSettings.Create;
begin

  inherited Create;

  FName          := '';
  FNameField     := '';
  FTemplateField := '';
  FDataPipeline  := nil;
  FOnNameChange  := nil;

end;

{------------------------------------------------------------------------------}
{ TppTemplateDBSettings.Destroy }

destructor TppTemplateDBSettings.Destroy;
begin

   {tell data pipeline that we no longer exist}
 { if (FDataPipeline <> nil) then
    FDataPipeline.RemoveNotify(Self);}

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppTemplateDBSettings.Assign }

procedure TppTemplateDBSettings.Assign(Source: TPersistent);
var
  lDBSettings: TppTemplateDBSettings;

begin

  if Source is TppTemplateDBSettings then
    begin
      lDBSettings := Source as TppTemplateDBSettings;

      SetDataPipeline(lDBSettings.DataPipeline);

      SetName(lDBSettings.Name);
      FNameField     := lDBSettings.NameField;
      FTemplateField := lDBSettings.TemplateField;


    end

  else
    {this basically just raises an exception}
    inherited Assign(Source);

end;

{------------------------------------------------------------------------------}
{ TppTemplateDBSettings.SetDataPipeline }

procedure TppTemplateDBSettings.SetDataPipeline(aDataPipeline: TppDataPipeline);
begin

  {fire this event first adn pass the new datapipeline}
  if Assigned(FOnDataPipelineChange) then FOnDataPipelineChange(aDataPipeline);

  FDataPipeline := aDataPipeline;

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppTemplateDBSettings.SetName }

procedure TppTemplateDBSettings.SetName(aName: String);
begin

  FName := aName;

  if Assigned(FOnNameChange) then FOnNameChange(Self);

end; {procedure, SetName}

{******************************************************************************
 *
 ** C U S T O M   T E M P L A T E
 *
{******************************************************************************}

 {------------------------------------------------------------------------------}
{ TppCustomTemplate.Create }

constructor TppCustomTemplate.Create(aOwner: TComponent);
begin

  inherited Create;

  FOwner := aOwner;

  FDatabaseSettings := TppTemplateDBSettings.Create;

  FFileName := '';

  FOffSet := 0;

  FFormat := ftBinary;
  FSaveTo := stFile;

end;

{------------------------------------------------------------------------------}
{ TppCustomTemplate.Destroy }

destructor TppCustomTemplate.Destroy;
begin

  FDatabaseSettings.Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppCustomTemplate.Assign }

procedure TppCustomTemplate.Assign(Source: TPersistent);
var
  lppTemplate: TppCustomTemplate;

begin


  if Source is TppCustomTemplate then
    begin
      lppTemplate := Source as TppCustomTemplate;

      FDatabaseSettings.Assign(lppTemplate.DatabaseSettings);
      SetFileName(lppTemplate.FileName);

      FOffset      := lppTemplate.Offset;
      FSaveTo      := lppTemplate.SaveTo;
      FFormat      := lppTemplate.Format;

    end

  else
    {this basically just raises an exception}
    inherited Assign(Source);

end;

{------------------------------------------------------------------------------}
{ TppCustomTemplate.CheckDatabaseSettings }

function TppCustomTemplate.CheckDatabaseSettings: Boolean;
begin

  Result := (FDatabaseSettings.DataPipeline  <> nil) and
            (FDatabaseSettings.TemplateField <> '')  and
            (FDatabaseSettings.NameField     <> '');


end; {function, CheckDatabaseSettings}


{------------------------------------------------------------------------------}
{ TppCustomTemplate.GetDescription }

function TppCustomTemplate.GetDescription: String;
begin

  if FSaveTo = stFile then
    Result := FFileName
  else
    Result := FDatabaseSettings.Name;

end;

{------------------------------------------------------------------------------}
{ TppCustomTemplate.SetDescription }

procedure TppCustomTemplate.SetDescription(aDescription: String);
begin

  if FSaveTo = stFile then
    FFileName := aDescription
  else
    FDatabaseSettings.Name := aDescription;

end;

{------------------------------------------------------------------------------}
{ TppCustomTemplate.SetDatabaseSettings }

procedure TppCustomTemplate.SetDatabaseSettings(aDatabaseSettings: TppTemplateDBSettings);
begin
  FDatabaseSettings.Assign(aDatabaseSettings);
end;

{------------------------------------------------------------------------------}
{ TppCustomTemplate.SetFileName }

procedure TppCustomTemplate.SetFileName(aFileName: String);
begin
  FFileName := aFileName;
end;

{******************************************************************************
 *
 ** T E M P L A T E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTemplate.Create }

constructor TppTemplate.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  if (Owner <> nil) then
    FRoot  := Owner.Owner
  else
    FRoot := nil;

  FOnLoadEnd      := nil;
  FOnLoadStart    := nil;
  FOnLocateRecord := nil;
  FOnNew          := nil;
  FOnSaveEnd      := nil;
  FOnSaveStart    := nil;
  FLanguageIndex  := 0;
  FSaveTemplate   := nil;

  {for use by Report Explorer}
  FreOnCreateDialog := nil;
  FreOnNew := nil;
  FreOnLoadEnd := nil;
  FreOnLocateRecord := nil;
  FreOnSaveEnd := nil;

  DatabaseSettings.OnNameChange         := DBSettingsNameChangeEvent;
  DatabaseSettings.OnDataPipelineChange := DBSettingsPipelineChangeEvent;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTemplate.Destroy }

destructor TppTemplate.Destroy;
begin

  FSaveTemplate.Free;
  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppTemplate.AssignWithEvents }

procedure TppTemplate.AssignWithEvents(Source: TPersistent);
var
  lSourceTemplate: TppTemplate;

begin

  Assign(Source);

  if not (Source is TppTemplate) then Exit;

  lSourceTemplate := TppTemplate(Source);

  FOnCreateDialog := lSourceTemplate.FOnCreateDialog;
  FOnLoadStart    := lSourceTemplate.FOnLoadStart;
  FOnLoadEnd      := lSourceTemplate.FOnLoadEnd;
  FOnLocateRecord := lSourceTemplate.FOnLocateRecord;
  FOnNew          := lSourceTemplate.FOnNew;
  FOnSaveStart    := lSourceTemplate.FOnSaveStart;
  FOnSaveEnd      := lSourceTemplate.FOnSaveEnd;

  FreOnCreateDialog := lSourceTemplate.FreOnCreateDialog;
  FreOnLoadEnd      := lSourceTemplate.FreOnLoadEnd;
  FreOnLocateRecord := lSourceTemplate.FreOnLocateRecord;
  FreOnNew          := lSourceTemplate.FreOnNew;
  FreOnSaveEnd      := lSourceTemplate.FreOnSaveEnd;

end; {procedure, AssignWithEvents}


{------------------------------------------------------------------------------}
{ TppTemplate.InitializeSettings }

procedure TppTemplate.InitializeSettings(aTemplate: TppTemplate);
var
  lsName: String;
  lsFileName: String;

begin

  lsName     := DatabaseSettings.Name;
  lsFileName := FileName;

  AssignWithEvents(aTemplate);

  DatabaseSettings.Name := lsName;
  FileName := lsFileName;

end; {procedure, AssignEvents}

{------------------------------------------------------------------------------}
{ TppTemplate.New }

procedure TppTemplate.New;
begin
  DoOnNew(Self);
end; {procedure, New}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnCreateDialog }

procedure TppTemplate.DoOnCreateDialog(Sender: TObject; aDialog: TObject);
begin

  if Assigned(FOnCreateDialog) then FOnCreateDialog(Sender, aDialog);

  if Assigned(FreOnCreateDialog) then FreOnCreateDialog(Sender, aDialog);

end; {procedure, DoOnCreateDialog}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnNew }

procedure TppTemplate.DoOnNew(Sender: TObject);
begin

  if Assigned(FOnNew) then FOnNew(Sender);

  if Assigned(FreOnNew) then FreOnNew(Sender);

end; {procedure, DoOnNew}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnLocateRecord }

function TppTemplate.DoOnLocateRecord(Sender: TObject; const aName: String): Boolean;
begin

  Result := False;

  if Assigned(FOnLocateRecord) then
    Result := FOnLocateRecord(Sender, aName);

  if Assigned(FreOnLocateRecord) then
    Result := FreOnLocateRecord(Sender, aName);

end; {procedure, DoOnLocateRecord}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnLoadStart }

procedure TppTemplate.DoOnLoadStart(aStream: TMemoryStream);
begin
  if Assigned(FOnLoadStart) then FOnLoadStart(Self, aStream);
end;  {procedure, DoOnLoadStart}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnLoadEnd }

procedure TppTemplate.DoOnLoadEnd(Sender: TObject);
begin

  if Assigned(FOnLoadEnd) then FOnLoadEnd(Sender);

  if Assigned(FreOnLoadEnd) then FreOnLoadEnd(Sender);

end; {procedure, DoOnLoadEnd}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnSaveStart }

procedure TppTemplate.DoOnSaveStart(Sender: TObject);
begin
  if Assigned(FOnSaveStart) then FOnSaveStart(Sender);
end;  {procedure, DoOnSaveStart}

{------------------------------------------------------------------------------}
{ TppTemplate.DoOnSaveEnd }

procedure TppTemplate.DoOnSaveEnd(aStream: TMemoryStream);
begin

  if Assigned(FOnSaveEnd) then FOnSaveEnd(Self, aStream);

  if Assigned(FreOnSaveEnd) then FreOnSaveEnd(Self, aStream);

end; {procedure, DoOnSaveEnd}

{------------------------------------------------------------------------------}
{ TppTemplate.CheckDatabaseSettings }

function TppTemplate.CheckDatabaseSettings: Boolean;
var
  lFieldDataType: TppDataType;

begin

  Result := inherited CheckDatabaseSettings;

  if not Result then Exit;

  {check template field type }
  lFieldDataType := FDatabaseSettings.DataPipeline.GetFieldDataType(FDatabaseSettings.TemplateField);

  if not (lFieldDataType in [dtBlob, dtMemo]) then
    raise ETemplateSaveError.Create(ppLoadStr(53));

end; {function, CheckDatabaseSettings}

{------------------------------------------------------------------------------}
{ TppTemplate.GetFormDesigner }

function TppTemplate.GetFormDesigner: TppFormDesigner;
begin
  Result := nil;
end; {function, GetFormDesigner}

{------------------------------------------------------------------------------}
{ TppTemplate.GetReadOnly }

function TppTemplate.GetReadOnly:Boolean;
begin
  {return true if a file exists with read-only attribute set}
  if FileName = '' then
    Result := False
  else
    Result := FileExists(FileName) and ((faReadOnly and FileGetAttr(FileName) > 0))
end; {function, GetReadOnly}

{------------------------------------------------------------------------------}
{ TppTemplate.LocateFile }

function TppTemplate.LocateFile: Boolean;
begin
  if FileExists(FileName) then
    Result := True
  else
    Result := False;
end; {function, LocateFile}

{------------------------------------------------------------------------------}
{ TppTemplate.LocateRecord }

function TppTemplate.LocateRecord: Boolean;
var
  lsName: String;
begin

  lsName := FDatabaseSettings.Name;

  Result := DoOnLocateRecord(Self, lsName);

  if not(Assigned(FreOnLocateRecord)) and not(Assigned(FOnLocateRecord)) then
    begin

      if (FDatabaseSettings.DataPipeline <> nil) then
        Result := FDatabaseSettings.DataPipeline.Locate(FDatabaseSettings.NameField, lsName,[pploCaseInsensitive]);
    end;

end; {function, LocateRecord}

{------------------------------------------------------------------------------}
{ TppTemplate.Load }

procedure TppTemplate.Load;
begin
  LoadFromSource(FSaveTo);
end; {procedure, Load}


{------------------------------------------------------------------------------}
{ TppTemplate.LoadFromDatabase }

procedure TppTemplate.LoadFromDatabase;
begin
  LoadFromSource(stDatabase);
end; {procedure, LoadFromDatabase}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadFromFile }

procedure TppTemplate.LoadFromFile;
begin
  LoadFromSource(stFile);
end;  {procedure, LoadFromFile}

{------------------------------------------------------------------------------}
{ TppTemplate.Save }

procedure TppTemplate.Save;
begin
  SaveToSource(FSaveTo);
end;  {procedure, Save}

{------------------------------------------------------------------------------}
{ TppTemplate.SaveToDatabase }

procedure TppTemplate.SaveToDatabase;
begin
  SaveToSource(stDatabase);
end; {procedure, SaveToDatabase}

{------------------------------------------------------------------------------}
{ TppTemplate.SaveToFile }

procedure TppTemplate.SaveToFile;
begin
  SaveToSource(stFile);
end; {procedure, SaveToFile}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadFromSource }

procedure TppTemplate.LoadFromSource(aSaveToType: TppSaveToType);
var
  lReader: TReader;
  lTextStream,
  lBinaryStream,
  lLoadStream,
  lObjectStream: TMemoryStream;
  lbLoaded: Boolean;
  lsMsg: String;
begin

  FIgnoreErrors := False;
  lbLoaded := True;

  lBinaryStream := nil;
  lTextStream   := nil;
  lReader       := nil;

  lsMsg := ppLoadStr(46);

  if (aSaveToType = stDatabase) then
    begin

     {find template record in Database}
     if not FDatabaseSettings.DataPipeline.Active then
       FDatabaseSettings.DataPipeline.Open;

      if (not(CheckDatabaseSettings) or not(LocateRecord)) then

        raise ETemplateLoadError.Create(ppLoadStr(45) + ' ' + FDatabaseSettings.Name)

    end

  {find template file}
  else if (aSaveToType = stFile) and not LocateFile then

    raise ETemplateLoadError.Create(lsMsg + ' ' + FileName);

  {allow descendant classes to check whether its OK to load a template}
  if not LoadStart then Exit;

  lLoadStream := TMemoryStream.Create;

  if (aSaveToType = stDatabase) then

    {save template in blob to the TextStream}
    try
      FDatabaseSettings.DataPipeline.GetFieldAsStream(FDatabaseSettings.TemplateField, lLoadStream);
    except
      lLoadStream.Free;
      {error reading template from database}
      raise ETemplateLoadError.Create(ppLoadStr(47));
    end

  else if (aSaveToType = stFile) then
    begin
      {load template from file into TextStream}
      lLoadStream.LoadFromFile(FileName);

    end;

  try

    try

      {call OnLoadStart event}
      DoOnLoadStart(lLoadStream);

      FFormat := StreamType(lLoadStream);


      if FOffset > 0 then
        begin
          lLoadStream.Seek(FOffset, soFromBeginning);

          {copy the object definition to a separate stream}
          lObjectStream := TMemoryStream.Create;
          lObjectStream.CopyFrom(lLoadStream, lLoadStream.Size-FOffset);

        end

      else
        begin
          lObjectStream := lLoadStream;
          lLoadStream   := nil;
        end;

      CheckObjectStream(lObjectStream);

      lObjectStream.Seek(0, soFromBeginning);

      {convert text stream to binary if necessary}
      if (FFormat = ftASCII) then
        begin
          lTextStream   := lObjectStream;
          lBinaryStream := TextStreamToBinaryStream(lTextStream);
        end
      else
        begin
          lTextStream   := nil;
          lBinaryStream := lObjectStream;
        end;

      {read template from MemoryStream}
      lReader              := TReader.Create(lBinaryStream, 1024);
      lReader.OnSetName    := LoadSetName;
      lReader.OnFindMethod := LoadFindMethod;
      lReader.OnError      := LoadError;

      {reposition at beginning of stream}
      lBinaryStream.Seek(0, soFromBeginning);

      lReader.ReadComponents(FRoot, nil, LoadCallback);

    except
      lbLoaded := False;
      raise;
    end; {try, except}

  finally

    lReader.Free;
    lBinaryStream.Free;
    lLoadStream.Free;
    lTextStream.Free;

    LoadEnd(lbLoaded);

    DoOnLoadEnd(FOwner);

  end; {try, finally}


end; {procedure, LoadFromSource}

{------------------------------------------------------------------------------}
{ TppTemplate.IsValidASCIISignature }

function TppTemplate.IsValidASCIISignature(aStream: TStream): Boolean;
var
  lBuffer: array [1..SizeOf(cASCIISignature)] of char;

begin

 {note: ASCIISignature is a constant defined in this unit }

  aStream.Read(lBuffer, SizeOf(cASCIISignature));
  aStream.Seek(-SizeOf(cASCIISignature), soFromCurrent); {restore stream position}

  Result := (lBuffer = cASCIISignature);


end; {procedure, IsValidASCIISignature}

{------------------------------------------------------------------------------}
{ TppTemplate.IsValidBinarySignature }

function TppTemplate.IsValidBinarySignature(aStream: TStream): Boolean;
var
  lBuffer: array [1..SizeOf(cBinarySignature)] of char;

begin

  {note: BinarySignature is a constant defined in this unit }

  aStream.Read(lBuffer, SizeOf(cBinarySignature) );
  aStream.Seek(SizeOf(cBinarySignature), soFromCurrent); {restore stream position}

  Result := (lBuffer = cBinarySignature);

end; {procedure, IsValidBinarySignature}

{------------------------------------------------------------------------------}
{ TppTemplate.ComputeOffSetFromStream }

procedure TppTemplate.ComputeOffSetFromStream(aStream: TStream);
var
  liOffset: LongInt;

begin

  {1. check for object at FOffset position in stream }
  aStream.Seek(FOffset, soFromBeginning);

  if IsValidASCIISignature(aStream) or IsValidBinarySignature(aStream) then Exit;

  {2. check for object at beginning of stream }
  aStream.Seek(0, soFromBeginning);

  if IsValidASCIISignature(aStream) or IsValidBinarySignature(aStream) then
    begin
      FOffset := 0;
      Exit;
    end;

  {3. check for object by first reading an Offset value from beginning of stream }
  try
    aStream.Seek(0, soFromBeginning);
    aStream.Read(liOffset, SizeOf(LongInt));
  except

  end; {try, except}


  if liOffset > 0 then
    begin
      aStream.Seek(liOffset, soFromBeginning);

      if IsValidASCIISignature(aStream) or IsValidBinarySignature(aStream) then
        FOffset := liOffset;

    end;

end; {procedure, ComputeOffSetFromStream}

{------------------------------------------------------------------------------}
{ TppTemplate.StreamType }

function TppTemplate.StreamType(aStream: TStream): TppFormatType;
begin

  ComputeOffsetFromStream(aStream);

  aStream.Seek(FOffset, soFromBeginning);

  if IsValidASCIISignature(aStream) then
    Result := ftASCII

  else if IsValidBinarySignature(aStream) then
    Result := ftBinary

  else
    raise EInvalidTemplateError.Create(ppLoadStr(49));


end; {function, StreamType}

{------------------------------------------------------------------------------}
{ TppTemplate.TextStreamToBinaryStream }

function TppTemplate.TextStreamToBinaryStream(aTextStream: TMemoryStream): TMemoryStream;
var
  lDecimalSeparator: Char;
  lWriter: TWriter;

begin

  {allow descendants to perform any needed modifications to the TextStream}
  ObjectTextToBinaryStart(aTextStream);

  aTextStream.Seek(0,soFromBeginning);

  Result :=  TMemoryStream.Create;

  lDecimalSeparator := DecimalSeparator;

  try

    DecimalSeparator  := '.';

    {convert & copy binary MemoryStream content to text FileStream }
    ObjectTextToBinary(aTextStream, Result);

  finally

    DecimalSeparator := lDecimalSeparator;

  end; {try, except}


  {note: must write an extra EndList indicator following the above ObjectTextToBinary call}
  Result.Seek(0,soFromEnd);
  lWriter := TWriter.Create(Result, 1024);

  try
    lWriter.Root := FRoot;
    lWriter.WriteListEnd;

  finally
    lWriter.Free;

  end;

end; {function, TextStreamToBinaryStream}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadStart }

function TppTemplate.LoadStart: Boolean;
var
  lClass: TppTemplateClass;
begin

  Result := True;

  lClass := TppTemplateClass(ClassType);

  if FSaveTemplate = nil then
    FSaveTemplate := lClass.Create(nil);
  FSaveTemplate.Assign(Self);

end; {function, LoadStart}

{------------------------------------------------------------------------------}
{ TppTemplate.CheckObjectStream }

procedure TppTemplate.CheckObjectStream(aObjectStream: TMemoryStream);
begin

end;  {procedure, CheckObjectStream}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadEnd }

procedure TppTemplate.LoadEnd(aLoaded: Boolean);
begin

  {restore old template settings}
  if FSaveTemplate <>  nil then
    Assign(FSaveTemplate);

  FSaveTemplate.Free;
  FSaveTemplate := nil;

end; {procedure, LoadEnd}

{------------------------------------------------------------------------------}
{ TppTemplate.ObjectTextToBinaryStart }

procedure TppTemplate.ObjectTextToBinaryStart(aTextStream: TMemoryStream);
begin

end; {procedure, ObjectTextToBinaryStart}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadCallback }
procedure TppTemplate.LoadCallback(Component: TComponent);
begin

end; {procedure, LoadCallback}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadSetName }

procedure TppTemplate.LoadSetName(Reader: TReader; Component: TComponent; var Name: string);
begin
  FCurrentComponent := Component;
end; {procedure, LoadSetName}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadFindMethod }

procedure TppTemplate.LoadFindMethod(Reader: TReader; const MethodName: string;
                                var Address: Pointer; var Error: Boolean);
var
  lDesigner: TppFormDesigner;

begin

  if Error and (FRoot <> nil) and (csDesigning in FRoot.ComponentState) then
    begin
      lDesigner := GetFormDesigner;
      if (lDesigner <> nil) then
        Error := lDesigner.GetMethodAddress(FCurrentComponent, MethodName, Address);

    end;

end; {procedure, LoadFindMethod}

{------------------------------------------------------------------------------}
{ TppTemplate.LoadError }

procedure TppTemplate.LoadError(Reader: TReader; const Message: string; var Handled: Boolean);
var
  lFormClass: TFormClass;
  lErrorDialog: TppCustomTemplateErrorDialog;

begin

  Handled := True;

  if FIgnoreErrors then Exit;

  lFormClass := ppGetFormClass(TppCustomTemplateErrorDialog);
  lErrorDialog := TppCustomTemplateErrorDialog(lFormClass.Create(Application));
  lErrorDialog.LanguageIndex := FLanguageIndex;
  lErrorDialog.ErrorMessage := Message + #13#10 + ppLoadStr(50);

  case lErrorDialog.ShowModal of

    mrCancel:
      Handled := False;

    mrAll:
      FIgnoreErrors := True;

  end;

  lErrorDialog.Free;

end; {procedure, LoadError}

{------------------------------------------------------------------------------}
{ TppTemplate.SaveToSource}

procedure TppTemplate.SaveToSource(aSaveToType: TppSaveToType);
var
  lWriter: TWriter;
  lBinaryStream,
  lObjectStream,
  lTextStream,
  lSaveStream: TMemoryStream;
  lFileStream: TStream;
begin

  lSaveStream := nil;
  lObjectStream := nil;

  if (aSaveToType = stDatabase) and not CheckDatabaseSettings then Exit;

  if not SaveStart then Exit;

  DoOnSaveStart(FOwner);

  {write Template to MemoryStream}
  lBinaryStream := TMemoryStream.Create;
  lWriter       := TWriter.Create(lBinaryStream, 1024);

  try
    lWriter.Root := FRoot;
    lWriter.WriteSignature;
    lWriter.WriteComponent(Owner);
    lWriter.WriteListEnd;

  finally
    lWriter.Free;
   end;


  try

    {if ASCII must convert to Text }
    if FFormat = ftASCII then
      begin
        lTextStream   := BinaryStreamToTextStream(lBinaryStream);
        lObjectStream := lTextStream;
      end
    else if FFormat = ftBinary then
      begin
        lObjectStream := lBinaryStream;
        lBinaryStream := nil;
      end
    else
      begin
        lObjectStream := nil;
        lBinaryStream := nil;
      end;


    {copy object stream to save stream }
    lObjectStream.Seek(0, soFromBeginning);

    if FOffSet > 0 then
      begin
        lSaveStream := TMemoryStream.Create;
        lSaveStream.Seek(FOffset, soFromBeginning);
        lSaveStream.CopyFrom(lObjectStream, lObjectStream.Size);
      end
    else
      begin
        lSaveStream   := lObjectStream;
        lObjectStream := nil;
      end;


    lSaveStream.Seek(0, soFromBeginning);



    if (aSaveToType = stFile) then
      begin
        {call OnSaveEnd event}
        DoOnSaveEnd(lSaveStream);

        {raise error if file is read-only}
        if ReadOnly then
          raise ETemplateSaveError.Create(ppLoadStr(51));

        lFileStream := TFileStream.Create(FileName, fmOpenReadWrite or fmShareExclusive or fmCreate);
        lSaveStream.SaveToStream(lFileStream);
        lFileStream.Free;

      end

    else if (aSaveToType = stDatabase) then
      begin

       if not FDatabaseSettings.DataPipeline.Active then
        FDatabaseSettings.DataPipeline.Open;

       {edit existing record, or add a new record, if needed}
       if LocateRecord then
         begin
           FDatabaseSettings.DataPipeline.Edit;

           {call OnSaveEnd event}
           DoOnSaveEnd(lSaveStream);

           FDatabaseSettings.DataPipeline.SetFieldFromStream(FDatabaseSettings.TemplateField, lSaveStream);
         end
       else
         begin
           FDatabaseSettings.DataPipeline.Insert;
           FDatabaseSettings.DataPipeline.SetFieldValue(FDatabaseSettings.NameField, FDatabaseSettings.Name);

           {call OnSaveEnd event}
           DoOnSaveEnd(lSaveStream);

           FDatabaseSettings.DataPipeline.SetFieldFromStream(FDatabaseSettings.TemplateField, lSaveStream);
         end;

         FDatabaseSettings.DataPipeline.Post;

      end;

  finally

    lBinaryStream.Free;
    lObjectStream.Free;
    lSaveStream.Free;

    SaveEnd(True);

  end;

end; {procedure, SaveToSource}

{------------------------------------------------------------------------------}
{ TppTemplate.BinaryStreamToTextStream}

function TppTemplate.BinaryStreamToTextStream(aBinaryStream: TMemoryStream): TMemoryStream;
var
  lDecimalSeparator: Char;

begin

  lDecimalSeparator := DecimalSeparator;

  Result := TMemoryStream.Create;

  try
    {convert & copy binary BinaryStream content to TextStream }
    aBinaryStream.Seek(0, soFromBeginning);

    DecimalSeparator  := '.';

    ObjectBinaryToText(aBinaryStream, Result);

    DecimalSeparator := lDecimalSeparator;

  except

    DecimalSeparator := lDecimalSeparator;

    Result.Free;

    raise

  end;



end;  {function, BinaryStreamToTextStream}


{------------------------------------------------------------------------------}
{ TppTemplate.SaveStart }

function TppTemplate.SaveStart: Boolean;
begin

  Result := True
end; {function, SaveStart}

{------------------------------------------------------------------------------}
{ TppTemplate.SaveEnd }

procedure TppTemplate.SaveEnd(aSaved: Boolean);
begin

end;  {procedure, SaveEnd}

{------------------------------------------------------------------------------}
{ TppTemplate.DBSettingsNameChangeEvent }

procedure TppTemplate.DBSettingsNameChangeEvent(Sender: TObject);
begin
  NameChanged;
end;  {procedure, DBSettingsNameChangeEvent}


{------------------------------------------------------------------------------}
{ TppTemplate.DBSettingsPipelineChangeEvent }

procedure TppTemplate.DBSettingsPipelineChangeEvent(Sender: TObject);
begin
  DataPipelineChange(Sender);
end;  {procedure, DBSettingsPipelineChangeEvent}


{------------------------------------------------------------------------------}
{ TppTemplate.SetFileName }

procedure TppTemplate.SetFileName(aFileName: String);
begin
  inherited SetFileName(aFileName);
  NameChanged;
end;  {procedure, SetFileName}

{------------------------------------------------------------------------------}
{ TppTemplate.NameChanged }

procedure TppTemplate.NameChanged;
begin

end; {procedure, NameChanged}

{------------------------------------------------------------------------------}
{ TppTemplate.DataPipelineChange }

procedure TppTemplate.DataPipelineChange(aDataPipeline: TObject);
begin


end; {procedure, DataPipelineChange}


{------------------------------------------------------------------------------}
{ TppTemplate.ShowOpenDialog }

function TppTemplate.ShowOpenDialog;
begin
  if FSaveTo = stFile then
    Result := ShowFileOpenDialog
  else
    Result := ShowDBOpenDialog;
end;

{------------------------------------------------------------------------------}
{ TppTemplate.ShowSaveDialog }

function TppTemplate.ShowSaveDialog: Boolean;
begin
  if FSaveTo = stFile then
    Result := ShowFileSaveDialog
  else
    Result := ShowDBSaveDialog;
end;

{------------------------------------------------------------------------------}
{ TppTemplate.ShowDBOpenDialog }

function TppTemplate.ShowDBOpenDialog: Boolean;
var
  lFormClass: TFormClass;
  lDialog: TppCustomTemplateDialog;
begin

  Result := False;

  lFormClass := ppGetFormClass(TppCustomTemplateDialog);
  lDialog := TppCustomTemplateDialog(lFormClass.Create(Application));

  lDialog.DialogType    := ppdtOpen;
  lDialog.DataPipeline  := FDatabaseSettings.DataPipeline;
  lDialog.NameField     := FDatabaseSettings.NameField;
  lDialog.TemplateName  := FDatabaseSettings.Name;

  DoOnCreateDialog(Self, lDialog);

  try

    if (lDialog.ShowModal = mrOK) then
      begin
        FDatabaseSettings.Name := lDialog.TemplateName;

        Result := True;
      end;

  finally
    lDialog.Free;
  end;

end; {function, ShowDBOpenDialog}

{------------------------------------------------------------------------------}
{ TppTemplate.ShowDBSaveDialog }

function TppTemplate.ShowDBSaveDialog: Boolean;
var
  lFormClass: TFormClass;
  lDialog: TppCustomTemplateDialog;
begin

  Result := False;

  lFormClass := ppGetFormClass(TppCustomTemplateDialog);
  lDialog := TppCustomTemplateDialog(lFormClass.Create(Application));

  lDialog.DialogType     := ppdtSave;
  lDialog.DataPipeline  := FDatabaseSettings.DataPipeline;
  lDialog.NameField     := FDatabaseSettings.NameField;
  lDialog.TemplateName  := FDatabaseSettings.Name;

  DoOnCreateDialog(Self, lDialog);

  try

    if (lDialog.ShowModal = mrOK) then
      begin
        FDatabaseSettings.Name := lDialog.TemplateName;

        Result := True;
      end;

  finally
    lDialog.Free;
  end;

end; {function, ShowDBSaveDialog}

{------------------------------------------------------------------------------}
{ TppTemplate.ShowFileOpenDialog}

function TppTemplate.ShowFileOpenDialog: Boolean;
var
  lOpenDlg: TOpenDialog;
begin

  lOpenDlg := TOpenDialog.Create(Application);

  lOpenDlg.DefaultExt := FFileExtension;
  lOpenDlg.Filename   := FileName;
  lOpenDlg.Filter     := FFileFilter;
  lOpenDlg.Options    := [ofHideReadOnly, ofFileMustExist];

  DoOnCreateDialog(Self, lOpenDlg);

  try
    Result := lOpenDlg.Execute;

    if Result then
      SetFileName(lOpenDlg.Filename);

  finally
    lOpenDlg.Free;
  end;

end;

{------------------------------------------------------------------------------}
{ TppTemplate.ShowFileSaveDialog }

function TppTemplate.ShowFileSaveDialog;
var
  lSaveDlg : TSaveDialog;
  lbShowSaveDlg: Boolean;
  lsSaveFileName: String;

begin

  Result := False;

  lsSaveFileName := FileName;

  lSaveDlg := TSaveDialog.Create(Application);
  lSaveDlg.DefaultExt := FFileExtension;
  lSaveDlg.Filter     := FFileFilter;
  lSaveDlg.Options    := [ofOverWritePrompt, ofPathMustExist, ofHideReadOnly];
  lSaveDlg.FileName   := FileName;

  DoOnCreateDialog(Self, lSaveDlg);

  lbShowSaveDlg := True;

  while lbShowSaveDlg do
    begin
      lbShowSaveDlg := False;

      if lSaveDlg.Execute then
        begin
          FileName := lSaveDlg.FileName;

          {re-display the save dialog, if file is read-only}
          if GetReadOnly then
            begin
              MessageDlg(ppLoadStr(51), mtWarning, [mbOK], 0); {'File is read-only'}
              
              lbShowSaveDlg := True;
            end
          else
            Result := True;
        end;

    end; {while}

  lSaveDlg.Free;

  if not Result then
    FileName := lsSaveFileName;

end;


{******************************************************************************
 *
 ** T p p R e p o r t  T e m p l a t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportTemplate.Create }

constructor TppReportTemplate.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FReport       := aOwner;

  if FReport <> nil then
    Root := FReport.Owner;

  FNewReport    := nil;
  FSaveReport   := nil;
  FSaveViewer   := nil;

  FileExtension := 'rtm';
  FileFilter    := 'Report file (*.rtm)|*.rtm';

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.Destroy }

destructor TppReportTemplate.Destroy;
begin
  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.GetFormDesigner }

function TppReportTemplate.GetFormDesigner: TppFormDesigner;
begin

  if (FReport <> nil) and (FReport is TppCustomReport) then
    Result := TppCustomReport(FReport).FormDesigner
  else
    Result := nil;

end; {function, GetFormDesigner}

{------------------------------------------------------------------------------}
{ TppReportTemplate.SendDesignMessage }

procedure TppReportTemplate.SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
begin

  if (FReport = nil) then Exit;

  TppCustomReport(FReport).SendDesignMessage(aMsg, aWParam, aLParam);

end; {procedure, SendDesignMessage}


{------------------------------------------------------------------------------}
{ TppReportTemplate.New }

procedure TppReportTemplate.New;
var
  lReport: TppBandedReport;
  lDetailPipeline: TppDataPipeline;

begin

  if (FReport = nil) then Exit;

  SendDesignMessage(PM_REPORTLOADSTART, ppWCustomMsg, Longint(FReport));

  lReport := TppBandedReport(FReport);

  lReport.NewNotify;

  if lReport.DetailBand <> nil then
    lDetailPipeline := lReport.DetailBand.DataPipeline
  else
    lDetailPipeline := nil;

  lReport.FreeBandsAndGroups;
  lReport.CreateDefaultBands;

  lReport.DetailBand.DataPipeline := lDetailPipeline;

  lReport.Template.Description := '';

  inherited New;

  SendDesignMessage(PM_REPORTLOADEND, ppWCustomMsg, Longint(FReport));

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.NameChanged }

procedure TppReportTemplate.NameChanged;
begin

  inherited NameChanged;

  SendDesignMessage(PM_COMPONENTNAMECHANGE,ppWCustomMsg,0);

end; {procedure, NameChanged}

{------------------------------------------------------------------------------}
{ TppReportTemplate.DataPipelineChange }

procedure TppReportTemplate.DataPipelineChange(aPipeline: TObject);
var
  lDataPipeline: TppDataPipeline;
  lReport: TppCustomReport;
begin

  inherited DataPipelineChange(aPipeline);

  if FReport = nil then Exit;

  lDataPipeline := DatabaseSettings.DataPipeline;
  lReport := TppCustomReport(FReport);

  {remove report from notify list}
  if (lDataPipeline <> nil) and (lReport.DataPipeline <> lDataPipeline) then
    lDataPipeline.RemoveNotify(lReport);

  lDataPipeline := TppDataPipeline(aPipeline);

  {add report to notify list}
  if lDataPipeline <> nil then
    lDataPipeline.AddNotify(lReport);

end; {procedure, DataPipelineChange}


{------------------------------------------------------------------------------}
{ TppReportTemplate.LoadStart }

function TppReportTemplate.LoadStart: Boolean;
var
  lReport: TppCustomReport;

begin

  inherited LoadStart;

  Result := False;

  if FReport = nil then Exit;

  lReport := TppCustomReport(FReport);

  if (Root = nil) then
    Root := lReport.Owner;

  if lReport.Printing then Exit;

  FSaveReport := TppCustomReportClass(lReport.ClassType).Create(nil);
  TppCustomReport(FSaveReport).DSInclude([pppcTemplateLoading]);

  TppCustomReport(FSaveReport).Transfer(TppCustomReport(FReport));

  Result := True;

  {add template loading to design state}
  if Result then
    begin
      lReport.DSInclude([pppcTemplateLoading]);
      SendDesignMessage(PM_REPORTLOADSTART, ppWCustomMsg, Longint(lReport))
    end;

end;

{$IFDEF WINDOWS}

{------------------------------------------------------------------------------}
{ TppReportTemplate.CheckObjectStream }

procedure TppReportTemplate.CheckObjectStream(aObjectStream: TMemoryStream);
var
  lTextStream: TMemoryStream;
  lBinaryStream: TMemoryStream;

begin

  if (Format <> ftBinary) then Exit;

  lTextStream   := nil;
  lBinaryStream := nil;

  try
    {convert binary stream to text}
    lTextStream := BinaryStreamToTextStream(aObjectStream);

    {check the version, this routine only required for pre 3.0 reports}
    if (VersionFromTextStream(lTextStream) < 3000) then
      begin

       {free the binary stream and get a new converted one}
       aObjectStream.Clear;

       {call this routine to convert the old integer props to floats}
       lBinaryStream := TextStreamToBinaryStream(lTextStream);
       aObjectStream.LoadFromStream(lBinaryStream);

     end;

  finally
   lTextStream.Free;
   lBinaryStream.Free;

  end;

end;

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppReportTemplate.ObjectTextToBinaryStart }

procedure TppReportTemplate.ObjectTextToBinaryStart(aTextStream: TMemoryStream);
var
  lObjectText: TStringList;

begin

  {this routine only required for pre 3.0 reports}
  if (VersionFromTextStream(aTextStream) >= 3000) then  Exit;

  lObjectText := TStringList.Create;

  lObjectText.LoadFromStream(aTextStream);

  ppDoctorReportObjectText(lObjectText);

  ppStringsToStream(lObjectText, aTextStream);

  lObjectText.Free;

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.VersionFromTextStream }

function TppReportTemplate.VersionFromTextStream(aTextStream: TMemoryStream): Integer;
var
  lpBuffer: PChar;
  lpVersion: PChar;
  laVersion: array [0..35] of char;
  liBufSize: Integer;

begin
  Result := 0;

  liBufSize := 2000;

  if (aTextStream.Size < liBufSize) then
    liBufSize := aTextStream.Size;

  {copy stream to a PChar  }
  lpBuffer := StrAlloc(liBufSize+1);

  aTextStream.Position := 0;
  aTextStream.Read(lpBuffer^, liBufSize);

  lpBuffer[liBufSize] := #0;

  {look for version in stream}
  lpVersion := StrPos(lpBuffer, 'Version');

  if (lpVersion <> nil) then
    begin
      {skip over the property label part}
      Inc(lpVersion, Length('Version = ') + 1);

      {copy the value to a PChar}
      StrLCopy(laVersion, lpVersion, 30);

      Result := ppVersionToInt(StrPas(laVersion));

    end;

  StrDispose(lpBuffer);

  aTextStream.Position := 0;

end;



{------------------------------------------------------------------------------}
{ TppReportTemplate.LoadEnd }

procedure TppReportTemplate.LoadEnd(aLoaded: Boolean);
var
  lReport: TppCustomReport;

begin

  lReport := TppCustomReport(FReport);

  if aLoaded then
    begin
      {assign new template }
      lReport.Transfer(TppCustomReport(FNewReport))
    end
  else
    {restore original report}
    lReport.Transfer(TppCustomReport(FSaveReport));


  FSaveReport.Free;

  if FNewReport <> nil then
    begin
      FNewReport.Free;
      FNewReport := nil;
    end;

  {remove template loading to design state}
  lReport.DSExclude([pppcTemplateLoading]);

  SendDesignMessage(PM_REPORTLOADEND, ppWCustomMsg, Longint(lReport));

  inherited LoadEnd(aLoaded);

  lReport.Reset;
  lReport.Modified := False;

end;


{------------------------------------------------------------------------------}
{ TppReportTemplate.SaveStart }

function TppReportTemplate.SaveStart: Boolean;
begin

  Result := True;

  {add template loading to design state}
  TppCustomReport(FReport).DSInclude([pppcTemplateSaving]);

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.SaveEnd }

procedure TppReportTemplate.SaveEnd(aSaved: Boolean);
begin
  if aSaved and (FReport <> nil) then
    TppCustomReport(FReport).Modified := False;

  TppCustomReport(FReport).DSExclude([pppcTemplateSaving]);

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.LoadCallback }

procedure TppReportTemplate.LoadCallback(Component: TComponent);
begin

  if (Component is TppCustomReport) then
    begin
      FNewReport := Component;
      TppCustomReport(Component).DSInclude([pppcTemplateLoading]);

      {note: the try, except prevents a gpf in D1 when loading TppChildReport}
      try
        if FSaveReport is TppReport then
          TppReport(Component).OnLoadTemplate := TppReport(FSaveReport).OnLoadTemplate;
      except
      end;

    end;

end;

{------------------------------------------------------------------------------}
{ TppReportTemplate.LoadSetName }

procedure TppReportTemplate.LoadSetName(Reader: TReader; Component: TComponent; var Name: string);
begin

  inherited LoadSetName(Reader, Component, Name);

  if FReport = nil then Exit;

  if (Reader.Root = FReport.Owner) and (FReport.Owner.FindComponent(Name) <> nil) then
    Name := TppCustomReport(FReport).GetValidName(Component);

end;



{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** T E M P L A T E   D B   S E T T I N G S    R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppTemplateDBSettingsRTTI.RefClass }

class function TraTppTemplateDBSettingsRTTI.RefClass: TClass;
begin
  Result := TppTemplateDBSettings;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppTemplateDBSettingsRTTI.GetPropList }

class procedure TraTppTemplateDBSettingsRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppTemplateDBSettingsRTTI.GetPropRec }

class function TraTppTemplateDBSettingsRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'DataPipeline') = 0) then
     ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if (CompareText(aPropName, 'Name') = 0) then
     PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'NameField') = 0) then
     PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'TemplateField') = 0) then
     PropToRec(aPropName, daString, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppTemplateDBSettingsRTTI.GetPropValue }

class function TraTppTemplateDBSettingsRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'DataPipeline') = 0) then
    Integer(aValue) := Integer(TppTemplateDBSettings(aObject).DataPipeline)

  else if (CompareText(aPropName, 'Name') = 0) then
    String(aValue) := TppTemplateDBSettings(aObject).Name

  else if (CompareText(aPropName, 'NameField') = 0) then
    String(aValue) := TppTemplateDBSettings(aObject).NameField

  else if (CompareText(aPropName, 'TemplateField') = 0) then
    String(aValue) := TppTemplateDBSettings(aObject).TemplateField

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppTemplateDBSettingsRTTI.SetPropValue }

class function TraTppTemplateDBSettingsRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'DataPipeline') = 0) then
    TppTemplateDBSettings(aObject).DataPipeline := TppDataPipeline(aValue)

  else if (CompareText(aPropName, 'Name') = 0) then
    TppTemplateDBSettings(aObject).Name := String(aValue)

  else if (CompareText(aPropName, 'NameField') = 0) then
    TppTemplateDBSettings(aObject).NameField := String(aValue)

  else if (CompareText(aPropName, 'TemplateField') = 0) then
    TppTemplateDBSettings(aObject).TemplateField := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** C U S T O M   T E M P L A T E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomTemplateRTTI.RefClass }

class function TraTppCustomTemplateRTTI.RefClass: TClass;
begin
  Result := TppCustomTemplate;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomTemplateRTTI.GetPropList }

class procedure TraTppCustomTemplateRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomTemplateRTTI.GetPropRec }

class function TraTppCustomTemplateRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'DatabaseSettings') = 0) then
    ClassPropToRec(aPropName, TppTemplateDBSettings, True, aPropRec)

  else if (CompareText(aPropName, 'Description') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'FileName') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Format') = 0) then
    EnumPropToRec(aPropName, 'TppFormatType', False, aPropRec)

  else if (CompareText(aPropName, 'Offset') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Owner') = 0) then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else if (CompareText(aPropName, 'SaveTo') = 0) then
    EnumPropToRec(aPropName, 'TppSaveToType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomTemplateRTTI.GetPropValue }

class function TraTppCustomTemplateRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'DatabaseSettings') = 0) then
    Integer(aValue) := Integer(TppCustomTemplate(aObject).DatabaseSettings)

  else if (CompareText(aPropName, 'Description') = 0) then
    String(aValue) := TppCustomTemplate(aObject).Description

  else if (CompareText(aPropName, 'FileName') = 0) then
    String(aValue) := TppCustomTemplate(aObject).FileName

  else if (CompareText(aPropName, 'Format') = 0) then
    Integer(aValue) := Ord(TppCustomTemplate(aObject).Format)

  else if (CompareText(aPropName, 'Offset') = 0) then
    Integer(aValue) := TppCustomTemplate(aObject).Offset

  else if (CompareText(aPropName, 'Owner') = 0) then
    Integer(aValue) := Integer(TppCustomTemplate(aObject).Owner)

  else if (CompareText(aPropName, 'SaveTo') = 0) then
    Integer(aValue) := Ord(TppCustomTemplate(aObject).SaveTo)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomTemplateRTTI.SetPropValue }

class function TraTppCustomTemplateRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'FileName') = 0) then
    TppCustomTemplate(aObject).FileName := String(aValue)

  else if (CompareText(aPropName, 'Format') = 0) then
    TppCustomTemplate(aObject).Format := TppFormatType(aValue)

  else if (CompareText(aPropName, 'Offset') = 0) then
    TppCustomTemplate(aObject).Offset := Integer(aValue)

  else if (CompareText(aPropName, 'SaveTo') = 0) then
    TppCustomTemplate(aObject).SaveTo := TppSaveToType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** T E M P L A T E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppTemplateRTTI.RefClass }

class function TraTppTemplateRTTI.RefClass: TClass;
begin
  Result := TppTemplate;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppTemplateRTTI.GetPropList }

class procedure TraTppTemplateRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddMethod('LoadFromDatabase');
  aPropList.AddMethod('LoadFromFile');
  aPropList.AddMethod('New');
  aPropList.AddMethod('SaveToDatabase');
  aPropList.AddMethod('SaveToFile');


end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppTemplateRTTI.GetPropRec }

class function TraTppTemplateRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'FileExtension') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'FileFilter') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Root') = 0) then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else if (CompareText(aPropName, 'ReadOnly') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else  if (CompareText(aPropName, 'LoadFromDataBase') = 0) or
           (CompareText(aPropName, 'LoadFromFile') = 0) or
           (CompareText(aPropName, 'New') = 0) or
           (CompareText(aPropName, 'SaveToDataBase') = 0) or
           (CompareText(aPropName, 'SaveToFile') = 0) then

    MethodToRec(aPropName, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppTemplateRTTI.GetPropValue }

class function TraTppTemplateRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'FileExtension') = 0) then
    String(aValue) := TppTemplate(aObject).FileExtension

  else if (CompareText(aPropName, 'FileFilter') = 0) then
    String(aValue) := TppTemplate(aObject).FileFilter

  else if (CompareText(aPropName, 'Root') = 0) then
    Integer(aValue) := Integer(TppTemplate(aObject).Root)

  else if (CompareText(aPropName, 'ReadOnly') = 0) then
    Boolean(aValue) := TppTemplate(aObject).ReadOnly

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppTemplateRTTI.CallMethod }

class function TraTppTemplateRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lTemplate: TppTemplate;
begin

  Result := True;

  lTemplate := TppTemplate(aObject);

  if ppEqual(aMethodName, 'LoadFromDatabase') then
    lTemplate.LoadFromDatabase

  else if ppEqual(aMethodName, 'LoadFromFile') then
    lTemplate.LoadFromFile

  else if ppEqual(aMethodName, 'New') then
    lTemplate.New

  else if ppEqual(aMethodName, 'SaveToDatabase') then
    lTemplate.SaveToDatabase
    
  else if ppEqual(aMethodName, 'SaveToFile') then
    lTemplate.SaveToFile

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppTemplateRTTI.SetPropValue }

class function TraTppTemplateRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'FileExtension') = 0) then
    TppTemplate(aObject).FileExtension := String(aValue)

  else if (CompareText(aPropName, 'FileFilter') = 0) then
    TppTemplate(aObject).FileFilter := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** R E P O R T   T E M P L A T E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppReportTemplateRTTI.RefClass }

class function TraTppReportTemplateRTTI.RefClass: TClass;
begin
  Result := TppReportTemplate;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppReportTemplateRTTI.GetPropList }

class procedure TraTppReportTemplateRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppReportTemplateRTTI.GetPropRec }

class function TraTppReportTemplateRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Report') = 0) then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppReportTemplateRTTI.GetPropValue }

class function TraTppReportTemplateRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Report') = 0) then
    Integer(aValue) := Integer(TppReportTemplate(aObject).Report)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}



{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppTemplateDBSettingsRTTI);
  raRegisterRTTI(TraTppCustomTemplateRTTI);
  raRegisterRTTI(TraTppTemplateRTTI);
  raRegisterRTTI(TraTppReportTemplateRTTI);

finalization

  raUnRegisterRTTI(TraTppTemplateDBSettingsRTTI);
  raUnRegisterRTTI(TraTppCustomTemplateRTTI);
  raUnRegisterRTTI(TraTppTemplateRTTI);
  raUnRegisterRTTI(TraTppReportTemplateRTTI);

end.
