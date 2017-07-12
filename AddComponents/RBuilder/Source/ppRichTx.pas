{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppRichTx;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls, Menus,
  ComCtrls, Dialogs, RichEdit,
  ppClass, ppTypes, ppUtils, ppDsgnCt, ppCtrls, ppDB, ppDevice, ppForms, ppPrintr,
  ppStrtch, ppViewr, ppDrwCmd, ppComm, ppRTTI;

type


  { TppCustomRichText }
  TppCustomRichText = class(TppStretchable)
    private
      FEndCharPos: Integer;
      FMailMerge: Boolean;
      FMetaFile: TMetaFile;
      FPlainText: Boolean;
      FReloadAfterPrinting : Boolean;
      FDrawRichEdit: TCustomRichEdit;
      FRichEdit: TCustomRichEdit;
      FRichTextStrings: TStrings;
      FRichTextStream: TMemoryStream;
      FStartCharPos: Integer;
      FSaveWidth: Longint;
      FSaveHeight: Longint;

      procedure DrawToMetafile;
      function  GetDrawRichEdit: TCustomRichEdit;
      function  GetPlainText: Boolean;
      procedure MergeDBFields;
      procedure SetMailMerge(aValue: Boolean);
      procedure SetPlainText(aValue: Boolean);

    protected
      procedure BoundsChange; override;
      function  GetRichText: String;virtual;

      function  GetRichTextStream: TMemoryStream; virtual;
      procedure LoadDrawRichEdit; virtual;
      procedure LoadRichText; virtual;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetColor(aColor: TColor); override;
      procedure SetRichText(Value: String); virtual;
      procedure SetRichTextStrings(Value: TStrings); virtual;

      procedure PaintDesignControl(aCanvas: TCanvas); override;

      procedure LinesChanged;

      {pass thru prop functions}
      function GetParaAttributes: TParaAttributes;
      function GetSelAttributes: TTextAttributes;
      function GetSelLength: Integer;
      function GetSelStart: Integer;
      function GetSelText: String;

      procedure SetSelLength(aValue: Integer);
      procedure SetSelStart(aValue: Integer);
      procedure SetSelText(aString: String);

      property DrawRichEdit: TCustomRichEdit read GetDrawRichEdit;
      property MailMerge: Boolean read FMailMerge write SetMailMerge default False;
      
    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Notification(aComponent: TComponent; Operation: TOperation); override;
      procedure CalcSpaceUsed; override;
      function  HasFont: Boolean; override;

      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

      procedure LoadFromFile(aFileName: String);
      procedure SaveToFile(aFileName: String);
      procedure LoadFromRTFStream(aStream: TStream);
      procedure SaveToRTFStream(aStream: TStream);

      {pass thru methods}
      procedure Clear; override;
      procedure ClearSelection;
      function  FindText(const SearchStr: string; StartPos, Length: Integer; Options: TSearchTypes):Integer;
      procedure SelectAll;

      property EndCharPos: Integer read FEndCharPos write FEndCharPos;
      property RichTextStream: TMemoryStream read GetRichTextStream;
      property StartCharPos: Integer read FStartCharPos write FStartCharPos;

      {pass thru props}
      property Paragraph: TParaAttributes read GetParaAttributes;
      property SelAttributes: TTextAttributes read GetSelAttributes;
      property SelLength: Integer read GetSelLength write SetSelLength;
      property SelStart: Integer read GetSelStart write SetSelStart;
      property SelText: String read GetSelText write SetSelText;

      property Height;
      property Left;
      property PlainText: Boolean read GetPlainText write SetPlainText default False;
      property RichText: String read GetRichText write SetRichText;
      property Stretch;
      property Top;
      property UserName;
      property Visible;
      property Width;

  end; {class, TppCustomRichText}

  { TppRichText }
  TppRichText = class(TppCustomRichText)
    private
      FMemStream: TMemoryStream;

    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetRichTextStream: TMemoryStream; override;
      procedure EditMenuClick(Sender: TObject);
      procedure LoadRichText; override;
      procedure SetRichTextStrings(Value: TStrings); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Edit;
      procedure InstantiateDesignControl; override;
      procedure PopupMenuClick(Sender: TObject); override;


    published
      property BottomOffset;
      property Caption;
      property Color;
      property Height;
      property Left;
      property MailMerge;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OverFlowOffset;
      property RichText;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property ShiftWithParent;
      property Stretch;
      property Transparent;
      property Top;
      property UserName;
      property Visible;
      property Width;
   end; {class, TppRichText}

  { TppDBRichText }
  TppDBRichText = class(TppCustomRichText)
    private
      FAutoDisplay: Boolean;
      FOnGetRichText: TppGetTextEvent;

      procedure SetAutoDisplay(aValue: Boolean);

    protected
      function  GetRichTextStream: TMemoryStream; override;
      procedure SetDataField(const Value: String); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function  IsDataAware: Boolean; override;
      procedure LoadRichText; override;

    published
      property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
      property BottomOffset;
      property Color;
      property DataField;
      property DataPipeline;
      property Height;
      property Left;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnGetRichText: TppGetTextEvent read FOnGetRichText write FOnGetRichText;
      property OverFlowOffset;
      property ParentDataPipeline;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property ShiftWithParent;
      property Stretch;
      property Top;
      property Transparent;
      property UserName;
      property Visible;
      property Width;

  end; {class, TppDBRichText}


  { TppCustomRichTextSaveRec - page cache info }
  TppCustomRichTextSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FOverFlow: Boolean;
    FObjectIndex: Integer;
    FPartialGeneration: Boolean;

    FStartCharPos: Integer;
    FEndCharPos: Integer;
  end; {record, TppCustomRichTextSaveRec}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomRichTextRTTI }
  TraTppCustomRichTextRTTI = class(TraTppStretchableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomRichTextRTTI}

  { TraTppDBRichTextRTTI }
  TraTppDBRichTextRTTI = class(TraTppCustomRichTextRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDBRichTextRTTI}

implementation

uses
  ppBands, ppRegion, ppPrnDev;



{******************************************************************************
 *
 ** C U S T O M R I C H T E X T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Create }

constructor TppCustomRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FDrawRichEdit := nil;
  FEndCharPos := -1;
  FMailMerge := False;
  FMetaFile := TMetaFile.Create;
  FPlainText := False;
  FStartCharPos := -1;
  FEndCharPos := -1;
  FReloadAfterPrinting := False;
  FSaveWidth  := 0;
  FSaveHeight := 0;

  FRichEdit := ppGetRichEditClass.Create(Self);
  FRichEdit.Parent  := ppParentWnd;

  FRichTextStream  := TMemoryStream.Create;
  FRichTextStrings := ppGetRichEditLines(FRichEdit);

  {init inherited properties}
  AutoSize    := False;
  spHeight    := 89;
  WordWrap    := True;
  spWidth     := 185;

  CacheRecordSize  := SizeOf(TppCustomRichTextSaveRec);
  DrawCommandClass := TppDrawRichText;


  {note: this is critical, when the Owner sends free notification
         the richtext control must be destroyed to avoid a Delphi design-time AV}
  if (Owner <> nil) then
    Owner.FreeNotification(Self);


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Destroy }

destructor TppCustomRichText.Destroy;
begin

 { Destroying;}

  FDrawRichEdit.Free;
  FRichEdit.Free;

  FMetaFile.Free;

  FRichTextStream.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Notification }

procedure TppCustomRichText.Notification(aComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

  if (Operation = opRemove) then
    begin
      if aComponent = FRichEdit then
        FRichEdit := nil;
      if aComponent = FRichEdit then
        FDrawRichEdit := nil;
    end;


  if (Operation = opRemove) and (aComponent = Owner) then
    begin
      FRichEdit := nil;
      FDrawRichEdit := nil;
    end;

end; {procedure, Notification}


{------------------------------------------------------------------------------}
{ TppCustomRichText.BoundsChange }

procedure TppCustomRichText.BoundsChange;
begin

  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  if (Band = nil) or (DesignControl = nil) then Exit;

  {note: if reading or loading and not pasting}
  if ((csReading in ComponentState) or (csLoading in ComponentState)) and (DesignControl = nil) then Exit;

  
  if (FMetaFile <> nil) and (FSaveHeight <> mmHeight) or (FSaveWidth <> mmWidth) then
    begin
      FSaveWidth  := mmWidth;
      FSaveHeight := mmHeight;

      FMetaFile.Width  := Trunc(ppFromMMThousandths(mmWidth,  utPrinterPixels, pprtHorizontal, GetPrinter));
      FMetaFile.Height := Trunc(ppFromMMThousandths(mmHeight, utPrinterPixels, pprtVertical, GetPrinter));

    end;

  {note call this last because it may cause InvalidateDesignControl }
  inherited BoundsChange;

end; {procedure, BoundsChange}

{------------------------------------------------------------------------------}
{ TppCustomRichText.HasFont }

function  TppCustomRichText.HasFont: Boolean;
begin
  Result := False;
end; {function, HasFont}

{------------------------------------------------------------------------------}
{ TppCustomRichText.LinesChanged }

procedure TppCustomRichText.LinesChanged;
begin

  InvalidateDesignControl;

end; {procedure, LinesChanged}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetRichText }

function TppCustomRichText.GetRichText: String;
var
  lBuf: PChar;
begin

  GetRichTextStream;

  if FRichTextStrings.Count = 0 then
    Result := ''

  else
    begin
      FRichTextStream.Position := 0;

      lBuf := StrAlloc(FRichTextStream.Size + 1);

      FRichTextStream.Read(lBuf^, FRichTextStream.Size);

      lBuf[FRichTextStream.Size] := #0;

      Result := String(lBuf);

      StrDispose(lBuf);

    end;

end; {function, GetRichText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetRichText }

procedure TppCustomRichText.SetRichText(Value: String);
var
  lBuf: PChar;

begin

  FRichTextStream.Clear;

  lBuf := PChar(Value);

  FRichTextStream.Write(lBuf^, StrLen(lBuf));

  FRichTextStream.Position := 0;
  FRichTextStrings.LoadFromStream(FRichTextStream);

end; {procedure, SetRichText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetRichTextStream }

function TppCustomRichText.GetRichTextStream: TMemoryStream;
begin
  Result := FRichTextStream;
end; {function, GetRichTextStream}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetPlainText }

function TppCustomRichText.GetPlainText: Boolean;
begin
  Result := FPlainText;
end; {function, GetPlainText}


{------------------------------------------------------------------------------}
{ TppCustomRichText.LoadDrawRichEdit}

procedure TppCustomRichText.LoadDrawRichEdit;
var
  lStream: TStream;
begin

  if not(FMailMerge) then Exit;

  lStream := TMemoryStream.Create;
  ppGetRichEditLines(FRichEdit).SaveToStream(lStream);
  lStream.Position := 0;

  {access property, this forces the creation of FDrawRichEdit}
  ppGetRichEditLines(DrawRichEdit).LoadFromStream(lStream);

  lStream.Free;

end; {procedure, LoadDrawRichEdit}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetDrawRichEdit }

function TppCustomRichText.GetDrawRichEdit: TCustomRichEdit;
begin

  if not(FMailMerge) then
    Result := TCustomRichEdit(FRichEdit)
  else
    begin
      if (FDrawRichEdit = nil) then
        begin
          FDrawRichEdit := ppGetRichEditClass.Create(Self);
          FDrawRichEdit.Visible := False;
          FDrawRichEdit.Parent  := ppParentWnd;
       {   FDrawRichEdit.FreeNotification(Self);}
        end;

      Result := FDrawRichEdit;
    end;

end; {function, GetDrawRichEdit}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetMailMerge }

procedure TppCustomRichText.SetMailMerge(aValue: Boolean);
begin

  FMailMerge := aValue;

  Reset;

end; {procedure, SetMailMerge}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetPlainText }

procedure TppCustomRichText.SetPlainText(aValue: Boolean);
begin

  FPlainText := aValue;

 { FRichEdit.PlainText := aValue;}

end;  {procedure, SetMailMerge}

{------------------------------------------------------------------------------}
{ TppCustomRichText.LoadRichText }

procedure TppCustomRichText.LoadRichText;
begin

end;  {procedure, LoadRichText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetColor }

procedure TppCustomRichText.SetColor(aColor: TColor);
begin

{  FRichEdit.Color := aColor;}

  inherited SetColor(aColor);

end; {procedure, SetColor}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetRichTextStrings }

procedure TppCustomRichText.SetRichTextStrings(Value: TStrings);
begin

  if csReading in ComponentState then Exit;

  FRichTextStrings.Assign(Value);

  LoadRichText;

end; {procedure, SetRichTextStrings}

{------------------------------------------------------------------------------}
{ TppCustomRichText.RestoreFromCache }

procedure TppCustomRichText.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppCustomRichTextSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  ObjectIndex       := lRec.FObjectIndex;
  OverFlow          := lRec.FOverFlow;
  PartialGeneration := lRec.FPartialGeneration;

  FStartCharPos  := lRec.FStartCharPos;
  FEndCharPos    := lRec.FEndCharPos;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SaveToCache }

procedure TppCustomRichText.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppCustomRichTextSaveRec;
begin                 

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FOverFlow          := OverFlow;
  lRec.FPartialGeneration := PartialGeneration;

  lRec.FStartCharPos  := FStartCharPos;
  lRec.FEndCharPos    := FEndCharPos;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCustomRichText.PaintDesignControl}

procedure TppCustomRichText.PaintDesignControl(aCanvas: TCanvas);
var
  lSaveColor : TColor;
  lClientRect: TRect;
begin

  lClientRect := spClientRect;

  if FReloadAfterPrinting then
    begin
      LoadRichText;
      FReloadAfterPrinting := False;
    end;

  {load text into draw rich edit}
  LoadDrawRichEdit;

  if Transparent then
    aCanvas.CopyMode := cmSrcAnd
  else
    aCanvas.CopyMode := cmSrcCopy;

  DrawToMetafile;

  if FRichTextStrings.Count > 0 then
    {draw the metafile to the screen canvas}
    aCanvas.StretchDraw(Rect(lClientRect.Left, lClientRect.Top, lClientRect.Right, lClientRect.Bottom), FMetaFile)
  else
    begin
      if not Transparent then
        begin
          {draw background color}
          aCanvas.Brush.Color := Color;
          aCanvas.Brush.Style := bsSolid;
          aCanvas.FillRect(lClientRect);

         end;

      {draw caption}
      aCanvas.Brush.Style := bsClear;
      aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, Caption);

    end;

  {draw a framerect}
  lSaveColor := aCanvas.Brush.Color;
  aCanvas.Brush.Style := bsSolid;
  aCanvas.Brush.Color := clBlack;
  aCanvas.FrameRect(lClientRect);
  aCanvas.Brush.Color := lSaveColor;

end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppCustomRichText.DrawToMetafile }

procedure TppCustomRichText.DrawToMetafile;
var
  lCharRange: TCharRange;
  lMetaFileCanvas: TMetaFileCanvas;
  liControlWidth, liControlHeight: Integer;
  lCanvasRect: TRect;
  lPrinter: TppPrinter;
  lDC: HDC;

begin

  if not (pppcDesigning in DesignState) or (DesignControl = nil) or (Printing) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  lCharRange.cpMin := 0;
  lCharRange.cpMax := -1;

  lPrinter := GetPrinter;

  liControlWidth  := Trunc(ppFromMMThousandths(mmWidth,  utPrinterPixels, pprtHorizontal, lPrinter));
  liControlHeight := Trunc(ppFromMMThousandths(mmHeight, utPrinterPixels, pprtVertical, lPrinter));

  lCanvasRect := Rect(0, 0, liControlWidth, liControlHeight);

  if (lPrinter <> nil) and (lPrinter.DC <> 0) then
    lDC := lPrinter.DC
  else
    lDC := GetDC(0);

  lMetaFileCanvas := TMetaFileCanvas.Create(FMetaFile, lDC);

  if not Transparent then
    begin
      {draw background color}
      lMetaFileCanvas.Brush.Style := bsSolid;
      lMetaFileCanvas.Brush.Color := Color;
      lMetaFileCanvas.FillRect(lCanvasRect);
    end;

  {draw the RichText to the metafile}
  ppGetRTFEngine(DrawRichEdit).DrawRichText(lMetaFileCanvas.Handle, lDC, lCanvasRect, lCharRange);

  lMetaFileCanvas.Free;

  if (lPrinter = nil) or (lPrinter.DC = 0) then
    ReleaseDC(0,lDC);
    
end; {procedure, DrawToMetafile}

{------------------------------------------------------------------------------}
{ TppCustomRichText.PropertiesToDrawCommand }

procedure TppCustomRichText.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawRichText;

begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawRichText) then Exit;

  lDrawCommand := TppDrawRichText(aDrawCommand);

  lDrawCommand.Color      := Color;
  lDrawCommand.Left       := PrintPosRect.Left;
  lDrawCommand.Top        := PrintPosRect.Top;
  lDrawCommand.Height     := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawCommand.Width      := PrintPosRect.Right - PrintPosRect.Left;
  lDrawCommand.StartCharPos := FStartCharPos;
  lDrawCommand.EndCharPos   := FEndCharPos;
  lDrawCommand.Transparent  := Transparent;

  ppGetRichEditLines(DrawRichEdit).SaveToStream(lDrawCommand.RichTextStream);

  {used to indicate to the Paint method that it needs to call LoadRichText prior to painting}
  FReloadAfterPrinting := True;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppCustomRichText.CalcSpaceUsed }

procedure TppCustomRichText.CalcSpaceUsed;
var
  liSpaceUsed: Longint;
  liLastFittedChar: Longint;
  lCharRange: TCharRange;
  lDestRect: TRect;
  lPrinter: TppPrinter;
  lbRangeFit: Boolean;
  lDC: HDC;
begin

  lPrinter := GetPrinter;

  GetRichText;

  LoadDrawRichEdit;

  MergeDBFields;
  
  if ParentStretch and Stretch then
    begin

      {reduce height for any area already printed}
      if OverFlow then

        FStartCharPos := FEndCharPos + 1
      else
        FStartCharPos := 0;

      lbRangeFit  := True;
      liSpaceUsed := 0;

      DrawRichEdit.SelectAll;
      FEndCharPos := DrawRichEdit.SelLength;

      {check whether text fits within the space available }
      if (DrawRichEdit.SelLength > 0) and (DrawRichEdit.SelText <> '') then
        begin
          lCharRange.cpMin := FStartCharPos;
          lCharRange.cpMax := FEndCharPos;

          {convert print rect space available to printer pixels}
          lDestRect.Left   := Trunc(ppFromMMThousandths(PrintPosRect.Left, utPrinterPixels, pprtHorizontal, lPrinter));
          lDestRect.Top    := Trunc(ppFromMMThousandths(PrintPosRect.Top, utPrinterPixels, pprtVertical, lPrinter));
          lDestRect.Right  := Trunc(ppFromMMThousandths(PrintPosRect.Right, utPrinterPixels, pprtHorizontal, lPrinter));
          lDestRect.Bottom := Trunc(ppFromMMThousandths(PrintPosRect.Bottom, utPrinterPixels, pprtVertical, lPrinter));

          if (lPrinter <> nil) and (lPrinter.DC <> 0) then
            lDC := lPrinter.DC
          else
            lDC := GetDC(0);

          lbRangeFit := ppGetRTFEngine(DrawRichEdit).CheckRangeFit(lDC, lCharRange, lDestRect, liLastFittedChar, liSpaceUsed);

          if (lPrinter = nil) or (lPrinter.DC = 0) then
            ReleaseDC(0, lDC);
        end;


      {if range still does not fit then there is an overflow situation}
      if not lbRangeFit then
        begin

          {update EndCharPos, since it can't all fit on this page}
          FEndCharPos := liLastFittedChar;

          if FEndCharPos < 0 then
            begin
              FStartCharPos    := -1;
              FEndCharPos      := -1;
            end
          else
            begin
              OverFlow   := True;
              SpaceUsed := ppToMMThousandths(liSpaceUsed, utPrinterPixels, pprtVertical, lPrinter);
            end;

        end

      else
        begin
          {memo is done printing, turn overflow off}
          OverFlow := False;

          if (FEndCharPos >= 0) then
            SpaceUsed := ppToMMThousandths(liSpaceUsed, utPrinterPixels, pprtVertical, lPrinter);

        end; {if, need to calc StartCharPos, EndCharPos}

    end

  else  {static memo }
    begin

      FStartCharPos := 0;

      DrawRichEdit.SelectAll;
      FEndCharPos := DrawRichEdit.SelLength;

      SpaceUsed := mmHeight;

    end; {if, Stretch is true}

end; {function, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppCustomRichText.MergeDBFields }

procedure TppCustomRichText.MergeDBFields;
var
  liLength: Integer;
  liFullLength: Integer;
  lFields: TStrings;
  lFieldAliases: TStrings;
  lDataPipeline: TppDataPipeline;
  lsFieldName: String;
  lbFieldFound: Boolean;
  liStartPos: Integer;
  liEndPos: Integer;
  liCharPos: Integer;
  lbSymbolFound: Boolean;
  liIndex: Integer;
begin

  if not(FMailMerge) then Exit;

  lFields := TStringList.Create;
  lFieldAliases := TStringList.Create;

  lDataPipeline := Band.Report.DataPipeline;

  if (lDataPipeline = nil) then Exit;

  lDataPipeline.GetFieldNames(lFields);
  lDataPipeline.GetFieldAliases(lFieldAliases);

  FDrawRichEdit.SelectAll;
  liFullLength := FDrawRichEdit.SelLength;

  lbSymbolFound := True;

  liCharPos := 0;
  liLength := 0;

  while lbSymbolFound do
    begin

      {find the text}
      liStartPos := FDrawRichEdit.FindText('<', liCharPos, liFullLength, []);
      liEndPos := FDrawRichEdit.FindText('>', liCharPos, liFullLength, []);

      lbFieldFound := False;

      {replace the text with the data}
      if ((liStartPos > -1) and (liEndPos > -1)) and (liEndPos > liStartPos) then
        begin
          liLength := liEndPos - liStartPos;

          FDrawRichEdit.SelStart   := liStartPos;
          FDrawRichEdit.SelLength  := liLength + 1;

          lsFieldName := Copy(FDrawRichEdit.SelText, 2, liLength - 1);

          
          lbFieldFound := (lFields.IndexOf(lsFieldName) <> -1);

          if not(lbFieldFound) then
            begin
              liIndex := lFieldAliases.IndexOf(lsFieldName);

              lbFieldFound := (liIndex <> -1);

              if (lbFieldFound) then
                lsFieldName := lFields[liIndex];
            end;

          if lbFieldFound then
            begin
              FDrawRichEdit.SelText := lDataPipeline.GetFieldAsString(lsFieldName);

              liLength := Length(FDrawRichEdit.SelText);

              FDrawRichEdit.SelectAll;
              liFullLength := FDrawRichEdit.SelLength;
            end;

        end;

        if lbFieldFound then
          liCharPos := liStartPos + liLength + 1

        else if (liEndPos > -1) and (liStartPos > -1) then
          begin
            if (liStartPos < liEndPos) then
              liCharPos := liStartPos + 1
            else
              liCharPos := liEndPos + 1;
          end

        else if (liEndPos > -1) then
          liCharPos := liEndPos + 1

        else if (liStartPos > -1) then
          liCharPos := liStartPos + 1

        else
          lbSymbolFound := False;

    end;

   lFields.Free;
   lFieldAliases.Free;

end; {procedure, MergeDBFields}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Clear }

procedure TppCustomRichText.Clear;
begin

  FRichEdit.Clear;

end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.ClearSelection }

procedure TppCustomRichText.ClearSelection;
begin
  FRichEdit.ClearSelection;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.FindText }

function TppCustomRichText.FindText(const SearchStr: string; StartPos, Length: Integer; Options: TSearchTypes):Integer;
begin
  Result := FRichEdit.FindText(SearchStr, StartPos, Length, Options);
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SelectAll }

procedure TppCustomRichText.SelectAll;
begin
  FRichEdit.SelectAll;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetParaAttributes }

function TppCustomRichText.GetParaAttributes: TParaAttributes;
begin
  Result := FRichEdit.Paragraph;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelAttributes }

function TppCustomRichText.GetSelAttributes: TTextAttributes;
begin
  Result := FRichEdit.SelAttributes;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelLength }

function TppCustomRichText.GetSelLength: Integer;
begin
  Result := FRichEdit.SelLength;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelStart }

function TppCustomRichText.GetSelStart: Integer;
begin
  Result := FRichEdit.SelStart;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelText }

function TppCustomRichText.GetSelText: String;
begin
  Result := FRichEdit.SelText;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetSelLength }

procedure TppCustomRichText.SetSelLength(aValue: Integer);
begin
  FRichEdit.SelLength := aValue;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetSelStart }

procedure TppCustomRichText.SetSelStart(aValue: Integer);
begin
  FRichEdit.SelStart := aValue;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetSelText }

procedure TppCustomRichText.SetSelText(aString: String);
begin
  FRichEdit.SelText := aString;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.LoadFromFile }

procedure TppCustomRichText.LoadFromFile(aFileName: String);
begin
  FRichTextStrings.LoadFromFile(aFileName);
end; {procedure, LoadFromFile}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SaveToFile }

procedure TppCustomRichText.SaveToFile(aFileName: String);
begin
  FRichTextStrings.SaveToFile(aFileName);
end; {procedure, SaveToFile}

{------------------------------------------------------------------------------}
{ TppCustomRichText.LoadFromRTFStream }

procedure TppCustomRichText.LoadFromRTFStream(aStream: TStream);
begin
  FRichTextStrings.LoadFromStream(aStream);
end; {procedure, LoadFromStream}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SaveToRTFStream }

procedure TppCustomRichText.SaveToRTFStream(aStream: TStream);
begin
  FRichTextStrings.SaveToStream(aStream);
end; {procedure, SaveToRTFStream}


{******************************************************************************
 *
 ** R I C H T E X T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppRichText.Create }

constructor TppRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FMemStream    := TMemoryStream.Create;

  DefaultPropName     := 'Caption';
  DefaultPropEditType := etAutoEdit;

end; {constructor, Create }

{------------------------------------------------------------------------------}
{ TppRichText.Destroy }

destructor TppRichText.Destroy;
begin

  FMemStream.Free;

  inherited Destroy;

end; {destructor, Destroy }


{------------------------------------------------------------------------------}
{ TppRichText.InstantiateDesignControl }

procedure TppRichText.InstantiateDesignControl;
begin

  inherited InstantiateDesignControl;

  LoadRichText;

end;  {procedure, InstantiateDesignControl }

{------------------------------------------------------------------------------}
{ TppRichText.SetRichTextStrings }

procedure TppRichText.SetRichTextStrings(Value: TStrings);

begin

  inherited SetRichTextStrings(Value);

  Reset;
  PropertyChange;
end; {procedure, GetRichTextStream }

{------------------------------------------------------------------------------}
{ TppRichText.GetRichTextStream }

function TppRichText.GetRichTextStream: TMemoryStream;
begin

  LoadRichText;

  Result := inherited GetRichTextStream;

end; {procedure, GetRichTextStream}


{------------------------------------------------------------------------------}
{ TppRichText.LoadRichText }

procedure TppRichText.LoadRichText;
begin

  FRichTextStream.Clear;

  FRichTextStrings.SaveToStream(FRichTextStream);
  FRichTextStream.Position := 0;

  InvalidateDesignControl;

end; {procedure, LoadRichText}


{------------------------------------------------------------------------------}
{ TppRichText.CreatePopupMenu }

procedure TppRichText.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'Edit', '',  120);
  aPopupMenu.AddItem(30, 'MailMerge', '',  502);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppRichText.PopupMenuClick }

procedure TppRichText.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('Edit').OnClick := EditMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppRichText.EditMenuClick }

procedure TppRichText.EditMenuClick(Sender: TObject);
begin
  Edit;
end; {procedure, EditMenuClick}

{------------------------------------------------------------------------------}
{ TppRichText.Edit }

procedure TppRichText.Edit;
var
  lRTFEditor : TppCustomRTFEditor;
  lRTFEditorClass: TFormClass;
begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  {display RichText property dialog}
  lRTFEditorClass := ppGetFormClass(TppCustomRTFEditor);

  if (lRTFEditorClass = nil) then Exit;

  lRTFEditor := TppCustomRTFEditor(lRTFEditorClass.Create(Application));

  lRTFEditor.LanguageIndex := Band.LanguageIndex;
  lRTFEditor.Report := Band.Report;
  lRTFEditor.MailMerge := FMailMerge;

  FMemStream.Clear;
  SaveToRTFStream(FMemStream);
  FMemStream.Position := 0;
  lRTFEditor.Lines.LoadFromStream(FMemStream);

  if (lRTFEditor.ShowModal = mrOK) then
    begin
      FMemStream.Clear;
      lRTFEditor.Lines.SaveToStream(FMemStream);
      FMemStream.Position := 0;
      LoadFromRTFStream(FMemStream);
      InvalidateDesignControl;
      PropertyChange;   {ok to call this here}
    end;

  lRTFEditor.Free;


end; {procedure, LinesMenuClick}



{******************************************************************************
 *
 ** D B R I C H T E X T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDBRichText.Create }

constructor TppDBRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FAutoDisplay            := True;
  FOnGetRichText          := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBRichText.Destroy }

destructor TppDBRichText.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetAutoDisplay }

procedure TppDBRichText.SetAutoDisplay(aValue: Boolean);
begin

  FAutoDisplay := aValue;
  
  if FAutoDisplay then
    LoadRichText
  else
    begin
      FRichTextStream.Clear;
      FRichTextStrings.Clear;
    end;

  InvalidateDesignControl;

end; {procedure, SetAutoDisplay}


{------------------------------------------------------------------------------}
{ TppDBRichText.GetRichTextStream }

function TppDBRichText.GetRichTextStream: TMemoryStream;
var
  lsText: String;

begin

  if Assigned(FOnGetRichText) then
    begin
      FOnGetRichText(Self, lsText);
      SetRichText(lsText);
    end
  else
    LoadRichText;

  Result := inherited GetRichTextStream;

end; {function, GetRichTextStream}

{------------------------------------------------------------------------------}
{ TppDBRichText.LoadRichText }

procedure TppDBRichText.LoadRichText;
begin

  if not(FAutoDisplay) then Exit;

  if not(CheckForPipelineData) then Exit;

  try
    SetRichText(DataPipeline.GetFieldAsString(DataField));
  except
    {'Error Loading RichText'}
    SetRichText(ppLoadStr(414));
  end; {try, except}

  InvalidateDesignControl;

end; {procedure, LoadRichText}

{------------------------------------------------------------------------------}
{ TppDBRichText.Notify }

procedure TppDBRichText.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (csDestroying in ComponentState) then Exit;

  if (aOperation in [ppopDataChange, ppopRemove]) and (pppcDesigning in DesignState) and not(Printing) then
    LoadRichText;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBRichText.IsDataAware }

function TppDBRichText.IsDataAware: Boolean;
begin
  Result := True;

end; {function, IsDataAware}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetDataField }

procedure TppDBRichText.SetDataField(const Value: string);
begin

  inherited SetDataField(Value);

  {display the text}
  LoadRichText;

end; {procedure, SetDataField}



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
 ** C U S T O M   R I C H T E X T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.CallMethod }

class function TraTppCustomRichTextRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lRichText: TppCustomRichText;
  lString: String;
  liStartPos: Integer;
  liLength: Integer;
  lOptions: TSearchTypes;
  liResult: Integer;
  lStream: TStream;
begin

  Result := True;

  lRichText := TppCustomRichText(aObject);

  if ppEqual(aMethodName, 'FindText') then
    begin
      aParams.GetParamValue(0, lString);
      aParams.GetParamValue(1, liStartPos);
      aParams.GetParamValue(2, liLength);
      aParams.GetParamValue(3, lOptions);

      liResult := lRichText.FindText(lString, liStartPos, liLength, lOptions);

      aParams.SetParamValue(4, liResult);
    end

  else if ppEqual(aMethodName, 'LoadFromFile') then
    begin
      aParams.GetParamValue(0, lString);

      lRichText.LoadFromFile(lString);
    end

  else if ppEqual(aMethodName, 'LoadFromRTFStream') then
    begin
      aParams.GetParamValue(0, lStream);

      lRichText.LoadFromRTFStream(lStream);
    end

  else if ppEqual(aMethodName, 'SaveToFile') then
    begin
      aParams.GetParamValue(0, lString);

      lRichText.SaveToFile(lString);
    end

  else if ppEqual(aMethodName, 'SaveToRTFStream') then
    begin
      aParams.GetParamValue(0, lStream);

      lRichText.SaveToRTFStream(lStream);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetParams }

class function TraTppCustomRichTextRTTI.GetParams(const aMethodName: String): TraParamList;
begin


  if ppEqual(aMethodName, 'FindText') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('SearchStr', daString, nil, '', True, False);
      Result.AddParam('StartPos', daInteger, nil, '', False, False);
      Result.AddParam('Length', daInteger, nil, '', False, False);
      Result.AddParam('Options', daEnum, nil, 'TSearchType', False, False);
      Result.AddParam('Result', daInteger, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'LoadFromFile') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aFileName', daString, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'LoadFromRTFStream') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aStream', daClass, TStream, '', False, False);
    end

  else if ppEqual(aMethodName, 'SaveToFile') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aFileName', daString, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'SaveToRTFStream') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aStream', daClass, TStream, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function GetParams}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.RefClass }

class function TraTppCustomRichTextRTTI.RefClass: TClass;
begin
  Result := TppCustomRichText;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetPropList }

class procedure TraTppCustomRichTextRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public methods}
  aPropList.AddMethod('FindText');
  aPropList.AddMethod('LoadFromFile');
  aPropList.AddMethod('LoadFromRTFStream');
  aPropList.AddMethod('SaveToFile');
  aPropList.AddMethod('SaveToRTFStream');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetPropRec }

class function TraTppCustomRichTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'EndCharPos') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'RichText') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'RichTextStream') = 0) then
    ClassPropToRec(aPropName, TMemoryStream, True, aPropRec)

  else if (CompareText(aPropName, 'StartCharPos') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'Paragraph') = 0) then
    ClassPropToRec(aPropName, TParaAttributes, True, aPropRec)

  else if (CompareText(aPropName, 'SelAttributes') = 0) then
    ClassPropToRec(aPropName, TTextAttributes, True, aPropRec)

  else if (CompareText(aPropName, 'SelLength') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'SelStart') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'SelText') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'PlainText') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else  if (CompareText(aPropName, 'FindText') = 0) or
           (CompareText(aPropName, 'LoadFromFile') = 0) or
           (CompareText(aPropName, 'LoadFromRTFStream') = 0) or
           (CompareText(aPropName, 'SaveToFile') = 0) or
           (CompareText(aPropName, 'SaveToRTFStream') = 0) then

    MethodToRec(aPropName, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetPropValue }

class function TraTppCustomRichTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'EndCharPos') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).EndCharPos

  else if (CompareText(aPropName, 'RichText') = 0) then
    String(aValue) := TppCustomRichText(aObject).RichText

  else if (CompareText(aPropName, 'RichTextStream') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).RichTextStream)

  else if (CompareText(aPropName, 'StartCharPos') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).StartCharPos

  else if (CompareText(aPropName, 'Paragraph') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).Paragraph)

  else if (CompareText(aPropName, 'SelAttributes') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).SelAttributes)

  else if (CompareText(aPropName, 'SelLength') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).SelLength

  else if (CompareText(aPropName, 'SelStart') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).SelStart

  else if (CompareText(aPropName, 'SelText') = 0) then
    String(aValue) := TppCustomRichText(aObject).SelText

  else if (CompareText(aPropName, 'PlainText') = 0) then
    Boolean(aValue) := TppCustomRichText(aObject).PlainText

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.SetPropValue }

class function TraTppCustomRichTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'RichText') = 0) then
    TppCustomRichText(aObject).RichText := String(aValue)

  else if (CompareText(aPropName, 'SelLength') = 0) then
    TppCustomRichText(aObject).SelLength := Integer(aValue)

  else if (CompareText(aPropName, 'SelStart') = 0) then
    TppCustomRichText(aObject).SelStart := Integer(aValue)

  else if (CompareText(aPropName, 'SelText') = 0) then
    TppCustomRichText(aObject).SelText := String(aValue)

  else if (CompareText(aPropName, 'PlainText') = 0) then
    TppCustomRichText(aObject).PlainText := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** D B   R I C H T E X T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.RefClass }

class function TraTppDBRichTextRTTI.RefClass: TClass;
begin
  Result := TppDBRichText;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.GetPropList }

class procedure TraTppDBRichTextRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.GetPropRec }

class function TraTppDBRichTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.GetPropValue }

class function TraTppDBRichTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    Boolean(aValue) := TppDBRichText(aObject).AutoDisplay

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.SetPropValue }

class function TraTppDBRichTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    TppDBRichText(aObject).AutoDisplay := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppCustomRichTextRTTI);
  raRegisterRTTI(TraTppDBRichTextRTTI);

finalization

  raUnRegisterRTTI(TraTppCustomRichTextRTTI);
  raUnRegisterRTTI(TraTppDBRichTextRTTI);

end.
