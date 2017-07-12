{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppViewr;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms, Dialogs, Menus, StdCtrls,
  ExtCtrls, Mask, Buttons,
  ppComm, ppTypes, ppUtils, ppDevice, ppProd, ppDrwCmd, ppPrnDev, ppPrintr,
  ppReport;

type

  TppViewer = class;

  {this needs to be here, otherwise users will have to modify uses clause}
  TppZoomSettingType = (zsWholePage, zsPageWidth, zs100Percent, zsPercentage);

  { TppScreenDevice }
  TppScreenDevice = class(TppRasterDevice)
    private
      FCalculatedZoom: Integer;
      FCanvas: TCanvas;
      FPage: TppPage;
      FPageImage: TBitmap;
      FOffsetX: Integer;
      FOffsetY: Integer;
      FScaledPageHeight: Integer;
      FScaledPageWidth: Integer;
      FScaleX: Double;
      FScaleY: Double;
      FShowStatus: Boolean;
      FViewer: TppViewer;

      procedure CalculateScaledPageSize;
      function  GetAbsolutePageNo: Longint;
      function  GetAbsolutePageCount: Longint;
      function  GetPageDef: TppPageDef;
      procedure ResetPageImage;

    protected
      procedure DrawShape(aDrawShape: TppDrawShape);
      procedure DrawLine(aDrawLine: TppDrawLine);
      procedure DrawImage(aDrawImage: TppDrawImage);
      procedure DrawText(aDrawText: TppDrawText);
      procedure DirectDrawImage(aDrawImage: TppDrawImage);
      procedure SetStatus(const aMessage: String); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      class function DeviceName: String; override;

      procedure Cancel;
      procedure CancelJob; override;
      function  Draw(aDrawCommand: TppDrawCommand): Boolean; override;
      function  DrawUpdateable(aDrawCommand: TppDrawCommand): Boolean; override;
      procedure EndJob; override;
      procedure FirstPage;
      procedure GotoPage(aAbsolutePageNo: Longint);
      procedure LastPage;
      function  FinalPagesOnly: Boolean; override;
      function  FindClickableDrawCommand(aX, aY: Integer; var aDrawCommand: TppDrawCommand): Boolean;
      procedure ReceivePage(aPage: TppPage); override;
      procedure RenderPage;
      procedure Reset; override;
      procedure ScaleVertices(aDrawCommand: TppDrawCommand);
      procedure StartJob; override;

      property AbsolutePageNo: Longint read GetAbsolutePageNo;
      property AbsolutePageCount: Longint read GetAbsolutePageCount;
      property CalculatedZoom: Integer read FCalculatedZoom;
      property Canvas: TCanvas read FCanvas;
      property OffsetX: Integer read FOffsetX;
      property OffsetY: Integer read FOffsetY;
      property PageDef: TppPageDef read GetPageDef;
      property PageImage: TBitmap read FPageImage;
      property ScaleX: Double read FScaleX;
      property ScaleY: Double read FScaleY;
      property ShowStatus: Boolean read FShowStatus write FShowStatus default True;
      property Viewer: TppViewer read FViewer;

  end; {class, TppScreenDevice}

  { TppViewer }
  TppViewer = class(TCustomPanel)
  private
    FCurrentZoomSetting: TppZoomSettingType;                                            
    FDesignViewer: Boolean;
    FIncrementalPainting: Boolean;
    FNeedToUpdateScrollBars: Boolean;
    FPaintBox: TPaintBox;
    FProducer: TppProducer;
    FSaveCursor: TCursor;
    FScreenDevice: TppScreenDevice;
    FScrollBox: TScrollBox;
    FSettingCursor: Boolean;
    FZoomPercentage: Integer;
    FZoomSetting: TppZoomSettingType;

    {events}
    FOnStatusChange: TNotifyEvent;
    FOnPageChange: TNotifyEvent;
    FOnPrintStateChange: TNotifyEvent;
    FInitialized: Boolean;


    function  GetAbsolutePageNo: Longint;
    function  GetBusy: Boolean;
    function  GetCalculatedZoom: Integer;
    function  GetStatus: String;
    procedure PaintBoxMouseMoveEvent(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure PaintBoxClickEvent(Sender: TObject);
    procedure PaintBoxPaintEvent(Sender: TObject);
    procedure ResetCursor;

    procedure StartJobEvent(Sender: TObject);
    procedure CancelJobEvent(Sender: TObject);
    procedure EndJobEvent(Sender: TObject);

  protected
    {property handling routines}
    function  OkayToPaint: Boolean;
    procedure SetProducer(aProducer: TppProducer);
    procedure SetZoomPercentage(Value: Integer);
    procedure SetZoomSetting(Value: TppZoomSettingType);
    procedure Resize; override;
    procedure UpdateScrollBars;
    procedure WndProc(var Message: TMessage); override;
    procedure ScrollboxMouseWheelEvent(Sender: TObject; Shift: TShiftState;
                                       WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Loaded; override;

    procedure Initialize;
    procedure Cancel;
    procedure DoOnPageChange;
    procedure DoOnStatusChange;

    procedure DisplayAutoSearchDialog;
    procedure FirstPage;
    function  GetDevice: TppDevice;
    procedure GotoPage(aAbsolutePageNo: Longint);
    procedure LastPage;
    procedure NextPage;
    procedure Print;
    procedure PriorPage;
    procedure RefreshPage;
    procedure Reset;

    property AbsolutePageNo: Longint read GetAbsolutePageNo;
    property Busy: Boolean read GetBusy;
    property CalculatedZoom: Integer read GetCalculatedZoom;
    property DesignViewer: Boolean read FDesignViewer write FDesignViewer;
    property IncrementalPainting: Boolean read FIncrementalPainting write FIncrementalPainting;
    property PaintBox: TPaintBox read FPaintBox;
    property ScrollBox: TScrollbox read FScrollBox;
    property ScreenDevice: TppScreenDevice read FScreenDevice;
    property Status: String read GetStatus;

  published
    property Align;
    property Alignment;
{$IFDEF Delphi4}
    property Anchors;
{$ENDIF}
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BorderWidth;
    property BorderStyle;
    property Ctl3D;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Report: TppProducer read FProducer write SetProducer;
    property Visible;
    property ZoomPercentage: Integer read FZoomPercentage write SetZoomPercentage;
    property ZoomSetting: TppZoomSettingType read FZoomSetting write SetZoomSetting;

    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPageChange: TNotifyEvent read FOnPageChange  write FOnPageChange;
    property OnPrintStateChange: TNotifyEvent read FOnPrintStateChange write FOnPrintStateChange;
    property OnResize;
    property OnStatusChange: TNotifyEvent read FOnStatusChange  write FOnStatusChange;
  end; {class, TppViewer}


implementation


{$IFDEF Delphi3}
{$ELSE}
{$R ppViewr.res}
{$ENDIF}

{******************************************************************************
 *
 ** V I E W E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppViewer.Create }

constructor TppViewer.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FInitialized := False;

  {set style for viewer controls}
  Font.Name  := 'MS Sans Serif';
  Font.Size  := 8;
  Font.Style := [];
  Font.Color := clBtnShadow;

  Color   := clBtnShadow;

  Height := 120;
  Width  := 320;

  FCurrentZoomSetting     := zsWholePage;
  FDesignViewer           := False;
  FIncrementalPainting    := False;
  FNeedToUpdateScrollBars := True;
  FOnPageChange           := nil;
  FOnStatusChange         := nil;
  FScrollBox              := nil;
  FSettingCursor          := False;
  FPaintBox               := nil;
  FZoomSetting            := zsWholePage;
  FZoomPercentage         := 100;

  FScreenDevice            := TppScreenDevice.Create(Self);
  FScreenDevice.OnStartJob  := StartJobEvent;
  FScreenDevice.OnEndJob    := EndJobEvent;
  FScreenDevice.OnCancelJob := CancelJobEvent;

end; {constructor, TppViewer}

{------------------------------------------------------------------------------}
{ TppViewer.Destroy }

destructor TppViewer.Destroy;
begin

  {free screen device}
  FScreenDevice.Free;

  {free paintbox}
  FPaintBox.Free;

  {free parent scrollbox last}
  FScrollBox.Free;

  inherited Destroy;

end; {destructor, TppViewer}

{------------------------------------------------------------------------------}
{ TppViewer.SetProducer }

procedure TppViewer.SetProducer(aProducer: TppProducer);
begin
  FProducer := aProducer;

  if (FProducer <> nil) then
    FScreenDevice.Publisher := FProducer.Publisher
  else
    FScreenDevice.Publisher := nil;

end; {procedure, SetProducer}

{------------------------------------------------------------------------------}
{ TppViewer.Reset}

procedure TppViewer.Reset;
begin
  FScreenDevice.Reset;
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppViewer.Cancel }

procedure TppViewer.Cancel;
begin
  FScreenDevice.Cancel;
end; {procedure, Cancel}

{------------------------------------------------------------------------------}
{ TppViewer.DisplayAutoSearchDialog}

procedure TppViewer.DisplayAutoSearchDialog;
begin
  if (FProducer.DisplayAutoSearchDialog) then
    begin
      FScreenDevice.Publisher.Reset;
      
      FScreenDevice.Reset;

      FScreenDevice.MakePageRequest;
    end;
end; {procedure, DisplayAutoSearchDialog}

{------------------------------------------------------------------------------}
{ TppViewer.Print}

procedure TppViewer.Print;
var
  lsSaveDevice: String;
  lSavePrinterSetup: TppPrinterSetup;
  lbShowAutoSearchDialog: Boolean;
begin

  if FScreenDevice.Busy then Exit;

  if (FProducer <> nil) then
    begin

      {detach screen device}
      FScreenDevice.Publisher := nil;

      {set current page}
      if FScreenDevice.AbsolutePageNo = 0 then
        FProducer.CurrentPage := 1
      else
        FProducer.CurrentPage := FScreenDevice.AbsolutePageNo;

      {print the report}
      lsSaveDevice := FProducer.DeviceType;
      lSavePrinterSetup := TppPrinterSetup.Create(nil);
      lSavePrinterSetup.Assign(FProducer.PrinterSetup);

      lbShowAutoSearchDialog := FProducer.ShowAutoSearchDialog;

      try
        FProducer.ShowAutoSearchDialog := False;
        FProducer.DeviceType := TppPrinterDevice.DeviceName;
        FProducer.Print;

      finally
        FProducer.DeviceType := lsSaveDevice;
        FProducer.ShowAutoSearchDialog := lbShowAutoSearchDialog;
      end;

      {re-attach screen device}
      FScreenDevice.Publisher := FProducer.Publisher;

      {the printer settings have been changed, thus we must regen to
      the viewer}
      if not(lSavePrinterSetup.IsEqual(FProducer.PrinterSetup)) then
        begin
          FScreenDevice.Reset;

          FScreenDevice.MakePageRequest;
        end;

      lSavePrinterSetup.Free;

    end;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppViewer.GetAbsolutePageNo }

function TppViewer.GetAbsolutePageNo: Longint;
begin
  Result := FScreenDevice.AbsolutePageNo;
end;

{------------------------------------------------------------------------------}
{ TppViewer.GetDevice }

function  TppViewer.GetDevice: TppDevice;
begin
  Result := FScreenDevice;
end;

{------------------------------------------------------------------------------}
{ TppViewer.GetCalculatedZoom }

function  TppViewer.GetCalculatedZoom: Integer;
begin
  Result := FScreenDevice.CalculatedZoom;
end;

{------------------------------------------------------------------------------}
{ TppViewer.GetStatus }

function TppViewer.GetStatus: String;
begin
  Result := FScreenDevice.Status;
end;

{------------------------------------------------------------------------------}
{ TppViewer.GetBusy }

function TppViewer.GetBusy: Boolean;
begin
  Result := FScreenDevice.Busy;
end;

{------------------------------------------------------------------------------}
{ TppViewer.WndProc }

procedure TppViewer.WndProc(var Message: TMessage);
begin

 if Message.Msg = CM_CURSORCHANGED then
    begin
      if (FPaintBox <> nil) then
        FPaintBox.Cursor := Cursor;

      if not(FSettingCursor) then
        FSaveCursor := Cursor;
    end;

 inherited WndProc(Message);

end;

{------------------------------------------------------------------------------}
{ TppViewer.Initialize }

procedure TppViewer.Initialize;
begin

  if FInitialized then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FInitialized := True;

  {create paint boxes}
  FScrollBox  := TScrollBox.Create(Self);

{$IFDEF Delphi4}
  FScrollBox.OnMouseWheel := ScrollboxMouseWheelEvent;
{$ENDIF}

  FPaintBox   := TPaintBox.Create(Self);

  {set parent relationships}
  FScrollBox.Parent := Self;
  FScrollBox.VertScrollbar.Tracking := True;
  FScrollBox.HorzScrollbar.Tracking := True;

  FPaintBox.Parent  := FScrollBox;

  {configure zoom & page paintboxes}
  FScrollBox.Visible := False;
  FScrollBox.Align   := alClient;

  FPaintBox.Align  := alClient;
  FPaintBox.Color  := clBtnShadow;

  FScrollBox.Visible := True;

  {assign paint routine to paint boxes}
  FPaintBox.OnClick     := PaintBoxClickEvent;
  FPaintBox.OnMouseMove := PaintBoxMouseMoveEvent;
  FPaintBox.OnPaint     := PaintBoxPaintEvent;
  FPaintBox.Cursor      := Cursor;

  {FPaintBox.OnClick     := OnClick;}
  FPaintBox.OnDblClick  := OnDblClick;
  FPaintBox.OnDragDrop  := OnDragDrop;
  FPaintBox.OnDragOver  := OnDragOver;
  FPaintBox.OnMouseDown := OnMouseDown;
  {FPaintBox.OnMouseMove := OnMouseMove;}
  FPaintBox.OnMouseUp   := OnMouseUp;

  FSaveCursor := Cursor;

  {hide paintbox at design-time}
  if (csDesigning in ComponentState) then
    FPaintBox.Visible := False;

  Invalidate;

end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TppViewer.Loaded }

procedure TppViewer.Loaded;
begin

  inherited Loaded;

  Initialize;

end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TppViewer.OkayToPaint }

function TppViewer.OkayToPaint: Boolean;
begin

  if (csDesigning in ComponentState) or FIncrementalPainting then
    Result := False
  else
    Result := True;


 if not FInitialized then
    Initialize;


end; {procedure, OkayToPaint}

{------------------------------------------------------------------------------}
{ TppViewer.RefreshPage }

procedure TppViewer.RefreshPage;
begin
  PaintBoxPaintEvent(Self);
end; {procedure, RefreshViewer}

{------------------------------------------------------------------------------}
{ TppViewer.DoOnPageChange }

procedure TppViewer.DoOnPageChange;
begin
  if Assigned(FOnPageChange) then FOnPageChange(Self);
end; {procedure, DoOnPageChange}

{------------------------------------------------------------------------------}
{ TppViewer.DoOnStatusChange }

procedure TppViewer.DoOnStatusChange;
begin
  if Assigned(FOnStatusChange) then FOnStatusChange(Self);
end; {procedure, DoOnStatusChange}

{------------------------------------------------------------------------------}
{ TppViewer.Resize }

procedure TppViewer.Resize;
begin
  inherited Resize;

  {if you remove this, the Design-Time Viewer will GPF}
  if (csDestroying in ComponentState) then Exit;

  {check reading only here, not loading}
  if (csReading in ComponentState) then Exit;

  if not(OkayToPaint) then Exit;

  FScreenDevice.RenderPage;


  UpdateScrollBars;

  {indicate to preview form that page has changed}
  if  not (csLoading in ComponentState) then
    DoOnPageChange;

  {note: this fixes a bug related to resizign when PageWidth setting}
  if (FCurrentZoomSetting = zsPageWidth) then
    PaintBoxPaintEvent(Self);


end; {procedure, Resize}

{------------------------------------------------------------------------------}
{ TppViewer.PaintBoxPaintEvent }

procedure TppViewer.PaintBoxPaintEvent(Sender: TObject);
var
  lCanvas: TCanvas;

begin

  if not(OkayToPaint) then Exit;

  lCanvas := FPaintBox.Canvas;

  lCanvas.CopyRect(lCanvas.ClipRect, FScreenDevice.PageImage.Canvas, lCanvas.ClipRect);

end; {procedure, PaintBoxPaintEvent}

{------------------------------------------------------------------------------}
{ TppViewer.PaintBoxClickEvent }

procedure TppViewer.PaintBoxClickEvent(Sender: TObject);
var
  lPoint: TPoint;
  lDrawCommand: TppDrawCommand;
begin
  GetCursorPos(lPoint);

  lPoint := FPaintBox.ScreenToClient(lPoint);
  lDrawCommand := nil;
  
  if FScreenDevice.FindClickableDrawCommand(lPoint.X, lPoint.Y, lDrawCommand) then
    begin
      lDrawCommand.DoOnClick;

      if lDrawCommand.RedrawPage then
        begin
          lDrawCommand.RedrawPage := False;

          {tell publisher we just want a single page}
          FScreenDevice.PageRequest.PageSetting := psSinglePage;
          FScreenDevice.PageRequest.PageRequested := AbsolutePageNo;

          FScreenDevice.MakePageRequest;

          {reset cursor}
          ResetCursor;
        end;
    end;

  {trigger panels onclick event}
  Click;

end; {procedure, PaintBoxClickEvent}

{------------------------------------------------------------------------------}
{ TppViewer.ResetCursor }

procedure TppViewer.ResetCursor;
var
  lPoint: TPoint;
begin

  GetCursorPos(lPoint);

  SetCursorPos(lPoint.X - 1, lPoint.Y - 1);
  Application.ProcessMessages;

  SetCursorPos(lPoint.X, lPoint.Y);
  Application.ProcessMessages;

end; {procedure, ResetCursor}

{------------------------------------------------------------------------------}
{ TppViewer.PaintBoxMouseMoveEvent }

procedure TppViewer.PaintBoxMouseMoveEvent(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var
  lPoint: TPoint;
  lDrawCommand: TppDrawCommand;
  lbFound: Boolean;
begin
  GetCursorPos(lPoint);

  lPoint := ScreenToClient(lPoint);

  FSettingCursor := True;

  lbFound := FScreenDevice.FindClickableDrawCommand(X, Y, lDrawCommand);

  {force cursor to change}
  Cursor := FSaveCursor;

  if lbFound then
    Cursor := crHandPoint;

  FSettingCursor := False;

  {trigger panels mouse move event}
  MouseMove(Shift, X, Y);

end; {procedure, PaintBoxMouseMoveEvent}

{------------------------------------------------------------------------------}
{ TppViewer.SetZoomSetting }

procedure TppViewer.SetZoomSetting(Value: TppZoomSettingType);
begin

  FZoomSetting := Value;

  {check reading only here, not loading}
  if (csReading in ComponentState) then Exit;

  if not(OkayToPaint) then Exit;

  if not Visible then
    begin
      Invalidate;
      Exit;
    end;

  {paint uses this var to get back in sync}
  FCurrentZoomSetting := Value;

  {set zoom}
  FPaintBox.Visible := False;

  FScreenDevice.RenderPage;

  FNeedToUpdateScrollBars := True;

  UpdateScrollBars;

  FPaintBox.Visible := True;

end; {procedure, SetZoomSetting}

{------------------------------------------------------------------------------}
{ TppViewer.SetZoomPercentage }

procedure TppViewer.SetZoomPercentage(Value: Integer);
begin

  if (Value <= 250) then
    FZoomPercentage := Value
  else
    FZoomPercentage := 250;

  SetZoomSetting(zsPercentage);

end; {procedure, SetZoomPercentage}

{------------------------------------------------------------------------------}
{ TppViewer.UpdateScrollBars }

procedure TppViewer.UpdateScrollBars;
begin
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if not OkayToPaint then Exit;

  {set horizontal scroll bar}
  if FScreenDevice.PageImage.Width > FScrollBox.Width then
    begin
      FScrollBox.HorzScrollBar.Range := FScreenDevice.PageImage.Width;
      FScrollBox.HorzScrollBar.Visible := True;
    end
  else
   begin
      FScrollBox.HorzScrollBar.Range := ClientWidth;
      FScrollBox.HorzScrollBar.Visible := False;
   end;

  {set vertical scroll bar}
  if FScreenDevice.PageImage.Height > FScrollBox.Height then
    begin
      FScrollBox.VertScrollBar.Range := FScreenDevice.PageImage.Height;
      FScrollBox.VertScrollBar.Visible := True;
    end
  else
   begin
      FScrollBox.VertScrollBar.Range := ClientHeight;
      FScrollBox.VertScrollBar.Visible := False;
   end;

  {reposition thumbs}
  if FNeedToUpdateScrollBars then
    begin
      FScrollBox.HorzScrollBar.Position := 0;
      FScrollBox.VertScrollBar.Position := 0;

      FNeedToUpdateScrollBars := False;
    end;

end; {procedure, UpdateScrollBars}

{------------------------------------------------------------------------------}
{ TppViewer.GotoPage }

procedure TppViewer.GotoPage(aAbsolutePageNo: Longint);
begin
  FScreenDevice.GotoPage(aAbsolutePageNo);
end; {function, GotoPage}

{------------------------------------------------------------------------------}
{ TppViewer.NextPage }

procedure TppViewer.NextPage;
begin

  if (FScreenDevice.FPage.LastPage) then Exit;

  FScreenDevice.GotoPage(FScreenDevice.AbsolutePageNo + 1);

end; {procedure, NextPage}

{------------------------------------------------------------------------------}
{ TppViewer.PriorPage }

procedure TppViewer.PriorPage;
begin

  if (FScreenDevice.FPage.AbsolutePageNo = 1) then Exit;

  FScreenDevice.GotoPage(FScreenDevice.AbsolutePageNo - 1);

end; {procedure, PriorPage}

{------------------------------------------------------------------------------}
{ TppViewer.FirstPage }
procedure TppViewer.FirstPage;
begin
  FScreenDevice.FirstPage;
end; {procedure, FirstPage}

{------------------------------------------------------------------------------}
{ TppViewer.LastPage }

procedure TppViewer.LastPage;
begin
  FScreenDevice.LastPage;
end; {procedure, LastPage}


{------------------------------------------------------------------------------}
{ TppViewer.ScrollboxMouseWheelEvent }

procedure TppViewer.ScrollboxMouseWheelEvent(Sender: TObject; Shift: TShiftState;
                                              WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
 { if (ssCtrl in Shift) then
     ZoomPercentage := ZoomPercentage + (WheelDelta div 10)
  else
     FScrollBox.ScrollBy(WheelDelta, 0);
  }
 { if Assigned(FOnMouseWheel) then FOnMouseWheel(Self);}
end; {procedure, ScrollboxMouseWheelEvent}

{------------------------------------------------------------------------------}
{ TppViewer.StartJobEvent }

procedure TppViewer.StartJobEvent(Sender: TObject);
begin
  if Assigned(FOnPrintStateChange) then FOnPrintStateChange(Self);
end; {procedure, StartJobEvent}

{------------------------------------------------------------------------------}
{ TppViewer.EndJobEvent }

procedure TppViewer.EndJobEvent(Sender: TObject);
begin
  if Assigned(FOnPrintStateChange) then FOnPrintStateChange(Self);
end; {procedure, EndJobEvent}

{------------------------------------------------------------------------------}
{ TppViewer.CancelJobEvent }

procedure TppViewer.CancelJobEvent(Sender: TObject);
begin
  if Assigned(FOnPrintStateChange) then FOnPrintStateChange(Self);
end; {procedure, CancelJobEvent}

{******************************************************************************
 *
 ** S C R E E N   D E V I C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppScreenDevice.Create }

constructor TppScreenDevice.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FPageImage := TBitMap.Create;
  FShowStatus := True;
  FPage := TppPage.Create(nil);

  if (aOwner is TppViewer) then
    begin
      FViewer := TppViewer(aOwner);

      FPageImage.Width  := FViewer.Width;
      FPageImage.Height := FViewer.Height;
    end

  else
    FViewer := nil;

  {tell publisher we just want the first page}
  PageRequest.PageSetting := psFirstPage;
  PageRequest.PageRequested := 1;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppScreenDevice.Destroy }

destructor TppScreenDevice.Destroy;
begin

  FPageImage.Free;

  FPage.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppScreenDevice.DeviceName }

class function TppScreenDevice.DeviceName: String;
begin
  Result := 'Screen';
end; {class function, DeviceName}


{------------------------------------------------------------------------------}
{ TppScreenDevice.Notify}

procedure TppScreenDevice.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  {clear report property of viewer}
  if (aCommunicator = Publisher) and (aOperation = ppopRemove) then
  
    if (FViewer <> nil) then
      begin
        FViewer.FProducer := nil;
        FViewer.Reset;
      end;


  {this clears the publisher property}
  inherited Notify(aCommunicator, aOperation);

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppScreenDevice.StartJob }

procedure TppScreenDevice.StartJob;
begin

  inherited StartJob;

  SetStatus(ppLoadStr(2)); {'Accessing data...'}

  FPage.Clear;
  
end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppScreenDevice.CancelJob }

procedure TppScreenDevice.CancelJob;
begin

  inherited CancelJob;

  SetStatus(FPage.PageNoDescription);

end; {procedure, CancelJob}

{------------------------------------------------------------------------------}
{ TppScreenDevice.EndJob }

procedure TppScreenDevice.EndJob;
begin

  if (Publisher.ReportCompleted) then
    SetStatus(FPage.PageSetDescription)
  else
    SetStatus(FPage.PageNoDescription);

  inherited EndJob;

end; {procedure, CancelJob}

{------------------------------------------------------------------------------}
{ TppScreenDevice.Reset }

procedure TppScreenDevice.Reset;
begin

  inherited Reset;

  ResetPageImage;

  PageRequest.PageSetting := psFirstPage;
  PageRequest.PageRequested := 1;

end;  {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppScreenDevice.ResetPageImage }

procedure TppScreenDevice.ResetPageImage;
begin

  FPage.FreeDrawCommands;
  FPageImage.Free;

  FPageImage := TBitmap.Create;

  if (FViewer <> nil) then
    begin
      if (FViewer.Report <> nil) then
        FPage.PrinterSetup := FViewer.Report.PrinterSetup;
        
      FPageImage.Width := FViewer.Width;
      FPageImage.Height := FViewer.Height;

      RenderPage;
      
      FViewer.RefreshPage;
    end;

end; {procedure, ResetPageImage}

{------------------------------------------------------------------------------}
{ TppScreenDevice.Cancel }

procedure TppScreenDevice.Cancel;
begin
  if (FViewer = nil) or (FViewer.Report = nil) then Exit;

  FViewer.Report.Cancel;

end; {procedure, Cancel}

{------------------------------------------------------------------------------}
{ TppScreenDevice.GetAbsolutePageNo }

function TppScreenDevice.GetAbsolutePageNo;
begin
  Result := FPage.AbsolutePageNo;
end; {function, GetPageDef}

{------------------------------------------------------------------------------}
{ TppScreenDevice.GetAbsolutePageCount }

function TppScreenDevice.GetAbsolutePageCount;
begin
  Result := FPage.AbsolutePageCount;
end; {function, GetPageDef}

{------------------------------------------------------------------------------}
{ TppScreenDevice.GetPageDef }

function TppScreenDevice.GetPageDef;
begin
  Result := FPage.PageDef;
end; {function, GetPageDef}

{------------------------------------------------------------------------------}
{ TppScreenDevice.FinalPagesOnly }

function TppScreenDevice.FinalPagesOnly: Boolean;
begin
  Result := False;
end; {function, FinalPagesOnly}

{------------------------------------------------------------------------------}
{ TppScreenDevice.ReceivePage }

procedure TppScreenDevice.ReceivePage(aPage: TppPage);
var
  lsMessage: String;
begin

  inherited ReceivePage(aPage);

  if (csDesigning in ComponentState) and not(FViewer.DesignViewer) then Exit;


  if IsRequestedPage then
    begin

      if Publisher.ReportCompleted then
        begin
          lsMessage := ppLoadStr(10); {'Drawing page 1 of 15 for <documentname>'}
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), IntToStr(aPage.AbsolutePageCount), aPage.DocumentName]);
        end
      else
        begin
          lsMessage := ppLoadStr(4); {'Calculating page 1 for <documentname>'}
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), aPage.DocumentName]);
        end;

      SetStatus(lsMessage);

      if not(IsMessagePage) then
        begin
          FPage.Assign(aPage);

          if (FViewer = nil) then Exit;
          
          RenderPage;

          FViewer.UpdateScrollBars;

          FViewer.RefreshPage;

          if Publisher.ReportCompleted then
            SetStatus(aPage.PageSetDescription)
          else
            SetStatus(aPage.PageNoDescription);

          {notify viewer of page change}
          if FViewer <> nil then
            FViewer.DoOnPageChange;
        end

    end

  else if (aPage.Calculation) then
    begin
      lsMessage := ppLoadStr(4); {'Calculating Page 1 of 15 for <documentname>'}
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), aPage.DocumentName]);

      SetStatus(lsMessage);

      {update current page}
      if (FPage.AbsolutePageCount <> aPage.AbsolutePageCount) then
        begin
          FPage.AbsolutePageCount := aPage.AbsolutePageCount;

          if (FPage.ControlGroupBreakNo = aPage.ControlGroupBreakNo) then
            FPage.PageCount := aPage.PageCount;

          if FPage.HasUpdateables then
            begin
              FPage.Update(Self);
              {allow page canvas to painted}
              Application.ProcessMessages;
            end;
        end;
    end;

end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppScreenDevice.SetStatus }

procedure TppScreenDevice.SetStatus(const aMessage: String);
begin
  if not(FShowStatus) then Exit;

  inherited SetStatus(aMessage);

  if (FViewer <> nil) then
    FViewer.DoOnStatusChange;

  Application.ProcessMessages; {force update}

end; {procedure, SetStatus}

{------------------------------------------------------------------------------}
{ TppScreenDevice.FirstPage }

procedure TppScreenDevice.FirstPage;
begin
  if (Busy) then Exit;

  if (FPage.AbsolutePageNo = 1) then Exit;

  {tell publisher we just want a single page}
  PageRequest.PageSetting := psFirstPage;

  MakePageRequest;

end; {function, FirstPage}

{------------------------------------------------------------------------------}
{ TppScreenDevice.LastPage }

procedure TppScreenDevice.LastPage;
begin
  if (Busy) then Exit;

  if (FPage.LastPage) then Exit;

  {tell publisher we just want a single page}
  PageRequest.PageSetting := psLastPage;

  MakePageRequest;

end; {function, LastPage}

{------------------------------------------------------------------------------}
{ TppScreenDevice.GotoPage }

procedure TppScreenDevice.GotoPage(aAbsolutePageNo: Longint);
begin
  if (Busy) then Exit;

  if (FPage.AbsolutePageNo = aAbsolutePageNo) then Exit;

  {tell publisher we just want a single page}
  PageRequest.PageSetting := psSinglePage;
  PageRequest.PageRequested := aAbsolutePageNo;

  MakePageRequest;
end; {function, GotoPage}

{------------------------------------------------------------------------------}
{ TppScreenDevice.RenderPage }

procedure TppScreenDevice.RenderPage;
var
 lRect: TRect;
 lPageDef: TppPageDef;
 
begin

  lPageDef := FPage.PageDef;

  if (lPageDef.mmWidth = 0) or (lPageDef.mmHeight = 0) then Exit;

  
  {clear bitmap of previous drawing}
  if FPageImage <> nil then
    FPageImage.Free;

  FPageImage := TBitmap.Create;

  FCanvas := FPageImage.Canvas;

  {calculate scaled page size}
  CalculateScaledPageSize;

  {draw background}
  FCanvas.Brush.Style := bsSolid;
  FCanvas.Brush.Color := clBtnShadow;
  FCanvas.FillRect(Rect(0, 0, FPageImage.Width, FPageImage.Height));

  {calculate scaled page boundaries}
  lRect.Left   := (FPageImage.Width - FScaledPageWidth) div 2;
  lRect.Top    := (FPageImage.Height - FScaledPageHeight) div 2;
  lRect.Right  := lRect.Left + FScaledPageWidth;
  lRect.Bottom := lRect.Top + FScaledPageHeight;

  {draw page}
  FCanvas.Brush.Style := bsSolid;
  FCanvas.Brush.Color := clWindow;
  FCanvas.Rectangle(lRect.Left, lRect.Top, lRect.Right, lRect.Bottom);

  {calculate scaling factors for drawing rest of page}
  FScaleX := FScaledPageWidth / lPageDef.spWidth;
  FScaleY := FScaledPageHeight / lPageDef.spHeight;

  {calculate offsets for each printing rect}
  FOffsetY := lRect.Top;
  FOffsetX := lRect.Left;

  DrawPage(FPage);

end; {procedure, RenderPage}

{------------------------------------------------------------------------------}
{ TppScreenDevice.CalculateScaledPageSize}

procedure TppScreenDevice.CalculateScaledPageSize;
var
 ldRatio: Double;
 liDeadArea: Integer;
 lPageDef: TppPageDef;
 liQuarterInch: Integer;
 liHalfInch: Integer;
 liEighthInch: Integer;
 liScrollBarMargin: Integer;
 ldPercentage: Double;
begin

  liEighthInch := Round(0.125 * Screen.PixelsPerInch);
  liQuarterInch := Round(0.25 * Screen.PixelsPerInch);
  liHalfInch := Round(0.5 * Screen.PixelsPerInch);

  lPageDef := FPage.PageDef;

  if (FViewer.ZoomSetting = zs100Percent) then

    begin
      {set area around page border}
      liDeadArea := liQuarterInch;

      {full page size}
      FPageImage.Height := lPageDef.spHeight + (liDeadArea * 2);
      FPageImage.Width  := lPageDef.spWidth + (liDeadArea * 2);

      FScaledPageHeight := lPageDef.spHeight;
      FScaledPageWidth := lPageDef.spWidth;

    end {if, ZoomSetting = zs100Percent}

  else if (FViewer.ZoomSetting = zsWholePage) then

    begin
      {get size of viewable area}
      FPageImage.Height := FViewer.ScrollBox.Height;
      FPageImage.Width  := FViewer.ScrollBox.Width;

      {compute page rectangle size}
      ldRatio := lPageDef.spWidth / lPageDef.spHeight;

      FScaledPageHeight := FViewer.ScrollBox.Height - liQuarterInch;
      FScaledPageWidth := Round(ldRatio * FScaledPageHeight);

      {reduce width & height until entire page fits in viewable area}
      if (FPageImage.Width > liHalfInch) and (FPageImage.Height > liHalfInch) then
        while (FScaledPageWidth >= FPageImage.Width) do
          begin
            FScaledPageHeight := FScaledPageHeight - liQuarterInch;
            FScaledPageWidth := Round(ldRatio * FScaledPageHeight);
          end;

    end {if, ZoomSetting = zsWholePage}

  else if (FViewer.ZoomSetting = zsPageWidth) then

    begin
      {compute page rectangle size}
      ldRatio := lPageDef.spWidth / lPageDef.spHeight;

      liDeadArea := liEighthInch;
      liScrollBarMargin := Round(Screen.PixelsPerInch * 0.1458);

      {calculate height as less than viewable area}
      FScaledPageWidth := FViewer.ScrollBox.Width - (liDeadArea * 2) - liScrollBarMargin;
      FScaledPageHeight := Round(FScaledPageWidth / ldRatio);

      {this may or may not force a scroll bar}
      FPageImage.Height := FScaledPageHeight + (liDeadArea * 2);
      FPageImage.Width  := FScaledPageWidth + (liDeadArea * 2);

      {if height ends up less than viewing area, extend height}
      if FPageImage.Height < FViewer.ScrollBox.Height then
        FPageImage.Height := FViewer.ScrollBox.Height;

    end {if, ZoomSetting = zsPageWidth}

  else if (FViewer.ZoomSetting = zsPercentage) then

    begin
      ldPercentage := FViewer.ZoomPercentage / 100;

      {compute page rectangle size}
      FScaledPageHeight := Round(lPageDef.spHeight * ldPercentage);
      FScaledPageWidth := Round(lPageDef.spWidth * ldPercentage);

      {set area around page border}
      liDeadArea := liQuarterInch;

      {set page image height, greater of scaled page and scrollbox}
      if (FScaledPageHeight + (liDeadArea * 2)) > FViewer.ScrollBox.Height then
        FPageImage.Height := FScaledPageHeight + (liDeadArea * 2)
      else
        FPageImage.Height := FViewer.ScrollBox.Height;

      {set page image width, greater of scaled page and scrollbox}
      if (FScaledPageWidth + (liDeadArea * 2)) > FViewer.ScrollBox.Width then
        FPageImage.Width  := FScaledPageWidth + (liDeadArea * 2)
      else
        FPageImage.Width := FViewer.ScrollBox.Width

    end; {if, ZoomSetting = zsPercentage}

    FCalculatedZoom := Round((FScaledPageHeight / lPageDef.spHeight) * 100);

end; {procedure, CalculateScaledPageSize}

{------------------------------------------------------------------------------}
{ TppScreenDevice.ScaleVertices}

procedure TppScreenDevice.ScaleVertices(aDrawCommand: TppDrawCommand);
var
  liLeft: Integer;
  liTop: Integer;
  liWidth: Integer;
  liHeight: Integer;
begin

  liLeft   := Trunc(ppFromMMThousandths(aDrawCommand.Left,   utScreenPixels, pprtHorizontal, nil));
  liTop    := Trunc(ppFromMMThousandths(aDrawCommand.Top,    utScreenPixels, pprtVertical,   nil));
  liWidth  := Trunc(ppFromMMThousandths(aDrawCommand.Width,  utScreenPixels, pprtHorizontal, nil));
  liHeight := Trunc(ppFromMMThousandths(aDrawCommand.Height, utScreenPixels, pprtVertical,   nil));

  {scale the bounding rectangle}
  aDrawCommand.DrawLeft   := FOffsetX + Round(liLeft * FScaleX);
  aDrawCommand.DrawTop    := FOffsetY + Round(liTop * FScaleY);
  aDrawCommand.DrawRight  := FOffsetX + Round((liLeft + liWidth) * FScaleX);
  aDrawCommand.DrawBottom := FOffsetY + Round((liTop + liHeight) * FScaleY);

end; {procedure, ScaleVertices}

{------------------------------------------------------------------------------}
{ TppScreenDevice.DrawUpdateable }

function TppScreenDevice.DrawUpdateable(aDrawCommand: TppDrawCommand): Boolean;
var
  lCanvas: TCanvas;
  lbTransparent: Boolean;
begin

  {make drawcommand opaque in order to erase previous version}
  if (aDrawCommand is TppDrawText) then
    lbTransparent := TppDrawText(aDrawCommand).Transparent
  else
    lbTransparent := False;

  if lbTransparent then
    TppDrawText(aDrawCommand).Transparent := False;

  Result := Draw(aDrawCommand);

  if lbTransparent then
    TppDrawText(aDrawCommand).Transparent := True;


  if not Result then Exit;

  lCanvas := FViewer.PaintBox.Canvas;

  FViewer.IncrementalPainting := True;

  try
    lCanvas.CopyRect(aDrawCommand.DrawRect, FPageImage.Canvas, aDrawCommand.DrawRect);
  finally
    FViewer.IncrementalPainting := False;
  end;

end; {function, DrawUpdateable}

{------------------------------------------------------------------------------}
{ TppScreenDevice.Draw }

function TppScreenDevice.Draw(aDrawCommand: TppDrawCommand): Boolean;
begin
  Result := True;

  ScaleVertices(aDrawCommand);

  if (aDrawCommand is TppDrawText) then
    DrawText(TppDrawText(aDrawCommand))

  else if (aDrawCommand is TppDrawCalc) then
    DrawText(TppDrawText(aDrawCommand))

  else if (aDrawCommand is TppDrawShape) then
    DrawShape(TppDrawShape(aDrawCommand))

  else if (aDrawCommand is TppDrawLine) then
    DrawLine(TppDrawLine(aDrawCommand))

  else if (aDrawCommand is TppDrawImage) then
    DrawImage(TppDrawImage(aDrawCommand))

  else
    Result := False;

end; {function, Draw}

{------------------------------------------------------------------------------}
{ TppScreenDevice.DrawShape }

procedure TppScreenDevice.DrawShape(aDrawShape: TppDrawShape);
var
  liXCornerRound: Integer;
  liYCornerRound: Integer;
begin


  {assign pen and brush}
  FCanvas.Pen   := aDrawShape.Pen;
  FCanvas.Brush := aDrawShape.Brush;

  {scale pen width}
  FCanvas.Pen.Width := Round(aDrawShape.Pen.Width * FScaleX);

  {draw shape}
  case aDrawShape.ShapeType of

    stRectangle:
      FCanvas.Rectangle(aDrawShape.DrawLeft, aDrawShape.DrawTop, aDrawShape.DrawRight, aDrawShape.DrawBottom);

    stEllipse:
      FCanvas.Ellipse(aDrawShape.DrawLeft, aDrawShape.DrawTop, aDrawShape.DrawRight, aDrawShape.DrawBottom);

    stRoundRect:
      begin
        liXCornerRound := Trunc(ppFromMMThousandths(aDrawShape.XCornerRound, utScreenPixels, pprtHorizontal, nil));
        liYCornerRound := Trunc(ppFromMMThousandths(aDrawShape.YCornerRound, utScreenPixels, pprtVertical, nil));

        liXCornerRound := Round(liXCornerRound * FScaleX);
        liYCornerRound := Round(liYCornerRound * FScaleY);

        FCanvas.RoundRect(aDrawShape.DrawLeft, aDrawShape.DrawTop, aDrawShape.DrawRight, aDrawShape.DrawBottom,
                          liXCornerRound, liYCornerRound);

      end; {case, RoundRect}

  end; {case, ShapeType}

end; {procedure, DrawShape}

{------------------------------------------------------------------------------}
{ TppScreenDevice.DrawLine }

procedure TppScreenDevice.DrawLine(aDrawLine: TppDrawLine);
var
  liPenWidth: Integer;
  liSize: Integer;
  liOffset: Integer;
  liLines: Integer;
  liLine: Integer;
  liPosition: Integer;
begin

  {get pen width}
  liPenWidth := Round( (aDrawLine.Weight * Screen.PixelsPerInch / 72) * FScaleX);

  if (liPenWidth = 0) then
    liSize := 1
  else
    liSize := liPenWidth;

  {how many lines to draw?}
  if aDrawLine.LineStyle = lsSingle then
    liLines := 1
  else
    liLines := 2;

   {when draiwing bottom line, descrease the height by one pixel, otherwise
   the line is drawn outside the bounds of the control}
  if aDrawLine.LinePosition = lpBottom then
    aDrawLine.DrawBottom := aDrawLine.DrawBottom - 1;

  {when draiwing right line, descrease the width by one pixel, otherwise
  the line is drawn outside the bounds of the control}
  if aDrawLine.LinePosition = lpRight then
    aDrawLine.DrawRight := aDrawLine.DrawRight - 1;


  {setting brush to cross causes LineTo to honor the penstyle}
  FCanvas.Brush.Style := bsCross;

  {we're going to draw rectangles, because the pen doesn't work for large pen widths}
  FCanvas.Pen := aDrawLine.Pen;
  FCanvas.Pen.Width := 1;

  for liLine := 1 to liLines do

    begin

      if (liLine = 1) then
        liOffset := 0
      else
        liOffset := liSize * 2;

      for liPosition := 0 to liSize - 1 do

      {set print object moveto/lineto positions}
      case aDrawLine.LinePosition of
        lpTop:
          begin
            FCanvas.MoveTo(aDrawLine.DrawLeft, aDrawLine.DrawTop + liOffset + liPosition);
            FCanvas.LineTo(aDrawLine.DrawRight, aDrawLine.DrawTop + liOffset + liPosition);
          end;

        lpBottom:
          begin
            FCanvas.MoveTo(aDrawLine.DrawLeft, aDrawLine.DrawBottom - liOffset - liPosition);
            FCanvas.LineTo(aDrawLine.DrawRight, aDrawLine.DrawBottom - liOffset - liPosition);
          end;

        lpLeft:
          begin
            FCanvas.MoveTo(aDrawLine.DrawLeft + liOffset + liPosition, aDrawLine.DrawTop);
            FCanvas.LineTo(aDrawLine.DrawLeft + liOffset + liPosition, aDrawLine.DrawBottom);
          end;

        lpRight:
          begin
            FCanvas.MoveTo(aDrawLine.DrawRight - liOffset - liPosition, aDrawLine.DrawTop);
            FCanvas.LineTo(aDrawLine.DrawRight - liOffset - liPosition, aDrawLine.DrawBottom);
          end;

      end; {case, line style}

   end; {for, each line}

end; {procedure, DrawLine}

{------------------------------------------------------------------------------}
{ TppScreenDevice.DrawImage }

procedure TppScreenDevice.DrawImage(aDrawImage: TppDrawImage);
var
  lClipRect: TRect;
  lSavePalette:HPalette;
  lbRestorePalette: Boolean;
  lControlBMP: TBitmap;
  liControlHeight: Integer;
  liControlWidth: Integer;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;

begin

  if (aDrawImage = nil) or (aDrawImage.Picture = nil) or
     (aDrawImage.Picture.Graphic = nil) then Exit;

  if aDrawImage.DirectDraw then
    begin
      DirectDrawImage(aDrawImage);
      Exit;
    end;


  lSavePalette := 0;
  lbRestorePalette := False;


  {realize palette }
{$IFDEF Delphi3}

  if aDrawImage.Picture.Graphic.Palette <> 0 then
    begin
      lSavePalette := SelectPalette(FCanvas.Handle, aDrawImage.Picture.Graphic.Palette, False);
      RealizePalette(FCanvas.Handle);
      lbRestorePalette := True;
    end;

{$ELSE}

  if (aDrawImage.AsBitmap <> nil) then
    if aDrawImage.AsBitmap.Palette <> 0 then
      begin
        lSavePalette := SelectPalette(FCanvas.Handle, aDrawImage.AsBitmap.Palette, False);
        RealizePalette(FCanvas.Handle);
        lbRestorePalette := True;
      end;
{$ENDIF}

  {get the unscaled height and width of the object}
  liControlWidth  := Trunc(ppFromMMThousandths(aDrawImage.Width,  utScreenPixels, pprtHorizontal, nil));
  liControlHeight := Trunc(ppFromMMThousandths(aDrawImage.Height, utScreenPixels, pprtVertical,   nil));

  {compute clipping rect based on control size & picture size }
  if aDrawImage.Stretch and aDrawImage.MaintainAspectRatio then
    begin

      lClipRect := Rect(0, 0, liControlWidth, liControlHeight);

      lfScale := ppCalcAspectRatio(aDrawImage.Picture.Width, aDrawImage.Picture.Height, liControlWidth, liControlHeight);

      liScaledWidth  := Trunc(aDrawImage.Picture.Width  * lfScale);
      liScaledHeight := Trunc(aDrawImage.Picture.Height * lfScale);

      if aDrawImage.Center then
        begin
          lClipRect.Left := lClipRect.Left + ((liControlWidth  - liScaledWidth)  div 2);
          lClipRect.Top  := lClipRect.Top  + ((liControlHeight - liScaledHeight) div 2);
        end;

      lClipRect.Right  := lClipRect.Left + liScaledWidth;
      lClipRect.Bottom := lClipRect.Top  + liScaledHeight;

    end

  else if aDrawImage.Stretch then
    lClipRect := Rect(0, 0, liControlWidth, liControlHeight)

  else if aDrawImage.Center then
    lClipRect := Bounds((liControlWidth - aDrawImage.Picture.Width) div 2, (liControlHeight - aDrawImage.Picture.Height) div 2,
                 aDrawImage.Picture.Width, aDrawImage.Picture.Height)
  else
    lClipRect := Rect(0, 0, aDrawImage.Picture.Width, aDrawImage.Picture.Height);


  {create a bitmap with the same dimensions as the picture control}
  lControlBMP := TBitMap.Create;

  lControlBMP.Width   := liControlWidth;
  lControlBMP.Height  := liControlHeight;

  {stretch draw the source bitmap onto the bitmap's canvas
    note: at this point we have mapped the source bmp to the control's picture }
  if aDrawImage.AsBitmap <> nil then
    lControlBMP.Canvas.StretchDraw(lClipRect, aDrawImage.AsBitmap)
  else
    lControlBMP.Canvas.StretchDraw(lClipRect, aDrawImage.Picture.Graphic);

  if aDrawImage.Transparent then
    FCanvas.CopyMode := SrcAnd
  else
    FCanvas.CopyMode := SrcCopy;

  {draw the clipped bmp to the result canvas}
  FCanvas.StretchDraw(aDrawImage.DrawRect, lControlBMP);

  lControlBMP.Free;

  {restore save palette }
  if lbRestorePalette then
    SelectPalette(FCanvas.Handle, lSavePalette, False);


end; {procedure, DrawImage}



{------------------------------------------------------------------------------}
{ TppScreenDevice.DirectDrawImage }

procedure TppScreenDevice.DirectDrawImage(aDrawImage: TppDrawImage);
var
  lSaveClipRgn: HRGN;
  lNewClipRgn: HRGN;
  lDrawRect: TRect;
  liImageWidth: Integer;
  liImageHeight: Integer;
  liControlWidth: Integer;
  liControlHeight: Integer;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;

{$IFDEF WINDOWS}
lClipBox: TRect;
{$ENDIF}

begin

  if aDrawImage.Transparent then
    FCanvas.CopyMode := cmSrcAnd
  else
    FCanvas.CopyMode := cmSrcCopy;


  {initialize}
  lDrawRect := aDrawImage.DrawRect;

  {compute image dimensions in screen pixels}
  liImageWidth    := aDrawImage.Picture.Graphic.Width;
  liImageHeight   := aDrawImage.Picture.Graphic.Height;


  if aDrawImage.Stretch then
    begin

      {scale the draw rect to maintain aspect ration, if needed }
      if aDrawImage.MaintainAspectRatio then
        begin
          liControlWidth  := lDrawRect.Right  - lDrawRect.Left;
          liControlHeight := lDrawRect.Bottom - lDrawRect.Top;

          lfScale := ppCalcAspectRatio(liImageWidth, liImageHeight, liControlWidth, liControlHeight);

          liScaledWidth  := Trunc(liImageWidth  * lfScale);
          liScaledHeight := Trunc(liImageHeight * lfScale);

          if aDrawImage.Center then
            begin
              lDrawRect.Left:=lDrawRect.Left + (liControlWidth  - liScaledWidth)  div 2;
              lDrawRect.Top:= lDrawRect.Top  + (liControlHeight - liScaledHeight) div 2;
            end;

          lDrawRect.Right  := lDrawRect.Left + liScaledWidth;
          lDrawRect.Bottom := lDrawRect.Top  + liScaledHeight;

        end;

      {draw image}
      FCanvas.StretchDraw(lDrawRect, aDrawImage.Picture.Graphic);


    end

  else
    begin


{$IFDEF WIN32}
      lSaveClipRgn := 0;
      GetClipRgn (FCanvas.Handle, lSaveClipRgn);
{$ELSE}
      GetClipBox(FCanvas.Handle, lClipBox);
      lSaveClipRgn := CreateRectRgnIndirect(lClipBox);
{$ENDIF}

      {set clipping region}
      lNewClipRgn  := CreateRectRgnIndirect(aDrawImage.DrawRect);
      SelectClipRgn (FCanvas.Handle, lNewClipRgn);

      {compute control dimensions in screen pixels}
      liControlWidth  := Trunc(ppFromMMThousandths(aDrawImage.Width,  utScreenPixels, pprtHorizontal, nil));
      liControlHeight := Trunc(ppFromMMThousandths(aDrawImage.Height, utScreenPixels, pprtVertical,   nil));

      {recompute lef and top, if centered}
      if aDrawImage.Center then
        begin
          lDrawRect.Left := lDrawRect.Left + Trunc( ((liControlWidth  - liImageWidth)  div 2) * FScaleX);
          lDrawRect.Top  := lDrawRect.Top  + Trunc( ((liControlHeight - liImageHeight) div 2) * FScaleY);
        end;

      {compute right and bottom}
      lDrawRect.Right  := lDrawRect.Left + Trunc(liImageWidth  * FScaleX);
      lDrawRect.Bottom := lDrawRect.Top  + Trunc(liImageHeight * FScaleY);

      FCanvas.StretchDraw(lDrawRect, aDrawImage.Picture.Graphic);

      {restore clipping region}
      SelectClipRgn(FCanvas.Handle, lSaveClipRgn);

      DeleteObject(lNewClipRgn);


  end

end; {procedure, DirectDrawImage}


{------------------------------------------------------------------------------}
{ TppScreenDevice.DrawText }

procedure TppScreenDevice.DrawText(aDrawText: TppDrawText);
var
  liLineHeight: Integer;
  liCalcHeight: Integer;
  lbLinesFit: Boolean;
  liLineSpaceUsed: Integer;
  liLines: Integer;
  liLine: Integer;
  lDrawRect: TRect;
  lRect: TRect;
  lCalcRect: TRect;
  liRectWidth: Integer;
  liTextWidth: Integer;
  lSourceText: TStringList;
  lsLine: String;
  liStart: Integer;
  liLeading: Integer;

  lLineBuf: PChar;
  lTextMetric: TTextMetric;
  lbTruncTheText: Boolean;

  llRectHeight: Longint;
  llCalcHeight: Longint;

  liTabStopCount: Integer;
  liTabStop: Integer;
  lTabStopArray: TppTabStopPos;
  liTop: Integer;
  liMaxWidth: Integer;

begin

  liTabStopCount := aDrawText.TabStopPositions.Count;
  
  {convert memo tab stop positions to screen units, if needed }
  if aDrawText.IsMemo and (aDrawText.TabStopPositions.Count > 0) then
    begin
      ppConvertTabStopPos(utScreenPixels, aDrawText.TabStopPositions, lTabStopArray, liTabStopCount, nil);

      for liTabStop := 0 to liTabStopCount - 1 do
        lTabStopArray[liTabStop] := Round(lTabStopArray[liTabStop] * FScaleX);
    end;

{$IFDEF Delphi3}

  if (FCanvas.Font.CharSet <> aDrawText.Font.CharSet) or
{$ELSE}
  if
{$ENDIF}
     (FCanvas.Font.Color   <> aDrawText.Font.Color)   or
     (FCanvas.Font.Pitch   <> aDrawText.Font.Pitch)   or
     (FCanvas.Font.Size    <> aDrawText.Font.Size)    or
     (FCanvas.Font.Style   <> aDrawText.Font.Style)   or
     (FCanvas.Font.Name    <> aDrawText.Font.Name) then

    FCanvas.Font := aDrawText.Font;


  {maybe we can't use the selected font}
  FCanvas.Font.Name := ppSubstituteFont(aDrawText.Font.Name);

  {set font height}
  FCanvas.Font.Height := Round(aDrawText.Font.Height * FScaleY);

  lbTruncTheText := False;

  {font size must at least be one}
  if (FCanvas.Font.Height = 0) then
    FCanvas.Font.Height := -1;

  GetTextMetrics(FCanvas.Handle, lTextMetric);

  {use default leading for this font}
  if not(aDrawText.IsMemo) then
    liLeading := lTextMetric.tmExternalLeading
  else
    liLeading := Trunc(ppFromMMThousandths(aDrawText.Leading, utScreenPixels, pprtVertical, nil));

  liLineHeight := lTextMetric.tmHeight + liLeading;

  lDrawRect := Rect(aDrawText.DrawLeft, aDrawText.DrawTop, aDrawText.DrawRight, aDrawText.DrawBottom );

  {adjust bounding rect height}
  if aDrawText.AutoSize and not(aDrawText.WordWrap) and (Length(aDrawText.Text) > 0) then
    begin
      llRectHeight := lDrawRect.Bottom - lDrawRect.Top;
      llCalcHeight := liLineHeight;

      if (llCalcHeight > llRectHeight) then
        lDrawRect.Bottom := lDrawRect.Top + llCalcHeight;

    end;

  liLine := 0;
  liLines := aDrawText.WrappedText.Count - 1;
  liRectWidth := (lDrawRect.Right - lDrawRect.Left);

  lbLinesFit := True;

  if (aDrawText.IsMemo) and (aDrawText.WrappedText.Count > 1) then
    begin

      {fix line width, if necessary}
      while liLine < liLines do
        begin
          lsLine := aDrawText.WrappedText[liLine];

          if ppLineTooLong(lsLine, liRectWidth, FCanvas, liTabStopCount, lTabStopArray) and
             (Abs(FCanvas.Font.Height) > 1) then
            begin

              {decrease height of font by one pixel }
              if (FCanvas.Font.Height > 0) then
                FCanvas.Font.Height := FCanvas.Font.Height - 1
              else
                FCanvas.Font.Height := FCanvas.Font.Height + 1;

              if Abs(FCanvas.Font.Height) > 1 then
                liLine := liLine-1
              else
                liLine := liLines;

            end;

          Inc(liLine);
        end;

      GetTextMetrics(FCanvas.Handle, lTextMetric);

      {get leading for this font}
      if not(aDrawText.IsMemo) then
        liLeading := lTextMetric.tmExternalLeading
      else
        liLeading := Trunc(ppFromMMThousandths(aDrawText.Leading, utScreenPixels, pprtVertical, nil));

      liLineHeight := lTextMetric.tmHeight + liLeading;

      liCalcHeight := Round((lDrawRect.Bottom - lDrawRect.Top) / aDrawText.WrappedText.Count);

      if ((Abs(liCalcHeight - liLineHeight) / liLineHeight) <= 0.10) then

        liLineHeight := liCalcHeight

      else

        begin

          lbLinesFit := liLineHeight <= Trunc((lDrawRect.Bottom - lDrawRect.Top) / aDrawText.WrappedText.Count);

          while not(lbLinesFit) and (Abs(FCanvas.Font.Height) > 1) do
            begin


              if liLeading > 0 then
                Dec(liLeading)
              else
                begin
                  {decrease height of font by one pixel }
                  if FCanvas.Font.Height > 0 then

                    FCanvas.Font.Height := FCanvas.Font.Height - 1
                  else
                    FCanvas.Font.Height := FCanvas.Font.Height + 1;

                  GetTextMetrics(FCanvas.Handle, lTextMetric);
                end;

              liLineHeight := lTextMetric.tmHeight + liLeading;

              lbLinesFit := liLineHeight <= Trunc((lDrawRect.Bottom - lDrawRect.Top) / aDrawText.WrappedText.Count);
           end; {while, lines don't fit}

        end; {check to see if lines fit}

    end; {if, memo & linecound > 1) }

  if not(lbLinesFit) then
    liLines := Trunc((lDrawRect.Bottom - lDrawRect.Top) / liLineHeight);


  if Abs(FCanvas.Font.Height) < 1 then
    begin
      if FCanvas.Font.Height > 0 then
        FCanvas.Font.Height := 1
      else
        FCanvas.Font.Height := -1;

      lbTruncTheText := True;
    end;

  lSourceText := TStringList.Create;

  if aDrawText.WordWrap then
    lSourceText.Assign(aDrawText.WrappedText)

  else if (Length(aDrawText.Text) > 0) then
    begin
      lSourceText.Add(aDrawText.Text);

      liLines := 0;
    end;

  {set rectangle to original value}
  lCalcRect := lDrawRect;


  {calculate rectangle width based on longest text}
  if aDrawText.AutoSize then
    begin

      liMaxWidth := 0;

      {calc max line width}
      for liLine := 0 to liLines do
        begin
          lsLine := lSourceText[liLine];

          liTextWidth  := FCanvas.TextWidth(lsLine);
          if liTextWidth > liMaxWidth then
            liMaxWidth := liTextWidth;
        end;

      liRectWidth := (lCalcRect.Right - lCalcRect.Left);

      {if text wider than rectangle, adjust rectangle}
      if (liMaxWidth <> liRectWidth) then
        begin

          {adjust rectangle}
          if aDrawText.Alignment = taLeftJustify then
            lCalcRect.Right := lCalcRect.Left + liMaxWidth

          else if aDrawText.Alignment = taRightJustify then
            lCalcRect.Left := lCalcRect.Right - liMaxWidth

          else if aDrawText.Alignment = taCenter then
            begin
              lCalcRect.Left  := lCalcRect.Left + Round((liRectWidth - liMaxWidth) / 2);
              lCalcRect.Right := lCalcRect.Left + liMaxWidth;
            end;

        end; {text wider than rectangle}

    end; {if, AutoSize}


  {fill rectangle with background color}
  if not(aDrawText.Transparent) then
    begin
      FCanvas.Brush.Color := aDrawText.Color;
      FCanvas.Brush.Style := bsSolid;
      FCanvas.FillRect(lCalcRect);
    end;

  FCanvas.Brush.Style := bsClear;

  liLineSpaceUsed := 0;

  for liLine := 0 to liLines do
    begin
      lsLine := lSourceText[liLine];

      {calculate width of text}
      liTextWidth := FCanvas.TextWidth(lsLine);

      liRectWidth := (lCalcRect.Right - lCalcRect.Left);

      {reset rectangle to original value}
      lRect := lCalcRect;

      lRect.Top := lRect.Top + liLineSpaceUsed;

      liTop := lRect.Top;

      {justify text}
      if aDrawText.Alignment = taLeftJustify then
        liStart := lRect.Left

      else if aDrawText.Alignment = taRightJustify then
        liStart := lRect.Right - liTextWidth

      else if aDrawText.Alignment = taCenter then
        liStart := lRect.Left + Round( ((liRectWidth - liTextWidth) / 2))

      else
        liStart := 0;

      {draw the text}
      if aDrawText.IsMemo and not(lbTruncTheText) then
        begin
          lLineBuf := StrAlloc(Length(lsLine) + 1);
          StrPCopy(lLineBuf, lsLine);
          TabbedTextOut(FCanvas.Handle, liStart, liTop, lLineBuf, StrLen(lLineBuf), liTabStopCount, lTabStopArray, liStart);
          StrDispose(lLineBuf);
        end

      else
        begin
          if aDrawText.AutoSize and not(aDrawText.IsMemo) then
            FCanvas.TextOut(liStart, liTop, lsLine)
          else
            FCanvas.TextRect(lRect, liStart, liTop, lsLine);
        end;

      {goto next line}
      Inc(liLineSpaceUsed, liLineHeight);
      
    end; {for, each line of text}

  lSourceText.Free;

  {update size of draw rect}
  if aDrawText.AutoSize then
    begin
      aDrawText.DrawLeft   := lCalcRect.Left;
      aDrawText.DrawRight  := lCalcRect.Right;
      aDrawText.DrawBottom := aDrawText.DrawTop + liLineSpaceUsed;
    end;

end; {procedure, DrawText}

{------------------------------------------------------------------------------}
{ TppScreenDevice.FindClickableDrawCommand }

function TppScreenDevice.FindClickableDrawCommand(aX, aY: Integer; var aDrawCommand: TppDrawCommand): Boolean;
var
  liIndex: Integer;
  lDrawCommand: TppDrawCommand;
  lbFound: Boolean;
begin

  liIndex := 0;
  lbFound := False;
  lDrawCommand := nil;

  while (liIndex <= FPage.ClickableCount - 1) and not(lbFound) do
    begin
      lDrawCommand := FPage.Clickables[liIndex];

      lbFound := (aX >= lDrawCommand.DrawLeft) and
                 (aX <= lDrawCommand.DrawRight) and
                 (aY >= lDrawCommand.DrawTop) and
                 (aY <= lDrawCommand.DrawBottom) and
                 (lDrawCommand.IsClickable);

      Inc(liIndex);
    end;

  if lbFound then
    aDrawCommand := lDrawCommand;

  Result := lbFound;
  
end; {procedure, FindClickableDrawCommand}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppViewer, TppScreenDevice]);

  ppRegisterDevice(TppScreenDevice);

finalization

  ppUnRegisterDevice(TppScreenDevice);

  UnRegisterClasses([TppViewer, TppScreenDevice]);

end. 
