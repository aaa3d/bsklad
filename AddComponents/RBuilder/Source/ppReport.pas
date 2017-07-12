{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppReport;

interface

{$I ppIfDef.pas}

uses
   Windows, Messages, Classes, Controls, Forms, ExtCtrls, Menus, Graphics,
   Printers, Dialogs, SysUtils, StdCtrls,
   ppComm, ppDevice, ppRuler, ppTypes, ppUtils, ppPrintr, ppDB, ppTmplat,
   ppCache, ppClass, ppForms, ppDsgnCt, ppProd, ppBands, ppRelatv, ppASDlg,
   ppRTTI;

type

  { TppBandedReport }
  TppBandedReport = class(TppCustomReport)
    private
      function  GetColumnHeader: TppColumnHeaderBand;
      function  GetColumnFooter: TppColumnFooterBand;
      function  GetTitle: TppTitleBand;
      function  GetHeader: TppHeaderBand;
      function  GetDetail: TppDetailBand;
      function  GetFooter: TppFooterBand;
      function  GetSummary: TppSummaryBand;
      function  GetGroupHeader(aIndex: Integer): TppGroupHeaderBand;
      function  GetGroupFooter(aIndex: Integer): TppGroupFooterBand;

    public
      {backward compatibilty}
      property ColumnHeaderBand: TppColumnHeaderBand read GetColumnHeader;
      property ColumnFooterBand: TppColumnFooterBand read GetColumnFooter;
      property DetailBand: TppDetailBand read GetDetail;
      property FooterBand: TppFooterBand read GetFooter;
      property GroupHeaderBand[Index: Integer]: TppGroupHeaderBand  read GetGroupHeader;
      property GroupFooterBand[Index: Integer]: TppGroupFooterBand  read GetGroupFooter;
      property HeaderBand: TppHeaderBand read GetHeader;
      property SummaryBand: TppSummaryBand read GetSummary;
      property TitleBand: TppTitleBand read GetTitle;

      property ColumnHeader: TppColumnHeaderBand read GetColumnHeader;
      property ColumnFooter: TppColumnFooterBand read GetColumnFooter;
      property Detail: TppDetailBand read GetDetail;
      property Footer: TppFooterBand read GetFooter;
      property GroupHeader[Index: Integer]: TppGroupHeaderBand  read GetGroupHeader;
      property GroupFooter[Index: Integer]: TppGroupFooterBand  read GetGroupFooter;
      property Header: TppHeaderBand read GetHeader;
      property Summary: TppSummaryBand read GetSummary;
      property Title: TppTitleBand read GetTitle;

  end; {class, TppBandedReport}



  { TppReport }
  TppReport = class(TppBandedReport)
  private
    FActiveReport: TppCustomReport;
    FAutoSearchDialog: TppCustomAutoSearchDialog;
    FAutoSearchFields: TList;
    FCacheManager: TppCacheManager;
    FCachePages: Boolean;
    FOnLoadTemplate: TNotifyEvent;
    FOnAutoSearchDialogClose: TNotifyEvent;
    FOnAutoSearchDialogCreate: TNotifyEvent;
    FOnGetAutoSearchValues: TNotifyEvent;
    FPrintCalled: Boolean;

    {used for conversion to 3.0}
    FDataSource: String;
    FRowSpacing: Single;
    FOldOrientation: TPrinterOrientation;
    FOnPrintingComplete: String;

    function  GetAutoSearchField(aIndex: Integer): TppAutoSearchField;
    function  GetAutoSearchFieldCount: Integer;
    function  GetAutoSearchDescriptionAsString: String;

    procedure CloseSubReportDataPipelines;
    procedure ResetSubReports;
    procedure SetCachePages(Value: Boolean);
    procedure TakeSubReportAction(aAction: TppSubReportActionType);

    {cache manager related routines}
    procedure GetLastPageCached(Sender: TObject; var aPageNo: Longint);
    procedure ResetCache(Sender: TObject);
    procedure ReadCache(Sender: TObject);
    procedure WriteCache(Sender: TObject);

    {used for conversion to 3.0}
    procedure ReadAllowPrintCancel(Reader: TReader);
    procedure ReadDataSource(Reader: TReader);
    procedure ReadOnPrintingComplete(Reader: TReader);
    procedure ReadOrientation(Reader: TReader);
    procedure ReadNoDataPages(Reader: TReader);
    procedure ReadPreviewPages(Reader: TReader);
    procedure ReadRowSpacing(Reader: TReader);
    procedure ReadSuppressFormFeed(Reader: TReader);
    procedure ReadViewer(Reader: TReader);

  protected
    {defines 'fake' properties}
    procedure DefineProperties(Filer: TFiler); override; {contains temporary conversion routine}

    procedure DoOnLoadTemplate(aReport: TppCustomReport); override;
    function  GetMainReport: TppCustomReport; override;

    {overriden from TppRelative}
    procedure SaveComponents(Proc: TGetChildProc); override;

    procedure AutoSearchDialogCloseEvent(Sender: TObject);
    procedure DoOnAutoSearchDialogClose;
    procedure DoOnAutoSearchDialogCreate;
    procedure DoOnGetAutoSearchValues;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Cancel; override;
    procedure CloseDataPipelines;
    procedure CollapseDrillDowns;
    procedure Convert(aVersionNo: Integer); override;
    procedure ESExclude(aEngineStateSet: TppEngineStates); override;
    procedure ESInclude(aEngineStateSet: TppEngineStates); override;
    procedure ExpandDrillDowns;
    function  GetPrintMessage: String; override;
    procedure GetReportKey(var aKey: String); override;
    function  IsCached: Boolean;
    procedure LanguageChanged; override;
    procedure PrintToDevices; override;
    function  PrintDateTime: TDateTime;
    procedure Print; override;
    procedure PageSent(Sender: TObject); override;
    procedure RequestPage(Sender: TObject; aPageRequest: TObject); override;
    procedure ResetFromPageNo(aAbsolutePageNo: Longint);
    procedure SetPrintMessage(const aMessage: String); override;
    procedure Transfer(aSource: TppCommunicator); override;


    {backward compatibility}
    procedure PrintReport;
    procedure PrintPage(aPageNo: Integer);
    procedure PrintPageList(aPageList: TStrings);

    {overridden from communicator}
    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    {overridden from relative}
    procedure AddChild(aChild: TppRelative); override;
    function  AutoSearchFieldByName(const aName: String): TppAutoSearchField;
    function  CreateAutoSearchField(const aTableName, aFieldName, aFieldAlias: String; aDataType: TppDataType; aOperator: TppSearchOperatorType; const aExpression: String; aMandatory: Boolean): TppAutoSearchField;
    function  CreateAutoSearchCriteria(const aDataPipelineName, aFieldName: String; aOperator: TppSearchOperatorType; const aExpression: String; aMandatory: Boolean): TppAutoSearchField;
    function  DisplayAutoSearchDialog: Boolean; override;
    procedure FreeAutoSearchFields;
    function  HasParent: Boolean; override;
    procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
    function  IndexOfChild(aChild: TppRelative): Integer; override;
    procedure MoveChild(aChild: TppRelative; aCurrentIndex, aNewIndex: Integer);
    function  RemoveChild(aChild: TppRelative): Integer; override;
    procedure GetAutoSearchDescriptionLines(aLines: TStrings);

    property ActiveReport: TppCustomReport read FActiveReport write FActiveReport;
    property CacheManager: TppCacheManager read FCacheManager;
    property CancelDialog;
    property PreviewForm;

    property OnLoadTemplate: TNotifyEvent read FOnLoadTemplate write FOnLoadTemplate;

    property AutoSearchDescription: String read GetAutoSearchDescriptionAsString;
    property AutoSearchFields[Index: Integer]: TppAutoSearchField read GetAutoSearchField;
    property AutoSearchFieldCount: Integer read GetAutoSearchFieldCount;
    property AutoSearchDialog: TppCustomAutoSearchDialog read FAutoSearchDialog;

    {used for conversion to 3.0}
    property DataSource: String read FDataSource;
    property RowSpacing: Single read FRowSpacing;

  published
    property AfterPrint;
    property AllowPrintToArchive;
    property AllowPrintToFile;
    property ArchiveFileName;
    property BeforePrint;
    property CachePages: Boolean read FCachePages write SetCachePages default False;
    property DeviceType;
    property Icon;
    property Language;
    property ModalCancelDialog;
    property ModalPreview;
    property OnAutoSearchDialogClose: TNotifyEvent read FOnAutoSearchDialogClose write FOnAutoSearchDialogClose;
    property OnAutoSearchDialogCreate: TNotifyEvent read FOnAutoSearchDialogCreate write FOnAutoSearchDialogCreate;
    property OnCancel;
    property OnCancelDialogClose;
    property OnCancelDialogCreate;
    property OnGetAutoSearchValues: TNotifyEvent read FOnGetAutoSearchValues write FOnGetAutoSearchValues;
    property OnPageRequest;
    property OnPreviewFormClose;
    property OnPreviewFormCreate;
    property OnPrintingComplete;
    property OnPrintDialogClose;
    property OnPrintDialogCreate;
    property SavePrinterSetup;
    property ShowAutoSearchDialog;
    property ShowCancelDialog;
    property ShowPrintDialog;
    property TextFileName;
    property TextFileType;

  end; {class, TppReport}


  { TppChildReport }
  TppChildReport = class(TppBandedReport)
    private
      FResetting: Boolean;

      procedure CheckParentPrinterSetup;

    protected
      function  GetMainReport: TppCustomReport; override;
      procedure PrinterSetupChanged; override;
      procedure SetModified(Value: Boolean); override;
      procedure SetParent(aParent: TppRelative); override;

    public
      constructor Create(aOwner: TComponent); override;

      procedure Cancel; override;
      function  GetPrintMessage: String; override;
      procedure GetReportKey(var aKey: String); override;
      function  GetUniqueUserName(aComponent: TComponent): String; override;
      procedure ESExclude(aEngineStateSet: TppEngineStates); override;
      procedure ESInclude(aEngineStateSet: TppEngineStates); override;
      procedure Reset; override;
      procedure SetPrintMessage(const aMessage: String); override;
      procedure Transfer(aSource: TppCommunicator); override;

  end; {class, TppChildReport}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppBandedReportRTTI }
  TraTppBandedReportRTTI = class(TraTppCustomReportRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppBandedReportRTTI}

  { TraTppReportRTTI }
  TraTppReportRTTI = class(TraTppBandedReportRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppReportRTTI}

implementation

uses ppEngine, ppCtrls, ppViewr, ppSubRpt,
     ppPrvDlg, ppPDlg, ppCDlg, ppRegion, ppPrnDev, ppFilDev;

{******************************************************************************
 *
 ** B A N D E D   R E P O R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetColumnHeader }

function TppBandedReport.GetColumnHeader: TppColumnHeaderBand;
begin
  Result := TppColumnHeaderBand(GetBand(btColumnHeader, 0));
end; {function, GetColumnHeader}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetColumnFooter }

function TppBandedReport.GetColumnFooter: TppColumnFooterBand;
begin
  Result := TppColumnFooterBand(GetBand(btColumnFooter, 0));
end; {function, GetColumnFooter}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetTitle }

function TppBandedReport.GetTitle: TppTitleBand;
begin
  Result := TppTitleBand(GetBand(btTitle, 0));
end; {function, GetTitle}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetHeader }

function TppBandedReport.GetHeader: TppHeaderBand;
begin
  Result := TppHeaderBand(GetBand(btHeader, 0));
end; {function, GetHeader}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetDetail }

function TppBandedReport.GetDetail: TppDetailBand;
begin
  Result := TppDetailBand(GetBand(btDetail, 0));
end; {function, GetDetail}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetFooter }

function TppBandedReport.GetFooter: TppFooterBand;
begin
  Result := TppFooterBand(GetBand(btFooter, 0));
end; {function, GetFooter}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetSummary }

function TppBandedReport.GetSummary: TppSummaryBand;
begin
  Result := TppSummaryBand(GetBand(btSummary, 0));
end; {function, GetSummary}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetGroupHeader }

function TppBandedReport.GetGroupHeader(aIndex: Integer): TppGroupHeaderBand;
begin
  Result := TppGroupHeaderBand(GetBand(btGroupHeader, aIndex));
end; {function, GetGroupHeader}

{------------------------------------------------------------------------------}
{ TppBandedReport.GetGroupFooter }

function TppBandedReport.GetGroupFooter(aIndex: Integer): TppGroupFooterBand;
begin
  Result := TppGroupFooterBand(GetBand(btGroupFooter, aIndex));
end; {function, GetGroupFooter}


{******************************************************************************
 *
 ** R E P O R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReport.Create }

constructor TppReport.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FActiveReport := nil;
  FAutoSearchDialog := nil;
  FAutoSearchFields := TList.Create;
  FCacheManager := TppCacheManager.Create(Self);
  FCachePages := False;
  FOnLoadTemplate := nil;
  FOnAutoSearchDialogClose := nil;
  FOnAutoSearchDialogCreate := nil;
  FOnGetAutoSearchValues := nil;
  FPrintCalled := False;

  {assign cache manager routines to engine}
  if (Engine <> nil) then
    begin
      Engine.OnResetCache := ResetCache;
      Engine.OnReadCache := ReadCache;
      Engine.OnWriteCache := WriteCache;
      Engine.OnGetLastPageCached := GetLastPageCached;
    end;

end; {constructor, TppReport}

{------------------------------------------------------------------------------}
{ TppReport.Destroy }

destructor TppReport.Destroy;
begin

  TriggerCodeModuleDestroy; 

  FreeAutoSearchFields;

  FAutoSearchFields.Free;
  FAutoSearchFields := nil;

 { showMessage('TppReport.Destroy - begin');}

 {showMessage('free cache manager');}
  {free cache manager before all others}
  FCacheManager.Free;

  inherited Destroy;
 {showMessage('TppReport.Destroy - end');}

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppReport.FreeAutoSearchFields }

procedure TppReport.FreeAutoSearchFields;
var
  liIndex: Integer;
begin
  if FAutoSearchFields = nil then Exit;

  for liIndex := FAutoSearchFields.Count - 1 downto 0 do
    TppRelative(FAutoSearchFields[liIndex]).Free;

  FAutoSearchFields.Clear;

end; {procedure, FreeAutoSearchFields}

{------------------------------------------------------------------------------}
{ TppReport.Convert }

procedure TppReport.Convert(aVersionNo: Integer);
begin

  inherited Convert(aVersionNo);
  
  {move orientation to printersetup.orientation}
  if (aVersionNo < 1270) then
    PrinterSetup.Orientation := FOldOrientation;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppReport.GetPrintMessage }

function TppReport.GetPrintMessage: String;
begin

  if (Publisher <> nil) then
    Result := Publisher.GetPrintMessage
  else
    Result := '';

end; {function, GetPrintMessage }

{------------------------------------------------------------------------------}
{ TppReport.SetPrintMessage }

procedure TppReport.SetPrintMessage(const aMessage: String);
begin
  if (Publisher <> nil) then
    Publisher.SetPrintMessage(aMessage);
end; {function, SetPrintMessage }

{------------------------------------------------------------------------------}
{ TppReport.CloseDataPipelines }

procedure TppReport.CloseDataPipelines;
begin
  Engine.CloseDataPipelines;

  CloseSubReportDataPipelines;
end; {procedure, CloseDataPipelines}

{------------------------------------------------------------------------------}
{ TppReport.Print }

procedure TppReport.Print;
var
  lbPrint: Boolean;
begin

  FPrintCalled := True;

  if (ShowAutoSearchDialog) then
    lbPrint := DisplayAutoSearchDialog
  else
    lbPrint := True;

  if (lbPrint) then
    begin
      {4.21, add engine check so when report has already been previewed, printing to printer won't cause autosearch values to be reassigned.}
      if not(esInitialized in Engine.State) and (AutoSearchFieldCount > 0) then
        DoOnGetAutoSearchValues;
    end;

  if (FAutoSearchDialog <> nil) then
    begin
      FAutoSearchDialog.Free;
      FAutoSearchDialog := nil;
    end;

  FPrintCalled := False;

  if (lbPrint) then
    inherited Print;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppReport.DisplayAutoSearchDialog }

function TppReport.DisplayAutoSearchDialog: Boolean;
var
  lFormClass: TFormClass;
begin

  Result := True;

  lFormClass := ppGetFormClass(TppCustomAutoSearchDialog);

  FAutoSearchDialog := TppCustomAutoSearchDialog(lFormClass.Create(Application));
  FAutoSearchDialog.Report := Self;
  FAutoSearchDialog.LanguageIndex := LanguageIndex;

  DoOnAutoSearchDialogCreate;

  if (FAutoSearchFields.Count) = 0 then
    begin
      FAutoSearchDialog.Free;
      FAutoSearchDialog := nil;

      Exit;
    end;

  FAutoSearchDialog.AutoSearchFields := FAutoSearchFields;
  FAutoSearchDialog.ppOnClose := AutoSearchDialogCloseEvent;

  FAutoSearchDialog.Init;

  if (FAutoSearchDialog.ShowModal <> mrOK) then
    Result := False;

  if (Result) then
    begin
      Engine.Reset;

      if not(FPrintCalled) then
        DoOnGetAutoSearchValues;
    end;

  {do this after triggering event}
  if not(FPrintCalled) then
    begin
      FAutoSearchDialog.Free;
      FAutoSearchDialog := nil;
    end;

end; {function, DisplayAutoSearchDialog}

{------------------------------------------------------------------------------}
{ TppReport.DoOnGetAutoSearchValues }

procedure TppReport.DoOnGetAutoSearchValues;
begin

  {let event handler modify values first}
  if Assigned(FOnGetAutoSearchValues) then FOnGetAutoSearchValues(Self);

  {then notify dataview}
  SendEventNotify(Self, ciReportGetAutoSearchValues, nil);

end; {procedure, DoOnGetAutoSearchValues}

{------------------------------------------------------------------------------}
{ TppReport.DoOnAutoSearchDialogCreate }

procedure TppReport.DoOnAutoSearchDialogCreate;
begin
  if Assigned(FOnAutoSearchDialogCreate) then FOnAutoSearchDialogCreate(Self);

  SendEventNotify(Self, ciReportAutoSearchDialogCreate, nil);
end; {procedure, DoOnAutoSearchDialogCreate}

{------------------------------------------------------------------------------}
{ TppReport.AutoSearchDialogCloseEvent }

procedure TppReport.AutoSearchDialogCloseEvent(Sender: TObject);
begin
  DoOnAutoSearchDialogClose;
end; {procedure, AutoSearchDialogCloseEvent}

{------------------------------------------------------------------------------}
{ TppReport.DoOnAutoSearchDialogClose }

procedure TppReport.DoOnAutoSearchDialogClose;
begin
  if Assigned(FOnAutoSearchDialogClose) then FOnAutoSearchDialogClose(Self);

  SendEventNotify(Self, ciReportAutoSearchDialogClose, nil);
end; {procedure, DoOnAutoSearchDialogClose}

{------------------------------------------------------------------------------}
{ TppReport.HasParent }

function TppReport.HasParent: Boolean;
begin
  Result := False;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppReport.SaveComponents }

procedure TppReport.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  for liIndex := 0 to (FAutoSearchFields.Count - 1) do
    Proc(FAutoSearchFields[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppReport.Notify }

procedure TppReport.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator is TppAutoSearchField) and (IndexOfChild(TppRelative(aCommunicator)) <> -1) then
    RemoveChild(TppRelative(aCommunicator));

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppReport.AutoSearchFieldByName }

function TppReport.AutoSearchFieldByName(const aName: String): TppAutoSearchField;
var
  liIndex: Integer;
  lAutoSearchField: TppAutoSearchField;
begin

  Result := nil;
  liIndex := 0;

  while (Result = nil) and (liIndex < FAutoSearchFields.Count) do
    begin
      lAutoSearchField := AutoSearchFields[liIndex];

      if (CompareText(aName, lAutoSearchField.FieldName) = 0) then
        Result := lAutoSearchField;

      Inc(liIndex);
    end;

end; {procedure, AutoSearchFieldByName}

{------------------------------------------------------------------------------}
{ TppReport.CreateAutoSearchCriteria }

function TppReport.CreateAutoSearchCriteria(const aDataPipelineName, aFieldName: String; aOperator: TppSearchOperatorType; const aExpression: String; aMandatory: Boolean): TppAutoSearchField;
var
  lParams: TraParamList;
begin

  Result := TppAutoSearchField.Create(Self);

  Result.DataPipelineName := aDataPipelineName;
  Result.FieldName := aFieldName;
  Result.SearchOperator := aOperator;
  Result.SearchExpression := aExpression;
  Result.Mandatory := aMandatory;

  Result.Parent := Self;

  {notify any attached dataview that field has been created}
  lParams := TraParamList.Create;
  lParams.AddParam('aAutoSearchField', daClass, TppAutoSearchField, '', False, False);
  lParams.CreateValuePointer(0, Result);

  SendEventNotify(Self, ciReportCreateAutoSearchCriteria, lParams);

  lParams.Free;
  
end; {procedure, CreateAutoSearchCriteria}

{------------------------------------------------------------------------------}
{ TppReport.CreateAutoSearchField }

function TppReport.CreateAutoSearchField(const aTableName, aFieldName, aFieldAlias: String; aDataType: TppDataType;
                                         aOperator: TppSearchOperatorType; const aExpression: String; aMandatory: Boolean): TppAutoSearchField;
begin

  Result := TppAutoSearchField.Create(Self);

  Result.TableName := aTableName;
  Result.FieldName := aFieldName;
  Result.FieldAlias := aFieldAlias;
  Result.DataType := aDataType;
  Result.SearchOperator := aOperator;
  Result.SearchExpression := aExpression;
  Result.Mandatory := aMandatory;

  Result.Parent := Self;

end; {procedure, CreateAutoSearchField}

{------------------------------------------------------------------------------}
{ TppReport.AddChild }

procedure TppReport.AddChild(aChild: TppRelative);
begin

  if (aChild is TppAutoSearchField) then
    begin
      aChild.AddNotify(Self);

      FAutoSearchFields.Add(aChild);

      Reset;
    end
  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppReport.MoveChild }

procedure TppReport.MoveChild(aChild: TppRelative; aCurrentIndex, aNewIndex: Integer);
begin

  if (aChild is TppAutoSearchField) then
    begin
      FAutoSearchFields.Move(aCurrentIndex, aNewIndex);

      Reset;
    end;

end; {procedure, MoveChild}

{------------------------------------------------------------------------------}
{ TppReport.InsertChild }

procedure TppReport.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  if (aChild is TppAutoSearchField) then
    begin
      aChild.AddNotify(Self);

      FAutoSearchFields.Insert(aPosition, aChild);

      Reset;
    end
  else
    inherited InsertChild(aPosition, aChild);


end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TppReport.IndexOfChild }

function TppReport.IndexOfChild(aChild: TppRelative): Integer;
begin

  if (aChild is TppAutoSearchField) then
    Result := FAutoSearchFields.IndexOf(aChild)
  else
    Result := inherited IndexOfChild(aChild);

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TppReport.RemoveChild }

function TppReport.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  if (aChild is TppAutoSearchField) then
    begin
      aChild.RemoveNotify(Self);

      FAutoSearchFields.Delete(liIndex);

      Reset;
    end

  else
    Result := inherited RemoveChild(aChild);

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppReport.GetAutoSearchField }

function  TppReport.GetAutoSearchField(aIndex: Integer): TppAutoSearchField;
begin
  if FAutoSearchFields <> nil then
    Result := TppAutoSearchField(FAutoSearchFields[aIndex])
  else
    Result := nil;

end; {procedure, GetAutoSearchField}

{------------------------------------------------------------------------------}
{ TppReport.GetAutoSearchFieldCount }

function  TppReport.GetAutoSearchFieldCount: Integer;
begin
  if FAutoSearchFields <> nil then
    Result := FAutoSearchFields.Count
  else
    Result := 0;

end; {procedure, GetAutoSearchFieldCount}

{------------------------------------------------------------------------------}
{ TppReport.GetAutoSearchDescriptionAsString }

function  TppReport.GetAutoSearchDescriptionAsString: String;
var
  liIndex: Integer;

begin
  Result := '';

  for liIndex := 0 to AutoSearchFieldCount - 1 do
    begin
      if (Result = '') then
        AutoSearchFields[liIndex].FirstField := True
      else
        Result := Result + ' ';

      Result := Result + AutoSearchFields[liIndex].Description


    end;

end; {procedure, GetAutoSearchDescriptionAsString}

{------------------------------------------------------------------------------}
{ TppReport.GetAutoSearchDescriptionLines }

procedure  TppReport.GetAutoSearchDescriptionLines(aLines: TStrings);
var
  liIndex: Integer;

begin
  aLines.Clear;

  for liIndex := 0 to AutoSearchFieldCount - 1 do
    begin
      if (aLines.Count = 0) then
        AutoSearchFields[liIndex].FirstField := True;

      aLines.Add(AutoSearchFields[liIndex].Description);

    end;

end; {procedure, GetAutoSearchDescriptionLines}

{------------------------------------------------------------------------------}
{ TppReport.CloseSubReportDataPipelines }

procedure TppReport.CloseSubReportDataPipelines;
var
  lReports: TStringList;
  lReport: TppCustomReport;
  liReport: Integer;
begin
  lReports := TStringList.Create;

  {get list of all sub-reports}
  GetSubReports(lReports);

  for liReport := 0 to lReports.Count - 1 do
    begin
      lReport := TppCustomReport(lReports.Objects[liReport]);

      if (lReport.Engine <> nil) then
        lReport.Engine.CloseDataPipelines;
    end;

  lReports.Free;

end; {procedure, CloseSubReportDataPipelines}

{------------------------------------------------------------------------------}
{ TppReport.LanguageChanged }

procedure TppReport.LanguageChanged;
var
  lReports: TStringList;
  lReport: TppCustomReport;
  liReport: Integer;
begin

  inherited LanguageChanged;

  lReports := TStringList.Create;

  {get list of all sub-reports}
  GetSubReports(lReports);

  for liReport := 0 to lReports.Count - 1 do
    begin
      lReport := TppCustomReport(lReports.Objects[liReport]);

      lReport.Language := Language;
    end;

  lReports.Free;

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppReport.Transfer }

procedure TppReport.Transfer(aSource: TppCommunicator);
var
  lSourceReport: TppReport;
begin

  inherited Transfer(aSource);

  if not(aSource is TppReport) then Exit;


  lSourceReport := TppReport(aSource);

  FCachePages := lSourceReport.CachePages;

  {4.25 - allow DADE dataview to create the autosearch fields, don't transfer them}
  {ShowAutoSearchDialog := lSourceReport.ShowAutoSearchDialog;

  for liIndex := 0 to lSourceReport.AutoSearchFieldCount - 1 do
    lSourceReport.AutoSearchFields[0].Parent := Self; }

  {note: this event is public, but needs to be assigned}
  FOnLoadTemplate := lSourceReport.OnLoadTemplate;

  {used for conversion to 3.0}
  FDataSource := lSourceReport.DataSource;

end; {procedure, Transfer}

{------------------------------------------------------------------------------}
{ TppReport.ESInclude }

procedure TppReport.ESInclude(aEngineStateSet: TppEngineStates);
begin

  Engine.ESInclude(aEngineStateSet);

end; {function, ESInclude}

{------------------------------------------------------------------------------}
{ TppReport.ESExclude }

procedure TppReport.ESExclude(aEngineStateSet: TppEngineStates);
begin

  Engine.ESExclude(aEngineStateSet);

end; {function, ESExclude}

{------------------------------------------------------------------------------}
{ TppReport.DoOnLoadTemplate }

procedure TppReport.DoOnLoadTemplate(aReport: TppCustomReport);
begin

  if Assigned(FOnLoadTemplate) then FOnLoadTemplate(aReport);

end; {function, DoOnLoadTemplate}

{------------------------------------------------------------------------------}
{ TppReport.PrintDateTime }

function TppReport.PrintDateTime: TDateTime;
begin
  Result := Engine.PrintDateTime;
end; {function, PrintDateTime}

{------------------------------------------------------------------------------}
{ TppReport.GetMainReport }

function TppReport.GetMainReport: TppCustomReport;
begin
  Result := Self;
end; {function, GetMainReport}

{------------------------------------------------------------------------------}
{ TppReport.GetReportKey }

procedure TppReport.GetReportKey(var aKey: String);
var
  lSubReport: TppSubReport;
begin

  if (Parent is TppSubReport) then
    begin
      lSubReport := TppSubReport(Parent);

      aKey := aKey + Format('%8d', [lSubReport.Count]) + '|';

      if (lSubReport.Band <> nil) and (lSubReport.Band.Report <> nil) then
       lSubReport.Band.Report.GetReportKey(aKey);
    end;

end; {function, GetReportKey}

{------------------------------------------------------------------------------}
{ TppReport.ResetFromPageNo }

procedure TppReport.ResetFromPageNo(aAbsolutePageNo: Longint);
begin

  FCacheManager.DumpCache(aAbsolutePageNo);

  if (Engine <> nil) then
    Engine.ResetFromPageNo(aAbsolutePageNo);

end; {procedure, ResetFromPageNo}

{------------------------------------------------------------------------------}
{ TppReport.GetLastPageCached }

procedure TppReport.GetLastPageCached(Sender: TObject; var aPageNo: Longint);
begin
  aPageNo := FCacheManager.CachePageCount;
end;

{------------------------------------------------------------------------------}
{ TppReport.ResetCache }

procedure TppReport.ResetCache(Sender: TObject);
begin

  {clear any previously created bookmarks, this also clears the streams}
  FCacheManager.ResetCache;

end; {procedure, ResetCache}

{------------------------------------------------------------------------------}
{ TppReport.ReadCache }

procedure TppReport.ReadCache(Sender: TObject);
begin

  {restore engine state}
  FCacheManager.ReadCache(AbsolutePageNo - 1);

end; {procedure, ReadCache}

{------------------------------------------------------------------------------}
{ TppReport.WriteCache }

procedure TppReport.WriteCache(Sender: TObject);
begin

  {save engine state}
  FCacheManager.WriteCache(AbsolutePageNo);

end; {procedure, WriteCache}

{------------------------------------------------------------------------------}
{ TppReport.SetCachePages }

procedure TppReport.SetCachePages(Value: Boolean);
begin
  if Printing then Exit;

  if (FCachePages <> Value) then
    begin
      FCachePages := Value;

      {notify report designer}
      SetModified(True);

      Reset;
    end;

end; {procedure, SetCachePages}

{------------------------------------------------------------------------------}
{ TppReport.PrintReport - backward compatibility }

procedure TppReport.PrintReport;
begin
  Print;
end; {procedure, PrintReport}

{------------------------------------------------------------------------------}
{ TppReport.PrintPageList - backward compatibility }

procedure TppReport.PrintPageList(aPageList: TStrings);
begin

  {RequestPage(Self, psPageList, 0, aPageList);}

end; {procedure, PrintPageList}

{------------------------------------------------------------------------------}
{ TppReport.PrintPage - backward compatibility }

procedure TppReport.PrintPage(aPageNo: Integer);
begin

  {RequestPage(Self, psSinglePage, aPageNo, nil);}

end; {procedure, PrintPage}

{------------------------------------------------------------------------------}
{ TppReport.PrintToDevices }

procedure TppReport.PrintToDevices;
begin

  try

    SendDesignMessage(PM_REPORTPRINTING, ppWCustomMsg, 1);

    if not(esInitialized in Engine.State) and not(Engine.StopPrinting) then
      begin
        Publisher.CachePages := FCachePages;
        ResetSubReports;
      end;

    inherited PrintToDevices;

  finally

    SendDesignMessage(PM_REPORTPRINTING, ppWCustomMsg, 0);

  end;

end; {procedure, PrintToDevices}

{------------------------------------------------------------------------------}
{ TppReport.RequestPage }

procedure TppReport.RequestPage(Sender: TObject; aPageRequest: TObject);
begin

  inherited RequestPage(Sender, aPageRequest);

  {generate the pages}
  try

      Printing := True;

    try


      Engine.Page.PrinterSetup := PrinterSetup;

      {set page size}
      if not(Engine.Page.PrinterSetup.IsPrinterDefEqual(PrinterSetup)) then
        begin
          Publisher.Clear;

          Engine.Reset;
        end;  

      Engine.RequestPage(TppPageRequest(aPageRequest));

    except
    
      {ReportBuilder Exception}
      on EPrintError do
        begin
          Engine.Printing := False;

          Engine.Reset;

          raise;
        end;

      {Delphi Exception}
      on E: Exception do
        begin
          Engine.Printing := False;

          Engine.Reset;

          raise EPrintError.Create(ppLoadStr(1023) + #13#10 + #13#10 + E.Message); {'Cannot generate report.'}
        end;

    end; {try, except}

  finally

    Printing := False;

  end; {try, finally}

  {if the user cancels the job, notify devices, reset engine}
  if Engine.StopPrinting then
    Engine.Reset;

end; {procedure, RequestPage}

{------------------------------------------------------------------------------}
{ TppReport.Cancel }

procedure TppReport.Cancel;
begin

  inherited Cancel;

  if (FActiveReport <> nil) and (FActiveReport <> Self) then
    FActiveReport.Cancel;

  Engine.StopPrinting := True;

end; {procedure, Cancel}

{------------------------------------------------------------------------------}
{ TppReport.IsCached }

function TppReport.IsCached: Boolean;
begin

  Result := (esInitialized in Engine.State);

end; {function, IsCached}

{------------------------------------------------------------------------------}
{ TppReport.PageSent }

procedure TppReport.PageSent(Sender: TObject);
begin

  Publisher.ReceivePage(Engine.Page);

end; {procedure, PageSent}

{------------------------------------------------------------------------------}
{ TppReport.ExpandDrillDowns }

procedure TppReport.ExpandDrillDowns;
begin
  TakeSubReportAction(ppsrExpandDrillDowns);

  ResetFromPageNo(1);

  Publisher.ResetDevices;
end; {procedure, ExpandDrillDowns}

{------------------------------------------------------------------------------}
{ TppReport.CollapseDrillDowns }

procedure TppReport.CollapseDrillDowns;
begin
  TakeSubReportAction(ppsrCollapseDrillDowns);

  ResetFromPageNo(1);
  
  Publisher.ResetDevices;
end; {procedure, ExpandDrillDowns}

{------------------------------------------------------------------------------}
{ TppReport.ResetSubReports }

procedure TppReport.ResetSubReports;
begin
  TakeSubReportAction(ppsrReset);
end; {procedure, ResetSubReports}

{------------------------------------------------------------------------------}
{ TppReport.TakeSubReportAction }

procedure TppReport.TakeSubReportAction(aAction: TppSubReportActionType);
var
  lReports: TStringList;
  lReport: TppCustomReport;
  liReport: Integer;
begin
  lReports := TStringList.Create;

  {get list of all sub-reports}
  GetSubReports(lReports);

  for liReport := 0 to lReports.Count - 1 do
    begin
      lReport := TppCustomReport(lReports.Objects[liReport]);

      case aAction of
         ppsrReset:
           begin
             if (lReport.Engine <> nil) then
               lReport.Engine.Reset;
           end;

         ppsrExpandDrillDowns:
           begin
             if (lReport is TppChildReport) and (TppChildReport(lReport).Parent is TppSubReport) then
               TppSubReport(TppChildReport(lReport).Parent).ExpandAll := True;
           end;

         ppsrCollapseDrillDowns:
           begin
             if (lReport is TppChildReport) and (TppChildReport(lReport).Parent is TppSubReport) then
               TppSubReport(TppChildReport(lReport).Parent).ExpandAll := False;
           end;

      end;

    end;

  lReports.Free;

end; {procedure, TakeSubReportAction}

{******************************************************************************
 *
 ** R E P O R T  -  DISCONTINUED PROPERTIES
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReport.DefineProperties - read/write private 'fake' properties }

procedure TppReport.DefineProperties(Filer: TFiler);
begin

  inherited DefineProperties(Filer);

  {conversion to 3.0}
  Filer.DefineProperty('AllowPrintCancel', ReadAllowPrintCancel, nil, False);
  Filer.DefineProperty('DataSource', ReadDataSource, nil, False);
  Filer.DefineProperty('OnPrintingComplete', ReadOnPrintingComplete, nil, False);
  Filer.DefineProperty('Orientation', ReadOrientation, nil, False);
  Filer.DefineProperty('NoDataPages', ReadNoDataPages, nil, False);
  Filer.DefineProperty('PreviewPages', ReadPreviewPages, nil, False);
  Filer.DefineProperty('RowSpacing', ReadRowSpacing, nil, False);
  Filer.DefineProperty('SuppressFormFeed', ReadSuppressFormFeed, nil, False);
  Filer.DefineProperty('Viewer', ReadViewer, nil, False);

end;

{------------------------------------------------------------------------------}
{ TppReport.ReadDataSource }

procedure TppReport.ReadDataSource(Reader: TReader);
begin
  {read the datasource name, but don't do anything with it}
  FDataSource := Reader.ReadIdent;
end; {procedure, ReadDataSource}

{------------------------------------------------------------------------------}
{ TppReport.ReadNoDataPages }

procedure TppReport.ReadNoDataPages(Reader: TReader);
begin
  {convert nodatapages to pagelimit}
  PageLimit := Reader.ReadInteger;
end; {procedure, ReadNoDataPages}

{------------------------------------------------------------------------------}
{ TppReport.ReadPreviewPages}

procedure TppReport.ReadPreviewPages(Reader: TReader);
begin
  {read the preview pages prop, but don't do anything with it}
  Reader.ReadInteger;
end; {procedure, ReadPreviewPages}

{------------------------------------------------------------------------------}
{ TppBand.ReadOnPrintingComplete }

procedure TppReport.ReadOnPrintingComplete(Reader: TReader);
begin
  FOnPrintingComplete := Reader.ReadIdent;
end; {procedure, ReadOnPrintingComplete}

{------------------------------------------------------------------------------}
{ TppReport.ReadOrientation }

procedure TppReport.ReadOrientation(Reader: TReader);
var
  lsOldOrientation: String;
begin
  lsOldOrientation := Reader.ReadIdent;

  if lsOldOrientation = 'poLandscape' then
    FOldOrientation := poLandscape
  else
    FOldOrientation := poPortrait;

end;

{------------------------------------------------------------------------------}
{ TppReport.ReadRowSpacing }

procedure TppReport.ReadRowSpacing(Reader: TReader);
begin
  FRowSpacing := Reader.ReadFloat;
end;

{------------------------------------------------------------------------------}
{ TppReport.ReadSuppressFormFeed }

procedure TppReport.ReadSuppressFormFeed(Reader: TReader);
begin
  {read the property out of the stream, but don't do anything with it}
  Reader.ReadBoolean;
end;

{------------------------------------------------------------------------------}
{ TppReport.ReadAllowPrintCancel }

procedure TppReport.ReadAllowPrintCancel(Reader: TReader);
begin
  {read the property out of the stream, but don't do anything with it}
  Reader.ReadBoolean;
end;

{------------------------------------------------------------------------------}
{ TppReport.ReadViewer }

procedure TppReport.ReadViewer(Reader: TReader);
begin
  {read the datasource name, but don't do anything with it}
  Reader.ReadIdent;
end; {procedure, ReadViewer}

{******************************************************************************
 *
 ** C H I L D  R E P O R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppChildReport.Create }

constructor TppChildReport.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FResetting := False;

end;  {constructor, Create}

{------------------------------------------------------------------------------}
{ TppChildReport.Transfer }

procedure TppChildReport.Transfer(aSource: TppCommunicator);
begin

  inherited Transfer(aSource);

  {for a child report, do not allow save as template to load}
  SaveAsTemplate := False;

  if (aSource is TppChildReport) then
    CheckParentPrinterSetup;

end; {procedure, Transfer}

{------------------------------------------------------------------------------}
{ TppChildReport.GetMainReport }

function TppChildReport.GetMainReport: TppCustomReport;
begin
  if (Parent is TppSubReport) and (TppSubReport(Parent).Band <> nil) and (TppSubReport(Parent).Band.Report <> nil) then
    Result := TppSubReport(Parent).Band.Report.MainReport
  else
    Result := nil;
end; {function, GetMainReport}

{------------------------------------------------------------------------------}
{ TppChildReport.GetReportKey }

procedure TppChildReport.GetReportKey(var aKey: String);
var
  lSubReport: TppSubReport;
begin

  if (Parent is TppSubReport) then
    begin
      lSubReport := TppSubReport(Parent);

      aKey := aKey + Format('%8d', [lSubReport.Count]) + '|';

      if (lSubReport.Band <> nil) and (lSubReport.Band.Report <> nil) then
       lSubReport.Band.Report.GetReportKey(aKey);
    end;

end; {function, GetReportKey}

{------------------------------------------------------------------------------}
{ TppChildReport.GetUniqueUserName }

function  TppChildReport.GetUniqueUserName(aComponent: TComponent): String;
begin
  if aComponent is TppSubReport then
    Result := GetMainReport.GetUniqueUserName(aComponent)
  else
    Result := inherited GetUniqueUserName(aComponent)
end; {function, GetUniqueUserName}

{------------------------------------------------------------------------------}
{ TppChildReport.GetPrintMessage }

function TppChildReport.GetPrintMessage: String;
begin
  if (MainReport <> nil) then
    Result := MainReport.GetPrintMessage;
end; {function, GetPrintMessage }

{------------------------------------------------------------------------------}
{ TppChildReport.SetPrintMessage }

procedure TppChildReport.SetPrintMessage(const aMessage: String);
begin
  if (MainReport <> nil) then
    MainReport.SetPrintMessage(aMessage);
end; {function, SetPrintMessage }

{------------------------------------------------------------------------------}
{ TppChildReport.CheckParentPrinterSetup }

procedure TppChildReport.CheckParentPrinterSetup;
var
  lSubReport: TppSubReport;

begin

  if (ParentReport = nil) or not (Parent is TppSubReport) then Exit;

  lSubReport := TppSubReport(Parent);

  {set ParentPrinterSetup to False if no longer in sync}
  if lSubReport.ParentPrinterSetup and not PrinterSetup.IsEqual(ParentReport.PrinterSetup) then
    lSubReport.ParentPrinterSetup := False;

end; {procedure, CheckParentPrinterSetup}

{------------------------------------------------------------------------------}
{ TppChildReport.PrinterSetupChanged }

procedure TppChildReport.PrinterSetupChanged;
begin

  inherited PrinterSetupChanged;

  CheckParentPrinterSetup;

end; {procedure, PrinterSetupChanged}

{------------------------------------------------------------------------------}
{ TppChildReport.Reset }

procedure TppChildReport.Reset;
begin

  {notify master report, who will then reset all child reports}
  if (MainReport <> nil) then
    MainReport.Reset;

end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppChildReport.Cancel }

procedure TppChildReport.Cancel;
begin

  inherited Cancel;

  Engine.StopPrinting := True;

  if (ParentReport <> nil) and not(ParentReport is TppReport) then
    ParentReport.Cancel;

end; {procedure, Cancel}

{------------------------------------------------------------------------------}
{ TppChildReport.ESInclude }

procedure TppChildReport.ESInclude(aEngineStateSet: TppEngineStates);
begin

  Engine.ESInclude(aEngineStateSet);

  if (ParentReport <> nil) then
    ParentReport.ESInclude(aEngineStateSet);

end; {function, ESInclude}

{------------------------------------------------------------------------------}
{ TppChildReport.ESExclude }

procedure TppChildReport.ESExclude(aEngineStateSet: TppEngineStates);
begin

  Engine.ESExclude(aEngineStateSet);

  if (ParentReport <> nil) then
    ParentReport.ESExclude(aEngineStateSet);

end; {function, ESExclude}

{------------------------------------------------------------------------------}
{ TppChildReport.SetModified }

procedure TppChildReport.SetModified(Value: Boolean);
var
  lReport: TppCustomReport;
begin

  inherited SetModified(Value);

  if not SaveAsTemplate then
    begin
      lReport := ParentReport;

      if lReport <> nil then
        lReport.Modified := Value;
    end;

end; {function, SetModified}

{------------------------------------------------------------------------------}
{ TppChildReport.SetParent }

procedure TppChildReport.SetParent(aParent: TppRelative);
begin

  if (Parent <> nil) and (Parent is TppSubReport) then
    TppSubReport(Parent).SetReportProperty(nil);

  inherited SetParent(aParent);

  if (Parent <> nil) and (Parent is TppSubReport) then
    TppSubReport(aParent).SetReportProperty(Self);

end; {function, SetParent}


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
 ** B A N D E D   R E P O R T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppBandedReportRTTI.RefClass }

class function TraTppBandedReportRTTI.RefClass: TClass;
begin
  Result := TppBandedReport;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppBandedReportRTTI.GetPropList }

class procedure TraTppBandedReportRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('ColumnHeader');
  aPropList.AddProp('ColumnFooter');
  aPropList.AddProp('Title');
  aPropList.AddProp('Header');
  aPropList.AddProp('Detail');
  aPropList.AddProp('Footer');
  aPropList.AddProp('Summary');
  aPropList.AddProp('GroupHeader');
  aPropList.AddProp('GroupFooter');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppBandedReportRTTI.GetPropRec }

class function TraTppBandedReportRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'ColumnHeader') or ppEqual(aPropName, 'ColumnHeaderBand') then
    ClassPropToRec(aPropName, TppColumnHeaderBand, True, aPropRec)

  else if ppEqual(aPropName, 'ColumnFooter') or ppEqual(aPropName, 'ColumnFooterBand') then
    ClassPropToRec(aPropName, TppColumnFooterBand, True, aPropRec)

  else if ppEqual(aPropName, 'Title') or ppEqual(aPropName, 'TitleBand') then
    ClassPropToRec(aPropName, TppTitleBand, True, aPropRec)

  else if ppEqual(aPropName, 'Header') or ppEqual(aPropName, 'HeaderBand') then
    ClassPropToRec(aPropName, TppHeaderBand, True, aPropRec)

  else if ppEqual(aPropName, 'Detail') or ppEqual(aPropName, 'DetailBand') then
    ClassPropToRec(aPropName, TppDetailBand, True, aPropRec)

  else if ppEqual(aPropName, 'Footer') or ppEqual(aPropName, 'FooterBand') then
    ClassPropToRec(aPropName, TppFooterBand, True, aPropRec)

  else if ppEqual(aPropName, 'Summary') or ppEqual(aPropName, 'SummaryBand') then
    ClassPropToRec(aPropName, TppSummaryBand, True, aPropRec)

  else if ppEqual(aPropName, 'GroupHeader') or ppEqual(aPropName, 'GroupHeaderBand') then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'GroupFooter') or ppEqual(aPropName, 'GroupFooterBand') then
    AccessSpecifierToRec(aPropName, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppBandedReportRTTI.GetParams }

class function TraTppBandedReportRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'GroupHeader') or ppEqual(aMethodName, 'GroupHeaderBand') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppGroupHeaderBand, '', False, False);
    end

  else if ppEqual(aMethodName, 'GroupFooter') or ppEqual(aMethodName, 'GroupFooterBand') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppGroupFooterBand, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppBandedReportRTTI.CallMethod }

class function TraTppBandedReportRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lReport: TppBandedReport;
  liIndex: Integer;
  lBand: TppBand;
begin

  Result := True;
  
  lReport := TppBandedReport(aObject);

  if ppEqual(aMethodName, 'GroupHeader') or ppEqual(aMethodName, 'GroupHeaderBand') then
    begin
      aParams.GetParamValue(0, liIndex);

      lBand := lReport.GroupHeaderBand[liIndex];

      aParams.SetParamValue(1, Integer(lBand));
    end

  else if ppEqual(aMethodName, 'GroupFooter') or ppEqual(aMethodName, 'GroupFooterBand') then
    begin
      aParams.GetParamValue(0, liIndex);

      lBand := lReport.GroupFooterBand[liIndex];

      aParams.SetParamValue(1, Integer(lBand));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppBandedReportRTTI.GetPropValue }

class function TraTppBandedReportRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Title') or ppEqual(aPropName, 'TitleBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).TitleBand)

  else if ppEqual(aPropName, 'Header') or ppEqual(aPropName, 'HeaderBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).HeaderBand)

  else if ppEqual(aPropName, 'Detail') or ppEqual(aPropName, 'DetailBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).DetailBand)

  else if ppEqual(aPropName, 'Footer') or ppEqual(aPropName, 'FooterBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).FooterBand)

  else if ppEqual(aPropName, 'Summary') or ppEqual(aPropName, 'SummaryBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).SummaryBand)

  else if ppEqual(aPropName, 'ColumnHeader') or ppEqual(aPropName, 'ColumnHeaderBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).ColumnHeaderBand)

  else if ppEqual(aPropName, 'ColumnFooter') or ppEqual(aPropName, 'ColumnFooterBand') then
    Integer(aValue) := Integer(TppBandedReport(aObject).ColumnFooterBand)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{******************************************************************************
 *
 ** R E P O R T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.RefClass }

class function TraTppReportRTTI.RefClass: TClass;
begin
  Result := TppReport;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.GetPropList }

class procedure TraTppReportRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('PreviewForm');

  {add public methods}
  aPropList.AddMethod('CreateAutoSearchCriteria');
  aPropList.AddMethod('GetAutoSearchDescriptionLines');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.GetPropRec }

class function TraTppReportRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if CompareText(aPropName, 'OnAutoSearchDialogCreate') = 0 then
    EventToRec(aPropName, ciReportAutoSearchDialogCreate, False, aPropRec)

  else if CompareText(aPropName, 'OnAutoSearchDialogClose') = 0 then
    EventToRec(aPropName, ciReportAutoSearchDialogClose, False, aPropRec)

  else if CompareText(aPropName, 'OnGetAutoSearchValues') = 0 then
    EventToRec(aPropName, ciReportGetAutoSearchValues, False, aPropRec)

    
  {properties & methods}
  else if (CompareText(aPropName, 'ActiveReport') = 0) then
    ClassPropToRec(aPropName, TppCustomReport, True, aPropRec)

  else if (CompareText(aPropName, 'AutoSearchDialog') = 0) then
    ClassPropToRec(aPropName, TppCustomAutoSearchDialog, True, aPropRec)

  else if (CompareText(aPropName, 'AutoSearchFields') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'AutoSearchDescription') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'AutoSearchFieldCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'CacheManager') = 0) then
    ClassPropToRec(aPropName, TppCacheManager, True, aPropRec)

  else if (CompareText(aPropName, 'CachePages') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'CreateAutoSearchCriteria') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetAutoSearchDescriptionLines') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.GetParams }

class function TraTppReportRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'AutoSearchFields') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppAutoSearchField, '', False, False);
    end

  else if (CompareText(aMethodName, 'CreateAutoSearchCriteria') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aDataPipelineName', daString, nil, '', True, False);
      Result.AddParam('aFieldName', daString, nil, '', True, False);
      Result.AddParam('aOperator', daEnum, nil, 'TppSearchOperatorType', False, False);
      Result.AddParam('aExpression', daString, nil, '', True, False);
      Result.AddParam('aMandatory', daBoolean, nil, '', False, False);
      Result.AddParam('Result', daClass, TppAutoSearchField, '', False, False);
    end

  else if (CompareText(aMethodName, 'GetAutoSearchDescriptionLines') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aLines', daClass, TStrings, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.CallMethod }

class function TraTppReportRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lReport: TppReport;
  liIndex: Integer;
  lField: TppAutoSearchField;
  lsDataPipeName: String;
  lsFieldName: String;
  liOperator: Integer;
  lOperator: TppSearchOperatorType;
  lbMandatory: Boolean;
  lsExpression: String;
  lStringList: TStringList;
begin

  Result := True;
  
  lReport := TppReport(aObject);

  if (CompareText(aMethodName, 'AutoSearchFields') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lField := lReport.AutoSearchFields[liIndex];

      aParams.SetParamValue(1, Integer(lField));
    end

  else if (CompareText(aMethodName, 'CreateAutoSearchCriteria') = 0) then
    begin
      aParams.GetParamValue(0, lsDataPipeName);
      aParams.GetParamValue(1, lsFieldName);
      aParams.GetParamValue(2, liOperator);
      aParams.GetParamValue(3, lsExpression);
      aParams.GetParamValue(4, lbMandatory);

      lOperator := TppSearchOperatorType(liOperator);

      lField := lReport.CreateAutoSearchCriteria(lsDataPipeName, lsFieldName, lOperator, lsExpression, lbMandatory);

      aParams.SetParamValue(5, Integer(lField));
    end

  else if (CompareText(aMethodName, 'GetAutoSearchDescriptionLines') = 0) then
    begin
      aParams.GetParamValue(0, lStringList);

      lReport.GetAutoSearchDescriptionLines(lStringList);

      aParams.SetParamValue(0, lStringList);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.GetPropValue }

class function TraTppReportRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'ActiveReport') = 0) then
    Integer(aValue) := Integer(TppReport(aObject).PreviewForm)

  else if (CompareText(aPropName, 'AutoSearchDescription') = 0) then
    String(aValue) := TppReport(aObject).AutoSearchDescription

  else if (CompareText(aPropName, 'GetAutoSearchDescriptionAsString') = 0) then
    Integer(aValue) := Integer(TppReport(aObject).GetAutoSearchDescriptionAsString)

  else if (CompareText(aPropName, 'AutoSearchDialog') = 0) then
    Integer(aValue) := Integer(TppReport(aObject).AutoSearchDialog)

  else if (CompareText(aPropName, 'AutoSearchFieldCount') = 0) then
    Integer(aValue) := TppReport(aObject).AutoSearchFieldCount

  else if (CompareText(aPropName, 'CacheManager') = 0) then
    Integer(aValue) := Integer(TppReport(aObject).CacheManager)

  else if (CompareText(aPropName, 'CachePages') = 0) then
    Boolean(aValue) := TppReport(aObject).CachePages

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppReportRTTI.SetPropValue }

class function TraTppReportRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CachePages') = 0) then
    TppReport(aObject).CachePages := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppChildReport, TppReport, TppReportTemplate]);

  raRegisterRTTI(TraTppBandedReportRTTI);
  raRegisterRTTI(TraTppReportRTTI);

finalization

  UnRegisterClasses([TppChildReport, TppReport, TppReportTemplate]);

  raUnRegisterRTTI(TraTppBandedReportRTTI);
  raUnRegisterRTTI(TraTppReportRTTI);

end.
