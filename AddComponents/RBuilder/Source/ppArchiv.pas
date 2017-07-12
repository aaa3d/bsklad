{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppArchiv;

interface

{$I ppIfDef.pas}

uses
  Classes, Forms, SysUtils, ppProd, ppUtils, ppTypes, ppDevice, ppDrwCmd;

type

  { TppArchiveReader }
  TppArchiveReader = class(TppProducer)
    private
      FArchivePageCount: Longint;
      FArchivePageNo: Longint;
      FFileStream: TFileStream;
      FFirstPageRead: Boolean;
      FGenerateCompleted: Boolean;
      FHeaderSize: Longint;
      FOnInitializePrinterSetup: TNotifyEvent;
      FOnDrawCommandClick: TppDrawCommandEvent;
      FPage: TppPage;
      FPageEntrySize: Longint;
      FPageListIndex: Integer;
      FPageRequest: TppPageRequest;
      FPrinterSetupInitialized: Boolean;
      FStopPrinting: Boolean;

      procedure AssignClickableDrawCommandsToHandler;
      procedure CloseFile;
      procedure DoOnInitializePrinterSetup;
      procedure DrawCommandClickEvent(Sender: TObject);
      procedure Generate;
      procedure GetFirstPage;
      procedure GetNextPage;
      function  GetPageFromPageList: Boolean;
      procedure InitializePrinterSetup;
      procedure OpenFile;
      function  ReadFirstPage: Boolean;
      procedure ReadHeader;
      function  ReadPageEntry(aArchivePageNo: Longint; var aPageEntryRec: TppPageEntryRec): Boolean;
      function  ReadPageFromFile: Boolean;

    protected
      procedure SetDeviceType(const aDeviceName: String); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Cancel; override;
      function  HasParent: Boolean; override;
      procedure RequestPage(Sender: TObject; aPageRequest: TObject); override;
      procedure Reset; override;
      procedure Print; override;
      procedure PrintToDevices; override;

      property ArchivePageNo: Longint read FArchivePageNo;
      property ArchivePageCount: Longint read FArchivePageCount;

    published
      property AfterPrint;
      property AllowPrintToFile;
      property ArchiveFileName;
      property BeforePrint;
      property DeviceType;
      property Icon;
      property Language;
      property ModalCancelDialog;
      property ModalPreview;
      property OnCancel;
      property OnCancelDialogClose;
      property OnCancelDialogCreate;
      property OnDrawCommandClick: TppDrawCommandEvent read FOnDrawCommandClick write FOnDrawCommandClick;
      property OnInitializePrinterSetup: TNotifyEvent read FOnInitializePrinterSetup write FOnInitializePrinterSetup;
      property OnPreviewFormClose;
      property OnPreviewFormCreate;
      property OnPrintDialogClose;
      property OnPrintDialogCreate;
      property SavePrinterSetup;
      property ShowCancelDialog;
      property ShowPrintDialog;
      property TextFileName;
      property TextFileType;

  end; {class, TppArchiveReader}


implementation

uses
  ppFilDev;

{******************************************************************************
 *
 ** A R C H I V E   R E A D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppArchiveReader.Create }

constructor TppArchiveReader.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FArchivePageNo := 0;
  FArchivePageCount := 0;
  FFileStream := nil;
  FFirstPageRead := False;
  FGenerateCompleted := False;
  FHeaderSize := 0;
  FOnDrawCommandClick := nil;
  FPage := nil;
  FPageEntrySize := SizeOf(TppPageEntryRec);
  FPageListIndex := 0;
  FPageRequest := TppPageRequest.Create;
  FPrinterSetupInitialized := False;
  FStopPrinting := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppArchiveReader.Destroy }

destructor TppArchiveReader.Destroy;
begin

  CloseFile;

  FPageRequest.Free;

  FPage.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppArchiveReader.HasParent }

function TppArchiveReader.HasParent: Boolean;
begin
  Result := False;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppArchiveReader.DrawCommandClickEvent }

procedure TppArchiveReader.DrawCommandClickEvent(Sender: TObject);
begin
  if Assigned(FOnDrawCommandClick) then FOnDrawCommandClick(Self, Sender);
end; {procedure, DrawCommandClickEvent}

{------------------------------------------------------------------------------}
{ TppArchiveReader.InitializePrinterSetup }

procedure TppArchiveReader.InitializePrinterSetup;
begin

  {read the first page in order to set the printersetup default}
  if not(FPrinterSetupInitialized) or
    ((FPrinterSetupInitialized) and not(SavePrinterSetup)) then
    begin

      if ReadFirstPage then
        begin
          FPrinterSetupInitialized := True;

          PrinterSetup := FPage.PrinterSetup;
        end;
        
      DoOnInitializePrinterSetup;
    end;


end; {procedure, InitializePrinterSetup}

{------------------------------------------------------------------------------}
{ TppArchiveReader.DoOnInitializePrinterSetup }

procedure TppArchiveReader.DoOnInitializePrinterSetup;
begin
  if Assigned(FOnInitializePrinterSetup) then FOnInitializePrinterSetup(Self);
end; {procedure, DoOnInitializePrinterSetup}

{------------------------------------------------------------------------------}
{ TppArchiveReader.Print }

procedure TppArchiveReader.Print;
begin

  InitializePrinterSetup;

  inherited Print;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppArchiveReader.PrintToDevices }

procedure TppArchiveReader.PrintToDevices;
begin

  InitializePrinterSetup;

  inherited PrintToDevices;

end; {procedure, PrintToDevices}

{------------------------------------------------------------------------------}
{ TppArchiveReader.ReadFirstPage }

function TppArchiveReader.ReadFirstPage: Boolean;
begin

  Result := False;
  
  if FFirstPageRead then Exit;

  {clear indicators}
  FGenerateCompleted := False;
  FStopPrinting := False;

  FFirstPageRead := False;

  try
    {open the file}
    OpenFile;

    {read header info}
    ReadHeader;

    {determine starting page}
    GetFirstPage;

    if ReadPageFromFile then
      FFirstPageRead := True;

    Result := FFirstPageRead;

  except

    {close the archive file}
    CloseFile;

    raise;

  end; {try, finally}

end; {procedure, ReadFirstPage}

{------------------------------------------------------------------------------}
{ TppArchiveReader.SetDeviceType }

procedure TppArchiveReader.SetDeviceType(const aDeviceName: String);
begin
  if (aDeviceName = TppArchiveDevice.DeviceName) then Exit;

  inherited SetDeviceType(aDeviceName);

end; {procedure, SetDeviceType}

{------------------------------------------------------------------------------}
{ TppArchiveReader.Reset }

procedure TppArchiveReader.Reset;
begin

  inherited Reset;

  FPrinterSetupInitialized := False;
  FFirstPageRead := False;

  CloseFile;
  
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppArchiveReader.Cancel }

procedure TppArchiveReader.Cancel;
begin
  FStopPrinting := True;
end; {procedure, Cancel}

{------------------------------------------------------------------------------}
{ TppArchiveReader.RequestPage }

procedure TppArchiveReader.RequestPage(Sender: TObject; aPageRequest: TObject);
begin

  {if we're already reading pages, we're outta here}
  if Printing then Exit;

  Printing := True;

  {copy page request settings}
  FPageRequest.Assign(TppPageRequest(aPageRequest));

  {read the pages from the archive}
  Generate;

  Printing := False;

end; {procedure, RequestPage}

{------------------------------------------------------------------------------}
{ TppArchiveReader.Generate }

procedure TppArchiveReader.Generate;
begin

  {clear indicators}
  FGenerateCompleted := False;
  FStopPrinting := False;

  try
    {open file and read first page}
    if not(FFirstPageRead) then
      FGenerateCompleted := not(ReadFirstPage);

    {set the archive page no}
    GetFirstPage;

    {loop until all page requests granted or printing cancelled}
    while not(FGenerateCompleted) and not(FStopPrinting) do
      begin

        {send page to all devices}
        if ReadPageFromFile then
          begin
            {if printer setup has been changed, update it}
            if not(FPage.PrinterSetup.IsEqual(PrinterSetup)) then
              FPage.PrinterSetup.AssignJobDef(PrinterSetup);

            Publisher.ReceivePage(FPage);
          end;

        {advance to next page}
        GetNextPage;

        ProcessMessages;

      end; {while, pagesrequested}

  except

    {close the archive file}
    Reset;

    raise;

  end; {try, except }

end;  {procedure, Generate}

{------------------------------------------------------------------------------}
{ TppArchiveReader.ReadHeader }

procedure TppArchiveReader.ReadHeader;
begin

  FFileStream.Read(FHeaderSize, SizeOf(Longint));

  FArchivePageNo := 0;
  FArchivePageCount := (FHeaderSize - SizeOf(Longint)) div FPageEntrySize;

end; {procedure, ReadHeader}

{------------------------------------------------------------------------------}
{ TppArchiveReader.ReadPageEntry }

function TppArchiveReader.ReadPageEntry(aArchivePageNo: Longint; var aPageEntryRec: TppPageEntryRec): Boolean;
var
  llPosition: Longint;
begin

  Result := False;

  if (aArchivePageNo <= 0) then Exit;

  if (aArchivePageNo > FArchivePageCount) then Exit;


  llPosition := (FPageEntrySize * (aArchivePageNo - 1)) + SizeOf(Longint);

  if (llPosition >= FHeaderSize) then Exit;


  FFileStream.Seek(llPosition, 0);

  FFileStream.Read(aPageEntryRec, FPageEntrySize);

  Result := True;

end; {procedure, ReadPageEntry}

{------------------------------------------------------------------------------}
{ TppArchiveReader.ReadPageFromFile }

function TppArchiveReader.ReadPageFromFile: Boolean;
var
  lPageEntry: TppPageEntryRec;
  llPosition: Longint;
  
begin

  Result := False;

  {read page entry record from header area}
  if not(ReadPageEntry(FArchivePageNo, lPageEntry)) then Exit;


  llPosition := lPageEntry.Position + FHeaderSize;

  if (llPosition > FFileStream.Size) then Exit;


  FFileStream.Seek(llPosition, 0);

  {instantiate page and assign to page object}
  if (FPage <> nil) then
    FPage.Free;

  FPage := TppPage.Create(nil);

  FFileStream.ReadComponent(FPage);

  AssignClickableDrawCommandsToHandler;

  {set first & last page indicators}
  FPage.FirstPage := (FArchivePageNo = 1);
  FPage.LastPage  := (FArchivePageNo = FArchivePageCount);

  FPage.AbsolutePageNo    := FArchivePageNo;
  FPage.AbsolutePageCount := FArchivePageCount;

  FPage.Calculation := False;
  FPage.Final := True;

  Result := True;

end; {procedure, ReadPageFromFile}

{------------------------------------------------------------------------------}
{ TppArchiveReader.AssignClickableDrawCommandsToHandler }

procedure TppArchiveReader.AssignClickableDrawCommandsToHandler;
var
  liIndex: Integer;
begin
  for liIndex := 0 to FPage.DrawCommandCount - 1 do
    if FPage.DrawCommands[liIndex].Clickable then
      FPage.DrawCommands[liIndex].OnClick := DrawCommandClickEvent;
end; {procedure, AssignClickableDrawCommandsToHandler}

{------------------------------------------------------------------------------}
{ TppArchiveReader.OpenFile }

procedure TppArchiveReader.OpenFile;
var
  lMode: Word;
  lsMessage: String;
begin
  lMode := fmOpenRead or fmShareDenyWrite;

  {check to see if the file has already been opened}
  if Assigned(FFileStream) then
    CloseFile;

  {put exception handling here in case file can't be opened}
  try
    FFileStream := TFileStream.Create(ArchiveFileName, lMode);
  except
    lsMessage := ppLoadStr(67); {Unable to open file: <filename>.}
    lsMessage := ppSetMessageParameters(lsMessage);
    lsMessage := Format(lsMessage, [ArchiveFileName]);

    raise EPrintError.Create(lsMessage);
  end; {try, except}

end; {procedure, OpenFile}

{------------------------------------------------------------------------------}
{ TppArchiveReader.CloseFile }

procedure TppArchiveReader.CloseFile;
begin

  if FFileStream = nil then Exit;

  FFileStream.Free;
  FFileStream := nil;

  FPrinterSetupInitialized := False;
  FFirstPageRead := False;

end; {procedure, CloseFile}

{------------------------------------------------------------------------------}
{ TppArchiveReader.GetFirstPage }

procedure TppArchiveReader.GetFirstPage;
begin

  if FGenerateCompleted then Exit;

  {determine starting page no}
  case FPageRequest.PageSetting of
    psAll:
      FArchivePageNo := 1;

    psSinglePage:
      FArchivePageNo := FPageRequest.PageRequested;

    psFirstPage:
      FArchivePageNo := 1;

    psLastPage:
      FArchivePageNo := FArchivePageCount;

    psPageList:
      begin
        FPageListIndex := 0;

        if GetPageFromPageList then
          FArchivePageNo := FPageRequest.PageRequested
        else
          FGenerateCompleted := True;

      end;

   end; {case, page setting type}


end; {procedure, GetFirstPage}

{------------------------------------------------------------------------------}
{ TppArchiveReader.GetNextPage }

procedure TppArchiveReader.GetNextPage;
begin

  if FGenerateCompleted then Exit;

  case FPageRequest.PageSetting of
    psAll:
      if (FArchivePageNo >= FArchivePageCount) then
        FGenerateCompleted := True
      else
        FArchivePageNo := FArchivePageNo + 1;

    psSinglePage, psFirstPage, psLastPage:
      FGenerateCompleted := True;

    psPageList:
      if GetPageFromPageList then
        FArchivePageNo := FPageRequest.PageRequested
      else
        FGenerateCompleted := True;

   end; {case, page settting type}

end; {procedure, GetNextPage}

{------------------------------------------------------------------------------}
{ TppArchiveReader.GetPageFromPageList }

function TppArchiveReader.GetPageFromPageList: Boolean;
var
  lbInvalidPage: Boolean;
begin
  Result := True;

  if (FPageRequest.PageList = nil) then
    Result := False

  else if (FPageListIndex >= FPageRequest.PageList.Count) then
    Result := False

  else
    begin
      lbInvalidPage := True;

      while (FPageListIndex < FPageRequest.PageList.Count) and lbInvalidPage do
        begin
          FPageRequest.PageRequested := StrToInt(FPageRequest.PageList[FPageListIndex]);

          if (FPageRequest.PageRequested <= FArchivePageCount) then
            lbInvalidPage := False;

          Inc(FPageListIndex);

        end; {while, pages invalid}

    end;

end; {function, GetPageFromPageList}

end.
