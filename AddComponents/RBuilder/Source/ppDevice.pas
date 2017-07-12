{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDevice;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, ExtCtrls, SysUtils, Forms, Controls,
  ppComm, ppForms, ppTypes, ppUtils, ppPrintr;


type

  {forward declarations}
  TppPage = class;
  TppPageRequest = class;
  TppDrawCommand = class;
  TppDevice = class;

  TppDrawCommandClass = class of TppDrawCommand;

  { TppPublisher }
  TppPublisher = class(TppCommunicator)
  private
    FAbsolutePageCount: Longint;
    FCachePages: Boolean;
    FDevices: TList;
    FFirstPageRequest: Boolean;
    FStacks: TStringList;
    FOnPageRequest: TppPageRequestEvent;
    FPageCache: TStringList;
    FPageRequest: TppPageRequest;
    FPageRequestsGranted: Boolean;
    FReadingCache: Boolean;
    FReportCompleted: Boolean;
    FRequestingPages: Boolean;
    FGeneratingPages: Boolean;

    procedure AddDevice(aDevice: TppDevice);
    procedure AddPageToCache(aPage: TppPage);
    procedure AddStackableDevice(aDevice: TppDevice);
    procedure CheckPagesRequested(aPage: TppPage);
    procedure ClearPageCache;
    procedure ClearPageRequests;
    procedure DoOnPageRequest;
    procedure FreeStacks;
    function  GetDevice(aIndex: Integer): TppDevice;
    function  GetDeviceCount: Integer;
    function  GetPage(aIndex: Integer): TppPage;
    function  GetPageCount: Integer;
    function  GetPagesFromCache: Boolean;
    function  IsValidDevice(aDevice: TppDevice): Boolean;
    procedure RemoveDevice(aDevice: TppDevice);
    procedure RemoveStackableDevice(aDevice: TppDevice);
    procedure RequestPage(aPageRequest: TppPageRequest);
    procedure ResolvePageRequest(aPageRequest: TppPageRequest);
    procedure SetCachePages(Value: Boolean);
    procedure TakeDeviceAction(aAction: TppDeviceActionType; aPage: TppPage; const aMessage: String);
    procedure UpdateCachedPages(aPage: TppPage);

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    procedure CancelJob;
    procedure Clear;
    function  GetPageFromCache(aPageNo: Longint): TppPage;
    function  GetPrintMessage: String;
    procedure EndJob;
    function  OnlyScreenDevicesConnected: Boolean;
    procedure Publish;
    procedure ReceivePage(aPage: TppPage);
    procedure Reset;
    procedure ResetDevices;
    procedure SetPrintMessage(const aMessage: String);
    procedure StartJob;

    property CachePages: Boolean read FCachePages write SetCachePages default False;
    property Devices[Index: Integer]: TppDevice read GetDevice;
    property DeviceCount: Integer read GetDeviceCount;
    property OnPageRequest: TppPageRequestEvent read FOnPageRequest write FOnPageRequest;
    property Pages[Index: Integer]: TppPage read GetPage;
    property PageCount: Integer read GetPageCount;
    property PageRequestsGranted: Boolean read FPageRequestsGranted;
    property ReportCompleted: Boolean read FReportCompleted;

  end; {class, TppPublisher}

  { TppDevice }
  TppDevice = class(TppCommunicator)
    private
      FActive: Boolean;
      FBusy: Boolean;
      FCancelDialog: TppCustomCancelDialog;
      FIsMessagePage: Boolean;
      FIsRequestedPage: Boolean;
      FLanguageIndex: Longint;
      FOnCancelJob: TNotifyEvent;
      FOnPageRequest: TNotifyEvent;
      FOnPageReceive: TppPageEvent;
      FOnStartJob: TNotifyEvent;
      FOnEndJob: TNotifyEvent;
      FOnSetPublisher: TNotifyEvent;
      FPageRequest: TppPageRequest;
      FPublisher: TppPublisher;
      FStackable: Boolean;
      FStackName: String;
      FStatus: String;
      FWaitingForPage: Boolean;

      procedure CheckPagesRequested(aPage: TppPage);
      procedure DoOnSetPublisher;
      function  GetPageList: TStrings;
      function  GetPageRequested: Integer;
      function  GetPageSetting: TppPageSettingType;
      procedure SetActive(aValue: Boolean);
      procedure SetPageList(aPageList: TStrings);
      procedure SetPageRequested(Value: Integer);
      procedure SetPageRequest(aPageRequest: TppPageRequest);
      procedure SetPageSetting(aPageSetting: TppPageSettingType);
      procedure SetPublisher(aPublisher: TppPublisher);

    protected
      procedure DrawPage(aPage: TppPage);

      procedure SetStackable(Value: Boolean); virtual;
      procedure SetStackName(aName: String); virtual;
      procedure SetStatus(const aValue: String); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function DeviceName: String; virtual;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure CancelJob; virtual;
      procedure DoOnPageRequest;
      function  Draw(aDrawCommand: TppDrawCommand): Boolean; virtual;
      function  DrawUpdateable(aDrawCommand: TppDrawCommand): Boolean; virtual;
      procedure EndJob; virtual;
      function  FinalPagesOnly: Boolean; virtual;
      procedure MakePageRequest;
      procedure ReceivePage(aPage: TppPage); virtual;
      procedure Reset; virtual;
      procedure StartJob; virtual;

      property Active: Boolean read FActive write SetActive;
      property Busy: Boolean read FBusy;
      property CancelDialog: TppCustomCancelDialog read FCancelDialog write FCancelDialog;
      property IsMessagePage: Boolean read FIsMessagePage write FIsMessagePage;
      property IsRequestedPage: Boolean read FIsRequestedPage write FIsRequestedPage;
      property LanguageIndex: Longint read FLanguageIndex write FLanguageIndex;
      property OnSetPublisher: TNotifyEvent read FOnSetPublisher write FOnSetPublisher;
      property PageList: TStrings read GetPageList write SetPageList;
      property PageRequested: Integer read GetPageRequested write SetPageRequested;
      property PageSetting: TppPageSettingType read GetPageSetting write SetPageSetting;
      property PageRequest: TppPageRequest read FPageRequest write SetPageRequest;
      property Publisher: TppPublisher read FPublisher write SetPublisher;
      property Stackable: Boolean read FStackable write SetStackable;
      property StackName: String read FStackName write SetStackName;
      property Status: String read FStatus write SetStatus;
      property WaitingForPage: Boolean read FWaitingForPage write FWaitingForPage;

      {these events allow run-time communication with device}
      property OnCancelJob: TNotifyEvent read FOnCancelJob write FOnCancelJob;
      property OnEndJob: TNotifyEvent read FOnEndJob write FOnEndJob;
      property OnPageReceive: TppPageEvent read FOnPageReceive write FOnPageReceive;
      property OnPageRequest: TNotifyEvent read FOnPageRequest write FOnPageRequest;
      property OnStartJob: TNotifyEvent read FOnStartJob write FOnStartJob;

  end; {class TppDevice}

  { TppRasterDevice }
  TppRasterDevice = class(TppDevice)
  end; {class TppRasterDevice}


{******************************************************************************
 *
 ** P A G E   &   P A G E   C O M M A N D S
 *
{******************************************************************************}

  { TppPage }
  TppPage = class(TComponent)
    private
      FAbsolutePageNo: Longint;
      FAbsolutePageCount: Longint;
      FCalculation: Boolean;
      FClickables: TList;
      FControlGroupBreakNo: Longint;
      FDocumentName: String;
      FDrawCommands: TList;
      FFinal: Boolean;
      FFirstPage: Boolean;
      FLanguageIndex: Longint;
      FLastPage: Boolean;
      FPageNo: Longint;
      FPageCount: Longint;
      FPassSetting: TppPassSettingType;
      FPrintDateTime: TDateTime;
      FPrinterSetup: TppPrinterSetup;
      FUpdateables: TList;

      procedure AddClickable(aDrawCommand: TppDrawCommand);
      procedure AddUpdateable(aDrawCommand: TppDrawCommand);
      function  GetClickable(aIndex: Integer): TppDrawCommand;
      function  GetClickableCount: Integer;
      function  GetDrawCommand(aIndex: Integer): TppDrawCommand;
      function  GetDrawCommandCount: Integer;
      function  GetPageDef: TppPageDef;
      function  GetPageNoDescription: String;
      function  GetPageSetDescription: String;
      procedure RemoveClickable(aDrawCommand: TppDrawCommand);
      procedure RemoveUpdateable(aDrawCommand: TppDrawCommand);
      procedure SetPrinterSetup(aPrinterSetup: TppPrinterSetup);

    protected

     {component streaming stuff}
{$IFDEF WIN32}
  {$IFDEF Delphi3}
    procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
    procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}

{$ELSE}
    procedure WriteComponents(Writer: TWriter); override;
{$ENDIF}

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure AddDrawCommand(aDrawCommand: TppDrawCommand);
      procedure Clear;
      procedure FreeDrawCommands;
      function  HasClickables: Boolean;
      function  HasUpdateables: Boolean;
      procedure RemoveDrawCommand(aDrawCommand: TppDrawCommand);
      procedure Update(aDevice: TppDevice);

      property Description: String read GetPageSetDescription;
      property DrawCommands[Index: Integer]: TppDrawCommand read GetDrawCommand; default;
      property DrawCommandCount: Integer read GetDrawCommandCount;
      property Calculation: Boolean read FCalculation write FCalculation;
      property Clickables[Index: Integer]: TppDrawCommand read GetClickable;
      property ClickableCount: Integer read GetClickableCount;
      property Final: Boolean read FFinal write FFinal;
      property PageNoDescription: String read GetPageNoDescription;
      property PageSetDescription: String read GetPageSetDescription;

    published
      property AbsolutePageNo: Longint read FAbsolutePageNo write FAbsolutePageNo;
      property AbsolutePageCount: Longint read FAbsolutePageCount write FAbsolutePageCount;
      property ControlGroupBreakNo: Longint read FControlGroupBreakNo write FControlGroupBreakNo;
      property DocumentName: String read FDocumentName write FDocumentName;
      property FirstPage: Boolean read FFirstPage write FFirstPage;
      property LanguageIndex: Longint read FLanguageIndex write FLanguageIndex;
      property LastPage: Boolean read FLastPage write FLastPage;
      property PageDef: TppPageDef read GetPageDef;
      property PageNo: Longint read FPageNo write FPageNo;
      property PageCount: Longint read FPageCount write FPageCount;
      property PassSetting: TppPassSettingType read FPassSetting write FPassSetting;
      property PrintDateTime: TDateTime read FPrintDateTime write FPrintDateTime;
      property PrinterSetup: TppPrinterSetup read FPrinterSetup write SetPrinterSetup;

  end; {class TppPage}

  { TppDrawCommand }
  TppDrawCommand = class(TComponent)
    private
      FBand: TComponent;
      FClickable: Boolean;
      FClipRect: TppRect;
      FDataType: TppDataType;
      FDrawLeft: Longint;
      FDrawRight: Longint;
      FDrawTop: Longint;
      FDrawBottom: Longint;
      FExpansionKey: String;
      FLeft: Longint;
      FHeight: Longint;
      FOnClick: TNotifyEvent;
      FPage: TppPage;
      FRedrawPage: Boolean;
      FTop: Longint;
      FWidth: Longint;

      function  GetDrawRect: TRect;
      procedure SetPage(aPage: TppPage);

    protected
{$IFDEF WIN32 }
    procedure SetParentComponent(Value: TComponent); override;
{$ELSE}
    procedure ReadState(Reader: TReader); override;

{$ENDIF }

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;
      procedure DoOnClick;

      function  Draw(aDevice: TppDevice): Boolean; virtual;
      function  HasParent: Boolean; override;
      function  IsUpdateable: Boolean; virtual;
      function  IsClickable: Boolean;
      function  Update: Boolean; virtual;

{$IFDEF WIN32 }
    function  GetParentComponent: TComponent; override;
{$ENDIF}

      property Band: TComponent read FBand write FBand;
      property ClipRect: TppRect read FClipRect write FClipRect;
      property DrawLeft: Longint read FDrawLeft write FDrawLeft;
      property DrawRight: Longint read FDrawRight write FDrawRight;
      property DrawTop: Longint read FDrawTop write FDrawTop;
      property DrawBottom: Longint read FDrawBottom write FDrawBottom;
      property DrawRect: TRect read GetDrawRect;
      property ExpansionKey: String read FExpansionKey write FExpansionKey;
      property OnClick: TNotifyEvent read FOnClick write FOnClick;
      property Page: TppPage read FPage write SetPage;
      property RedrawPage: Boolean read FRedrawPage write FRedrawPage;

    published
      property Clickable: Boolean read FClickable write FClickable default False;
      property DataType: TppDataType read FDataType write FDataType default dtString;
      property Left: Longint read FLeft write FLeft;
      property Height: Longint read FHeight write FHeight;
      property Top: Longint read FTop write FTop;
      property Width: Longint read FWidth write FWidth;


  end; {class, TppDrawCommand}

  { TppPageRequest }
  TppPageRequest = class(TPersistent)
    private
      FPageList: TStrings;
      FPageRequested: Longint;
      FPageSetting: TppPageSettingType;
      FPageRange: TppPageRangeType;

      procedure SetPageList(aPageList: TStrings);

    public
      constructor Create;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure AddPageRequest(aPageRequest: TppPageRequest);
      function  AllPagesReceived(aPage: TppPage): Boolean;
      function  IsRequestedPage(aPage: TppPage): Boolean;
      procedure Reset;

      property PageList: TStrings read FPageList write SetPageList;
      property PageRequested: Integer read FPageRequested write FPageRequested;
      property PageSetting: TppPageSettingType read FPageSetting write FPageSetting;
      property PageRange: TppPageRangeType read FPageRange write FPageRange;

  end; {class, TppPageRequest}

  TppDeviceClass = class of TppDevice;

  {register procedures}
  function  ppDeviceClassForName(const aDeviceName: String): TppDeviceClass;
  procedure ppGetDeviceClasses(aList: TStrings);
  procedure ppRegisterDevice(aDeviceClass: TppDeviceClass);
  procedure ppUnRegisterDevice(aDeviceClass: TppDeviceClass);


implementation

uses
  ppProd;

var
  FDeviceClassList: TList = nil;

{******************************************************************************
 *
 ** P U B L I S H E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPublisher.Create }

constructor TppPublisher.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAbsolutePageCount := 0;
  FCachePages := False;
  FFirstPageRequest := False;
  FOnPageRequest := nil;
  FPageRequest := TppPageRequest.Create;
  FPageRequestsGranted := False;
  FReadingCache := False;
  FReportCompleted := False;
  FRequestingPages := False;
  FGeneratingPages := False;


  FDevices := TList.Create;
  FPageCache := TStringList.Create;
  FStacks := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPublisher.Destroy }

destructor TppPublisher.Destroy;
begin

  ClearPageCache;
  FreeStacks;

  FDevices.Free;
  FPageCache.Free;
  FPageRequest.Free;
  FStacks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPublisher.FreeStacks }

procedure TppPublisher.FreeStacks;
var
  liStack: Integer;
begin

  for liStack :=  0 to FStacks.Count-1 do
   FStacks.Objects[liStack].Free;

end; {procedure, FreeStacks}

{------------------------------------------------------------------------------}
{ TppPublisher.Notify }

procedure TppPublisher.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin
  inherited Notify(aCommunicator, aOperation);

  if (aCommunicator is TppDevice) and (aOperation = ppopRemove) then
    RemoveDevice(TppDevice(aCommunicator));

end; {procedure, Notify}


{------------------------------------------------------------------------------}
{ TppPublisher.TakeDeviceAction }

procedure TppPublisher.TakeDeviceAction(aAction: TppDeviceActionType; aPage: TppPage; const aMessage: String);
var
  liDevice: Integer;
  liDevices: Integer;
  lDevice: TppDevice;
begin

  liDevices := FDevices.Count;

  for liDevice := 0 to (liDevices - 1) do
    begin
      lDevice := Devices[liDevice];

      if not(lDevice.Active) then Continue;

      case aAction of

        ppdvGetPageRequest:
          if lDevice.WaitingForPage then
            begin
              lDevice.DoOnPageRequest;

              RequestPage(lDevice.PageRequest);
            end;

        ppdvReceivePage:
          if lDevice.WaitingForPage then
            lDevice.ReceivePage(aPage);

        ppdvStartJob:
          lDevice.StartJob;

        ppdvEndJob:
          lDevice.EndJob;

        ppdvCancelJob:
          if lDevice.WaitingForPage then
            lDevice.CancelJob;

        ppdvReset:
          lDevice.Reset;


      end; {case, action type}

    end;

end; {procedure, TakeDeviceAction}

{------------------------------------------------------------------------------}
{ TppPublisher.ResetDevices }

procedure TppPublisher.ResetDevices;
begin
  TakeDeviceAction(ppdvReset, nil, '');
end; {procedure, ResetDevices}

{------------------------------------------------------------------------------}
{ TppPublisher.Clear }

procedure TppPublisher.Clear;
begin
  {called from the report to clear everything but the page requests}
  FReportCompleted := False;

  FAbsolutePageCount := 0;

  FPageRequestsGranted := False;

  ClearPageCache;
end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppPublisher.OnlyScreenDevicesConnected }

function TppPublisher.OnlyScreenDevicesConnected: Boolean;
var
  liIndex: Integer;
  lDevice: TppDevice;
begin

  Result := True;

  liIndex := 0;

  while (liIndex < FDevices.Count) and (Result) do
    begin
      lDevice := Devices[liIndex];

      if (CompareText(lDevice.ClassName, 'TppScreenDevice') <> 0) then
        Result := False
      else
        Inc(liIndex);
    end;

end; {function, OnlyScreenDevicesConnected}

{------------------------------------------------------------------------------}
{ TppPublisher.Reset }

procedure TppPublisher.Reset;
begin
  FReportCompleted := False;
  
  FAbsolutePageCount := 0;

  FPageRequestsGranted := False;

  ClearPageRequests;

  ClearPageCache;
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppPublisher.Publish }

procedure TppPublisher.Publish;
begin

  {notify devices that job is starting}
  StartJob;

  {gather page requests from devices}
  try
    FRequestingPages := True;
    FFirstPageRequest := True;

    TakeDeviceAction(ppdvGetPageRequest, nil, '');
  finally
    FRequestingPages := False;
  end; {try, finally}


  {generate pages from report, or read pages from cache}
  try
    FGeneratingPages := True;

    DoOnPageRequest;
  finally
    FGeneratingPages := False;

    {notify devices that job is ending}
    EndJob;
  end; {try, finally}

end; {procedure, Publish}

{------------------------------------------------------------------------------}
{ TppPublisher.StartJob}

procedure TppPublisher.StartJob;
begin
  TakeDeviceAction(ppdvStartJob, nil, '');
end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppPublisher.CancelJob}

procedure TppPublisher.CancelJob;
begin
  TakeDeviceAction(ppdvCancelJob, nil, '');
end; {procedure, CancelJob}

{------------------------------------------------------------------------------}
{ TppPublisher.EndJob }

procedure TppPublisher.EndJob;
begin

  TakeDeviceAction(ppdvEndJob, nil, '');

  ClearPageRequests;

end;  {procedure, EndJob}

{------------------------------------------------------------------------------}
{ TppPublisher.GetPrintMessage }

function TppPublisher.GetPrintMessage: String;
var
  liIndex: Integer;
begin

  Result := '';
  liIndex := 0;

  while (Result = '') and (liIndex < FDevices.Count) do
    begin
      Result := Devices[liIndex].Status;

      Inc(liIndex);
    end;

end;  {procedure, GetPrintMessage}

{------------------------------------------------------------------------------}
{ TppPublisher.SetPrintMessage }

procedure TppPublisher.SetPrintMessage(const aMessage: String);
var
  liIndex: Integer;
begin

  for liIndex := 0 to (FDevices.Count - 1) do
    Devices[liIndex].Status := aMessage;

end;  {procedure, SetPrintMessage}

{------------------------------------------------------------------------------}
{ TppPublisher.ReceivePage }

procedure TppPublisher.ReceivePage(aPage: TppPage);
begin

  {add page to cache}
  AddPageToCache(aPage);

  {send page to all devices}
  TakeDeviceAction(ppdvReceivePage, aPage, '');

  {check to see if all page requests have been granted}
  CheckPagesRequested(aPage);

  {if not(FReportCompleted) and aPage.LastPage and aPage.Final and not(aPage.Calculation) then}
  if not(FReportCompleted) and aPage.LastPage then
    begin
      FReportCompleted := True;

      FAbsolutePageCount := aPage.AbsolutePageNo;
    end;

end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppPublisher.RequestPage }

procedure TppPublisher.RequestPage(aPageRequest: TppPageRequest);
begin

  if not(FFirstPageRequest) and not(FRequestingPages) and not(FGeneratingPages) then
    FFirstPageRequest := True;

  {indicate that all page requests have not been granted}
  FPageRequestsGranted := False;

  ResolvePageRequest(aPageRequest);

end; {procedure, RequestPage}

{------------------------------------------------------------------------------}
{ TppPublisher.ResolvePageRequest }

procedure TppPublisher.ResolvePageRequest(aPageRequest: TppPageRequest);
begin

  if (FFirstPageRequest) then
    begin
      FFirstPageRequest := False;

      FPageRequest.Assign(aPageRequest);
    end

  else if (FPageRequest.PageSetting <> psAll) then
    FPageRequest.AddPageRequest(aPageRequest);

end; {procedure, ResolvePageRequest}

{------------------------------------------------------------------------------}
{ TppPublisher.DoOnPageRequest }

procedure TppPublisher.DoOnPageRequest;
begin

  if FRequestingPages or FPageRequestsGranted then Exit;

  {if we have a page cache, return any pages found to device}
  FPageRequestsGranted := GetPagesFromCache;


  if FPageRequestsGranted then Exit;

  {generate more pages}
  if Assigned(FOnPageRequest) then FOnPageRequest(Self, FPageRequest);

end; {procedure, DoOnPageRequest}

{------------------------------------------------------------------------------}
{ TppPublisher.CheckPagesRequested }

procedure TppPublisher.CheckPagesRequested(aPage: TppPage);
begin
  FPageRequestsGranted := FPageRequest.AllPagesReceived(aPage);
end; {procedure, CheckPagesRequested}

{------------------------------------------------------------------------------}
{ TppPublisher.ClearPageRequests }

procedure TppPublisher.ClearPageRequests;
begin

  FFirstPageRequest := True;

  FPageRequest.Reset;

end; {procedure, ClearPageRequests}

{------------------------------------------------------------------------------}
{ TppPublisher.SetCachePages }

procedure TppPublisher.SetCachePages(Value: Boolean);
begin

  FCachePages := Value;

end; {procedure, SetCachePages}

{------------------------------------------------------------------------------}
{ TppPublisher.ClearPageCache}

procedure TppPublisher.ClearPageCache;
var
  liPage: Integer;
  liPages: Integer;
  lPage: TppPage;
begin

  liPages := FPageCache.Count;

  for liPage := 0 to (liPages - 1) do
    begin
      lPage := Pages[liPage];

      lPage.Free;
    end;

  FPageCache.Clear;

end; {procedure, ClearPageCache}

{------------------------------------------------------------------------------}
{ TppPublisher.AddPageToCache }

procedure TppPublisher.AddPageToCache(aPage: TppPage);
var
  lsPage: String;
  liIndex: Integer;
  lPage: TppPage;
begin
  if not(FCachePages) then Exit;

  if FReadingCache then Exit;

  if not(aPage.Final) then Exit;

  if aPage.Calculation then Exit;

  lsPage := Format('%8d',[aPage.AbsolutePageNo]);

  liIndex := FPageCache.IndexOf(lsPage);

  if liIndex <> -1 then
    FPageCache.Delete(liIndex);

  lPage := TppPage.Create(nil);

  lPage.Assign(aPage);

  {turn calculation switch off, this allows the page to be rendered as a real page when
   it is read from the cache.}
  lPage.Calculation := False;

  FPageCache.AddObject(lsPage, lPage);

  FPageCache.Sort;

  if (FPageCache.Count > 1) then
    UpdateCachedPages(aPage);

end; {procedure, AddPageToCache}

{------------------------------------------------------------------------------}
{ TppPublisher.UpdateCachedPages }

procedure TppPublisher.UpdateCachedPages(aPage: TppPage);
var
  liPage: Longint;
  liPages: Longint;
  lPage: TppPage;
begin

  liPages := FPageCache.Count;
  
  for liPage := 0 to liPages - 1 do
    begin

      lPage := TppPage(FPageCache.Objects[liPage]);

      {update current page}
      if (lPage.AbsolutePageCount < aPage.AbsolutePageCount) then
        begin
          lPage.AbsolutePageCount := aPage.AbsolutePageCount;

          if (lPage.ControlGroupBreakNo = aPage.ControlGroupBreakNo) and
             (lPage.PageCount < aPage.PageCount) then
            lPage.PageCount := aPage.PageCount;

          if lPage.HasUpdateables then
            lPage.Update(nil);

        end;

    end; {for, each page}

end; {procedure, UpdateCachedPages}

{------------------------------------------------------------------------------}
{ TppPublisher.GetPageFromCache }

function TppPublisher.GetPageFromCache(aPageNo: Longint): TppPage;
var
  liIndex: Integer;
  lsPage: String;
begin

  lsPage := Format('%8d',[aPageNo]);

  liIndex := FPageCache.IndexOf(lsPage);

  {return page object based on the position in the cache}
  if (liIndex <> -1) then
    Result := TppPage(FPageCache.Objects[liIndex])
  else
    Result := nil;

end; {function, GetPageFromCache}

{------------------------------------------------------------------------------}
{ TppPublisher.GetPagesFromCache }

function TppPublisher.GetPagesFromCache: Boolean;
var
  liPage: Integer;
  lsPage: String;
  lPage: TppPage;
begin

  Result := False;

  if not(FCachePages) then Exit;

  FReadingCache := True;

  case FPageRequest.PageSetting of
    psAll:
      begin

        if FReportCompleted then
          begin

            if (FPageCache.Count > 0) then
              begin
                lPage := GetPageFromCache(1);

                if (lPage.AbsolutePageCount <> FPageCache.Count) then
                  Result := False
                else
                  Result := True;
              end;

            if (Result) then
              for liPage := 1 to FPageCache.Count do
                begin
                  lPage := GetPageFromCache(liPage);

                  ReceivePage(lPage);
                end;

          end;

      end;

    psSinglePage:
      begin
        lPage := GetPageFromCache(FPageRequest.PageRequested);

        if (lPage <> nil) then
          begin
            ReceivePage(lPage);

            Result := True;
          end;

      end;

    psFirstPage:
      begin
        lPage := GetPageFromCache(1);

        if (lPage <> nil) then
          begin
            ReceivePage(lPage);

            Result := True;
          end;

      end;

    psLastPage:
      begin
        if FReportCompleted then
          begin
            lPage := GetPageFromCache(FAbsolutePageCount);

            if (lPage <> nil) then
              begin
                ReceivePage(lPage);

                Result := True;
              end;

          end;

      end;

    psPageList:
      begin

        for liPage := 0 to FPageRequest.PageList.Count - 1 do
          begin
            lsPage := FPageRequest.PageList[liPage];

            lPage := GetPageFromCache(StrToInt(lsPage));

            if (lPage <> nil) then
              begin
                ReceivePage(lPage);

                Result := True;
              end;

          end;

      end;

  end; {case, PageSetting}

  FReadingCache := False;

end; {procedure, GetPagesFromCache}

{------------------------------------------------------------------------------}
{ TppPublisher.AddDevice }

procedure TppPublisher.AddDevice(aDevice: TppDevice);
begin

  if not IsValidDevice(aDevice) then Exit;

  if aDevice.Stackable then
    AddStackableDevice(aDevice);

  FDevices.Add(aDevice);

  {add device to own notify list}
  AddNotify(aDevice);

end; {procedure, AddDevice}

{------------------------------------------------------------------------------}
{ TppPublisher.RemoveDevice }

procedure TppPublisher.RemoveDevice(aDevice: TppDevice);
begin

  {remove device from list}
  if (aDevice <> nil) and (FDevices.IndexOf(aDevice) <> -1) then
    FDevices.Remove(aDevice);

  {remove device from stackable list}
  if aDevice.Stackable then
    RemoveStackableDevice(aDevice);

  {remove device from own notify list}
  RemoveNotify(aDevice);

end; {procedure, RemoveDevice}

{------------------------------------------------------------------------------}
{ TppPublisher.AddStackableDevice }

procedure TppPublisher.AddStackableDevice(aDevice: TppDevice);
var
  liStack: Integer;
  lStack: TList;

begin

  {check whether a stack with the given name already exists}
  liStack := FStacks.IndexOf(aDevice.StackName);

  {get the stack or create a new one if needed}
  if liStack >= 0 then
    lStack := TList(FStacks.Objects[liStack])
  else
    begin
      lStack  := TList.Create;
      FStacks.AddObject(aDevice.StackName, lStack);
    end;

  {remove the device at the front of the stack from the active Device list}
  if lStack.Count > 0 then
    FDevices.Remove(TppDevice(lStack[0]));

  {add new device to the front of the stack}
  lStack.Insert(0, aDevice);

end; {procedure, AddStackableDevice}

{------------------------------------------------------------------------------}
{ TppPublisher.IsValidDevice }

function TppPublisher.IsValidDevice(aDevice: TppDevice): Boolean;
var
  lStack: TList;
  liStack: Integer;

begin

  Result := False;

  {check if device is already in Device list}
  if (aDevice = nil) and (FDevices.IndexOf(aDevice) >= 0) then Exit;

  {check if device is already in Stack list}
  for liStack := 0 to FStacks.Count-1  do
    begin
      lStack := TList(FStacks.Objects[liStack]);
      if lStack.IndexOf(aDevice) >= 0 then Exit;
    end;

  Result := True;

end; {procedure, IsValidDevice}

{------------------------------------------------------------------------------}
{ TppPublisher.GetDevice }

function TppPublisher.GetDevice(aIndex: Integer): TppDevice;
begin
  Result := TppDevice(FDevices[aIndex]);
end; {function, GetDevice}

{------------------------------------------------------------------------------}
{ TppPublisher.GetDeviceCount }

function  TppPublisher.GetDeviceCount: Integer;
begin
  Result := FDevices.Count;
end; {function, GetDeviceCount}

{------------------------------------------------------------------------------}
{ TppPublisher.GetPage }

function TppPublisher.GetPage(aIndex: Integer): TppPage;
begin
  Result := TppPage(FPageCache.Objects[aIndex]);
end; {function, GetPage}

{------------------------------------------------------------------------------}
{ TppPublisher.GetPageCount }

function  TppPublisher.GetPageCount: Integer;
begin
  Result := FPageCache.Count;
end; {function, GetPageCount}

{------------------------------------------------------------------------------}
{ TppPublisher.RemoveStackableDevice }

procedure TppPublisher.RemoveStackableDevice(aDevice: TppDevice);
var
  liStack: Integer;
  lStack: TList;

begin

  {find the stack}
  liStack := FStacks.IndexOf(aDevice.StackName);

  if liStack < 0 then Exit;

  lStack := TList(FStacks.Objects[liStack]);

  {remove device from stack and if this device in on top of stack then...}
  if (lStack.Remove(aDevice) = 0) then

    {add next device in stack to list of active devices}
    if (lStack.Count > 0) then
      FDevices.Add(lStack[0]);

end; {procedure, RemoveStackableDevice}


{******************************************************************************
 *
 ** D E V I C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDevice.Create }

constructor TppDevice.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FActive := True;
  FBusy := False;
  FCancelDialog := nil;
  FIsRequestedPage := False;
  FIsMessagePage := False;
  FLanguageIndex := 0;
  FOnSetPublisher := nil;
  FPageRequest := TppPageRequest.Create;
  FStackable := False;
  FStackName := '';
  FStatus :=  '';
  FPublisher := nil;
  FWaitingForPage := True;

  FOnCancelJob := nil;
  FOnEndJob := nil;
  FOnPageReceive := nil;
  FOnPageRequest := nil;
  FOnStartJob := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDevice.Destroy }

destructor TppDevice.Destroy;
begin

  FPageRequest.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDevice.SetPageRequest }

procedure TppDevice.SetPageRequest(aPageRequest: TppPageRequest);
begin
  FPageRequest.Assign(aPageRequest);
end; {function, SetPageRequest}

{------------------------------------------------------------------------------}
{ TppDevice.GetPageList }

function TppDevice.GetPageList: TStrings;
begin
  Result := FPageRequest.PageList;
end; {function, GetPageList}

{------------------------------------------------------------------------------}
{ TppDevice.GetPageRequested }

function TppDevice.GetPageRequested: Integer;
begin
  Result := FPageRequest.PageRequested;
end; {function, GetPageRequested}

{------------------------------------------------------------------------------}
{ TppDevice.GetPageSetting }

function TppDevice.GetPageSetting: TppPageSettingType;
begin
  Result := FPageRequest.PageSetting;
end; {function, GetPageSetting}

{------------------------------------------------------------------------------}
{ TppDevice.SetPageList }

procedure TppDevice.SetPageList(aPageList: TStrings);
begin
  FPageRequest.PageList := aPageList;
end; {procedure, SetPageList}

{------------------------------------------------------------------------------}
{ TppDevice.SetPageRequested }

procedure TppDevice.SetPageRequested(Value: Integer);
begin
  FPageRequest.PageRequested := Value;
end; {procedure, SetPageRequested}

{------------------------------------------------------------------------------}
{ TppDevice.SetPageSetting }

procedure TppDevice.SetPageSetting(aPageSetting: TppPageSettingType);
begin
  FPageRequest.PageSetting := aPageSetting;
end; {procedure, SetPageSetting}

{------------------------------------------------------------------------------}
{ TppDevice.DeviceName }

class function TppDevice.DeviceName: String;
begin
  Result := ClassName;
end; {class function, DeviceName}

{------------------------------------------------------------------------------}
{ TppDevice.SetStatus }

procedure TppDevice.SetStatus(const aValue: String);
begin
  FStatus := aValue;
end; {procedure, SetStatus}

{------------------------------------------------------------------------------}
{ TppDevice.SetActive }

procedure TppDevice.SetActive(aValue: Boolean);
begin
  if FBusy then Exit;

  FActive := aValue;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TppDevice.Reset }

procedure TppDevice.Reset;
begin
  FPageRequest.Reset;

  FWaitingForPage := True;
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppDevice.SetPublisher}

procedure TppDevice.SetPublisher(aPublisher: TppPublisher);
begin
  if (FPublisher <> nil) then
    FPublisher.RemoveDevice(Self);

  FPublisher := aPublisher;

  if (FPublisher <> nil) then
    FPublisher.AddDevice(Self);

  DoOnSetPublisher;
end; {procedure, SetPublisher}

{------------------------------------------------------------------------------}
{ TppDevice.Notify}

procedure TppDevice.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aCommunicator = FPublisher) and (aOperation = ppopRemove) then
    begin
      FPublisher := nil;

      DoOnSetPublisher;
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDevice.DoOnSetPublisher }

procedure TppDevice.DoOnSetPublisher;
begin
  if Assigned(FOnSetPublisher) then FOnSetPublisher(Self);
end; {procedure, DoOnSetPublisher}

{------------------------------------------------------------------------------}
{ TppDevice.FinalPagesOnly }

function TppDevice.FinalPagesOnly: Boolean;
begin
  Result := True;
end; {function, FinalPagesOnly}

{------------------------------------------------------------------------------}
{ TppDevice.DrawUpdateable}

function TppDevice.DrawUpdateable(aDrawCommand: TppDrawCommand): Boolean;
begin
  Result := False;
end; {function, DrawUpdateable}

{------------------------------------------------------------------------------}
{ TppDevice.Draw}

function TppDevice.Draw(aDrawCommand: TppDrawCommand): Boolean;
begin
  Result := False;
end; {function, Draw}

{------------------------------------------------------------------------------}
{ TppDevice.DrawPage}

procedure TppDevice.DrawPage(aPage: TppPage);
var
  liCommand: Integer;
  liCommands: Integer;
  lDrawCommand: TppDrawCommand;

begin

  {loop through objects, drawing each one on the canvas}
  liCommand  := 0;
  liCommands := aPage.DrawCommandCount;

  while (liCommand <= liCommands - 1) do
    begin
      lDrawCommand := aPage.DrawCommands[liCommand];

      if (lDrawCommand.Left <= aPage.PageDef.mmWidth)  and
         (lDrawCommand.Top  <= aPage.PageDef.mmHeight) then

          lDrawCommand.Draw(Self);

      Inc(liCommand);
    end; {while, each print object}

end; {procedure, DrawPage}

{------------------------------------------------------------------------------}
{ TppDevice.DoOnPageRequest }

procedure TppDevice.DoOnPageRequest;
begin
  if Assigned(FOnPageRequest) then FOnPageRequest(Self);
end; {procedure, DoOnPageRequest}

{------------------------------------------------------------------------------}
{ TppDevice.StartJob }

procedure TppDevice.StartJob;
begin
  FBusy := True;

  if Assigned(FOnStartJob) then FOnStartJob(Self);
end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppDevice.EndJob }

procedure TppDevice.EndJob;
begin
  FBusy := False;

  FWaitingForPage := True;

  if Assigned(FOnEndJob) then FOnEndJob(Self);
end; {procedure, EndJob}

{------------------------------------------------------------------------------}
{ TppDevice.CancelJob }

procedure TppDevice.CancelJob;
begin
  FBusy := False;

  if Assigned(FOnCancelJob) then FOnCancelJob(Self);
end; {procedure, CancelJob}

{------------------------------------------------------------------------------}
{ TppDevice.MakePageRequest }

procedure TppDevice.MakePageRequest;
begin
  if (FPublisher = nil) then Exit;

  FWaitingForPage := True;

  FPublisher.Publish;
end; {procedure, MakePageRequest}

{------------------------------------------------------------------------------}
{ TppDevice.ReceivePage }

procedure TppDevice.ReceivePage(aPage: TppPage);
begin

  FIsMessagePage := False;

  FIsRequestedPage := FPageRequest.IsRequestedPage(aPage);

  {if calculation, page doesn't count}
  if aPage.Calculation then
    FIsMessagePage := True;

  {if device wants finals only, page doesn't count}
  if not(aPage.Final) and (FinalPagesOnly) then
    FIsMessagePage := True;

  {trigger the event}
  if Assigned(FOnPageReceive) then FOnPageReceive(Self, aPage);

  CheckPagesRequested(aPage);
  
end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppDevice.CheckPagesRequested }

procedure TppDevice.CheckPagesRequested(aPage: TppPage);
begin

  if not(FWaitingForPage) then Exit;
  
  if not(aPage.Final) then Exit;

  if aPage.Calculation then Exit;

  FWaitingForPage := not(FPageRequest.AllPagesReceived(aPage));

end; {procedure, CheckPagesRequested}

{------------------------------------------------------------------------------}
{ TppDevice.SetStackable }

procedure TppDevice.SetStackable(Value: Boolean);
begin

  {do not assign this property if device is already registered with a publisher }
  if (FPublisher = nil) and not(FBusy) then
    FStackable := Value;

end; {procedure, SetStackable}

{------------------------------------------------------------------------------}
{ TppDevice.SetStackName }

procedure TppDevice.SetStackName(aName: String);
begin
  {do not assign this property if device is already registered with a publisher }
  if (FPublisher = nil) and not(FBusy) then
    FStackName := aName;

end; {procedure, SetStackName}

{******************************************************************************
 *
 ** P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPage.Create }

constructor TppPage.Create(aOwner: TComponent);

begin
  inherited Create(aOwner);

  FAbsolutePageNo := 0;
  FAbsolutePageCount := 0;
  FCalculation := False;
  FClickables := nil;
  FControlGroupBreakNo := 0;
  FDocumentName := '';
  FDrawCommands := TList.Create;
  FFinal := False;
  FLanguageIndex := 0;
  FLastPage := False;
  FPageCount := 0;
  FPageNo := 0;
  FPrinterSetup := TppPrinterSetup.Create(nil);
  FUpdateables := nil;

end; {constructor, TppPage}

{------------------------------------------------------------------------------}
{ TppPage.Destroy }

destructor TppPage.Destroy;
begin
  FreeDrawCommands;

  FClickables.Free;
  FDrawCommands.Free;
  FUpdateables.Free;

  FPrinterSetup.Free;

  inherited Destroy;

end; {destructor, TppPage}

{------------------------------------------------------------------------------}
{ TppPage.Assign }

procedure TppPage.Assign(Source: TPersistent);
var
  liCommands: Integer;
  liCommand: Integer;
  lPage: TppPage;
  lClass: TppDrawCommandClass;
  lSourceDrawCommand: TppDrawCommand;
  lTargetDrawCommand: TppDrawCommand;
begin

  if not(Source is TppPage) then
    inherited Assign(Source);

  lPage := TppPage(Source);

  FAbsolutePageNo      := lPage.AbsolutePageNo;
  FAbsolutePageCount   := lPage.AbsolutePageCount;
  FCalculation         := lPage.Calculation;
  FControlGroupBreakNo := lPage.ControlGroupBreakNo;
  FDocumentName        := lPage.DocumentName;
  FFinal               := lPage.Final;
  FFirstPage           := lPage.FirstPage;
  FLanguageIndex       := lPage.LanguageIndex;
  FLastPage            := lPage.LastPage;
  FPassSetting         := lPage.PassSetting;
  FPageCount           := lPage.PageCount;
  FPageNo              := lPage.PageNo;
  FPrintDateTime       := lPage.PrintDateTime;

  FPrinterSetup.Assign(lPage.PrinterSetup);

  {copy draw commands}
  FreeDrawCommands;

  liCommands := lPage.DrawCommandCount;

  for liCommand := 0 to liCommands - 1 do
    begin
      lSourceDrawCommand := lPage.DrawCommands[liCommand];

      {get an instance of the class}
      lClass := TppDrawCommandClass(GetClass(lSourceDrawCommand.ClassName));

      {instantiate a data view of the selected type}
      if (lClass <> nil) then
        begin
          lTargetDrawCommand := TppDrawCommand(lClass.Create(Self));
          lTargetDrawCommand.Assign(lSourceDrawCommand);
          lTargetDrawCommand.Page := Self;
        end;

    end; {each draw command}

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppPage.Clear}

procedure TppPage.Clear;
begin

  FreeDrawCommands;

  FAbsolutePageNo := 0;
  FAbsolutePageCount := 0;
  FCalculation := False;
  FControlGroupBreakNo := 0;
  FDocumentName := '';
  FFinal := False;
  FLanguageIndex := 0;
  FLastPage := False;
  FPageCount := 0;
  FPageNo := 0;
  
end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppPage.GetPageSetDescription}

function TppPage.GetPageSetDescription: String;
begin
  {'Page 1 of 10'}
  Result := ppLoadStr(18) + ' ' + IntToStr(FAbsolutePageNo) + ' ' + ppLoadStr(16) + ' ' + IntToStr(FAbsolutePageCount);
end; {function, GetPageSetDescription}

{------------------------------------------------------------------------------}
{ TppPage.GetPageNoDescription}

function TppPage.GetPageNoDescription: String;
begin
  {'Page 1'}
  Result := ppLoadStr(18) + ' ' + IntToStr(FAbsolutePageNo);
end; {function, GetPageNoDescription}

{------------------------------------------------------------------------------}
{ TppPage.SetPrinterSetup}

procedure TppPage.SetPrinterSetup(aPrinterSetup: TppPrinterSetup);
begin

  if (aPrinterSetup <> nil) then
    FPrinterSetup.Assign(aPrinterSetup);

end; {procedure, SetPrinterSetup}

{------------------------------------------------------------------------------}
{ TppPage.FreeDrawCommands }

procedure TppPage.FreeDrawCommands;
var
  liDrawCommand: Integer;
  lDrawCommand: TppDrawCommand;
begin

  for liDrawCommand := 0 to (FDrawCommands.Count - 1) do
    begin
      lDrawCommand := DrawCommands[liDrawCommand];

      lDrawCommand.Free;
    end;

  FDrawCommands.Clear;

  if (FUpdateables <> nil) then
    FUpdateables.Clear;

  if (FClickables <> nil) then
    FClickables.Clear;

end; {procedure, FreeDrawCommands}

{------------------------------------------------------------------------------}
{ TppPage.GetDrawCommand }

function TppPage.GetDrawCommand(aIndex: Integer): TppDrawCommand;
begin
  Result := TppDrawCommand(FDrawCommands[aIndex]);
end; {procedure, GetDrawCommand}

{------------------------------------------------------------------------------}
{ TppPage.GetDrawCommandCount }

function TppPage.GetDrawCommandCount: Integer;
begin
  Result := FDrawCommands.Count;
end; {procedure, GetDrawCommandCount}

{------------------------------------------------------------------------------}
{ TppPage.GetClickable }

function TppPage.GetClickable(aIndex: Integer): TppDrawCommand;
begin
  if (FClickables <> nil) then
    Result := TppDrawCommand(FClickables[aIndex])
  else
    Result := nil;
end; {procedure, GetClickable}

{------------------------------------------------------------------------------}
{ TppPage.GetClickableCount }

function TppPage.GetClickableCount: Integer;
begin
  if (FClickables <> nil) then
    Result := FClickables.Count
  else
    Result := 0;
end; {procedure, GetClickableCount}

{------------------------------------------------------------------------------}
{ TppPage.GetPageDef }

function TppPage.GetPageDef: TppPageDef;
begin
  Result := FPrinterSetup.PageDef;
end; {procedure, GetPageDef}

{------------------------------------------------------------------------------}
{ TppPage.AddDrawCommand }

procedure TppPage.AddDrawCommand(aDrawCommand: TppDrawCommand);
begin
  FDrawCommands.Add(aDrawCommand);

  if aDrawCommand.IsUpdateable then
    AddUpdateable(aDrawCommand);

  if aDrawCommand.IsClickable then
    AddClickable(aDrawCommand);

  if aDrawCommand.Owner <> Self then
    InsertComponent(aDrawCommand);

end; {procedure, AddDrawCommand}

{------------------------------------------------------------------------------}
{ TppPage.RemoveDrawCommand }

procedure TppPage.RemoveDrawCommand(aDrawCommand: TppDrawCommand);
begin

  FDrawCommands.Remove(aDrawCommand);

  if aDrawCommand.IsClickable then
    RemoveClickable(aDrawCommand);
    
  if aDrawCommand.IsUpdateable then
    RemoveUpdateable(aDrawCommand);

  RemoveComponent(aDrawCommand);

end; {procedure, RemoveDrawCommand}

{------------------------------------------------------------------------------}
{ TppPage.AddUpdateable }

procedure TppPage.AddUpdateable(aDrawCommand: TppDrawCommand);
begin
  if (FUpdateables = nil) then
    FUpdateables := TList.Create;

  FUpdateables.Add(aDrawCommand);

end; {procedure, AddUpdateables}

{------------------------------------------------------------------------------}
{ TppPage.RemoveUpdateable }

procedure TppPage.RemoveUpdateable(aDrawCommand: TppDrawCommand);
begin

  FUpdateables.Remove(aDrawCommand);

  if (FUpdateables.Count = 0) then
    begin
      FUpdateables.Free;

      FUpdateables := nil;
    end;

end; {procedure, RemoveUpdateable}

{------------------------------------------------------------------------------}
{ TppPage.AddClickable }

procedure TppPage.AddClickable(aDrawCommand: TppDrawCommand);
begin
  if (FClickables = nil) then
    FClickables := TList.Create;

  FClickables.Add(aDrawCommand);

  {this property tracks the clickable state when archiving}
  aDrawCommand.Clickable := True;

end; {procedure, AddClickables}

{------------------------------------------------------------------------------}
{ TppPage.RemoveClickable }

procedure TppPage.RemoveClickable(aDrawCommand: TppDrawCommand);
begin

  FClickables.Remove(aDrawCommand);

  if (FClickables.Count = 0) then
    begin
      FClickables.Free;

      FClickables := nil;
    end;

end; {procedure, RemoveClickable}

{------------------------------------------------------------------------------}
{ TppPage.HasClickables }

function TppPage.HasClickables: Boolean;
begin
  Result := (FClickables <> nil);
end; {procedure, HasClickables}

{------------------------------------------------------------------------------}
{ TppPage.HasUpdateables }

function TppPage.HasUpdateables: Boolean;
begin
  Result := (FUpdateables <> nil);
end; {procedure, HasUpdateables}

{------------------------------------------------------------------------------}
{ TppPage.Update }

procedure TppPage.Update(aDevice: TppDevice);
var
  liDrawCommand: Integer;
  liDrawCommands: Integer;
  lDrawCommand: TppDrawCommand;
  lbDataChanged: Boolean;
begin

  if not(HasUpdateables) then Exit;
  
  liDrawCommands := FUpdateables.Count;

  for liDrawCommand := 0 to (liDrawCommands - 1) do
    begin
      lDrawCommand := TppDrawCommand(FUpdateables[liDrawCommand]);

      lbDataChanged := lDrawCommand.Update;

      if (aDevice <> nil) and lbDataChanged then
        aDevice.DrawUpdateable(lDrawCommand);
    end;

end; {procedure, Update}



{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppPage.GetChildren - write drawcommands as subcomponents to .DFM }

{$IFDEF Delphi3}
   procedure TppPage.GetChildren(Proc: TGetChildProc;Root: TComponent);
{$ELSE}
   procedure TppPage.GetChildren(Proc: TGetChildProc);
{$ENDIF}

var
  liDrawCommand: Integer;

begin

  {write draw commands }
  for liDrawCommand := 0 to (FDrawCommands.Count - 1) do
    Proc(DrawCommands[liDrawCommand]);

end;

{$ELSE}

{------------------------------------------------------------------------------}
{ TppPage.WriteComponents - write report bands as subcomponents to .DFM }

procedure TppPage.WriteComponents(Writer: TWriter);
var
  liDrawCommand: Integer;

begin

  {write non-group bands: Header, Title, Detail, Summary, Footer }
  for liDrawCommand := 0 to (FDrawCommands.Count - 1) do
    Writer.WriteComponent(DrawCommands[liDrawCommand]);

end; {procedure, WriteComponents}


{$ENDIF}

{******************************************************************************
 *
 ** D R A W   C O M M A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawCommand.Create }

constructor TppDrawCommand.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FBand := nil;
  FClickable := False;
  FDataType := dtString;
  FDrawLeft := 0;
  FDrawRight := 0;
  FDrawTop := 0;
  FDrawBottom := 0;
  FExpansionKey := '';
  FLeft := 0;
  FHeight := 0;
  FOnClick := nil;
  FPage := nil;
  FRedrawPage := False;
  FTop := 0;
  FWidth := 0;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawCommand.Destroy }

destructor TppDrawCommand.Destroy;
begin
  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawCommand.SetPage }

procedure TppDrawCommand.SetPage(aPage: TppPage);
begin
  if (FPage <> nil) then
    FPage.RemoveDrawCommand(Self);

  FPage := aPage;

  if (FPage <> nil) then
    FPage.AddDrawCommand(Self);


end; {procedure, SetPage}

{------------------------------------------------------------------------------}
{ TppDrawCommand.DoOnClick }

procedure TppDrawCommand.DoOnClick;
begin
  if Assigned(FOnClick) then FOnClick(Self);
end; {function, DoOnClick}

{------------------------------------------------------------------------------}
{ TppDrawCommand.IsClickable }

function TppDrawCommand.IsClickable: Boolean;
begin
  Result := Assigned(FOnClick);
end; {function, IsClickable}

{------------------------------------------------------------------------------}
{ TppDrawCommand.IsUpdateable }

function TppDrawCommand.IsUpdateable;
begin
  Result := False;
end; {function, IsUpdateable}

{------------------------------------------------------------------------------}
{ TppDrawCommand.Assign }

procedure TppDrawCommand.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawCommand;
begin

  if not(Source is TppDrawCommand) then
    inherited Assign(Source);

  lDrawCommand := TppDrawCommand(Source);

  FBand := lDrawCommand.Band;
  FDataType := lDrawCommand.DataType;
  FDrawLeft := lDrawCommand.DrawLeft;
  FDrawRight := lDrawCommand.DrawRight;
  FDrawTop := lDrawCommand.DrawTop;
  FDrawBottom := lDrawCommand.DrawBottom;
  FExpansionKey := lDrawCommand.ExpansionKey;
  FHeight := lDrawCommand.Height;
  FLeft := lDrawCommand.Left;
  FOnClick := lDrawCommand.OnClick;
  Tag := lDrawCommand.Tag;
  FTop := lDrawCommand.Top;
  FWidth := lDrawCommand.Width;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawCommand.Draw }

function TppDrawCommand.Draw(aDevice: TppDevice): Boolean;
begin
  Result := aDevice.Draw(Self);
end; {procedure, Draw}

{------------------------------------------------------------------------------}
{ TppDrawCommand.Update }

function TppDrawCommand.Update: Boolean;
begin
  Result := False;
end; {procedure, Update}

{------------------------------------------------------------------------------}
{ TppDrawCommand.GetDrawRect }

function TppDrawCommand.GetDrawRect: TRect;
begin
  Result := Rect(FDrawLeft, FDrawTop, FDrawRight, FDrawBottom);
end; {procedure, GetDrawRect}


{------------------------------------------------------------------------------}
{ TppDrawCommand.HasParent }

function TppDrawCommand.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}



{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppDrawCommand.GetParentComponent - required method for Components with HasParent = True }

function TppDrawCommand.GetParentComponent: TComponent;
begin
  Result := FPage;

end;

{------------------------------------------------------------------------------}
{ TppDrawCommand.SetParentComponent - required method for Components with HasParent = True }

procedure TppDrawCommand.SetParentComponent(Value: TComponent);
begin

  if (Value is TppPage) then
    SetPage(TppPage(Value));

end;


{$ELSE}

{------------------------------------------------------------------------------}
{ TppDrawCommand.ReadState }

procedure TppDrawCommand.ReadState(Reader: TReader);
begin

  if (Reader.Parent is TppPage) then
     SetPage(TppPage(Reader.Parent));


  inherited ReadState(Reader);

end;


{$ENDIF}


{******************************************************************************
 *
 ** R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppGetDeviceClassList }

function ppGetDeviceClassList: TList;
begin

  if FDeviceClassList = nil then
    FDeviceClassList := TList.Create;

  Result := FDeviceClassList;

end; {function, ppGetDeviceClassList}

{------------------------------------------------------------------------------}
{ ppDeviceClassForName }

function ppDeviceClassForName(const aDeviceName: String): TppDeviceClass;
var
  lList: TStringList;
  liPosition: Integer;
begin

  lList := TStringList.Create;

  ppGetDeviceClasses(lList);

  liPosition := lList.IndexOf(aDeviceName);

  if (liPosition <> -1) then
    Result := TppDeviceClass(lList.Objects[liPosition])
  else
    Result := nil;

  lList.Free;

end; {function, ppDeviceClassForName}

{------------------------------------------------------------------------------}
{ ppGetDeviceClasses }

procedure ppGetDeviceClasses(aList: TStrings);
var
  lClassList: TList;
  liIndex: Integer;
  lClass: TppDeviceClass;
begin

  lClassList := ppGetDeviceClassList;

  for liIndex := 0 to lClassList.Count - 1 do
    begin
      lClass := TppDeviceClass(lClassList[liIndex]);

      aList.AddObject(lClass.DeviceName, TObject(lClass));
    end;

end; {procedure, GetDeviceClasses}

{------------------------------------------------------------------------------}
{ ppRegisterDevice }

procedure ppRegisterDevice(aDeviceClass: TppDeviceClass);
var
  lClassList: TList;
  liIndex: Integer;
begin

  if (aDeviceClass = nil) then Exit;

  lClassList := ppGetDeviceClassList;

  liIndex :=  lClassList.IndexOf(aDeviceClass);

  if (liIndex = -1) then
    begin
      RegisterClass(aDeviceClass);

      lClassList.Add(aDeviceClass);
    end;

end; {procedure, ppRegisterDevice}

{------------------------------------------------------------------------------}
{ ppUnRegisterDevice }

procedure ppUnRegisterDevice(aDeviceClass: TppDeviceClass);
var
  lClassList: TList;
  liIndex: Integer;
begin

  if (aDeviceClass = nil) then Exit;

  UnRegisterClass(aDeviceClass);

  if (FDeviceClassList = nil) then Exit;

  lClassList := ppGetDeviceClassList;

  liIndex := lClassList.IndexOf(aDeviceClass);

  if (liIndex > 0) then
    lClassList.Delete(liIndex);

end; {procedure, ppUnRegisterDevice}

{******************************************************************************
 *
 ** P A G E   R E Q U E S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPageRequest.Create }

constructor TppPageRequest.Create;
begin

  inherited Create;

  FPageList := TStringList.Create;
  FPageRange := prAll;
  FPageRequested := 1;
  FPageSetting := psAll;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPageRequest.Destroy }

destructor TppPageRequest.Destroy;
begin

  FPageList.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPageRequest.Assign }

procedure TppPageRequest.Assign(Source: TPersistent);
var
  lSource: TppPageRequest;
begin

  if not(Source is TppPageRequest) then Exit;

  lSource := TppPageRequest(Source);

  FPageList.Assign(lSource.PageList);
  FPageRequested := lSource.PageRequested;
  FPageSetting := lSource.PageSetting;
  FPageRange := lSource.PageRange;
  
end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppPageRequest.Reset }

procedure TppPageRequest.Reset;
begin
  FPageList.Clear;
  FPageRange := prAll;
  FPageRequested := 1;
  FPageSetting := psAll;
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppPageRequest.SetPageList }

procedure TppPageRequest.SetPageList(aPageList: TStrings);
begin
  FPageList.Assign(aPageList);
end; {procedure, SetPageList}

{------------------------------------------------------------------------------}
{ TppPageRequest.IsRequestedPage }

function TppPageRequest.IsRequestedPage(aPage: TppPage): Boolean;
begin

  Result := False;

  case FPageSetting of

    psAll:
      Result := True;

    psPageList:
      Result := FPageList.IndexOf(IntToStr(aPage.AbsolutePageNo)) >= 0;

    psSinglePage:
      begin
        if (FPageRequested > aPage.AbsolutePageCount) and (aPage.LastPage) then
          FPageRequested := aPage.AbsolutePageCount

        else if (FPageRequested < 1) and (aPage.AbsolutePageNo = 1) then
          FPageRequested := 1;

        Result := (aPage.AbsolutePageNo = FPageRequested);
      end;

    psFirstPage:
      Result := aPage.FirstPage;

    psLastPage:
      Result := aPage.LastPage;

  end; {case, page setting type}

  case FPageRange of

    prAll:
      begin
        {do nothing}
      end;

    prOddPages:
      Result := ((aPage.AbsolutePageNo mod 2) <> 0);

    prEvenPages:
      Result := ((aPage.AbsolutePageNo mod 2) = 0);

  end;

end; {procedure, IsRequestedPage}

{------------------------------------------------------------------------------}
{ TppPageRequest.AllPagesReceived }

function TppPageRequest.AllPagesReceived(aPage: TppPage): Boolean;
var
  lsPage: String;
  liIndex: Integer;
begin

  Result := False;

  lsPage := Format('%8d',[aPage.AbsolutePageNo]);

  {check to see if all page requests have been granted}
  case FPageSetting of
    psAll:
      if aPage.LastPage then
        Result := True;

    psFirstPage:
      if (aPage.FirstPage) then
        Result := True;

    psSinglePage:
      if (aPage.AbsolutePageNo = FPageRequested) then
        Result := True;

    psLastPage:
      if aPage.LastPage then
        Result := True;

    psPageList:
      begin
        liIndex := FPageList.IndexOf(lsPage);

        if liIndex <> -1 then
          FPageList.Delete(liIndex);

        if (FPageList.Count = 0) then
          Result := True;
      end;

  end; {case, page setting type}

end; {procedure, AllPagesReceived}

{------------------------------------------------------------------------------}
{ TppPageRequest.AddPageRequest }

procedure TppPageRequest.AddPageRequest(aPageRequest: TppPageRequest);
begin

  case aPageRequest.PageSetting of

    psSinglePage, psFirstPage:
      begin

        if ((FPageSetting = psSinglePage) and (FPageRequested <> aPageRequest.PageRequested)) or
           ((FPageSetting = psFirstPage) and (aPageRequest.PageRequested <> 1)) then
          begin
            FPageSetting := psPageList;

            if (FPageList = nil) then
              FPageList := TStringList.Create;

            FPageList.Add(IntToStr(FPageRequested));
            FPageList.Add(IntToStr(aPageRequest.PageRequested));
          end

        else if (FPageSetting = psPageList) and (FPageList.IndexOf(IntToStr(aPageRequest.PageRequested)) = -1) then
          FPageList.Add(IntToStr(aPageRequest.PageRequested));

      end;

    else
      begin
        FPageSetting := psAll;
      end; {single page not requested}

  end; {case, page requested}

end; {procedure, AddPageRequest}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FDeviceClassList.Free;
  FDeviceClassList := nil;

end.
