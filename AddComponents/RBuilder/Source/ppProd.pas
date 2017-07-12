{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppProd;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Controls, Graphics, Forms, Dialogs, ExtCtrls,
  ppRelatv, ppComm, ppTypes, ppUtils, ppForms, ppDevice, ppFilDev, ppPrnDev,
  ppPrintr, ppRTTI;

type

  { TppProducer }
  TppProducer = class(TppRelative)
    private
      FAllowPrintToArchive: Boolean;
      FAllowPrintToFile: Boolean;
      FArchiveFileName: String;
      FBeforePrintTriggered: Boolean;
      FCancelDialog: TppCustomCancelDialog;
      FConverted: Boolean;
      FCurrentPage: Longint;
      FDeviceType: String;
      FEnableProcessMessages: Boolean;
      FFileDevice: TppFileDevice; {used for both text files & archiving}
      FIcon: TIcon;
      FInitialized: Boolean;
      FLanguage: TppLanguageType;
      FLanguageIndex: Longint;
      FModalCancelDialog: Boolean;
      FModalPreview: Boolean;
      FPreviewForm: TppCustomPreviewer;
      FPrintCancelled: Boolean;
      FPrinterDevice: TppPrinterDevice;
      FPrinterSetup: TppPrinterSetup;
      FPrintDialog: TppCustomPrintDialog;
      FPrinting: Boolean;
      FProducing: Boolean;
      FPublisher: TppPublisher;
      FSavePrinterSetup: Boolean;
      FShowAutoSearchDialog: Boolean;
      FShowCancelDialog: Boolean;
      FShowPrintDialog: Boolean;
      FTextFileName: String;
      FTextFileType: TppFileType;
      FVersion: String;
      FVersionNo: Integer;

      {retained for backward compatibility}
      FDevice: TppDeviceType;

      {events}
      FAfterPrint: TNotifyEvent;
      FBeforePrint: TNotifyEvent;
      FOnCancel: TNotifyEvent;
      FOnCancelDialogCreate: TNotifyEvent;
      FOnCancelDialogClose: TNotifyEvent;
      FOnPageRequest: TppPageRequestEvent;
      FOnPreviewFormCreate: TNotifyEvent;
      FOnPreviewFormClose: TNotifyEvent;
      FOnPrintDialogCreate: TNotifyEvent;
      FOnPrintDialogClose: TNotifyEvent;
      FOnSaveText: TppSaveTextEvent;
      FOnPrintingComplete: TNotifyEvent;

      {used to convert pre 4.0 reports during a print run}
      FConvertedFromPre40: Boolean;
      FWaitForTimer: Boolean;
      FTimer: TTimer;

      procedure ConvertedFromPre40TimerEvent(Sender: TObject);
      procedure ConvertedFromPre40Print(aPrintToDevices: Boolean);

      {property handling routines}
      procedure SetAllowPrintToArchive(Value: Boolean);
      procedure SetAllowPrintToFile(Value: Boolean);
      procedure SetArchiveFileName(aFileName: String);
      procedure SetIcon(aIcon: TIcon);
      procedure SetLanguage(aLanguageType: TppLanguageType);
      procedure SetModalCancelDialog(Value: Boolean);
      procedure SetModalPreview(Value: Boolean);
      procedure SetPrinterSetup(aPrinterSetup: TppPrinterSetup);
      procedure SetShowCancelDialog(Value: Boolean);
      procedure SetShowPrintDialog(Value: Boolean);
      procedure SetTextFileType(aFileType: TppFileType);
      procedure SetTextFileName(aFileName: String);

      {production related}
      function  CreateCancelDialog: TppCustomCancelDialog;
      function  CreatePreviewForm: TppCustomPreviewer;
      function  CreatePrintDialog: TppCustomPrintDialog;
      procedure PrintToPrinter;
      procedure PrintToScreen;

      {form event handlers}
      procedure CancelDialogActivateEvent(Sender: TObject);
      procedure CancelDialogCancelEvent(Sender: TObject);
      procedure CancelDialogCloseEvent(Sender: TObject);
      procedure CancelDialogDestroyEvent(Sender: TObject);
      procedure PreviewFormActivateEvent(Sender: TObject);
      procedure PreviewFormCloseEvent(Sender: TObject);
      procedure PreviewFormDestroyEvent(Sender: TObject);
      procedure PrintDialogCloseEvent(Sender: TObject);
      procedure TextDeviceSaveEvent(aTextDevice: TObject; aComponent: TObject; var Text: String); virtual;

      {printer setup handlers}
      function  GetPrinter: TppPrinter;
      procedure PrinterSetupGetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);

      {support version property}
      procedure ReadVersion(Reader: TReader);
      procedure WriteVersion(Writer: TWriter);

      {eat the old device property}
      procedure ReadDevice(Reader: TReader);

    protected

      class function AppearsOnDelphiPalette: Boolean; override;

      {supports 'fake' version property}
      procedure DefineProperties(Filer: TFiler); override;

      procedure SetEnableProcessMessages(aValue: Boolean);  virtual;

      {event triggers}
      procedure DoAfterPrint; virtual;
      procedure DoBeforePrint; virtual;
      procedure DoOnCancel; virtual;
      procedure DoOnCancelDialogCreate; virtual;
      procedure DoOnCancelDialogClose; virtual;
      procedure DeviceCreated(aDevice: TppDevice); virtual;
      procedure DoOnPageRequest(Sender: TObject; aPageRequest: TObject); virtual;
      procedure DoOnPreviewFormCreate; virtual;
      procedure DoOnPreviewFormClose; virtual;
      procedure DoOnPrintDialogCreate; virtual;
      procedure DoOnPrintDialogClose; virtual;
      procedure DoOnPrintingComplete; virtual;
      procedure DoOnSaveText(aTextDevice: TppTextFileDevice; var aText: String); virtual;
      function  FireAfterPrint: Boolean; virtual;
      procedure LanguageChanged; virtual;
      procedure PrinterSetupChanged; virtual;
      procedure SetDevice(aDevice: TppDeviceType); virtual;
      procedure SetDeviceType(const aDeviceName: String); virtual;

      {printer setup handlers}
      procedure PrinterSetupChangeQueryEvent(Sender: TObject; aNewPageDef: TObject; var CanChange: Boolean); virtual;
      procedure PrinterSetupPageDefChangeEvent(Sender: TObject); virtual;
      procedure PrinterSetupPrintJobChangeEvent(Sender: TObject); virtual;

      {event properties}
      property AfterPrint: TNotifyEvent read FAfterPrint write FAfterPrint;
      property BeforePrint: TNotifyEvent read FBeforePrint write FBeforePrint;
      property OnCancel: TNotifyEvent read FOnCancel write FOnCancel;
      property OnCancelDialogClose: TNotifyEvent read FOnCancelDialogClose write FOnCancelDialogClose;
      property OnCancelDialogCreate: TNotifyEvent read FOnCancelDialogCreate write FOnCancelDialogCreate;
      property OnPageRequest: TppPageRequestEvent read FOnPageRequest write FOnPageRequest;
      property OnPreviewFormClose: TNotifyEvent read FOnPreviewFormClose write FOnPreviewFormClose;
      property OnPreviewFormCreate: TNotifyEvent read FOnPreviewFormCreate write FOnPreviewFormCreate;
      property OnPrintDialogClose: TNotifyEvent read FOnPrintDialogClose write FOnPrintDialogClose;
      property OnPrintDialogCreate: TNotifyEvent read FOnPrintDialogCreate write FOnPrintDialogCreate;
      property OnPrintingComplete: TNotifyEvent read FOnPrintingComplete write FOnPrintingComplete;
      property OnSaveText: TppSaveTextEvent read FOnSaveText write FOnSaveText;

    public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Loaded; override; {contains temporary conversion routine}

      procedure Cancel; virtual;
      procedure Convert(aVersionNo: Integer); virtual;
      function  DeviceClass: TppDeviceClass;
      function  DisplayAutoSearchDialog: Boolean; virtual;
      procedure Print; virtual;
      procedure PrintToDevices; virtual;
      procedure ProcessMessages;
      procedure RequestPage(Sender: TObject; aPageRequest: TObject); virtual;
      procedure RaiseException(aException: Exception); virtual;
      procedure Reset; virtual;
      procedure ResetDevices;
      procedure Transfer(aSource: TppCommunicator); override;
      procedure TriggerCodeModuleAfterPrint;
      procedure TriggerCodeModuleBeforePrint;
      procedure TriggerCodeModuleCreate; virtual;
      procedure TriggerCodeModuleDestroy; virtual;

      {used for conversion to 3.1}
      procedure AssignOnSave(aOnSave: String);

      property AllowPrintToArchive: Boolean read FAllowPrintToArchive write SetAllowPrintToArchive default False;
      property AllowPrintToFile: Boolean read FAllowPrintToFile write SetAllowPrintToFile default False;
      property ArchiveFileName: String read FArchiveFileName write SetArchiveFileName;
      property CancelDialog: TppCustomCancelDialog read FCancelDialog;
      property Converted: Boolean read FConverted write FConverted;
      property ConvertedFromPre40: Boolean read FConvertedFromPre40;
      property CurrentPage: Longint read FCurrentPage write FCurrentPage;
      property Device: TppDeviceType read FDevice write SetDevice;
      property DeviceType: String read FDeviceType write SetDeviceType;
      property EnableProcessMessages: Boolean read FEnableProcessMessages write SetEnableProcessMessages;
      property FileDevice: TppFileDevice read FFileDevice;
      property Icon: TIcon read FIcon write SetIcon;
      property Language: TppLanguageType read FLanguage write SetLanguage default lgDefault;
      property LanguageIndex: Longint read FLanguageIndex;
      property ModalCancelDialog: Boolean read FModalCancelDialog write SetModalCancelDialog default True;
      property ModalPreview: Boolean read FModalPreview write SetModalPreview default True;
      property PreviewForm: TppCustomPreviewer read FPreviewForm;
      property PrinterSetup: TppPrinterSetup read FPrinterSetup write SetPrinterSetup;
      property Printer: TppPrinter read GetPrinter;
      property PrintDialog: TppCustomPrintDialog read FPrintDialog;
      property Printing: Boolean read FPrinting write FPrinting;
      property Producing: Boolean read FProducing write FProducing;
      property PrinterDevice: TppPrinterDevice read FPrinterDevice;
      property Publisher: TppPublisher read FPublisher;
      property SavePrinterSetup: Boolean read FSavePrinterSetup write FSavePrinterSetup default False;
      property ShowAutoSearchDialog: Boolean read FShowAutoSearchDialog write FShowAutoSearchDialog default False;
      property ShowCancelDialog: Boolean read FShowCancelDialog write SetShowCancelDialog default True;
      property ShowPrintDialog: Boolean read FShowPrintDialog write SetShowPrintDialog default True;
      property TextFileName: String read FTextFileName write SetTextFileName;
      property TextFileType: TppFileType read FTextFileType write SetTextFileType default ftComma;
      property Version: String read FVersion write FVersion;
      property VersionNo: Integer read FVersionNo write FVersionNo;

  end; {class, TppProducer}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppProducerRTTI }
  TraTppProducerRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppProducerRTTI}


implementation

{$R rbPrint.res}

uses
  ppPrvDlg, ppCDlg, ppPDlg, ppViewr;


{******************************************************************************
 *
 ** P R O D U C E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppProducer.Create }

constructor TppProducer.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAllowPrintToArchive := False;
  FAllowPrintToFile := False;
  FArchiveFileName := '';
  FBeforePrintTriggered := False;
  FCancelDialog := nil;
  FConverted := False;
  FConvertedFromPre40 := False;
  FCurrentPage := 1;
  FDevice := dvScreen;
  FDeviceType := TppScreenDevice.DeviceName;
  FEnableProcessMessages := True;
  FFileDevice := nil;
  FIcon := TIcon.Create;
  FInitialized := False;
  FLanguage := lgDefault;
  FLanguageIndex := 0;
  FModalCancelDialog := True;
  FModalPreview := True;
  FPreviewForm := nil;
  FPrintCancelled := False;
  FPrinterDevice := nil;
  FPrintDialog := nil;
  FPrinting := False;
  FProducing := False;
  FSavePrinterSetup := False;
  FShowAutoSearchDialog := False;
  FShowCancelDialog := True;
  FShowPrintDialog := True;
  FTextFileName := '';
  FTextFileType := ftComma;
  FVersion := '1.0';
  FVersionNo := 1000;

  {events}
  FAfterPrint := nil;
  FBeforePrint := nil;
  FOnCancel := nil;
  FOnCancelDialogCreate := nil;
  FOnCancelDialogClose := nil;
  FOnPreviewFormCreate := nil;
  FOnPreviewFormClose := nil;
  FOnPrintDialogCreate := nil;
  FOnPrintDialogClose := nil;
  FOnPrintingComplete := nil;
  FOnSaveText := nil;

  {create printer setup and assign event handlers}
  FPrinterSetup := TppPrinterSetup.Create(Self);
  FPrinterSetup.OnGetPrinter         := PrinterSetupGetPrinterEvent;
  FPrinterSetup.OnPageDefChangeQuery := PrinterSetupChangeQueryEvent;
  FPrinterSetup.OnPageDefChange      := PrinterSetupPageDefChangeEvent;
  FPrinterSetup.OnPrintJobChange     := PrinterSetupPrintJobChangeEvent;

  {create publisher and assign pass-thru events}
  FPublisher := TppPublisher.Create(Self);
  FPublisher.OnPageRequest := RequestPage;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppProducer.Destroy }

destructor TppProducer.Destroy;
begin
 {showMessage('TppProducer.Destroy - begin');}

 {showMessage('TppProducer.Destroy - notify the Preview Form');}
  {notify the Preview Form}
  if (FPreviewForm <> nil) then
    FPreviewForm.Perform(PM_REPORTDESTROY, ppWCustomMsg, 0);

  { showMessage('TppProducer.Destroy - free the Preview Form');}

  {free the Preview Form}
  if (FPreviewForm <> nil) then
    begin
      FPreviewForm.Free;
      FPreviewForm := nil;
    end;

  { showMessage('TppProducer.Destroy -notify the Cancel Dlg');}
 {notify the Cancel Dialog}
  if (FCancelDialog <> nil) then
    FCancelDialog.Perform(PM_REPORTDESTROY, ppWCustomMsg, 0);

  { showMessage('TppProducer.Destroy -free FCancelDialog');}
 {free the Cancel Dialog}
  if (FCancelDialog <> nil) then
    begin
      FCancelDialog.Free;
      FCancelDialog := nil;
    end;

  FIcon.Free;

  { showMessage('TppProducer.Destroy -FPrinterSetup.Free');}
 FPrinterSetup.Free;

   {showMessage('TppProducer.Destroy -FPublisher.Free');}
 FPublisher.Free;

  inherited Destroy;
 {showMessage('TppProducer.Destroy - end');}

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppProducer.Loaded }

procedure TppProducer.Loaded;
var
  lbConvert: Boolean;
  liPos: Integer;
  liBuild: Integer;
begin

  lbConvert := (FVersionNo < ppVersionToInt(ppVersion));

  liPos := Pos('Beta Build', FVersion);

  if not(lbConvert) and (liPos <> 0) then
    begin
      liBuild := StrToInt(Copy(FVersion, liPos + 11, 1));

      if (liBuild < 7) then
        FVersionNo := 3998
      else
        FVersionNo := 3999;
    end;

  lbConvert := (FVersionNo < ppVersionToInt(ppVersion));

  if (FVersionNo < 4000) then
    FConvertedFromPre40 := True
  else
    FConvertedFromPre40 := False;

  {perform any needed compatibility conversions }
  if lbConvert then
    begin
      Convert(FVersionNo);

      FConverted := True;
    end;

  {set new version no}
  FVersion := ppVersion;
  FVersionNo := ppVersionToInt(ppVersion);

  {this clears csLoading from ComponentState}
  inherited Loaded;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppProducer.ProcessMessages }

procedure TppProducer.ProcessMessages;
begin
  if not FEnableProcessMessages then Exit;

  Application.ProcessMessages;

end; {procedure, ProcessMessages}

{------------------------------------------------------------------------------}
{ TppProducer.Convert }

procedure TppProducer.Convert(aVersionNo: Integer);
begin

  {convert AutoStop property value}
  if (aVersionNo <= 4210) and (Language = lgSpanish) then
    SetLanguage(lgSpanishMexico);

end; {procedure, Convert}


{------------------------------------------------------------------------------}
{ TppProducer.AppearsOnDelphiPalette}

class function TppProducer.AppearsOnDelphiPalette: Boolean;
begin

  {this class function enables TppRelative descendants to decide whether to use
   the TComponent fake Left, Top  properties required for non-visual components
   installed onto the Delphi component palette}
  Result := True;

end; {class function, AppearsOnDelphiPalette}


{------------------------------------------------------------------------------}
{ TppProducer.AssignOnSave }

procedure TppProducer.AssignOnSave(aOnSave: String);
begin

  if (Owner <> nil) then
    @FOnSaveText := Owner.MethodAddress(aOnSave);

end; {procedure, AssignOnSave}

{------------------------------------------------------------------------------}
{ TppProducer.DefineProperties - read/write private 'fake' properties }

procedure TppProducer.DefineProperties(Filer: TFiler);
var
  lAncestor: TppProducer;

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}
  if (Filer.Ancestor is TppProducer) then
    lAncestor := TppProducer(Filer.Ancestor)
  else
    lAncestor := nil;

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('Device', ReadDevice, nil, False);
      Filer.DefineProperty('Version', ReadVersion, WriteVersion, False);
    end
  else
{$ENDIF}
    begin
      Filer.DefineProperty('Device', ReadDevice, nil, False);
      Filer.DefineProperty('Version', ReadVersion, WriteVersion, True);
    end;
end;

{------------------------------------------------------------------------------}
{ TppProducer.ReadDevice }

procedure TppProducer.ReadDevice(Reader: TReader);
var
  lsDevice: String;
begin
  lsDevice := Reader.ReadIdent;

  if (lsDevice = 'dvScreen') then
    SetDeviceType(TppScreenDevice.DeviceName)
  else if (lsDevice = 'dvPrinter') then
    SetDeviceType(TppPrinterDevice.DeviceName)
  else if (lsDevice = 'dvFile') then
    SetDeviceType(TppTextFileDevice.DeviceName)
  else if (lsDevice = 'dvArchive') then
    SetDeviceType(TppArchiveDevice.DeviceName);

end; {procedure, ReadDevice}

{------------------------------------------------------------------------------}
{ TppProducer.ReadVersion }

procedure TppProducer.ReadVersion(Reader: TReader);
begin
  FVersion:= Reader.ReadString;
  FVersionNo := ppVersionToInt(FVersion);
end;

{------------------------------------------------------------------------------}
{ TppProducer.WriteVersion }

procedure TppProducer.WriteVersion(Writer: TWriter);
begin
  Writer.WriteString(ppVersion);
end;

{------------------------------------------------------------------------------}
{ TppProducer.ResetDevices }

procedure TppProducer.ResetDevices;
begin
  FPublisher.ResetDevices;
end; {procedure, ResetDevices}

{------------------------------------------------------------------------------}
{ TppProducer.Transfer }

procedure TppProducer.Transfer(aSource: TppCommunicator);
var
  lSourceProducer: TppProducer;
begin

  if not(aSource is TppProducer) then Exit;

  lSourceProducer := TppProducer(aSource);

  {assign properties}
  FAllowPrintToFile     := lSourceProducer.FAllowPrintToFile;
  FAllowPrintToArchive  := lSourceProducer.FAllowPrintToArchive;
  FArchiveFileName      := lSourceProducer.FArchiveFileName;
  FConverted            := lSourceProducer.FConverted;
  FConvertedFromPre40   := lSourceProducer.FConvertedFromPre40;
  FDevice               := lSourceProducer.FDevice;
  FDeviceType           := lSourceProducer.FDeviceType;
  FIcon.Assign(lSourceProducer.FIcon);
  FLanguage             := lSourceProducer.FLanguage;
  FLanguageIndex        := lSourceProducer.FLanguageIndex;
  FModalCancelDialog    := lSourceProducer.FModalCancelDialog;
  FShowCancelDialog     := lSourceProducer.FShowCancelDialog;
  FShowPrintDialog      := lSourceProducer.FShowPrintDialog;
  Tag                   := lSourceProducer.Tag;
  FTextFileName         := lSourceProducer.FTextFileName;
  FTextFileType         := lSourceProducer.FTextFileType;
  FVersion              := lSourceProducer.FVersion;
  FVersionNo            := lSourceProducer.FVersionNo;

  FPrinterSetup.Assign(lSourceProducer.FPrinterSetup);

  {assign event handlers}
  FAfterPrint  := lSourceProducer.FAfterPrint;
  FBeforePrint := lSourceProducer.FBeforePrint;

  FOnCancel             := lSourceProducer.FOnCancel;
  FOnCancelDialogCreate := lSourceProducer.FOnCancelDialogCreate;
  FOnCancelDialogClose  := lSourceProducer.FOnCancelDialogClose;
  FOnPreviewFormCreate  := lSourceProducer.FOnPreviewFormCreate;
  FOnPreviewFormClose   := lSourceProducer.FOnPreviewFormClose;
  FOnPrintDialogCreate  := lSourceProducer.FOnPrintDialogCreate;
  FOnPrintDialogClose   := lSourceProducer.FOnPrintDialogClose;
  FOnPrintingComplete   := lSourceProducer.FOnPrintingComplete;
  FOnSaveText           := lSourceProducer.FOnSaveText;

end; {procedure, Transfer}

{------------------------------------------------------------------------------}
{ TppProducer.ConvertedFromPre40Print }

procedure TppProducer.ConvertedFromPre40Print;

  procedure AfterConvertPrintToDevices;
  begin
    {trigger event}
    DoBeforePrint;

    if not(FInitialized) and not(FPrintCancelled) then
      FPublisher.Reset;

    {generate pages}
    FInitialized := True;
    FPrintCancelled := False;

    FPublisher.Publish;


    {notify devices that job was cancelled}
    if FPrintCancelled then
      FPublisher.CancelJob;


    if (DeviceClass <> TppScreenDevice) then
      begin
        {trigger event}
        DoAfterPrint;

        {retained for backward compatiblity}
        DoOnPrintingComplete;
      end;
  end; {procedure, AfterConvertPrintToDevices}

  procedure AfterConvertPrint;
  begin

    FProducing := True;

    if (DeviceType = TppScreenDevice.DeviceName) then
      PrintToScreen
    else
      PrintToPrinter;

  end; {procedure, AfterConvertPrint}

begin

  if FPrinting then Exit;

  ShowMessage('This report will be converted to 4.0 format before printing.');

  {keep other reports from loading}
  FPrinting := True;

  {wait three seconds}
  FTimer := TTimer.Create(Self);

  try
    FTimer.OnTimer := ConvertedFromPre40TimerEvent;
    FTimer.Interval := 1000;
    FTimer.Enabled := True;

    FWaitForTimer := True;

    while (FWaitForTimer) do
      Application.ProcessMessages;

  finally
    FTimer.Free;
  end; {try, finally}

  FConvertedFromPre40 := False;

  FPrinting := False;

  if (aPrintToDevices) then
    AfterConvertPrintToDevices
  else
    AfterConvertPrint

end; {procedure, ConvertedFromPre40Print}

{------------------------------------------------------------------------------}
{ TppProducer.ConvertedFromPre40TimerEvent }

procedure TppProducer.ConvertedFromPre40TimerEvent(Sender: TObject);
begin
  FTimer.Enabled := False;

  FWaitForTimer := False;
end; {procedure, ConvertedFromPre40TimerEvent}

{------------------------------------------------------------------------------}
{ TppProducer.Print }

procedure TppProducer.Print;
begin

  if (FConvertedFromPre40) then
    begin
      ConvertedFromPre40Print(False);

      Exit;
    end;

  FProducing := True;

  if (DeviceType = TppScreenDevice.DeviceName) then
    PrintToScreen
  else
    PrintToPrinter;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppProducer.PrintToDevices }

procedure TppProducer.PrintToDevices;
begin

  if (FConvertedFromPre40) then
    begin
      ConvertedFromPre40Print(True);

      Exit;
    end;

  {trigger event}
  DoBeforePrint;

  if not(FInitialized) and not(FPrintCancelled) then
    FPublisher.Reset;

  {generate pages}
  FInitialized := True;
  FPrintCancelled := False;


  FPublisher.Publish;


  {notify devices that job was cancelled}
  if FPrintCancelled then
    FPublisher.CancelJob;


  if (FireAfterPrint) then
    begin
      {trigger event}
      DoAfterPrint;

      {retained for backward compatiblity}
      DoOnPrintingComplete;
    end;

end; {procedure, PrintToDevices}

{------------------------------------------------------------------------------}
{ TppProducer.FireAfterPrint }

function TppProducer.FireAfterPrint: Boolean;
begin
  Result := (DeviceClass <> TppScreenDevice);
end; {function, FireAfterPrint}

{------------------------------------------------------------------------------}
{ TppProducer.RaiseException }

procedure TppProducer.RaiseException(aException: Exception);
begin
  FPublisher.CancelJob;
end; {procedure, RaiseException}

{------------------------------------------------------------------------------}
{ TppProducer.RequestPage }

procedure TppProducer.RequestPage(Sender: TObject; aPageRequest: TObject);
begin
  DoOnPageRequest(Sender, aPageRequest);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DisplayAutoSearchDialog }

function TppProducer.DisplayAutoSearchDialog: Boolean;
begin
  Result := False;
end; {function, DisplayAutoSearchDialog}

{------------------------------------------------------------------------------}
{ TppProducer.Cancel }

procedure TppProducer.Cancel;
begin
  FPrintCancelled := True;
end; {procedure, Cancel}

{------------------------------------------------------------------------------}
{ TppProducer.Reset }

procedure TppProducer.Reset;
begin

  if (FPrinting) then Exit;
  
  FInitialized := False;
  FPrintCancelled := False;

end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppProducer.PrintToScreen }

procedure TppProducer.PrintToScreen;
begin

  if (FPreviewForm <> nil) then Exit;

  FPreviewForm := CreatePreviewForm;

  if (FPreviewForm = nil) then Exit;

  {trigger event}
  DoOnPreviewFormCreate;

  {display the form}
  if FModalPreview then
    begin
      FPreviewForm.ppOnActivate := PreviewFormActivateEvent;

      FPreviewForm.ShowModal;

{$IFDEF WINDOWS}
      {Delphi 1 does not free the preview form}
      FPreviewForm.Free;
{$ENDIF}

    end

  else
    begin
      FPreviewForm.Show;

      PrintToDevices;
    end;

  {note: this enables the FormClose and FormDestroy messages to fire
         when Report.Print is called from within a loop }
  ProcessMessages;


end; {procedure, PrintToScreen}


{------------------------------------------------------------------------------}
{ TppProducer.PrintToPrinter }

procedure TppProducer.PrintToPrinter;
var
  lOriginalPrinterSetup: TppPrinterSetup;
  lbPrintToFile: Boolean;
{$IFDEF WINDOWS}
  lsPrinterName: String;
{$ENDIF}
  lDeviceClass: TppDeviceClass;

procedure FreeObjects;
  begin
    FPrintDialog.Free;
    FPrintDialog := nil;
    
    lOriginalPrinterSetup.Free;
    
    FFileDevice.Free;
    FFileDevice := nil;

    FPrinterDevice.Free;
    FPrinterDevice := nil;

    FProducing := False;
  end;

begin

  if (FCancelDialog <> nil) then Exit;

  {get device class}
  lDeviceClass := DeviceClass;

  if (lDeviceClass = nil) then Exit;

  {save current printer setup}
  lOriginalPrinterSetup := TppPrinterSetup.Create(nil);
  lOriginalPrinterSetup.Assign(PrinterSetup);

  {create a printer device}
  FPrinterDevice := TppPrinterDevice.Create(Self);
  FPrinterDevice.Stackable := True;
  FPrinterDevice.LanguageIndex := LanguageIndex;

  if FPrinterDevice.Printer <> nil then
    FPrinterDevice.Printer.PrinterSetup := PrinterSetup;

{$IFDEF WINDOWS}
  lsPrinterName := PrinterSetup.PrinterName;
{$ENDIF}

  FPrintDialog := CreatePrintDialog;

  DoOnPrintDialogCreate;


  if (FPrintDialog <> nil) and (FPrintDialog.ShowModal <> mrOK) then
    begin
      FreeObjects;

      Exit;
    end;

  {create the device}
  if ((FPrintDialog <> nil) and (FPrintDialog.PrintToFile)) or
     ((FPrintDialog = nil) and (lDeviceClass.InheritsFrom(TppFileDevice) and
       not(DeviceClass.InheritsFrom(TppArchiveDevice)) )) then
    begin
      lbPrintToFile := True;

      if (FPrintDialog <> nil) then
        lDeviceClass := ppDeviceClassForName(FPrintDialog.DeviceType);

      FFileDevice := TppFileDevice(lDeviceClass.Create(Self));
      FFileDevice.LanguageIndex := LanguageIndex;

      if lDeviceClass.InheritsFrom(TppTextFileDevice) then
        begin
          TppTextFileDevice(FFileDevice).OnSave := TextDeviceSaveEvent;

          TppTextFileDevice(FFileDevice).TextFileType := FTextFileType;
        end;

      if (FPrintDialog <> nil) then
        begin
          FFileDevice.FileName := FPrintDialog.TextFileName;
          FFileDevice.PageRequest := TppPageRequest(FPrintDialog.PageRequest);
        end
      else
        FFileDevice.FileName := FTextFileName;

    end

  else if ((FPrintDialog <> nil) and (FPrintDialog.PrintToArchive)) or
          ((FPrintDialog = nil) and (lDeviceClass.InheritsFrom(TppArchiveDevice))) then
    begin
      lbPrintToFile := True;

      FFileDevice := TppArchiveDevice.Create(Self);
      FFileDevice.LanguageIndex := LanguageIndex;

      if (FPrintDialog <> nil) then
        begin
          FFileDevice.FileName := FPrintDialog.ArchiveFileName;
          FFileDevice.PageRequest := TppPageRequest(FPrintDialog.PageRequest);
        end

      else
        FFileDevice.FileName := FArchiveFileName;

    end

  else
    begin

      if (FPrinterDevice.Printer.DC = 0) then
        begin
          {'Windows cannot print due to a problem with the current printer setup.'}
          MessageDlg(ppLoadStr(1020), mtWarning, [mbOK],0);

          FreeObjects;
          
          Exit;
        end;

      lbPrintToFile := False;

      if (FPrintDialog <> nil) then
        FPrinterDevice.PageRequest := TppPageRequest(FPrintDialog.PageRequest);

    end;

  {assign device to publisher}
  if (lbPrintToFile) then
    begin
      FFileDevice.Publisher := FPublisher;
      
      DeviceCreated(FFileDevice);
    end

  else
    begin
      FPrinterDevice.Publisher := FPublisher;

      DeviceCreated(FPrinterDevice);
    end;


  {assign printer device to publisher}
  if not(lbPrintToFile) then
    begin

{$IFDEF WINDOWS}
      {for WIN 16, changing the printer name automatically changes the other
                           settings to the printer driver defaults, so this
                           code restores them to their prior settings}
      if (lsPrinterName <> FPrinterDevice.Printer.PrinterSetup.PrinterName) then
        begin
          FPrinterDevice.Printer.PrinterSetup.PaperName   := PrinterSetup.PaperName;
          FPrinterDevice.Printer.PrinterSetup.Orientation := PrinterSetup.Orientation;
        end;
{$ENDIF}

      {get printer device's printersetup - note: do not use assign here}
       PrinterSetup := FPrinterDevice.Printer.PrinterSetup;

    end;


  {create the cancel dialog}
  FCancelDialog := CreateCancelDialog;

  {assign cancel dialog to device}
  if (FCancelDialog <> nil) and (lbPrintToFile) then
     FFileDevice.CancelDialog := FCancelDialog

  else if (FCancelDialog <> nil) then
    FPrinterDevice.CancelDialog := FCancelDialog;

  {trigger event}
  DoOnCancelDialogCreate;

  {print report}
  try

    {display cancel dialog}
    if (FCancelDialog <> nil) then

      if FModalCancelDialog then
        begin
          FCancelDialog.ppOnActivate := CancelDialogActivateEvent;

          FCancelDialog.ppShowModal;

          FCancelDialog.Free;
        end

      else
        begin
          FCancelDialog.Show;

          PrintToDevices;

          {note: need to check if nil, since CancelDialogCloseEvent event may have fired}
          if (FCancelDialog <> nil) then
            FCancelDialog.Close;
        end

    else
      PrintToDevices;


  finally

    {restore printer setup}
    if not(FSavePrinterSetup) then
      PrinterSetup.Assign(lOriginalPrinterSetup);

    {free all objects created by this procedure}
    FreeObjects;

  end; {try, finally}

end; {procedure, PrintToPrinter}


{------------------------------------------------------------------------------}
{ TppProducer.TextDeviceSaveEvent }

procedure TppProducer.TextDeviceSaveEvent(aTextDevice: TObject; aComponent: TObject; var Text: String);
begin
  DoOnSaveText(TppTextFileDevice(aTextDevice), Text);
end; {procedure, TextDeviceSaveEvent}

{------------------------------------------------------------------------------}
{ TppProducer.CreatePreviewForm }

function TppProducer.CreatePreviewForm: TppCustomPreviewer;
var
  lFormClass: TFormClass;
begin

  {instantiate the previewer}
  lFormClass   := ppGetFormClass(TppCustomPreviewer);
  Result := TppCustomPreviewer(lFormClass.Create(Self));

  {these assigned to 'pp' events, so developer can use Delphi events}
  Result.ppOnClose    := PreviewFormCloseEvent;
  Result.ppOnDestroy  := PreviewFormDestroyEvent;

  {set the report property, devices are added by the preview form}
  Result.Report := Self;

  Result.Init;
  
end; {function, CreatePreviewForm}

{------------------------------------------------------------------------------}
{ TppProducer.CreateCancelDialog }

function TppProducer.CreateCancelDialog: TppCustomCancelDialog;
var
  lFormClass: TFormClass;
  lCancelDialog: TppCustomCancelDialog;
begin
  Result := nil;

  if not(FShowCancelDialog) then Exit;

  lFormClass := ppGetFormClass(TppCustomCancelDialog);

  lCancelDialog := TppCustomCancelDialog(lFormClass.Create(Application));
  
  lCancelDialog.Report           := Self;
  lCancelDialog.LanguageIndex    := LanguageIndex;
  lCancelDialog.ppOnCancel       := CancelDialogCancelEvent;
  lCancelDialog.ppOnClose        := CancelDialogCloseEvent;
  lCancelDialog.ppOnDestroy      := CancelDialogDestroyEvent;
  lCancelDialog.AllowPrintCancel := True;

  if not(FIcon.Empty) then
    lCancelDialog.Icon := FIcon;

  Result := lCancelDialog;

end; {function, CreateCancelDialog}

{------------------------------------------------------------------------------}
{ TppProducer.CreatePrintDialog }

function TppProducer.CreatePrintDialog: TppCustomPrintDialog;
var
  lFormClass: TFormClass;
  lPrintDialog: TppCustomPrintDialog;
begin

  Result := nil;

  if not ((pppcDesignPrinting in DesignState) or (FShowPrintDialog)) then Exit;

  lFormClass   := ppGetFormClass(TppCustomPrintDialog);

  lPrintDialog := TppCustomPrintDialog(lFormClass.Create(Application));

  lPrintDialog.Report              := Self;
  lPrintDialog.Printer             := TppPrinterDevice(FPrinterDevice).Printer;
  lPrintDialog.LanguageIndex       := LanguageIndex;
  lPrintDialog.AllowPrintToArchive := FAllowPrintToArchive;
  lPrintDialog.AllowPrintToFile    := FAllowPrintToFile;
  lPrintDialog.ArchiveFileName     := FArchiveFileName;
  lPrintDialog.TextFileName        := FTextFileName;
  lPrintDialog.ppOnClose           := PrintDialogCloseEvent;

  TppPageRequest(lPrintDialog.PageRequest).PageRequested := FCurrentPage;

  if not(FIcon.Empty) then
    lPrintDialog.Icon := FIcon;

  lPrintDialog.Init;

  Result := lPrintDialog;

end; {procedrue, CreatePrintDialog}

{******************************************************************************
 *
 ** F O R M   E V E N T   H A N D L E R S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppProducer.CancelDialogActivateEvent }

procedure TppProducer.CancelDialogActivateEvent(Sender: TObject);
begin

  {if this routine is called we have a modal cancel dialog and
   we need to continue the report printing process by calling print}
  PrintToDevices;

  FCancelDialog.ppCloseModal;

end; {procedure, CancelDialogActivate}

{------------------------------------------------------------------------------}
{ TppProducer.CancelDialogCancelEvent }

procedure TppProducer.CancelDialogCancelEvent(Sender: TObject);
begin
  Cancel;

  DoOnCancel;
end; {procedure, CancelDialogCancelEvent}

{------------------------------------------------------------------------------}
{ TppProducer.CancelDialogCloseEvent }

procedure TppProducer.CancelDialogCloseEvent(Sender: TObject);
begin
  {trigger event}
  DoOnCancelDialogClose;
end;

{------------------------------------------------------------------------------}
{ TppProducer.CancelDialogDestroyEvent }

procedure TppProducer.CancelDialogDestroyEvent(Sender: TObject);
begin

  if FCancelDialog <> nil then
    begin

      if (FPrinterDevice <> nil) then
        TppPrinterDevice(FPrinterDevice).CancelDialog := nil

      else if (FFileDevice <> nil) then
        TppTextFileDevice(FFileDevice).CancelDialog := nil;

      FCancelDialog := nil;

   end;

end; {procedure, CancelDialogDestroyEvent}

{------------------------------------------------------------------------------}
{ TppProducer.PrintDialogCloseEvent }

procedure TppProducer.PrintDialogCloseEvent(Sender: TObject);
begin
  {trigger event}
  DoOnPrintDialogClose;
end;

{------------------------------------------------------------------------------}
{ TppProducer.PreviewFormActivateEvent }

procedure TppProducer.PreviewFormActivateEvent(Sender: TObject);
begin

  {if this routine is called when we have a modal previewer and
   we need to continue the report printing process by calling print}
  PrintToDevices;

end; {procedure, PreviewFormActivateEvent}

{------------------------------------------------------------------------------}
{ TppProducer.PreviewFormCloseEvent }

procedure TppProducer.PreviewFormCloseEvent(Sender: TObject);
begin
  FProducing := False;

  DoAfterPrint;

  DoOnPreviewFormClose;
end;

{------------------------------------------------------------------------------}
{ TppProducer.PreviewFormDestroyEvent }

procedure TppProducer.PreviewFormDestroyEvent(Sender: TObject);
begin

  FPreviewForm := nil;

end; {procedure, PreviewFormDestroyEvent}

{******************************************************************************
 *
 ** E V E N T   T R I G G E R S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppProducer.DoOnPageRequest }

procedure TppProducer.DoOnPageRequest(Sender: TObject; aPageRequest: TObject);
begin
  if Assigned(FOnPageRequest) then FOnPageRequest(Sender, aPageRequest);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnPrintingComplete }

procedure TppProducer.DoOnPrintingComplete;
begin
  if Assigned(FOnPrintingComplete) then FOnPrintingComplete(Self);
end;

{------------------------------------------------------------------------------}
{ TppProducer.TriggerCodeModuleBeforePrint }

procedure TppProducer.TriggerCodeModuleBeforePrint;
begin

  if (FBeforePrintTriggered) then Exit;

  FBeforePrintTriggered := True;

  SendEventNotify(Self, ciProducerBeforePrint, nil);
  
end;

{------------------------------------------------------------------------------}
{ TppProducer.TriggerCodeModuleAfterPrint }

procedure TppProducer.TriggerCodeModuleAfterPrint;
begin

  if not(FBeforePrintTriggered) then Exit;

  FBeforePrintTriggered := False;

  SendEventNotify(Self, ciProducerAfterPrint, nil);

end;

{------------------------------------------------------------------------------}
{ TppProducer.DoAfterPrint }

procedure TppProducer.DoAfterPrint;
begin
  if Assigned(FAfterPrint) then FAfterPrint(Self);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoBeforePrint }

procedure TppProducer.DoBeforePrint;
begin
  if Assigned(FBeforePrint) then FBeforePrint(Self);
end;

{------------------------------------------------------------------------------}
{ TppProducer.TriggerCodeModuleCreate }

procedure TppProducer.TriggerCodeModuleCreate;
begin
  SendEventNotify(Self, ciProducerCreate, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.TriggerCodeModuleDestroy }

procedure TppProducer.TriggerCodeModuleDestroy;
begin
  SendEventNotify(Self, ciProducerDestroy, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnCancel }

procedure TppProducer.DoOnCancel;
begin
  if Assigned(FOnCancel) then FOnCancel(Self);

  SendEventNotify(Self, ciProducerCancel, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnCancelDialogCreate }

procedure TppProducer.DoOnCancelDialogCreate;
begin
  if Assigned(FOnCancelDialogCreate) then FOnCancelDialogCreate(Self);

  SendEventNotify(Self, ciProducerCancelDialogCreate, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnCancelDialogClose }

procedure TppProducer.DoOnCancelDialogClose;
begin
  if Assigned(FOnCancelDialogClose) then FOnCancelDialogClose(Self);

  SendEventNotify(Self, ciProducerCancelDialogClose, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.LanguageChanged }

procedure TppProducer.LanguageChanged;
begin

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppProducer.DeviceCreated }

procedure TppProducer.DeviceCreated(aDevice: TppDevice);
begin

end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnPreviewFormCreate }

procedure TppProducer.DoOnPreviewFormCreate;
begin
  FPreviewForm.LanguageIndex := FLanguageIndex;

  if not(FIcon.Empty) then FPreviewForm.Icon := FIcon;

  if Assigned(FOnPreviewFormCreate) then FOnPreviewFormCreate(Self);

  SendEventNotify(Self, ciProducerPreviewFormCreate, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnPreviewFormClose }

procedure TppProducer.DoOnPreviewFormClose;
begin
  {if we're printing, stop the job}
  if FPrinting then Cancel;

  if Assigned(FOnPreviewFormClose) then FOnPreviewFormClose(Self);

  SendEventNotify(Self, ciProducerPreviewFormClose, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnPrintDialogCreate }

procedure TppProducer.DoOnPrintDialogCreate;
begin
  if Assigned(FOnPrintDialogCreate) then FOnPrintDialogCreate(Self);

  SendEventNotify(Self, ciProducerPrintDialogCreate, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnPrintDialogClose }

procedure TppProducer.DoOnPrintDialogClose;
begin
  if Assigned(FOnPrintDialogClose) then FOnPrintDialogClose(Self);

  SendEventNotify(Self, ciProducerPrintDialogClose, nil);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DoOnSaveText }

procedure TppProducer.DoOnSaveText(aTextDevice: TppTextFileDevice; var aText: String);
var
  lParams: TraParamList;
begin

  if Assigned(FOnSaveText) then FOnSaveText(aTextDevice, aText);

  lParams := TraTppProducerRTTI.GetParams('OnSaveText');

  lParams.CreateValuePointer(0, aText);

  SendEventNotify(Self, ciProducerSaveText, lParams);

  lParams.Free;

end; {procedure, DoOnSaveText}

{******************************************************************************
 *
 ** P R O P E R T Y   H A N D L E R S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppProducer.SetAllowPrintToArchive }

procedure TppProducer.SetAllowPrintToArchive(Value: Boolean);
begin
  if FPrinting then Exit;

  FAllowPrintToArchive := Value;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetAllowPrintToFile }

procedure TppProducer.SetAllowPrintToFile(Value: Boolean);
begin
  if FPrinting then Exit;

  FAllowPrintToFile := Value;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetIcon }

procedure TppProducer.SetIcon(aIcon: TIcon);
begin
  if FPrinting then Exit;

  FIcon.Assign(aIcon);
end;

{------------------------------------------------------------------------------}
{ TppProducer.DeviceClass }

function TppProducer.DeviceClass: TppDeviceClass;
begin
  Result := ppDeviceClassForName(FDeviceType);
end; {procedure, DeviceClass}

{------------------------------------------------------------------------------}
{ TppProducer.SetDevice }

procedure TppProducer.SetDevice(aDevice: TppDeviceType);
begin

  {this routine supports code like:  ppReport1.Device := dvPrinter, for backward compatiblity}
  case aDevice of
    dvScreen:  SetDeviceType(TppScreenDevice.DeviceName);
    dvPrinter: SetDeviceType(TppPrinterDevice.DeviceName);
    dvFile:    SetDeviceType(TppTextFileDevice.DeviceName);
    dvArchive: SetDeviceType(TppArchiveDevice.DeviceName);
  end;

end; {procedure, SetDevice}

{------------------------------------------------------------------------------}
{ TppProducer.SetDeviceType }

procedure TppProducer.SetDeviceType(const aDeviceName: String);
var
  lsOldType: String;
begin

  if FPrinting then Exit;

  lsOldType := FDeviceType;

  FDeviceType := aDeviceName;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (ppDeviceClassForName(aDeviceName) = nil) then
    FDeviceType := lsOldType;

end; {procedure, SetDeviceType}


{------------------------------------------------------------------------------}
{ TppProducer.SetEnableProcessMessages }

procedure TppProducer.SetEnableProcessMessages(aValue: Boolean);
begin
  FEnableProcessMessages := aValue;

end; {procedure, SetEnableProcessMessages}

{------------------------------------------------------------------------------}
{ TppProducer.SetShowPrintDialog }

procedure TppProducer.SetShowPrintDialog(Value: Boolean);
begin
  if FPrinting then Exit;

  FShowPrintDialog := Value;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetShowCancelDialog }

procedure TppProducer.SetShowCancelDialog(Value: Boolean);
begin
  if FPrinting then Exit;

  FShowCancelDialog := Value;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetModalCancelDialog }

procedure TppProducer.SetModalCancelDialog(Value: Boolean);
begin
  if FPrinting then Exit;

  FModalCancelDialog := Value;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetModalPreview }

procedure TppProducer.SetModalPreview(Value: Boolean);
begin
  if FPrinting then Exit;

  FModalPreview := Value;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetArchiveFileName }

procedure TppProducer.SetArchiveFileName(aFileName: String);
begin
  if FPrinting then Exit;

  FArchiveFileName := aFileName;

  Reset;

  ResetDevices;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetTextFileType }

procedure TppProducer.SetTextFileType(aFileType: TppFileType);
begin
  if FPrinting then Exit;

  FTextFileType := aFileType;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetTextFileName }

procedure TppProducer.SetTextFileName(aFileName: String);
begin
  if FPrinting then Exit;

  FTextFileName := aFileName;
end;

{------------------------------------------------------------------------------}
{ TppProducer.SetLanguage }

procedure TppProducer.SetLanguage(aLanguageType: TppLanguageType);
begin

  if FPrinting then Exit;

  if not ppResourceManager.SetLanguage(aLanguageType) then
    if (csReading in ComponentState) or (csLoading in ComponentState) then
      begin
        aLanguageType := lgDefault;
        ppResourceManager.SetLanguage(aLanguageType);
      end
    else
      Exit;

  FLanguage := aLanguageType;

  FLanguageIndex := 0;

  LanguageChanged;

end;

{------------------------------------------------------------------------------}
{ TppProducer.SetPrinterSetup }

procedure TppProducer.SetPrinterSetup(aPrinterSetup: TppPrinterSetup);
begin

  FPrinterSetup.Assign(aPrinterSetup);

  PrinterSetupChanged;

end; {procedure, SetPrinterSetup}


{******************************************************************************
 *
 ** P R I N T E R  S E T U P   E V E N T    H A N D L E R S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppProducer.PrinterSetupChanged }

procedure TppProducer.PrinterSetupChanged;
begin

end;

{------------------------------------------------------------------------------}
{ TppProducer.GetPrinter }

function TppProducer.GetPrinter: TppPrinter;
begin

  Result := ppPrinter;

  if Result <> nil then
    Result.PrinterSetup := FPrinterSetup;

end; {function, GetPrinter}

{------------------------------------------------------------------------------}
{ TppProducer.PrinterSetupGetPrinterEvent }

procedure TppProducer.PrinterSetupGetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);
begin
  aPrinter := GetPrinter;
end;

{------------------------------------------------------------------------------}
{ TppProducer.PrinterSetupChangeQueryEvent }

procedure TppProducer.PrinterSetupChangeQueryEvent(Sender: TObject; aNewPageDef: TObject; var CanChange: Boolean);
begin

end; {procedure, PrinterSetupChangeQueryEvent}

{------------------------------------------------------------------------------}
{ TppProducer.PrinterSetupPageDefChangeEvent }

procedure TppProducer.PrinterSetupPageDefChangeEvent(Sender: TObject);
begin

  PrinterSetupChanged;

end; {procedure, PrinterSetupPageDefChangeEvent}

{------------------------------------------------------------------------------}
{ TppProducer.PrinterSetupPrintJobChangeEvent }

procedure TppProducer.PrinterSetupPrintJobChangeEvent(Sender: TObject);
begin

  PrinterSetupChanged;

end; {procedure, PrinterSetupPrintJobChangeEvent}

{******************************************************************************
 *
 ** P R O D U C E R   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppProducerRTTI.RefClass }

class function TraTppProducerRTTI.RefClass: TClass;
begin
  Result := TppProducer;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppProducerRTTI.GetPropList }

class procedure TraTppProducerRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppProducerRTTI.GetPropRec }

class function TraTppProducerRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;


  {events}
  if ppEqual(aPropName, 'AfterPrint') then
    EventToRec(aPropName, ciProducerAfterPrint, False, aPropRec)

  else if ppEqual(aPropName, 'BeforePrint') then
    EventToRec(aPropName, ciProducerBeforePrint, False, aPropRec)

  else if ppEqual(aPropName, 'OnCancel') then
    EventToRec(aPropName, ciProducerCancel, False, aPropRec)

  else if ppEqual(aPropName, 'OnCancelDialogCreate') then
    EventToRec(aPropName, ciProducerCancelDialogCreate, False, aPropRec)

  else if ppEqual(aPropName, 'OnCancelDialogClose') then
    EventToRec(aPropName, ciProducerCancelDialogClose, False, aPropRec)

  else if ppEqual(aPropName, 'OnPreviewFormCreate') then
    EventToRec(aPropName, ciProducerPreviewFormCreate, False, aPropRec)

  else if ppEqual(aPropName, 'OnPreviewFormClose') then
    EventToRec(aPropName, ciProducerPreviewFormClose, False, aPropRec)

  else if ppEqual(aPropName, 'OnCancelDialogCreate') then
    EventToRec(aPropName, ciProducerCancelDialogCreate, False, aPropRec)

  else if ppEqual(aPropName, 'OnPrintDialogCreate') then
    EventToRec(aPropName, ciProducerPrintDialogCreate, False, aPropRec)

  else if ppEqual(aPropName, 'OnPrintDialogClose') then
    EventToRec(aPropName, ciProducerPrintDialogClose, False, aPropRec)

  else if ppEqual(aPropName, 'OnSaveText') then
    EventToRec(aPropName, ciProducerSaveText, True, aPropRec)

    
  {properties & methods}
  else if ppEqual(aPropName, 'AllowPrintToArchive') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'AllowPrintToFile') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ArchiveFileName') then
    PropToRec(aPropName, daString, False, aPropRec)

  else if ppEqual(aPropName, 'CancelDialog') then
    ClassPropToRec(aPropName, TppCustomCancelDialog, True, aPropRec)

  else if ppEqual(aPropName, 'Converted') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'ConvertedFromPre40') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'CurrentPage') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'DeviceType') then
    PropToRec(aPropName, daString, False, aPropRec)

  else if ppEqual(aPropName, 'EnableProcessMessages') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'FileDevice') then
    ClassPropToRec(aPropName, TppFileDevice, True, aPropRec)

  else if ppEqual(aPropName, 'Icon') then
    ClassPropToRec(aPropName, TIcon, False, aPropRec)

  else if ppEqual(aPropName, 'Language') then
   EnumPropToRec(aPropName, 'TppLanguageType', True, aPropRec)

  else if ppEqual(aPropName, 'LanguageIndex') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'ModalCancelDialog') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ModalPreview') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'PreviewForm') then
    ClassPropToRec(aPropName, TppCustomPreviewer, True, aPropRec)

  else if ppEqual(aPropName, 'PrinterSetup') then
    ClassPropToRec(aPropName, TppPrinterSetup, True, aPropRec)

  else if ppEqual(aPropName, 'Printer') then
    ClassPropToRec(aPropName, TppPrinter, True, aPropRec)

  else if ppEqual(aPropName, 'PrintDialog') then
    ClassPropToRec(aPropName, TppCustomPrintDialog, True, aPropRec)

  else if ppEqual(aPropName, 'Printing') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'Producing') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'PrinterDevice') then
    ClassPropToRec(aPropName, TppPrinterDevice, True, aPropRec)

  else if ppEqual(aPropName, 'Publisher') then
    ClassPropToRec(aPropName, TppPublisher, True, aPropRec)

  else if ppEqual(aPropName, 'SavePrinterSetup') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ShowAutoSearchDialog') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ShowCancelDialog') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ShowPrintDialog') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'TextFileName') then
    PropToRec(aPropName, daString, False, aPropRec)

  else if ppEqual(aPropName, 'TextFileType') then
    EnumPropToRec(aPropName, 'TppFileType', False, aPropRec)

  else if ppEqual(aPropName, 'Version') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'VersionNo') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppProducerRTTI.GetParams }

class function TraTppProducerRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'OnSaveText') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Text', daString, nil, '', False, True);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppProducerRTTI.GetPropValue }

class function TraTppProducerRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AllowPrintToArchive') then
    Boolean(aValue) := TppProducer(aObject).AllowPrintToArchive

  else if ppEqual(aPropName, 'AllowPrintToFile') then
    Boolean(aValue) := TppProducer(aObject).AllowPrintToFile

  else if ppEqual(aPropName, 'ArchiveFileName') then
    String(aValue) := TppProducer(aObject).ArchiveFileName

  else if ppEqual(aPropName, 'CancelDialog') then
    Integer(aValue) := Integer(TppProducer(aObject).CancelDialog)

  else if ppEqual(aPropName, 'Converted') then
    Boolean(aValue) := TppProducer(aObject).Converted

  else if ppEqual(aPropName, 'ConvertedFromPre40') then
    Boolean(aValue) := TppProducer(aObject).ConvertedFromPre40

  else if ppEqual(aPropName, 'CurrentPage') then
    Integer(aValue) := TppProducer(aObject).CurrentPage

  else if ppEqual(aPropName, 'DeviceType') then
    String(aValue) := TppProducer(aObject).DeviceType

  else if ppEqual(aPropName, 'EnableProcessMessages') then
    Boolean(aValue) := TppProducer(aObject).EnableProcessMessages

  else if ppEqual(aPropName, 'FileDevice') then
    Integer(aValue) := Integer(TppProducer(aObject).FileDevice)

  else if ppEqual(aPropName, 'Icon') then
    Integer(aValue) := Integer(TppProducer(aObject).Icon)

  else if ppEqual(aPropName, 'Language') then
    Integer(aValue) := Ord(TppProducer(aObject).Language)

  else if ppEqual(aPropName, 'LanguageIndex') then
    Integer(aValue) := TppProducer(aObject).LanguageIndex

  else if ppEqual(aPropName, 'ModalCancelDialog') then
    Boolean(aValue) := TppProducer(aObject).ModalCancelDialog

  else if ppEqual(aPropName, 'ModalPreview') then
    Boolean(aValue) := TppProducer(aObject).ModalPreview

  else if ppEqual(aPropName, 'PreviewForm') then
    Integer(aValue) := Integer(TppProducer(aObject).PreviewForm)

  else if ppEqual(aPropName, 'PrinterSetup') then
    Integer(aValue) := Integer(TppProducer(aObject).PrinterSetup)

  else if ppEqual(aPropName, 'Printer') then
    Integer(aValue) := Integer(TppProducer(aObject).Printer)

  else if ppEqual(aPropName, 'PrintDialog') then
    Integer(aValue) := Integer(TppProducer(aObject).PrintDialog)

  else if ppEqual(aPropName, 'Printing') then
    Boolean(aValue) := TppProducer(aObject).Printing

  else if ppEqual(aPropName, 'Producing') then
    Boolean(aValue) := TppProducer(aObject).Producing

  else if ppEqual(aPropName, 'PrinterDevice') then
    Integer(aValue) := Integer(TppProducer(aObject).PrinterDevice)

  else if ppEqual(aPropName, 'Publisher') then
    Integer(aValue) := Integer(TppProducer(aObject).Publisher)

  else if ppEqual(aPropName, 'SavePrinterSetup') then
    Boolean(aValue) := TppProducer(aObject).SavePrinterSetup

  else if ppEqual(aPropName, 'ShowAutoSearchDialog') then
    Boolean(aValue) := TppProducer(aObject).ShowAutoSearchDialog

  else if ppEqual(aPropName, 'ShowCancelDialog') then
    Boolean(aValue) := TppProducer(aObject).ShowCancelDialog

  else if ppEqual(aPropName, 'ShowPrintDialog') then
    Boolean(aValue) := TppProducer(aObject).ShowPrintDialog

  else if ppEqual(aPropName, 'TextFileName') then
    String(aValue) := TppProducer(aObject).TextFileName

  else if ppEqual(aPropName, 'TextFileType') then
    Integer(aValue) := Ord(TppProducer(aObject).TextFileType)

  else if ppEqual(aPropName, 'Version') then
    String(aValue) := TppProducer(aObject).Version

  else if ppEqual(aPropName, 'VersionNo') then
    Integer(aValue) := TppProducer(aObject).VersionNo

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppProducerRTTI.SetPropValue }

class function TraTppProducerRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AllowPrintToArchive') then
    TppProducer(aObject).AllowPrintToArchive := Boolean(aValue)

  else if ppEqual(aPropName, 'AllowPrintToFile') then
    TppProducer(aObject).AllowPrintToFile := Boolean(aValue)

  else if ppEqual(aPropName, 'ArchiveFileName') then
    TppProducer(aObject).ArchiveFileName := String(aValue)

  else if ppEqual(aPropName, 'DeviceType') then
    TppProducer(aObject).DeviceType := String(aValue)

  else if ppEqual(aPropName, 'Language') then
    TppProducer(aObject).Language := TppLanguageType(aValue)

  else if ppEqual(aPropName, 'ModalCancelDialog') then
    TppProducer(aObject).ModalCancelDialog := Boolean(aValue)

  else if ppEqual(aPropName, 'ModalPreview') then
    TppProducer(aObject).ModalPreview := Boolean(aValue)

  else if ppEqual(aPropName, 'SavePrinterSetup') then
    TppProducer(aObject).SavePrinterSetup := Boolean(aValue)

  else if ppEqual(aPropName, 'ShowAutoSearchDialog') then
    TppProducer(aObject).ShowAutoSearchDialog := Boolean(aValue)

  else if ppEqual(aPropName, 'ShowCancelDialog') then
    TppProducer(aObject).ShowCancelDialog := Boolean(aValue)

  else if ppEqual(aPropName, 'ShowPrintDialog') then
    TppProducer(aObject).ShowPrintDialog := Boolean(aValue)

  else if ppEqual(aPropName, 'TextFileName') then
    TppProducer(aObject).TextFileName := String(aValue)

  else if ppEqual(aPropName, 'TextFileType') then
    TppProducer(aObject).TextFileType := TppFileType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppResourceManager.AddResFileName('rbPrint');

  RegisterClasses([TppProducer, TppPrinterSetup]);

  raRegisterRTTI(TraTppProducerRTTI);

finalization

  ppResourceManager.RemoveResFileName('rbPrint');

  UnRegisterClasses([TppProducer, TppPrinterSetup]);

  raUnRegisterRTTI(TraTppProducerRTTI);

end.
