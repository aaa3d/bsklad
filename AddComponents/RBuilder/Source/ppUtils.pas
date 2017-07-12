{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppUtils;

interface

{$I ppIfDef.pas}

uses
  Windows, Registry, Messages, Classes, Graphics, Mask, ExtCtrls,
  SysUtils, TypInfo, Dialogs, Forms, ppTypes;

type

  { TppPageDef }
  TppPageDef = class(TPersistent)
    private
      FHeight: Longint;
      FWidth: Longint;
      FMarginLeft: Longint;
      FMarginRight: Longint;
      FMarginTop: Longint;
      FMarginBottom: Longint;

      function GetPrintableHeight: Longint;
      function GetPrintableWidth: Longint;

      function GetScreenPixelPrintableHeight: Integer;
      function GetScreenPixelPrintableWidth: Integer;
      function GetScreenPixelHeight: Integer;
      function GetScreenPixelWidth: Integer;
      function GetScreenPixelMarginLeft: Integer;
      function GetScreenPixelMarginRight: Integer;
      function GetScreenPixelMarginTop: Integer;
      function GetScreenPixelMarginBottom: Integer;

    public
      procedure Assign(Source: TPersistent); override;

      function  PageRect: TppRect;
      function  IsEqual(aPageDef: TppPageDef): Boolean;

      property spPrintableHeight: Integer read GetScreenPixelPrintableHeight;
      property spPrintableWidth: Integer read GetScreenPixelPrintableWidth;
      property spHeight: Integer read GetScreenPixelHeight;
      property spWidth: Integer read GetScreenPixelWidth;
      property spMarginLeft: Integer read GetScreenPixelMarginLeft;
      property spMarginRight: Integer read GetScreenPixelMarginRight;
      property spMarginTop: Integer read GetScreenPixelMarginTop;
      property spMarginBottom: Integer read GetScreenPixelMarginBottom;

      property mmPrintableHeight: Longint read GetPrintableHeight;
      property mmPrintableWidth: Longint read GetPrintableWidth;

    published
      property mmHeight: Longint read FHeight write FHeight;
      property mmWidth: Longint read FWidth write FWidth;
      property mmMarginLeft: Longint read FMarginLeft write FMarginLeft;
      property mmMarginRight: Longint read FMarginRight write FMarginRight;
      property mmMarginTop: Longint read FMarginTop write FMarginTop;
      property mmMarginBottom: Longint read FMarginBottom write FMarginBottom;

  end; {class, TppPageDef}

  { TppFont  }
  TppFont = class(TFont)
  published
    property Height stored False;
    property Size stored True;

  end; {class, TppFont }

  {TppFontInfo }
  TppFontInfo = class
  private
    FCharSet: TFontCharSet;
    FFontName: TFontName;
    FFontType: Byte;

  public
    property CharSet: TFontCharSet read FCharSet write FCharSet;
    property FontName: TFontName read FFontName write FFontName;
    property FontType: Byte read FFontType write FFontType;

  end; {class, TppFontInfo}



  {TppFontList }
  TppFontList = class(TStringList)
  private

    function GetFontInfo(aIndex: Integer): TppFontInfo;

  public
    constructor CreateList(aDC: HDC);
    destructor Destroy; override;

    property FontInfo[Index: Integer]: TppFontInfo read GetFontInfo;


  end; {class, TppFontList }


  { TppRegListSubscriber }
  TppRegListSubscriber = class
  private
    FOnListChanged: TNotifyEvent;

  protected

  public

    procedure RegisterListChanged; virtual;

    property OnListChanged: TNotifyEvent read FOnListChanged write FOnListChanged;

  end; {class, TppRegListSubscriber}


 { TppRegList }
  TppRegList = class(TStringList)
  private
    FNotifyList: TList;

    procedure RegChanged;
    
  public
    destructor Destroy; override;

    procedure AddNotify(aRegListSubscriber: TppRegListSubscriber);
    procedure RemoveNotify(aRegListSubscriber: TppRegListSubscriber);

    function  AddObject(const S: string; AObject: TObject): Integer; override;
    procedure Delete(Index: Integer); override;

  end; {class, TppRegList}



 { TppResourceManager }
  TppResourceManager = class(TObject)
    private
      FLanguage: TppLanguageType;
      FResourceModules: TStringList;
      FResModuleCount: Integer;

      procedure LoadResourceModule(aIndex: Integer);
      procedure UnLoadResourceModule(aIndex: Integer);

      function LoadStrFromModule(aIdent: Longint): String;

      procedure LoadResourceModules;
      procedure FreeResourceModules;

    public
      constructor Create; virtual;
      destructor Destroy; override;

      procedure AddResFileName(aResFileName: String);
      procedure RemoveResFileName(aResFileName: String);

      function LoadStr(aIdent: Longint): String;
      function SetLanguage(aLanguage: TppLanguageType): Boolean;

      property Language: TppLanguageType read FLanguage;

    end; {class, TppResourceManager}




 
  { TppDeviceCompatibleCanvas }
  TppDeviceCompatibleCanvas = class(TCanvas)
  private
    FReferenceDC: HDC;
    FCompatibleDC: HDC;
    FCompatibleBitmap: HBitmap;
    FOldBitmap: HBitmap;
    FWidth: Integer;
    FHeight: Integer;
    FSavePalette: HPalette;
    FRestorePalette: Boolean;

  protected
    procedure CreateHandle; override;
    procedure Changing; override;
    procedure UpdateFont;

  public
    constructor Create(aReferenceDC: HDC; aWidth, aHeight: Integer; aPalette: HPalette);
    destructor Destroy; override;

    procedure RenderToDevice(aDestRect: TRect; aPalette: HPalette; aCopyMode: TCopyMode);

    property Height: Integer read FHeight;
    property Width: Integer read FWidth;


  end; {class, TppDeviceCompatibleCanvas }


  TppDebugLog = class(TStringList)
  public
    procedure WriteMessage(aMessage: String);

  end;

{******************************************************************************
 *
 ** G E N E R A L   F U N C T I O N S
 *
{******************************************************************************}

  function  ppBitmapFromResource(aBitmapName: String): THandle;
  function  ppCalcAspectRatio(aSourceWidth, aSourceHeight, aDestWidth, aDestHeight: Single): Single;
  function  ppCapitalize(aString: String): String;
  function  ppCheckLinesFit(aLineCount: Integer; aFont: TFont; aLeading: Longint; aSpaceAvailable: Longint; var aFittedLines: Integer; var aHeightUsed: Longint; aPrinter: TObject): Boolean;
  function  ppCheckPropInfo(aObject: TObject; aPropName: String): Boolean;
  procedure ppConvertTabStopPos(aUnits: TppUnitType; aTabList: TStrings; var aTabArray: TppTabStopPos; var aSize: Integer; aPrinter: TObject);
  function  ppCopyPalette(aPalette: HPalette): HPalette;
  procedure ppDebugMessage(aClassName, aProcName, aComment: String; aShowMessage: Boolean);
  procedure ppDecimalSeparatorToPeriod(aList: TStrings);
  function  ppDisplayWidthToPixels(aDisplayWidth: Integer; aCanvas: TCanvas): Integer;
  function  ppDoctorReportObjectText(aObjectText: TStrings): Boolean;
  function  ppDebugLog: TppDebugLog;
  procedure ppDrawDIBitmap(aCanvas: TCanvas; const aRect: TRect; aBitmap: TBitmap; aCopyMode: TCopyMode);
  procedure ppDrawTransparentDIBitmap(aCanvas: TCanvas; const aRect: TRect; aBitmap: TBitmap; aCopyMode: TCopyMode);
  function  ppFixText(Text: String; TargetLength: Integer; Alignment: TAlignment): String;
  function  ppFormat(const aDisplayFormat: String; aDataType: TppDataType; aValue: Variant): String;
  function  ppFormatCalcValue(aCalcType: TppCalcType; aPageNo, aPageCount: Longint; aPrintDateTime: TDateTime; aLanguageIndex: Longint; aPrinting: Boolean): String;
  function  ppFormatVarValue(aVarType: TppVarType; aPageNo, aPageCount: Longint; aPrintDateTime: TDateTime; aLanguageIndex: Longint; aPrinting: Boolean): String;
  function  ppGetDIB(aHBitmap: HBITMAP; aPalette: HPALETTE; var aBitmapInfo; var aBits): Boolean;
  procedure ppGetDIBSizes(aHBitmap: HBITMAP; var aInfoHeaderSize: Integer; var aImageSize: DWORD);
  procedure ppGetDisplayFormats(aDataType: TppDataType; aFormatList: TStrings);
  function  ppGetEnumName(aEnumType: PTypeInfo; aOrd: Integer): String;
  procedure ppGetEnumNames(aEnumType: PTypeInfo; aValues: TStrings);
  function  ppGetEnumStringAsInteger(aEnumType: PTypeInfo; const aEnum: String): Integer;
  procedure ppGetFontNames(aDC: HDC; aFontList: TStrings);
  function  ppGetOrdPropValue(aObject: TObject; aPropName: String): Longint;
  function  ppGetStringPropValue(aObject: TObject; aPropName: String): String;
  function  ppGetSystemDefaultLanguage: TppLanguageType;
  procedure ppSetOrdPropValue(aObject: TObject; aPropName: String; aValue: Longint);
  procedure ppSetStringPropValue(aObject: TObject; aPropName: String; aValue: String);
  procedure ppSetMethodPropValue(aObject: TObject; aPropName: String; aValue: TMethod);
  function  ppEqual(const aString1, aString2: String): Boolean;
  function  ppFindMethod(aObject: TObject; aMethodName: String): TMethod;
  function  ppFixUpFloatString(const aFloatString, aDisplayFormat: String): String;
  function  ppGetScreenRes: TPoint;
  function  ppGetStdNamingPrefix(aComponent: TComponent): String;
  function  ppGetUserNamePrefix(aComponent: TComponent): String;
  function  ppGetDelphiPath: String;
  function  ppGetTempFileName(aPath: String; aPrefix: String): String;
  function  ppGetTempPath: String;
  function  ppGetUniqueName(aOwner: TComponent; aNamingPrefix: String; aComponent: TComponent): String;
  function  ppExtractNamingNumber(aNamingPrefix: String; aComponent: TComponent; var aNamingNo: Integer): Boolean;
  function  ppGetUniqueNamingNumber(aNumberList: TStringList): Integer;
  function  ppGetWord(Text: PChar; var CharPos: Longint): String;
  function  ppLineTooLong(aLine: String; aWidth: Integer; aCanvas: TCanvas; aTabStops: Integer; var aTabStopArray: TppTabStopPos): Boolean;
  function  ppMaxLinesFit(aFont: TFont; aLeading: Longint; aSpaceAvailable: Longint; aPrinter: TObject; var aLineHeight: Longint): Integer;
  function  ppMessageDlg(const Caption, Msg: String; AType: TMsgDlgType; AButtons: TMsgDlgButtons; aBitmapHandle: Longint): Word;
  function  ppRect(aLeft, aTop, aRight, aBottom: Longint): TppRect;
  function  ppReadIntegerPropValue(Reader: TReader): LongInt;
  function  ppRemoveCharacter(aCharacter: Char; const aString: String): String;
  function  ppCombineStrings(aStrings: TStrings): String;
  procedure ppParseString(const aString: String; aStrings: TStrings);
  procedure ppPeriodToDecimalSeparator(aList: TStrings);
  function  ppSetMessageParameters(const aMessage: String): String;
  procedure ppStringsToStream(aStrings: TStrings; aMemoryStream: TMemoryStream);
  function  ppStripOffPath(Value: String): String;
  function  ppSubstituteFont(aFontName: String): String;
  function  ppAllTrim(const aString: String): String;
  function  ppTextToIdentifier(const aString: String): String;
  procedure ppTextToPageList(const aString: String; aPageList: TStrings; aTrimPages: Boolean);
  function  ppTrimLeft(const aString: String): String;
  function  ppTrimRight(const aString: String): String;
  function  ppStripCharacter(const aString: String; aChar: Char): String;
  function  ppVersionToInt(aVersion: String): Integer;
  function  ppCalcTextHeight(aFont: TFont): Integer;
  function  ppGetSpTextWidth(aFont: TFont; aText: String): Integer;
  function  ppGetSpTextHeight(aFont: TFont; aText: String): Integer;
  function  ppVarEventToEvent(aVarEvent: TppVarEventType): Integer;
  function  ppEventToVarEvent(aEvent: Integer): TppVarEventType;
  function  ppCalcTypeToVarType(aCalcType: TppCalcType): TppVarType;
  function  ppGetLangLocaleID(aLanguage: TppLanguageType): String;
  function  ppLoadStr(aIdent: Longint): String;
  function  ppResourceManager: TppResourceManager;
  function  ppFromMMTenths(Value: Longint; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Single;
  function  ppToMMTenths(Value: Single; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Longint;
  function  ppFromMMThousandths(Value: Longint; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Single;
  function  ppToMMThousandths(Value: Single; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Longint;
  function  ppToScreenPixels(aValue: Single; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Integer;
  function  ppFromScreenPixels(aScreenPixels: Integer; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Single;
  procedure ppStripOffTableName(aRawTableName: String; var aTableName: String; var aExtension: String; var aIsFileBased: Boolean);
  procedure ppStringsFromMMThousandths(aStringList: TStrings; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject);
  procedure ppStringsToMMThousandths(aStringList: TStrings; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject);
  procedure ppWordWrap(aTextBuf: PChar; aRect: TppRect; aFont: TFont; aLeading: Longint; aTruncateLines: Boolean;
                       var aWrappedLines: TStrings; aTabStopList: TStrings; aUnits: TppUnitType; aIsMemo: Boolean;
                       aPrinter: TObject; var aCharPos: Longint; aCharWrap: Boolean);

  function ppStrToDateTime(aValue: String): TDateTime;


implementation

uses
  Controls, Consts, ppPrintr;

var
  FDebugLog: TppDebugLog = nil;
  FResourceManager: TppResourceManager = nil;

{******************************************************************************
 *
 ** P A G E D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPageDef.PageRect }

function TppPageDef.PageRect: TppRect;
begin

  Result := ppRect( FMarginLeft,
                    FMarginTop,
                    FWidth - FMarginRight,
                    FHeight - FMarginBottom);

end; {function, PageRect}

{------------------------------------------------------------------------------}
{ TppPageDef.IsEqual }

function TppPageDef.IsEqual(aPageDef: TppPageDef): Boolean;
begin
  Result := (FHeight       = aPageDef.mmHeight)        and
            (FWidth        = aPageDef.mmWidth)         and
            (FMarginLeft   = aPageDef.mmMarginLeft)    and
            (FMarginRight  = aPageDef.mmMarginRight)   and
            (FMarginTop    = aPageDef.mmMarginTop)     and
            (FMarginBottom = aPageDef.mmMarginBottom);
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetPrintableHeight }

function TppPageDef.GetPrintableHeight: Longint;
begin
  Result := FHeight - (FMarginTop + FMarginBottom);
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetPrintableWidth }

function TppPageDef.GetPrintableWidth: Longint;
begin
  Result := FWidth - (FMarginLeft + FMarginRight);
end;

{------------------------------------------------------------------------------}
{ TppPageDef.Assign }

procedure TppPageDef.Assign(Source: TPersistent);
var
  lPageDef: TppPageDef;
begin

  {if object passed is not a PageDef, allow inherited Assign to raise exception}
  if not(Source is TppPageDef) then
    inherited Assign(Source);

  lPageDef := TppPageDef(Source);

  FHeight       := lPageDef.mmHeight;
  FWidth        := lPageDef.mmWidth;
  FMarginLeft   := lPageDef.mmMarginLeft;
  FMarginRight  := lPageDef.mmMarginRight;
  FMarginTop    := lPageDef.mmMarginTop;
  FMarginBottom := lPageDef.mmMarginBottom;

end; {procedure, Assign}


{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelPrintableHeight }

function TppPageDef.GetScreenPixelPrintableHeight: Integer;
begin
  Result := Trunc(ppFromMMThousandths(GetPrintableHeight, utScreenPixels, pprtVertical, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelPrintableWidth }

function TppPageDef.GetScreenPixelPrintableWidth: Integer;
begin
  Result := Trunc(ppFromMMThousandths(GetPrintableWidth, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelHeight }

function TppPageDef.GetScreenPixelHeight: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FHeight, utScreenPixels, pprtVertical, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelHeight }

function TppPageDef.GetScreenPixelWidth: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FWidth, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginLeft }

function TppPageDef.GetScreenPixelMarginLeft: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginLeft, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginRight }

function TppPageDef.GetScreenPixelMarginRight: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginRight, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginTop }

function TppPageDef.GetScreenPixelMarginTop: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginTop, utScreenPixels, pprtVertical, nil));
end;
{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginBottom }

function TppPageDef.GetScreenPixelMarginBottom: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginBottom, utScreenPixels, pprtVertical, nil));
end;

{******************************************************************************
 *
 ** F O N T L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ EnumFontsProc }

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer): Integer; stdcall;
var
  lFontInfo: TppFontInfo;
begin

  lFontInfo := TppFontInfo.Create;

  lFontInfo.FontName := StrPas(LogFont.lfFaceName);
  lFontInfo.FontType := TextMetric.tmPitchAndFamily;
  lFontInfo.CharSet  := TFontCharSet(LogFont.lfCharSet);


  TStrings(Data).AddObject(lFontInfo.FontName, lFontInfo);

  Result := 1;
end;

{------------------------------------------------------------------------------}
{ TppFontList.CreateList }

constructor TppFontList.CreateList(aDC: HDC);
var
  lDC: HDC;
  Proc: TFarProc;
begin
  inherited Create;

  if (aDC = 0) then
    lDC := GetDC(0)
  else
    lDC := aDC;

  Proc := MakeProcInstance(@EnumFontsProc, HInstance);

  EnumFonts(lDC, nil, Proc, Pointer(Self));
  FreeProcInstance(Proc);

  if (aDC = 0) then
    ReleaseDC(0, lDC);

  {sort the list}
  Sorted := True;


end;  {constructor, CreateList}

{------------------------------------------------------------------------------}
{ TppFontList.Destroy }

destructor TppFontList.Destroy;
var
  liIndex: Integer;
  
begin

  for liIndex := 0 to Count-1 do
    Objects[liIndex].Free;


  inherited Destroy;

end;   {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppFontList.GetFontInfo }

function TppFontList.GetFontInfo(aIndex: Integer): TppFontInfo;
begin

  Result := TppFontInfo(Objects[aIndex]);

end;  {function, GetFontInfo}




{******************************************************************************
 *
 ** R E G  L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRegList.Destroy }

destructor TppRegList.Destroy;
begin

  FNotifyList.Free;

  inherited Destroy;

end; {destructor,  Destroy}


{------------------------------------------------------------------------------}
{ TppRegList.AddNotify }

procedure TppRegList.AddNotify(aRegListSubscriber: TppRegListSubscriber);
begin

  if (FNotifyList = nil) then
    FNotifyList := TList.Create;

  FNotifyList.Add(aRegListSubscriber);

end; {procedure,  AddNotify}


{------------------------------------------------------------------------------}
{ TppRegList.RemoveNotify }

procedure TppRegList.RemoveNotify(aRegListSubscriber: TppRegListSubscriber);
begin


  FNotifyList.Remove(aRegListSubscriber);

  if (FNotifyList.Count = 0) then
    begin
      FNotifyList.Free;
      FNotifyList := nil;
    end;


end; {procedure,  RemoveNotify}


{------------------------------------------------------------------------------}
{ TppRegList.AddObject }

function  TppRegList.AddObject(const S: string; aObject: TObject): Integer;
begin

  Result := inherited AddObject(S, aObject);

  RegChanged;

end; {function,  AddObject}


{------------------------------------------------------------------------------}
{ TppRegList.Delete }

procedure TppRegList.Delete(Index: Integer);
begin
  inherited Delete(Index);

  RegChanged;

end; {procedure,  Delete}


{------------------------------------------------------------------------------}
{ TppRegList.RegChanged }

procedure TppRegList.RegChanged;
var
  liObject: Integer;
  lRegListSubscriber: TppRegListSubscriber;

begin

  inherited Changed;

  if (FNotifyList = nil) then Exit;

  for liObject := 0 to FNotifyList.Count-1 do
    begin

      lRegListSubscriber := TppRegListSubscriber(FNotifyList[liObject]);
      lRegListSubscriber.RegisterListChanged;
    end;

end; {procedure,  RegChanged}


{******************************************************************************
 *
 ** R E G   L I S T   S U B S C R I B E R
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppRegListSubscriber.RegisterListChanged }

procedure TppRegListSubscriber.RegisterListChanged;
begin

  if Assigned(FOnListChanged) then FOnListChanged(Self);

end; {procedure,  RegisterListChanged}




{******************************************************************************
 *
 ** R E S O U R C E M A N A G E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppResourceManager.Create }

constructor TppResourceManager.Create;
begin
  inherited Create;

  FLanguage := lgDefault;

  FResourceModules := TStringList.Create;

  FResModuleCount := 0;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppResourceManager.Destroy }

destructor TppResourceManager.Destroy;
begin

  FreeResourceModules;
  FResourceModules.Free;

  inherited Destroy;

end; {destructor,  Destroy}

{------------------------------------------------------------------------------}
{ TppResourceManager.SetLanguage }

function TppResourceManager.SetLanguage(aLanguage: TppLanguageType): Boolean;
var
  lSaveLanguage: TppLanguageType;

begin

  lSaveLanguage := FLanguage;

  FLanguage := aLanguage;

  LoadResourceModules;

  Result := (FLanguage = lgDefault) or (FResModuleCount > 0);

  if not Result then
    FLanguage := lSaveLanguage;


end; {procedure,  SetLanguage}

{------------------------------------------------------------------------------}
{ TppResourceManager.AddResFileName }

procedure TppResourceManager.AddResFileName(aResFileName: String);
var
  liIndex: Integer;
  
begin

  if FResourceModules.IndexOf(aResFileName) > 0 then Exit;

  liIndex := FResourceModules.Add(aResFileName);

  LoadResourceModule(liIndex);

end; {procedure,  AddResFileName}

{------------------------------------------------------------------------------}
{ TppResourceManager.RemoveResFileName }

procedure TppResourceManager.RemoveResFileName(aResFileName: String);
var
  liIndex: Integer;

begin
  liIndex := FResourceModules.IndexOf(aResFileName);

  if liIndex < 0 then Exit;

  UnLoadResourceModule(liIndex);

  FResourceModules.Delete(liIndex);

end; {procedure,  RemoveResFileName}


{------------------------------------------------------------------------------}
{ TppResourceManager.LoadStr }

function TppResourceManager.LoadStr(aIdent: Longint): String;
begin

  if FResModuleCount = 0 then
    Result := SysUtils.LoadStr(aIdent)
  else
    begin
      Result := LoadStrFromModule(aIdent);

      if Result = '' then
        Result := SysUtils.LoadStr(aIdent);

    end;

end; {function,  LoadStr}

{------------------------------------------------------------------------------}
{ TppResourceManager.LoadStrFromModule }

function TppResourceManager.LoadStrFromModule(aIdent: Longint): String;
var
  lBuffer: array[0..1023] of Char;
  liIndex: Integer;

begin

  Result := '';
  liIndex := 0;

  while (Result = '') and (liIndex < FResourceModules.Count) do
    begin

      if (FResourceModules.Objects[liIndex] <> nil) and
         (LoadString(THandle(FResourceModules.Objects[liIndex]), aIdent, lBuffer, SizeOf(lBuffer)) > 0) then

        Result := String(lBuffer);

      Inc(liIndex);

    end;

end; {function,  LoadStrFromModule}

{------------------------------------------------------------------------------}
{ TppResourceManager.LoadResourceModules }

procedure TppResourceManager.LoadResourceModules;
var
  liIndex: Integer;

begin

  FreeResourceModules;

  for liIndex := 0 to FResourceModules.Count-1 do
    LoadResourceModule(liIndex);

end; {procedure,  LoadResourceModules}

{------------------------------------------------------------------------------}
{ TppResourceManager.FreeResourceModules }

procedure TppResourceManager.FreeResourceModules;
var
  liIndex: Integer;
begin

  for liIndex := 0 to FResourceModules.Count-1 do
    UnLoadResourceModule(liIndex);

end; {procedure,  FreeResourceModules}

{------------------------------------------------------------------------------}
{ TppResourceManager.LoadResourceModule }

procedure TppResourceManager.LoadResourceModule(aIndex: Integer);
var
  lsResFileName: String;
  lResInstance: THandle;
begin

  lsResFileName := FResourceModules[aIndex] + '.' + ppGetLangLocaleID(FLanguage);

  lResInstance := LoadLibraryEx(PChar(lsResFileName), 0, LOAD_LIBRARY_AS_DATAFILE);

  FResourceModules.Objects[aIndex] := Pointer(lResInstance);

  if lResInstance <> 0 then
    Inc(FResModuleCount);


end; {function,  LoadResourceModule}


{------------------------------------------------------------------------------}
{ TppResourceManager.UnLoadResourceModule }

procedure TppResourceManager.UnLoadResourceModule(aIndex: Integer);
begin

  if (FResourceModules.Objects[aIndex] = nil) then Exit;

  FreeLibrary(THandle(FResourceModules.Objects[aIndex]));
  FResourceModules.Objects[aIndex] := nil;

  Dec(FResModuleCount);


end; {function,  LoadResourceModule}



{******************************************************************************
 *
 ** D e v i c e  C o m p a t i b l e  C a n v a s
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDeviceCompatibleCanvas.Create }

constructor TppDeviceCompatibleCanvas.Create(aReferenceDC: HDC; aWidth, aHeight: Integer; aPalette: HPalette);
begin
  inherited Create;

  FReferenceDC := aReferenceDC;
  FWidth  := aWidth;
  FHeight := aHeight;


  FSavePalette := 0;
  FRestorePalette := False;

  FCompatibleDC := CreateCompatibleDC(FReferenceDC);


  FCompatibleBitmap := CreateCompatibleBitmap(FReferenceDC, aWidth, aHeight);

  FOldBitMap := SelectObject(FCompatibleDC, FCompatibleBitmap);


  if aPalette <> 0 then
    begin
      FSavePalette := SelectPalette(FCompatibleDC, aPalette, False);
      RealizePalette(FCompatibleDC);
      FRestorePalette := True;
    end
  else
    begin
      FSavePalette := SelectPalette(FCompatibleDC, SystemPalette16, False);
      RealizePalette(FCompatibleDC);
      FRestorePalette := True;
    end;


  PatBlt(FCompatibleDC, 0, 0, aWidth, aHeight, WHITENESS);
  SetMapMode(FCompatibleDC, MM_TEXT);

end;

{------------------------------------------------------------------------------}
{ TppDeviceCompatibleCanvas.Destroy }

destructor TppDeviceCompatibleCanvas.Destroy;
begin

  if FRestorePalette then
    SelectPalette(FReferenceDC, FSavePalette, False);

  FReferenceDC := 0;

  Handle := 0;
  
  if FCompatibleDC <> 0 then
    begin
      SelectObject(FCompatibleDC, FOldBitMap);
      DeleteObject(FCompatibleBitmap);

      DeleteDC(FCompatibleDC);
    end;

  inherited Destroy;

end;



{------------------------------------------------------------------------------}
{ TppDeviceCompatibleCanvas.CreateHandle }

procedure TppDeviceCompatibleCanvas.CreateHandle;
begin
  UpdateFont;


  {assign to canvas handle }
  Handle := FCompatibleDC;

end;

{------------------------------------------------------------------------------}
{ TppDeviceCompatibleCanvas.Changing }

procedure TppDeviceCompatibleCanvas.Changing;
begin
  inherited Changing;
  UpdateFont;
end;

{------------------------------------------------------------------------------}
{ TppDeviceCompatibleCanvas.UpdateFont }

procedure TppDeviceCompatibleCanvas.UpdateFont;
var
  lFontSize: Integer;
  liDevicePixelsPerInch: Integer;
  
begin

  liDevicePixelsPerInch := GetDeviceCaps(FReferenceDC, LOGPIXELSY);

  if (liDevicePixelsPerInch <> Font.PixelsPerInch) then
    begin
      lFontSize := Font.Size;
      Font.PixelsPerInch := liDevicePixelsPerInch;
      Font.Size := lFontSize;
    end;

end;


{------------------------------------------------------------------------------}
{ TppDeviceCompatibleCanvas.RenderToDevice }

procedure TppDeviceCompatibleCanvas.RenderToDevice(aDestRect: TRect; aPalette: HPalette; aCopyMode: TCopyMode);
var
 lSavePalette: HPalette;
 lbRestorePalette: Boolean;


begin

  lSavePalette := 0;
  lbRestorePalette := False;

  if aPalette <> 0 then
    begin
      lSavePalette := SelectPalette(FReferenceDC, aPalette, False);
      RealizePalette(FReferenceDC);
      lbRestorePalette := True;
    end;


  {copy the bits to the device }
  BitBlt(FReferenceDC,
             aDestRect.Left, aDestRect.Top, aDestRect.Right - aDestRect.Left, aDestRect.Bottom - aDestRect.Top,
             FCompatibleDC,
             0, 0, aCopyMode);


  if lbRestorePalette then
    SelectPalette(FReferenceDC, lSavePalette, False);


end; {prodedure, RenderToDevice}


{******************************************************************************
 *
 ** G E N E R A L   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppStripOffTableName }

procedure ppStripOffTableName(aRawTableName: String; var aTableName: String; var aExtension: String; var aIsFileBased: Boolean);
var
  liPosition: Integer;
  lsString1: String;
  lsString2: String;
  lsExtension: String;
begin

  aTableName := aRawTableName;
  aExtension := '';

  liPosition := Pos('.', aTableName);

  if (liPosition > 0) then
    begin
      lsString1 := Copy(aTableName, 1, liPosition - 1);
      lsString2 := Copy(aTableName, liPosition + 1, Length(aTableName));

      aIsFileBased := ((CompareText(lsString2, 'DB') = 0) or
                       (CompareText(lsString2, 'DBF') = 0) or
                       (CompareText(lsString2, 'MDB') = 0) or
                       (CompareText(lsString2, 'DAT') = 0));

      lsExtension := Uppercase(lsString2);

      if aIsFileBased then
        begin
          aTableName := lsString1;
          aExtension := lsString2;
        end
      else
        begin
          aTableName := lsString2;
          aExtension := lsString1;
        end;
    end;

end;  {function, ppStripOffTableName}

{------------------------------------------------------------------------------}
{ ppCombineStrings }

function ppCombineStrings(aStrings: TStrings): String;
var
  liIndex: Integer;
begin

  Result := '';

  for liIndex := 0 to aStrings.Count - 1 do
    begin
      Result := Result + aStrings[liIndex];

      if (liIndex < aStrings.Count - 1) then
        Result := Result + ',';
    end;

end; {function, ppCombineStrings}

{------------------------------------------------------------------------------}
{ ppParseString }

procedure ppParseString(const aString: String; aStrings: TStrings);
var
  lsString: String;
  liPosition: Integer;
begin

  aStrings.Clear;
  
  lsString := aString;

  liPosition := Pos(',', lsString);

  while (liPosition <> 0) do
    begin
      aStrings.Add(Copy(lsString, 1, liPosition - 1));

      lsString := Copy(lsString, liPosition + 1, Length(lsString));

      liPosition := Pos(',', lsString);
    end;

  if (Length(lsString) > 0) then
    aStrings.Add(lsString);

end; {procedure, ppParseString}

{------------------------------------------------------------------------------}
{ ppCalcTypeToVarType }

function ppCalcTypeToVarType(aCalcType: TppCalcType): TppVarType;
begin

  case aCalcType of
    ctDate:          Result := vtDate;
    ctDateTime:      Result := vtDateTime;
    ctPrintDateTime: Result := vtPrintDateTime;
    ctPageCount:     Result := vtPageCount;
    ctPageSet:       Result := vtPageSet;
    ctPageSetDesc:   Result := vtPageSetDesc;
    ctPageNo:        Result := vtPageNo;
    ctPageNoDesc:    Result := vtPageNoDesc;
    ctTime:          Result := vtTime;
  else
    Result := vtDate;
  end; {case}

end; {function, ppCalcTypeToVarType}

{------------------------------------------------------------------------------}
{ ppEventToVarEvent }

function ppEventToVarEvent(aEvent: Integer): TppVarEventType;
begin

  case aEvent of
    ciTraversal:              Result := veTraversal;
    ciPipelineTraversal:      Result := veDataPipelineTraversal;
    ciEngineStart:            Result := veReportStart;
    ciEngineEnd:              Result := veReportEnd;
    ciEngineStartColumn:      Result := veColumnStart;
    ciEngineEndColumn:        Result := veColumnEnd;
    ciEngineStartPage:        Result := vePageStart;
    ciEngineEndPage:          Result := vePageEnd;
    ciGroupBeforeGroupBreak:  Result := veGroupStart;
    ciGroupAfterGroupBreak:   Result := veGroupEnd;
    ciGroupBeforeHeader:      Result := veGroupBeforeHeader;
    ciGroupBeforeFooter:      Result := veGroupBeforeFooter;
    else
      Result := veTraversal;
  end; {case}

end; {function, ppEventToVarEvent}

{------------------------------------------------------------------------------}
{ ppVarEventToEvent }

function ppVarEventToEvent(aVarEvent: TppVarEventType): Integer;
begin

  case aVarEvent of
    veTraversal:              Result := ciTraversal;
    veDataPipelineTraversal:  Result := ciPipelineTraversal;
    veReportStart:            Result := ciEngineStart;
    veReportEnd:              Result := ciEngineEnd;
    veColumnStart:            Result := ciEngineStartColumn;
    veColumnEnd:              Result := ciEngineEndColumn;
    vePageStart:              Result := ciEngineStartPage;
    vePageEnd:                Result := ciEngineEndPage;
    veGroupStart:             Result := ciGroupBeforeGroupBreak;
    veGroupEnd:               Result := ciGroupAfterGroupBreak;
    veGroupBeforeHeader:      Result := ciGroupBeforeHeader;
    veGroupBeforeFooter:      Result := ciGroupBeforeFooter;
    else
      Result := ciTraversal;
  end; {case}

end; {function, ppVarEventToEvent}

{------------------------------------------------------------------------------}
{ ppMessageDlg }

function ppMessageDlg(const Caption, Msg: String; AType: TMsgDlgType; AButtons: TMsgDlgButtons; aBitmapHandle: Longint): Word;
var
  lDialog: TForm;
  lImage: TComponent;
begin

  if (AType = mtCustom) then
    AType := mtError;

  lDialog := CreateMessageDialog(Msg, AType, AButtons);

  if (Caption <> '') then
    lDialog.Caption := Caption;

  if (aBitmapHandle <> 0) then
    begin
      lImage := lDialog.FindComponent('Image');

      if (lImage <> nil) then
        begin
          TImage(lImage).Picture.Bitmap.Handle := aBitmapHandle;
          TImage(lImage).Transparent := True;
        end;
    end;

  Result := lDialog.ShowModal;

  lDialog.Free;

end; {function, ppMessageDlg}

{------------------------------------------------------------------------------}
{ ppCalcTextHeight }

function ppCalcTextHeight(aFont: TFont): Integer;
var
  lBitMap: TBitmap;

begin

  lBitmap := TBitmap.Create;

  Result := lBitmap.Canvas.TextHeight('H');

  lBitmap.Free;

end;

{$IFDEF Delphi3}

{------------------------------------------------------------------------------}
{ ppReadIntegerPropValue }

function ppReadIntegerPropValue(Reader: TReader): LongInt;
begin
  {note: this function is used to read Longint properties because of a bug in Delphi's streaming logic }
  if Reader.NextValue = vaExtended then
    Result := Trunc(Reader.ReadFloat)
  else
    Result := Reader.ReadInteger;
end;

{$ELSE}

{------------------------------------------------------------------------------}
{ ppReadIntegerPropValue }

function ppReadIntegerPropValue(Reader: TReader): LongInt;
var
  lValueType: TValueType;
  lSmallInt: Smallint;
  lShortInt: Shortint;
  lExtendedValue: Extended;

begin
  {note: this function is used to read Longint properties because of a bug in Delphi's streaming logic }

  Reader.Read(lValueType, SizeOf(lValueType));

  case lValueType of
    vaExtended:
      begin
        Reader.Read(lExtendedValue, SizeOf(lExtendedValue));
        Result := Trunc(lExtendedValue);
      end;

    vaInt8:
      begin
        Reader.Read(lShortInt, SizeOf(lShortInt));
        Result := lShortInt;
      end;

    vaInt16:
      begin
        Reader.Read(lSmallInt, SizeOf(lSmallInt));
        Result := lSmallInt;
      end;

    vaInt32:
        Reader.Read(Result, SizeOf(Result));

  end;

end;

{$ENDIF}


{------------------------------------------------------------------------------}
{ ppRect }

function ppRect(aLeft, aTop, aRight, aBottom: Longint): TppRect;
var
  lRect: TppRect;
begin

  lRect.Left   := aLeft;
  lRect.Top    := aTop;
  lRect.Right  := aRight;
  lRect.Bottom := aBottom;

  Result := lRect;

end; {procedure, ppRect}

{------------------------------------------------------------------------------}
{ ppDebugMessage }

procedure ppDebugMessage(aClassName, aProcName, aComment: String; aShowMessage: Boolean);
begin
{$IFDEF DEBUG}
  if aShowMessage then
    ShowMessage(aClassName + '.'+ aProcName + ': ' + aComment);
{$ENDIF}
end;

{------------------------------------------------------------------------------}
{ ppGetLangLocaleID}

function ppGetLangLocaleID(aLanguage: TppLanguageType): String;
begin

 case aLanguage of
    lgDefault:           Result := 'dft';
    lgEnglish:           Result := 'eng';
    lgCustom:            Result := 'cst';
    lgDanish:            Result := 'dan';
    lgDutch:             Result := 'nld';
    lgFrench:            Result := 'fra';
    lgGerman:            Result := 'deu';
    lgItalian:           Result := 'ita';
    lgPortugueseBrazil:  Result := 'ptb';
    lgPortuguese:        Result := 'ptg';
    lgSpanish:           Result := 'esp';
    lgSpanishMexico:      Result := 'esm';
    lgSwedish:           Result := 'sve';
    lgNorwegian:         Result := 'nor';
  end;


end; {function, ppGetLangLocaleID}

{------------------------------------------------------------------------------}
{ ppLoadStr}

function ppLoadStr(aIdent: Longint): String;
begin

  Result := ppResourceManager.LoadStr(ciBaseNumber + aIdent);

 
end; {function, ppLoadString}

{------------------------------------------------------------------------------}
{ ppFindMethod }

function ppFindMethod(aObject: TObject; aMethodName: String): TMethod;
begin
  Result.Code := aObject.MethodAddress(aMethodName);
  Result.Data := aObject;
end;

{------------------------------------------------------------------------------}
{ ppCheckPropInfo }

function ppCheckPropInfo(aObject: TObject; aPropName: String): Boolean;
begin
  if aObject = nil then
    Result := False
  else
    Result := (GetPropInfo(aObject.ClassInfo, aPropName) <> nil);
end;


{------------------------------------------------------------------------------}
{ ppGetOrdPropValue }

function ppGetOrdPropValue(aObject: TObject; aPropName: String): Longint;
begin

  if not ppCheckPropInfo(aObject, aPropName) then
    Result := 0
  else
    Result := GetOrdProp(aObject, GetPropInfo(aObject.ClassInfo, aPropName));

end;

{------------------------------------------------------------------------------}
{ ppGetStringPropValue }

function ppGetStringPropValue(aObject: TObject; aPropName: String): String;
begin

  if not ppCheckPropInfo(aObject, aPropName) then
    Result := ''
  else
    Result := GetStrProp(aObject, GetPropInfo(aObject.ClassInfo, aPropName));

end;

{------------------------------------------------------------------------------}
{ ppSetOrdPropValue }

procedure ppSetOrdPropValue(aObject: TObject; aPropName: String; aValue: Longint);
begin

  if not ppCheckPropInfo(aObject, aPropName) then Exit;

  SetOrdProp(aObject, GetPropInfo(aObject.ClassInfo, aPropName), aValue);

end;

{------------------------------------------------------------------------------}
{ ppSetStrPropValue }

procedure ppSetStringPropValue(aObject: TObject; aPropName: String; aValue: String);
begin

  if not ppCheckPropInfo(aObject, aPropName) then Exit;

  SetStrProp(aObject, GetPropInfo(aObject.ClassInfo, aPropName), aValue);

end;


{------------------------------------------------------------------------------}
{ ppSetMethodPropValue }
procedure ppSetMethodPropValue(aObject: TObject; aPropName: String; aValue: TMethod);
begin

  if not ppCheckPropInfo(aObject, aPropName) then Exit;

  SetMethodProp(aObject, GetPropInfo(aObject.ClassInfo, aPropName), aValue);

end;


{------------------------------------------------------------------------------}
{ ppSetMessageParameters - convert all parms to '%s' }

function ppSetMessageParameters(const aMessage: String): String;
var
 lParameters: TStringList;
 liPos: Integer;
 lsParameter: String;
 lsMessage: String;
 liParameter: Integer;
 liParameters: Integer;
begin
  lsMessage := aMessage;

  lParameters := TStringList.Create;

  lParameters.Add('<page>');
  lParameters.Add('<pagecount>');
  lParameters.Add('<documentname>');
  lParameters.Add('<printername>');
  lParameters.Add('<columnno>');
  lParameters.Add('<filename>');
  lParameters.Add('<minbarwidth>');
  lParameters.Add('<maxbarwidth>');
  lParameters.Add('<character>');
  lParameters.Add('<identifier>');
  lParameters.Add('<name>');
  lParameters.Add('<count>');
  lParameters.Add('<message>');
  lParameters.Add('<length>');
  lParameters.Add('<no>');

  liParameters := lParameters.Count;
  liParameter := 0;
  liPos := 0;

  while (liParameter < liParameters) and (liPos = 0) do
    begin
      lsParameter := lParameters[liParameter];

      liPos := Pos(lsParameter, lsMessage);

      while (liPos <> 0) do
        begin
          Delete(lsMessage, liPos, Length(lsParameter));
          Insert('%s', lsMessage, liPos);
          liPos := Pos(lsParameter, lsMessage);
        end;

      Inc(liParameter);
    end;

  Result := lsMessage;

  lParameters.Free;

end;

{------------------------------------------------------------------------------}
{ ppGetEnumStringAsInteger }

function ppGetEnumStringAsInteger(aEnumType: PTypeInfo; const aEnum: String): Integer;
var
  lValues: TStrings;
begin

  lValues := TStringList.Create;

  ppGetEnumNames(aEnumType, lValues);

  Result := lValues.IndexOf(aEnum);

  lValues.Free;

end; {ppGetEnumStringAsInteger}

{------------------------------------------------------------------------------}
{ ppGetEnumName }

function ppGetEnumName(aEnumType: PTypeInfo; aOrd: Integer): String;
begin
  Result := GetEnumName(aEnumType, aOrd);
end;

{------------------------------------------------------------------------------}
{ ppGetEnumNames }

procedure ppGetEnumNames(aEnumType: PTypeInfo; aValues: TStrings);
var
  liValue: Integer;
  lTypeData: TTypeData;

begin

  aValues.Clear;

  lTypeData := GetTypeData(aEnumType)^;

  for liValue := lTypeData.MinValue to lTypeData.MaxValue do
    aValues.Add(ppGetEnumName(aEnumType, liValue));

end;


{------------------------------------------------------------------------------}
{ ppBitmapFromResource }

function ppBitmapFromResource(aBitmapName: String): THandle;
var
  lpLibModule: PLibModule;

begin

  Result := 0;

  lpLibModule := LibModuleList;

  while (lpLibModule <> nil) and (Result = 0) do
    begin
      Result := LoadBitmap(lpLibModule.ResInstance, PChar(aBitmapName));

      if (Result = 0) then
        Result := LoadBitmap(lpLibModule.Instance, PChar(aBitmapName));

      lpLibModule := lpLibModule.Next;
    end;

end;

{------------------------------------------------------------------------------}
{ ppDisplayWidthToPixels                                                       }

function ppDisplayWidthToPixels(aDisplayWidth: Integer; aCanvas: TCanvas): Integer;
var
  liCharWidth : Integer;
begin
  liCharWidth := aCanvas.TextWidth('0');
  Result := (aDisplayWidth * liCharWidth) + liCharWidth;
end; {procedure, DisplayWidthToPixels}


{------------------------------------------------------------------------------}
{ ppStripOffPath}

function ppStripOffPath(Value: String): String;
var
  liPos: Integer;
  liLastPos: Integer;
  lsOldValue: String;
begin
  Result := '';
  lsOldValue := Value;
  liLastPos := 0;

  repeat
    liPos := Pos('\', Value);
    if liPos > 0 then
      begin
        Value[liPos] := 'X';
        liLastPos := liPos;
      end;
  until (liPos = 0);

  if (liLastPos <> 0) then
    Result := Copy(lsOldValue, 1, liLastPos);

end;

{------------------------------------------------------------------------------}
{ ppFixUpFloatString}

function ppFixUpFloatString(const aFloatString, aDisplayFormat: String): String;
var
  lFloat: Double;
  lcDecimalSeparator: Char;
  lsFormat: String;
  liDigits: Integer;
  liPos: Integer;
begin

  {strip out any thousand separators}
  Result := ppRemoveCharacter(ThousandSeparator, aFloatString);

  {convert criteria to float}
  try
    lFloat := StrToFloat(Result);
  except on EConvertError do
    begin
      Result := '';

      Exit;
    end;
  end; {try, except}

  if (Length(aDisplayFormat) > 0) then
    begin
      Result := FormatFloat(aDisplayFormat, lFloat);
      
      Exit;
    end;

  {count digits in search criteria}
  liPos := Pos(DecimalSeparator, Result);

  if (liPos <> 0) then
    liDigits := Length(Result) - liPos
  else
    liDigits := 0;

  {create format}
  if (liDigits > 0) then
    lsFormat := '0.' + StringOfChar('#', liDigits)
  else
    lsFormat := '0';

  {convert float to string}
  lcDecimalSeparator := DecimalSeparator;

  DecimalSeparator := '.';

  try
    Result := FormatFloat(lsFormat, lFloat)
  finally
    DecimalSeparator := lcDecimalSeparator;
  end;

end; {ppFixUpFloatString}

{------------------------------------------------------------------------------}
{ ppRemoveCharacter}

function ppRemoveCharacter(aCharacter: Char; const aString: String): String;
var
  liPos: Integer;
begin
  Result := aString;

  liPos := Pos(aCharacter, Result);

  while (liPos <> 0) do
    begin
      Result := Copy(Result, 1, liPos - 1) + Copy(Result, liPos + 1, Length(Result));

      liPos := Pos(aCharacter, Result);
    end;

end; {function, ppRemoveCharacter}

{------------------------------------------------------------------------------}
{ ppFormat}

function ppFormat(const aDisplayFormat: String; aDataType: TppDataType; aValue: Variant): String;
var
  lsFormatStr: String;
  lfFormat: TFloatFormat;
  liDigits: Integer;
  liPrecision: Integer;
  lsString: String;
  liPos: Integer;
  lsTrueString: String;
  lsFalseString: String;
begin

  Result := '';

  if VarIsNull(aValue) then Exit;

  case aDataType of

    dtInteger, dtSingle, dtDouble, dtExtended, dtCurrency, dtLongint:
      begin

        lsFormatStr  := aDisplayFormat;

        if (Pos('$', aDisplayFormat) <> 0) then
          begin

            {calc digits required after the decimal separator }
            if Pos('.', aDisplayFormat) = 0 then
              liDigits := 0
            else
              begin
                liPos :=  Pos(';', aDisplayFormat);
                if liPos > 0 then
                  lsString := Copy(aDisplayFormat, 1, liPos-1)
                else
                  lsString := aDisplayFormat;

                liDigits := Length(lsString) - Pos('.', lsString);
              end;

            lfFormat := ffCurrency;
            liPrecision := 15;
            lsString := FloatToStrF(aValue, lfFormat, liPrecision, liDigits);
          end

        else if (aDisplayFormat <> '') then
          lsString := FormatFloat(lsFormatStr, aValue)

        else
          begin

            if (aDataType = dtCurrency) then
              begin
                lfFormat := ffCurrency;
                liDigits := CurrencyDecimals;
                liPrecision := 15;
              end

            else
              begin
                lfFormat := ffGeneral;
                liDigits := 0;
                liPrecision := 15;
              end;

            lsString := FloatToStrF(aValue, lfFormat, liPrecision, liDigits);
          end;

        Result := lsString;
      end;

    dtDate:

      if Length(aDisplayFormat) > 0 then
        Result := FormatDateTime(aDisplayFormat, aValue)
      else
        Result := FormatDateTime(ShortDateFormat, aValue);


    dtTime:

      if Length(aDisplayFormat) > 0 then
        Result := FormatDateTime(aDisplayFormat, aValue)
      else
        Result := FormatDateTime(LongTimeFormat, aValue);


    dtDateTime:

      if Length(aDisplayFormat) > 0 then
        Result := FormatDateTime(aDisplayFormat, aValue)
      else
        Result := FormatDateTime('c', aValue);

    dtString, dtChar:
      if Length(aDisplayFormat) > 0 then
         Result := FormatMaskText(aDisplayFormat, aValue)
      else
         Result := aValue;

    dtBoolean:
      begin
        if (Length(aDisplayFormat) > 0) then
          begin

            liPos :=  Pos(';', aDisplayFormat);

            if (liPos > 0) then
              begin
                if (liPos > 1) then
                  begin
                    lsTrueString := Copy(aDisplayFormat, 1, liPos - 1);
                    lsFalseString := Copy(aDisplayFormat, liPos + 1, Length(aDisplayFormat));
                  end
                else
                  begin
                    lsTrueString := '';
                    lsFalseString := Copy(aDisplayFormat, liPos + 1, Length(aDisplayFormat));
                  end;
              end
            else
              begin
                lsTrueString := aDisplayFormat;
                lsFalseString := '';
              end;

            if (aValue) then
              Result := lsTrueString
            else
              Result := lsFalseString;
          end

        else
          Result := aValue;

      end;

  end;


end; {function, ppFormat}

{------------------------------------------------------------------------------}
{ ppLineTooLong }

function ppLineTooLong(aLine: String; aWidth: Integer; aCanvas: TCanvas;
                       aTabStops: Integer; var aTabStopArray: TppTabStopPos): Boolean;
var
  lLineBuf: PChar;
  lDWord: LongInt;
  liWidth: Integer;
begin

  lLineBuf := StrAlloc(Length(aLine) + 1);

  StrPCopy(lLineBuf, aLine);

  {call windows API to check if line still fits within the given width}
  lDWord := GetTabbedTextExtent(aCanvas.Handle, lLineBuf, StrLen(lLineBuf),
                                aTabStops, aTabStopArray);

  liWidth := LoWord(lDWord);

  {return true if line needs to break}
  Result := (liWidth > aWidth);

  StrDispose(lLineBuf);

end;

{------------------------------------------------------------------------------}
{ ppEqual - use this becuase TStrings.SaveStream has a memory link }

function ppEqual(const aString1, aString2: String): Boolean;
begin
  Result := (CompareText(aString1, aString2) = 0);
end; {funciton, ppEqual}

{------------------------------------------------------------------------------}
{ ppStringsToStream - use this becuase TStrings.SaveStream has a memory link }

procedure ppStringsToStream(aStrings: TStrings; aMemoryStream: TMemoryStream);
var
  lTextBuf: PChar;

begin
  if (aStrings = nil) or (aMemoryStream = nil) then Exit;

  aMemoryStream.Clear;

  lTextBuf := aStrings.GetText;

  aMemoryStream.WriteBuffer(Pointer(lTextBuf)^, StrLen(lTextBuf));

  {TString.GetText returns a PChar, so must dispose }
  StrDispose(lTextBuf);

end;

{------------------------------------------------------------------------------}
{ ppGetWord }

function ppGetWord(Text: PChar; var CharPos: Longint): String;
const
  lcSpace = ' ';
  lcLF    = #10;
  lcNull  = #0;
  lcTab   = #9;


var
  lStartText: PChar;
  lFindText: PChar;
  lFindNull: PChar;
  lFindSpace: PChar;
  lFindCRLF: PChar;
  lFindTab: PChar;
  liLength: Integer;
  lsWord: String;
  lWord: PChar;
  liNewCharPos: Integer;
  liWordLength: Integer;
  lbEndOfText: Boolean;

begin

  lbEndOfText := False;

  lsWord := '';

  lFindText  := nil;

  {create a PChar of text to be searched}
  liLength := StrLen(Text) + 1;

  {move to beginning of words not yet wrapped}
  lStartText := Text;
  lStartText := lStartText + CharPos;

  {find occurance of a space}
  lFindSpace := lStartText;
  lFindSpace := StrScan(lFindSpace, lcSpace);

  {find occurance of a carriage return}
  lFindCRLF := lStartText;
  lFindCRLF := StrScan(lFindCRLF, lcLF);

  lFindNull := lStartText;
  lFindNull := StrScan(lFindNull, lcNull);

  lFindTab := lStartText;
  lFindTab := StrScan(lFindTab, lcTab);


  if lFindSpace <> nil then
    lFindText := lFindSpace;

  if (lFindTab <> nil) and ( (lFindText = nil) or (lFindTab < lFindText) ) then
    lFindText  := lFindTab;

  if (lFindCRLF <> nil) and ( (lFindText = nil) or (lFindCRLF < lFindText) ) then
    lFindText := lFindCRLF;

  if (lFindText = nil) and (lFindNull <> nil) then
    begin
      lFindText := lFindNull;
      lbEndOfText := True;
    end;

  {was a space or carriage return found?}
  if lFindText <> nil then
    begin
      {calculate new character position}
      if lbEndOfText then
        liNewCharPos := liLength
      else
        liNewCharPos := liLength - Integer(StrLen(lFindText));

      liWordLength := liNewCharPos - CharPos;

      lWord := StrAlloc(liWordLength + 1);

      lWord := StrLCopy(lWord, lStartText, liWordLength);

      lsWord := StrPas(lWord);

      if Assigned(lWord) then
        StrDispose(lWord);

      {return new char pos to calling procedure}
      if lbEndOfText then
        CharPos := -1
      else
        CharPos := liNewCharPos;

    end;

   Result := lsWord;

end; {function, ppGetWord}

{------------------------------------------------------------------------------}
{ ppCheckLinesFit }

function ppCheckLinesFit(aLineCount: Integer; aFont: TFont; aLeading: Longint; aSpaceAvailable: Longint;
                         var aFittedLines: Integer; var aHeightUsed: Longint; aPrinter: TObject): Boolean;
var
  liMaxLines: Integer;
  llLineHeight: Longint;
begin

  {calculate the maximum lines which will fit in the space}
  liMaxLines := ppMaxLinesFit(aFont, aLeading, aSpaceAvailable, aPrinter, llLineHeight);

  {return the lesser of the line count and the max lines}
  if (liMaxLines >= aLineCount) then
    begin
      Result := True;
      aFittedLines := aLineCount;
    end
  else
    begin
      Result := False;
      aFittedLines := liMaxLines;
    end;

  aHeightUsed := llLineHeight * aFittedLines;

end; {procedure, ppCheckLinesFit}

{------------------------------------------------------------------------------}
{ ppMaxLinesFit }

function ppMaxLinesFit(aFont: TFont; aLeading: Longint; aSpaceAvailable: Longint;
                       aPrinter: TObject; var aLineHeight: Longint): Integer;
var
  lBitmap: TBitmap;
  lCanvas: TCanvas;
  llLeading: Longint;
  llLineHeight: Longint;
  llSpaceAvailable: Longint;
  lTextMetric: TTextMetric;
begin

  {get a canvas}
  if (aPrinter <> nil) and (aPrinter is TppPrinter) and (TppPrinter(aPrinter).DC <> 0) then
    begin
      lCanvas := TppPrinter(aPrinter).Canvas;
      lBitmap := nil;
    end
  else
    begin
      lBitmap := TBitmap.Create;
      lCanvas := lBitmap.Canvas;
    end;

  lCanvas.Font := aFont;

  {calc the line height}
  GetTextMetrics(lCanvas.Handle, lTextMetric);

  llLeading := Trunc(ppFromMMThousandths(aLeading, utPrinterPixels, pprtVertical, aPrinter));

  llLineHeight := lTextMetric.tmHeight + llLeading;

  {calculate the maximum lines which will fit in the space}
  llSpaceAvailable := Trunc(ppFromMMThousandths(aSpaceAvailable, utPrinterPixels, pprtVertical, aPrinter));

  Result := Trunc(llSpaceAvailable / llLineHeight);

  aLineHeight := ppToMMThousandths(llLineHeight, utPrinterPixels, pprtVertical, aPrinter);

  {free the canvas}
  if (lBitmap <> nil) then
    lBitmap.Free;

end; {procedure, ppMaxLinesFit}

{------------------------------------------------------------------------------}
{ ppSubstituteFont }

function ppSubstituteFont(aFontName: String): String;
begin

  if aFontName = 'Courier' then
    Result := 'Courier New'

  else if aFontName = 'Fixedsys' then
    Result := 'Arial'

  else if aFontName = 'Modern' then
    Result := 'Arial'

  else if aFontName = 'MS Sans Serif' then
    Result := 'Arial'

  else if aFontName = 'MS Serif' then
    Result := 'Courier New'

  else if aFontName = 'Small Fonts' then
    Result := 'Arial'

  else if aFontName = 'System' then
    Result := 'Arial'

  else if aFontName = 'Terminal' then
    Result := 'Arial'

  else
    Result := aFontName;

end; {function, ppSubstituteFont}

{------------------------------------------------------------------------------}
{ ppGetDisplayFormats }

procedure ppGetDisplayFormats(aDataType: TppDataType; aFormatList: TStrings);
begin

  if aFormatList = nil then Exit;

  aFormatList.Clear;

  case aDataType of
  dtString:
    begin
      aFormatList.Add('Phone'           + #1 + '!\(999\)\ 000\-0000;0; ');
      aFormatList.Add('Extension'       + #1 + '!99999;0; ');
      aFormatList.Add('Social Security' + #1 + '000\-00\-0000;0; ');
      aFormatList.Add('Short Zip Code'  + #1 + '00000;0; ');
      aFormatList.Add('Long Zip Code'   + #1 + '00000\-9999;0; ');
      aFormatList.Add('Date'            + #1 + '!99/99/00;0; ');
      aFormatList.Add('Long Time'       + #1 + '!90:00:00\ >LL;0; ');
      aFormatList.Add('Short Time'      + #1 + '!90:00;0; ');
    end;

  dtInteger, dtSingle, dtDouble, dtExtended, dtCurrency, dtLongint:
    begin
      aFormatList.Add('-1,234'     + #1 + '#,0;-#,0');
      aFormatList.Add('-1,234.40'  + #1 + '#,0.00;-#,0.00');
      aFormatList.Add('(1,234.40)' + #1 + '#,0.00;(#,0.00)');
      aFormatList.Add('($1,234.40)'+ #1 + '$#,0.00;($#,0.00)');
      aFormatList.Add('-$1,234.40' + #1 + '$#,0.00;-$#,0.00');
      aFormatList.Add('-$1,234'    + #1 + '$#,0;-$#,0');
      aFormatList.Add('($1,234)'   + #1 + '$#,0;($#,0)');
      aFormatList.Add('-1234.4 %'  + #1 + '0 %');
      aFormatList.Add('-1234.40 %' + #1 + '0.00 %');
    end;

  dtDate:
    begin
      aFormatList.Add('3/4/95'            + #1 + 'm/d/yy');
      aFormatList.Add('03/04/95'          + #1 + 'mm/dd/yy');
      aFormatList.Add('03/04/1995'        + #1 + 'mm/dd/yyyy');
      aFormatList.Add('4-Mar-95 '         + #1 + 'd-mmm-yy');
      aFormatList.Add('04-Mar-95 '        + #1 + 'dd-mmm-yy');
      aFormatList.Add('March 4, 1995'     + #1 + 'mmmm d, yyyy');
      aFormatList.Add('3/4'               + #1 + 'm/d');
      aFormatList.Add('Mar-95'            + #1 + 'mmm-yy');
      aFormatList.Add('March-95'          + #1 + 'mmmm-yy');
    end;

  dtTime:
    begin
      aFormatList.Add('1:30 PM'    + #1 + 'h:nn AM/PM');
      aFormatList.Add('13:30'      + #1 + 'h:nn');
      aFormatList.Add('1:30:55 PM' + #1 + 'h:nn:ss AM/PM');
      aFormatList.Add('13:30:55'   + #1 + 'h:nn:ss');
    end;

  dtBoolean:
    begin
      aFormatList.Add('Yes'  + #1 + 'Yes;No');
      aFormatList.Add('Y'    + #1 + 'Y;N');
      aFormatList.Add('True' + #1 + 'True;False');
      aFormatList.Add('T'    + #1 + 'T;F');
      aFormatList.Add('OK'   + #1 + 'OK;');
      aFormatList.Add('Done' + #1 + 'Done;');
      aFormatList.Add(''     + #1 + ';Not OK');
      aFormatList.Add(''     + #1 + ';Not Done');
    end;

  dtDateTime:
    begin
      aFormatList.Add('3/4/95 1:30:55 PM' + #1 + 'm/d/yy h:nn:ss AM/PM');
      aFormatList.Add('3/4/95 13:30:55'   + #1 + 'm/d/yy h:nn:ss');
      aFormatList.Add('3/4/95'            + #1 + 'm/d/yy');
      aFormatList.Add('03/04/95'          + #1 + 'mm/dd/yy');
      aFormatList.Add('03/04/1995'        + #1 + 'mm/dd/yyyy');
      aFormatList.Add('4-Mar-95 '         + #1 + 'd-mmm-yy');
      aFormatList.Add('04-Mar-95 '        + #1 + 'dd-mmm-yy');
      aFormatList.Add('March 4, 1995'     + #1 + 'mmmm d, yyyy');
      aFormatList.Add('3/4'               + #1 + 'm/d');
      aFormatList.Add('Mar-95'            + #1 + 'mmm-yy');
      aFormatList.Add('March-95'          + #1 + 'mmmm-yy');
    end;

  end; {case, DataType}


end; {function, ppGetDisplayFormats}


{------------------------------------------------------------------------------}
{ ppGetStdNamingPrefix }

function ppGetStdNamingPrefix(aComponent: TComponent): String;
begin

  {compute standard naming prefix for this Component: ex. TppLabel is ppLabel }
  Result := Copy(aComponent.ClassName,2,Length(aComponent.ClassName));

end; {function, ppGetStdNamingPrefix}

{------------------------------------------------------------------------------}
{ ppGetUserNamePrefix }

function ppGetUserNamePrefix(aComponent: TComponent): String;
begin

  {compute user name prefix for this Component: ex TppLabel is Label }
  Result := Copy(aComponent.ClassName,4,Length(aComponent.ClassName));

end; {function, ppGetUserNamePrefix}


{$IFDEF OLD}
{------------------------------------------------------------------------------}
{ ppGetUniqueName - assign unique name for given ppComponent}

function ppGetUniqueName(aOwner: TComponent; aNamingPrefix: String; aComponent: TComponent): String;
var
  liNameNo: Integer;
  lComponent: TComponent;

begin

  liNameNo := 1;

  repeat
    Result := aNamingPrefix + IntToStr(liNameNo);
    Inc(liNameNo);

    lComponent := aOwner.FindComponent(Result);

  until (lComponent = nil) or (lComponent = aComponent);


end; {function, ppGetUniqueName}

{$ENDIF}


{------------------------------------------------------------------------------}
{ ppGetUniqueName - assign unique name for given ppComponent}

function ppGetUniqueName(aOwner: TComponent; aNamingPrefix: String; aComponent: TComponent): String;
var
  liComponent,
  liNameNo: Integer;
  lNumberList: TStringList;
  lComponent: TComponent;

begin

  lNumberList := TStringList.Create;

  {store currently used naming numbers to lNumberList}
    for liComponent := 0 to (aOwner.ComponentCount - 1) do
      begin
        lComponent := aOwner.Components[liComponent];


        {determine whether component is same class type}
        if (lComponent <> aComponent) and (lComponent is aComponent.ClassType) then

          if ppExtractNamingNumber(aNamingPrefix,  lComponent, liNameNo) then
            lNumberList.Add(Format('%8d',[liNameNo]));


      end;

  Result := aNamingPrefix + IntToStr(ppGetUniqueNamingNumber(lNumberList));

  lNumberList.Free;

end; {function, ppGetUniqueName}


{------------------------------------------------------------------------------}
{ ppExtractNamingNumber }

function ppExtractNamingNumber(aNamingPrefix: String; aComponent: TComponent; var aNamingNo: Integer): Boolean;
var
  lsComponentNo: String;

begin

  Result := False;

  {determine whether component name has standard prefix}
  if not ( Pos(aNamingPrefix, aComponent.Name) = 1) then Exit;

  {get name suffix}
  lsComponentNo := Copy(aComponent.Name, (Length(aNamingPrefix) + 1),
                                          Length(aComponent.Name));

  {determine whether name suffix is an integer}
  aNamingNo := StrToIntDef(lsComponentNo, 0);

  Result := (aNamingNo > 0);


end; {function, ppExtractNamingNumber}


{------------------------------------------------------------------------------}
{ ppGetUniqueNamingNumber }

function ppGetUniqueNamingNumber(aNumberList: TStringList): Integer;
var
  lbFound: Boolean;

begin

  aNumberList.Sort;

  Result  := 0;
  lbFound := False;

  {get first unused number in sequence from 1 to ... }
  while not lbFound and (Result < aNumberList.Count) do
    begin

      if (Result + 1) <> StrToInt(aNumberList[Result]) then
        lbFound := True;

      Inc(Result);

    end;

  {if no name found, used next number in sequence}
  if not lbFound then
    Inc(Result);

end;


{------------------------------------------------------------------------------}
{ ppFixText }

function ppFixText(Text: String; TargetLength: Integer; Alignment: TAlignment): String;
var
  liDifference: Integer;
  lsPadding: String;
  liLength: Integer;
  liSpace: Integer;
  lsPaddingLeft: String;
  lsPaddingRight: String;

begin
  liLength := Length(Text);

  if liLength = TargetLength then
    Result := Text

  else if (liLength > TargetLength) then
    Result := Copy(Text, 1, TargetLength)

  else if (liLength < TargetLength) then
    begin
      liDifference := TargetLength - liLength;

      lsPadding := '';
      for liSpace := 1 to liDifference do
        lsPadding := lsPadding + ' ';

      case Alignment of

        taLeftJustify:
          Result := Text + lsPadding;

        taRightJustify:
          Result := lsPadding + Text;

        taCenter:
          begin
            lsPaddingLeft  := Copy(lsPadding, 1, Trunc(liDifference/2));
            lsPaddingRight := Copy(lsPadding, 1, liDifference - Trunc(liDifference/2));
            Result := lsPaddingLeft + Text + lsPaddingRight;
          end;

      end;

    end;


end; {function, ppFixText}

{------------------------------------------------------------------------------}
{ ppFromMMTenths }

function ppFromMMTenths(Value: Longint; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Single;
var
  llMMThousandths: Longint;
  llScreenPixels: Longint;


begin

  llMMThousandths := Value*100;

  case aUnits of

    utScreenPixels, utPrinterPixels:
      Result := ppFromMMThousandths(llMMThousandths, aUnits, aResolution, aPrinter);

    utInches:
      begin
        llScreenPixels := ppToScreenPixels(llMMThousandths, utMMThousandths, aResolution, aPrinter);
        Result := ppFromScreenPixels(llScreenPixels, utInches, aResolution, aPrinter);
      end;

    utMillimeters:
      Result := Round(Value/10);

    utMMThousandths:
      Result := llMMThousandths;

    else
      Result := 0;

  end; {case, Units}

end;

{------------------------------------------------------------------------------}
{ ppToMMTenths }

function ppToMMTenths(Value: Single; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Longint;
var
  llScreenPixels: Longint;

begin

  case aUnits of

    utScreenPixels, utPrinterPixels:
      Result := ppToMMThousandths(Value, aUnits, aResolution, aPrinter) div 100;

    utInches:
      begin
        llScreenPixels := ppToScreenPixels(Value, utInches, aResolution, aPrinter);
        Result := Trunc(ppFromScreenPixels(llScreenPixels, utMMThousandths, aResolution, aPrinter) / 100);
      end;

    utMillimeters:
      Result := Round(Value*10);

    utMMThousandths:
      Result := Round(Value/100);

    else
      Result := 0;
  end;


end;


{------------------------------------------------------------------------------}
{ ppDoctorReportObjectText }

type
  TppFixReportProp = (fpColumnWidth, fpPaperHeight, fpPaperWidth, fpRowSpacing);
  TppFixObjectProp = (fpLeft, fpTop, fpWidth, fpHeight);

function ppDoctorReportObjectText(aObjectText: TStrings): Boolean;
var
  liFloatPos: Integer;
  liDecimalPos: Integer;
  liLine, liLines: Integer;
  lsLine: String;
  lFixReportProp: TppFixReportProp;
  lbReportProps: Boolean;
  lbVersion: Boolean;

begin

  Result := True;

  lFixReportProp := fpColumnWidth;
  liLine   := 0;
  liLines  := aObjectText.Count;
  lbReportProps := True;
  lbVersion := False;

  while (liLine < liLines) do
    begin
      lsLine := aObjectText[liLine];

      liFloatPos := 0;

      if lbReportProps then

          {ColumnWidth and RowSpacing props may not be found, so do a special check here}
          if (lFixReportProp = fpColumnWidth) and (lsLine[3] > 'C') then
            lFixReportProp := Succ(lFixReportProp)

          else if (lFixReportProp = fpRowSpacing) and (lsLine[3] > 'R') then
             lbReportProps := False;


      {fix TppReport props}
      if lbReportProps then
        begin

          {look for report property that needs fixing}
          case lFixReportProp of

            fpColumnWidth: liFloatPos := Pos('ColumnWidth = ', lsLine);

            fpPaperHeight: liFloatPos := Pos('PaperHeight = ', lsLine);

            fpPaperWidth: liFloatPos := Pos('PaperWidth = ', lsLine);

            fpRowSpacing: liFloatPos := Pos('RowSpacing = ', lsLine);

          else
            liFloatPos := 0;

          end;

        end


      else if not lbVersion then
        {check for the last report prop, which is Version}
        lbVersion := (Pos('Version', lsLine) > 0)

      else {fix TppBand, TppComponent props}
        begin

          {look for object property that needs fixing}
          liFloatPos := Pos(' Left = ', lsLine);

          if liFloatPos = 0 then
            liFloatPos := Pos(' Top = ', lsLine);

          if liFloatPos = 0 then
            liFloatPos := Pos(' Width = ', lsLine);

          if liFloatPos = 0 then
            liFloatPos := Pos(' Height = ', lsLine);

        end;


      {add '.0', if needed }
      if liFloatPos > 0 then
        begin

          lsLine := Copy(lsLine, liFloatPos + 1, Length(lsLine));

          liDecimalPos := Pos('.', lsLine);

          if liDecimalPos = 0 then
            aObjectText[liLine] := aObjectText[liLine]  + '.0';

          {determine whether were done fixing & if not get the next prop to fix }
          if lbReportProps then
            if lFixReportProp = High(lFixReportProp) then
              lbReportProps := False
            else
              lFixReportProp := Succ(lFixReportProp);

        end;

      Inc(liLine);

      end; {while each line}


end;

{------------------------------------------------------------------------------}
{ ppPeriodToDecimalSeparator }

procedure ppPeriodToDecimalSeparator(aList: TStrings);
var
  liSeparatorPos: Integer;
  liLine: Integer;
  lsLine: String;

begin

  for liLine := 0 to aList.Count-1 do
    begin
      lsLine := aList[liLine];

      liSeparatorPos := Pos('.', lsLine);

      if liSeparatorPos > 0 then
        begin
          lsLine[liSeparatorPos] := DecimalSeparator;

          aList[liLine] := lsLine;
        end;

    end; {for each line}

end;


{------------------------------------------------------------------------------}
{ ppDecimalSeparatorToPeriod }

procedure ppDecimalSeparatorToPeriod(aList: TStrings);
var
  liSeparatorPos: Integer;
  liLine: Integer;
  lsLine: String;

begin

  for liLine := 0 to aList.Count-1 do
    begin
      lsLine := aList[liLine];

      liSeparatorPos := Pos(DecimalSeparator, lsLine);

      if liSeparatorPos > 0 then
        begin
          lsLine[liSeparatorPos] := '.';
          
          aList[liLine] := lsLine;
        end;

    end; {for each line}

end;

{------------------------------------------------------------------------------}
{ ppGetTempPath }

function ppGetTempPath: String;
var
  lpPath: PChar;
begin
  lpPath := nil;
  try
    GetMem(lpPath, MAX_PATH);
    GetTempPath(MAX_PATH, lpPath);
    Result := StrPas(lpPath);
  finally
    FreeMem(lpPath);
  end;

end; {function, ppGetTempPath}

{------------------------------------------------------------------------------}
{ ppGetTempFileName }

function ppGetTempFileName(aPath: String; aPrefix: String): String;
var
  liPrefixSize: Integer;
  lpPrefix: PChar;
  liPathSize: Integer;
  lpPath: PChar;
  lpTempFileName: PChar;

begin

  lpPrefix := nil;
  lpPath := nil;
  lpTempFileName := nil;
  
  try
    {allocate space for path}
    liPathSize := Length(aPath) + 1;
    GetMem(lpPath, liPathSize);
    StrPCopy(lpPath, aPath);

    {allocate space for temporary file prefix}
    liPrefixSize := Length(aPrefix) + 1;
    GetMem(lpPrefix, liPrefixSize);
    StrPCopy(lpPrefix, aPrefix);

    GetMem(lpTempFileName, MAX_PATH);

    {get a unique temporary file name}
    GetTempFileName(lpPath, lpPrefix, 0, lpTempFileName);

    {return temporary file name as a pascal string}
    Result := StrPas(lpTempFileName);

  finally
    {free allocated resources}
    FreeMem(lpPrefix);
    FreeMem(lpPath);
    FreeMem(lpTempFileName);
  end;

end; {function, ppGetTempFileName}

{------------------------------------------------------------------------------}
{ ppGetDelphiPath }

function ppGetDelphiPath: String;
var
  lRegistry: TRegistry;
  lsVersion: String;
  lsKey: String;
begin

  lRegistry := TRegistry.Create;
  lRegistry.RootKey := HKEY_LOCAL_MACHINE;

{$IFDEF Delphi5}
  lsVersion := '5.0';
{$ELSE}
  lsVersion := '4.0';
{$ENDIF}
{$IFNDEF Delphi4}
  lsVersion := '3.0';
{$ENDIF}

  lsKey := '\SOFTWARE\Borland\Delphi\' + lsVersion;

  if lRegistry.OpenKeyReadOnly(lsKey) then
    Result := lRegistry.ReadString('RootDir')
  else
    Result := '';

  lRegistry.Free;

end; {function, ppGetDelphiPath}

{------------------------------------------------------------------------------}
{ ppGetScreenRes }

function ppGetScreenRes: TPoint;
var
  lDC: HDC;

begin

 lDC := GetDC(0);

 Result.X := GetDeviceCaps(lDC, HORZRES);
 Result.Y := GetDeviceCaps(lDC, VERTRES);

 ReleaseDC(0, lDC);

end;

{------------------------------------------------------------------------------}
{ ppTextToIdentifier }

function ppTextToIdentifier(const aString: String): String;
const
 lDigits = ['0'..'9'];
 lValidChars = ['A'..'Z', 'a'..'z', '0'..'9'];
var
  liIndex: Integer;
begin

  Result := aString;

  while (Length(Result) > 0) and ((Result[1] in lDigits) or not(Result[1] in lValidChars)) do
    Delete(Result, 1, 1);

  if Length(Result) = 0 then Exit;

  liIndex := 2;

  while (liIndex <= Length(Result)) do
    begin

      if (Result[liIndex] in lValidChars) then
        Inc(liIndex)

      else if (Result[liIndex - 1] <> '_') then
        begin
          Result[liIndex] := '_';

          Inc(liIndex);
        end

      else
        Delete(Result, liIndex, 1);

    end;

end; {function, ppTextToIdentifier}

{------------------------------------------------------------------------------}
{ ppTextToPageList }

procedure ppTextToPageList(const aString: String; aPageList: TStrings; aTrimPages: Boolean);
var
  lsChar          : Char;
  liChar          : Integer;
  liChars         : Integer;
  liPage          : Integer;
  lsNumber        : String;
  lbInteger       : Boolean;
  lbNumberFound   : Boolean;
  lbRangeStarted  : Boolean;
  liRangeStart    : Integer;
  liRangeEnd      : Integer;
  lsFormattedNumber: String;
  liIndex: Integer;
begin

  aPageList.Clear;

  lsNumber       := '';
  lbNumberFound  := False;
  lbRangeStarted := False;
  liRangeStart   := 0;

  liChars := Length(aString);

  {look at each character in string}
  for liChar := 1 to liChars do
    begin
      lsChar    := aString[liChar];
      lbInteger := StrToIntDef(lsChar,-1) <> -1;

      if lbInteger then
        {build number characters into number}
        lsNumber := lsNumber + lsChar;

      if (not(lbInteger) and (Length(lsNumber) > 0)) or
         ((liChar = liChars) and (Length(lsNumber) > 0)) then

        {current character non-numeric, save number}
        begin
          lbNumberFound := True;

          lsFormattedNumber := Format('%8d',[StrToInt(lsNumber)]);

          if aPageList.IndexOf(lsFormattedNumber) = -1 then
            aPageList.Add(lsFormattedNumber);

          {save number for range calculations}
          if not(lbRangeStarted) then
            liRangeStart := StrToInt(lsNumber) + 1;

        end;

      {if number found and range started, this is range end number}
      if lbNumberFound and lbRangeStarted then

        begin
          lbRangeStarted := False;
          liRangeEnd := StrToInt(lsNumber) - 1;
          for liPage := liRangeStart to liRangeEnd do
            begin
              lsFormattedNumber := Format('%8d',[liPage]);

              if aPageList.IndexOf(lsFormattedNumber) = -1 then
                aPageList.Add(lsFormattedNumber);
            end;
          liRangeStart := 0;
        end;

      {reset to collect next number}
      if lbNumberFound then
        begin
          lsNumber := '';
          lbNumberFound := False;
        end;

      {if hyphen, next number indicates end of range}
      if (lsChar = '-') and (liRangeStart <> 0) then
        lbRangeStarted := True;

    end; {for, each character in pages string}

    {sort list}
    TStringList(aPageList).Sort;

    {trim spaces from list}
    if aTrimPages then
      for liIndex := 0 to aPageList.Count - 1 do
        aPageList[liIndex] := ppTrimLeft(aPageList[liIndex]);

end; {procedure, ppTextToPageList}

{------------------------------------------------------------------------------}
{ ppFromMMThousandths }

function ppFromMMThousandths(Value: Longint; aUnits: TppUnitType; aResolution: TppResolutionType;
                             aPrinter: TObject): Single;
var
  liDPI: Integer;
begin

  case aUnits of

    utScreenPixels:
      Result := Round(((Value / 1000) * InchPerMM) * Screen.PixelsPerInch);

    utInches:
      Result := Round( ( ( (Value / 1000) * InchPerMM) * 10000) ) / 10000;

    utMillimeters:
      Result := Value / 1000;

    utPrinterPixels:
      begin

        if (aPrinter is TppPrinter) then
          begin

            if (aResolution = pprtVertical) then
              liDPI := TppPrinter(aPrinter).PixelsPerInch.Y
            else
              liDPI := TppPrinter(aPrinter).PixelsPerInch.X;

          end

        else
          liDPI := Screen.PixelsPerInch;

        Result := Round( ((Value / 1000) * InchPerMM) * liDPI);

      end;

    utMMThousandths:
      Result := Value;

  else
    Result := 0;

  end; {case, unit type}

end; {procedure, ppFromMMThousandths}

{------------------------------------------------------------------------------}
{ ppToMMThousandths }

function ppToMMThousandths(Value: Single; aUnits: TppUnitType; aResolution: TppResolutionType;
                           aPrinter: TObject): Longint;
var
  liDPI: Integer;
begin

  case aUnits of

    utScreenPixels:
      Result := Round( ((Value / Screen.PixelsPerInch) / InchPerMM) * 1000);

    utInches:
      Result := Round( (Value / InchPerMM) * 1000);

    utMillimeters:
      Result := Round(Value * 1000);

    utPrinterPixels:
      begin

        if (aPrinter is TppPrinter) then
          begin
          
            if (aResolution = pprtVertical) then
              liDPI := TppPrinter(aPrinter).PixelsPerInch.Y
            else
              liDPI := TppPrinter(aPrinter).PixelsPerInch.X;

          end
        else
          liDPI := Screen.PixelsPerInch;

        Result := Round( ((Value / liDPI) / InchPerMM) * 1000)
      end;

    utMMThousandths:
      Result := Trunc(Value);

  else
    Result := 0;

  end; {case, unit type}

end; {procedure, ppToMMThousandths}


{------------------------------------------------------------------------------}
{ ppFromScreenPixels }

function ppFromScreenPixels(aScreenPixels: Integer; aUnits: TppUnitType; aResolution: TppResolutionType;
                                                                         aPrinter: TObject): Single;

var
 llMMThousandths: Longint;
begin

  llMMThousandths := ppToMMThousandths(aScreenPixels, utScreenPixels, aResolution, aPrinter);

  Result := ppFromMMThousandths(llMMThousandths, aUnits, aResolution, aPrinter);

end;

{------------------------------------------------------------------------------}
{ ppToScreenPixels }

function ppToScreenPixels(aValue: Single; aUnits: TppUnitType; aResolution: TppResolutionType; aPrinter: TObject): Integer;

var
 llMMThousandths: Longint;
begin

  llMMThousandths := ppToMMThousandths(aValue, aUnits, aResolution, aPrinter);

  Result := Trunc(ppFromMMThousandths(llMMThousandths, utScreenPixels, aResolution, aPrinter));

end;

{------------------------------------------------------------------------------}
{ ppGetSpTextWidth }

function ppGetSpTextWidth(aFont: TFont; aText: String): Integer;
var
  {lPrinter: TppPrinter;}
  lBitmap: TBitmap;

begin
 { lPrinter := ppPrinter;}

  {use the printer, if possible}
{  if (lPrinter <> nil) and (lPrinter.Canvas <> nil) then
    begin
      lPrinter.Canvas.Font := aFont;
      Result := lPrinter.Canvas.TextWidth(aText);
      Result := ppToScreenPixels(Result, utPrinterPixels, pprtHorizontal, lPrinter);

    end
  else   }
    begin
      lBitmap := TBitmap.Create;
      lBitmap.Canvas.Font := aFont;
      Result := lBitmap.Canvas.TextWidth(aText);

      lBitmap.Free;

    end;

end; {function, ppGetSpTextWidth}

{------------------------------------------------------------------------------}
{ ppGetSpTextHeight }

function ppGetSpTextHeight(aFont: TFont; aText: String): Integer;
var
{  lPrinter: TppPrinter;}
  lBitmap: TBitmap;

begin
 { lPrinter := ppPrinter;}

  {use the printer, if possible}
{  if (lPrinter <> nil) and (lPrinter.Canvas <> nil) then
    begin
      lPrinter.Canvas.Font := aFont;
      Result := lPrinter.Canvas.TextHeight(aText);
      Result := ppToScreenPixels(Result, utPrinterPixels, pprtVertical, lPrinter);

    end
  else }
    begin
      lBitmap := TBitmap.Create;
      lBitmap.Canvas.Font := aFont;
      Result := lBitmap.Canvas.TextHeight(aText);

      lBitmap.Free;

    end;

end; {function, ppGetSpTextHeight}




{------------------------------------------------------------------------------}
{ ppVersionToInt }

function ppVersionToInt(aVersion: String): Integer;
type
  TVersionChars = set of char;

var
  lVersionChars: TVersionChars;
  lsVersionNo: String[VersionNoMaxLength];
  liChar: Integer;
  liDecimalPos: Integer;

begin

  {define a set of valid version characters }
  lVersionChars := ['0'..'9', '.'];

  {convert to a ShortString, which is an array of chars }
  lsVersionNo := aVersion;

  {traverse chars until end of version no. subString is found}
  liChar := 1;

  {note: VersionNoMaxLength is a constant }
  while liChar <= Length(lsVersionNo) do
    if (lsVersionNo[liChar] in lVersionChars) and (liChar < VersionNoMaxLength) then
      Inc(liChar)
    else
      Break;

  Dec(liChar);

  {copy the version no substring}
  lsVersionNo := Copy(lsVersionNo,1,liChar);

  {find the decimal point position}
  liDecimalPos := Pos('.', lsVersionNo);

  {get rid of the decimal point }
  Delete(lsVersionNo, liDecimalPos, 1);

  while Length(lsVersionNo) < 4 do
    lsVersionNo := lsVersionNo + '0';

  Result:= StrToInt(lsVersionNo);


end; {function, ppVersionToInt}

{------------------------------------------------------------------------------}
{ ppStringsFromMMThousandths }

procedure ppStringsFromMMThousandths(aStringList: TStrings; aUnits: TppUnitType;
                                     aResolution: TppResolutionType; aPrinter: TObject);
var
  lrValue: Single;
  llValue: Longint;
  liString: Integer;
  liStrings: Integer;
begin

  llValue := 0;

  liStrings := aStringList.Count;

  for liString := 0 to liStrings - 1 do
    begin
      try
        llValue := StrToInt(aStringList[liString]);
      except on EConvertError do
        llValue := 0;
      end; {try, except}

      lrValue := ppFromMMThousandths(llValue, aUnits, aResolution, aPrinter);

      try
        aStringList[liString] := FloatToStrF(lrValue, ffGeneral, 7, 0);
      except on EConvertError do
        aStringList[liString] := '0.0';
      end; {try, except}

    end; {for, each column}

end; {procedure, ppStringsFromMMThousandths}

{------------------------------------------------------------------------------}
{ ppStringsFromMMThousandths }

procedure ppStringsToMMThousandths(aStringList: TStrings; aUnits: TppUnitType;
                                   aResolution: TppResolutionType; aPrinter: TObject);
var
  lrValue: Single;
  llValue: Longint;
  liString: Integer;
  liStrings: Integer;
begin

  lrValue := 0;

  liStrings := aStringList.Count;

  for liString := 0 to liStrings - 1 do
    begin
      try
        lrValue := StrToFloat(aStringList[liString]);
      except on EConvertError do
        lrValue := 0;
      end; {try, except}

      llValue := ppToMMThousandths(lrValue, aUnits, aResolution, aPrinter);

      try
        aStringList[liString] := IntToStr(llValue);
      except on EConvertError do
        aStringList[liString] := '0';
      end; {try, except}

    end; {for, each column}

end; {procedure, ppStringsToMMThousandths}

{------------------------------------------------------------------------------}
{ ppConvertTabStopPos }

procedure ppConvertTabStopPos(aUnits: TppUnitType; aTabList: TStrings; var aTabArray: TppTabStopPos;
                              var aSize: Integer; aPrinter: TObject);
var
  liItem: Integer;
  liTabPos: Integer;
  llTabPos: Longint;

begin
  if (aUnits <> utPrinterPixels) and (aUnits <> utScreenPixels) then Exit;

  aSize := 0;

  for liItem := 0 to aTabList.Count - 1 do
    begin
      try
        llTabPos := StrToInt(aTabList[liItem]);

        liTabPos := Trunc(ppFromMMThousandths(llTabPos, aUnits, pprtHorizontal, aPrinter));

        aTabArray[aSize] := liTabPos;

        Inc(aSize);

      except on EConvertError do
        {do nothing}
      end; {try}

    end;

end; {procedure, ppConvertTabStops}

{------------------------------------------------------------------------------}
{ ppFormatCalcValue }

function ppFormatCalcValue(aCalcType: TppCalcType; aPageNo, aPageCount: Longint;
                           aPrintDateTime: TDateTime; aLanguageIndex: Longint; aPrinting: Boolean): String;
var
  lVarType: TppVarType;
begin

  lVarType := TppVarType(Ord(aCalcType));

  Result := ppFormatVarValue(lVarType, aPageNo, aPageCount, aPrintDateTime, aLanguageIndex, aPrinting);

end; {function, ppFormatCalcValue}

{------------------------------------------------------------------------------}
{ ppFormatVarValue }

function ppFormatVarValue(aVarType: TppVarType; aPageNo, aPageCount: Longint;
                          aPrintDateTime: TDateTime; aLanguageIndex: Longint; aPrinting: Boolean): String;
var
  liPageCount    : Integer;
  liPage         : Integer;
begin

  case aVarType of

    vtDate:
      Result := DateTimeToStr(Date);

    vtDateTime:
      Result := DateTimeToStr(Now);

    vtPageCount:
      begin

        if (aPrinting) then
           liPageCount := aPageCount
        else
           liPageCount := 1;

        Result := IntToStr(liPageCount);

      end;

    vtPageSet, vtPageSetDesc:

      begin

        if (aVarType = vtPageSet) then
          Result := ''
        else
          Result := ppLoadStr(18) + ' ';

        {get page no}
        if (aPrinting) then
          liPage := aPageNo
        else
          liPage := 1;

        Result := Result + IntToStr(liPage);

        {get page count}
        if (aPrinting) then
          liPageCount := aPageCount
        else
          liPageCount := 1;


        Result := Result + ' ' + ppLoadStr(16) + ' ' + IntToStr(liPageCount);

      end;

   vtPageNo, vtPageNoDesc:
      begin

        if (aPrinting) then
          liPage := aPageNo
        else
          liPage := 1;

        if (aVarType = vtPageNo) then
          Result := IntToStr(liPage)
        else
          Result :=  ppLoadStr(18) + ' ' + IntToStr(liPage);

      end;

    vtPrintDateTime:
      begin

        if (aPrinting) then
           Result := DateTimeToStr(aPrintDateTime)
        else
           Result := DateTimeToStr(Now);

      end;

    vtTime:
      Result := TimeToStr(Time);


  end; {case, vartype}

end; {procedure, ppFormatVarValue}

{------------------------------------------------------------------------------}
{ ppWordWrap }

procedure ppWordWrap(aTextBuf: PChar; aRect: TppRect; aFont: TFont; aLeading: Longint; aTruncateLines: Boolean;
                     var aWrappedLines: TStrings; aTabStopList: TStrings; aUnits: TppUnitType; aIsMemo: Boolean;
                     aPrinter: TObject; var aCharPos: Longint; aCharWrap: Boolean);

const
  lcTab  = #9;
  lcCR = #13;
  lcLF   = #10;
  lcCRLF = #13#10;
  lcNull = #0;

var
  liLine: Integer;
  liMaxLines: Integer;
  llLineHeight: Longint;
  llCharPos: Longint;
  llWidthAvailable: Longint;
  llTextLength: Longint;
  lsWord: String;
  lsLine: String;
  lsSaveLine: String;
  liTabStops: Integer;
  lTabStopArray: TppTabStopPos;
  lCanvas: TCanvas;
  lbWasWrapped: Boolean;
  lBitmap: TBitmap;
  lbAllTextWrapped: Boolean;
  lbEndOfLine: Boolean;

  {add line to result}
  procedure AddLine;
    begin
      if lbWasWrapped then
        lsSaveLine := ppTrimLeft(lsSaveLine);

      aWrappedLines.Add( ppTrimRight(lsSaveLine) );

      lsSaveLine := '';

      Inc(liLine);

      if aTruncateLines and (liLine >= liMaxLines) then
        begin
          lbAllTextWrapped := True;

          if Length(lsLine) > 0 then
            llCharPos := llCharPos - Length(lsLine);
        end;

    end; {procedure, AddLine}

  {truncate word to fit in width}
  function TruncateWord: Integer;
    var
      lsTruncatedWord: String;
    begin
      lsTruncatedWord := lsWord;

      while ppLineTooLong(lsTruncatedWord, llWidthAvailable, lCanvas, liTabStops, lTabStopArray) and
            (Length(lsTruncatedWord) > 1) do
          lsTruncatedWord := Copy(lsTruncatedWord, 1, Length(lsTruncatedWord) - 1);

      Result := Length(lsTruncatedWord);

    end; {function, ppTruncateWord}

  {save a wrapped line}
  procedure SaveLine;
    var
      lbTruncationComplete: Boolean;
      liTruncationPos: Integer;
    begin

      {if only one word in line, add word to line and let it get truncated}
      if aCharWrap and ((Length(lsSaveLine) = 0) and (Length(lsWord) > 0)) then
        begin
          lbTruncationComplete := False;

          while not(lbTruncationComplete) and not(lbAllTextWrapped) do
            begin
              liTruncationPos := TruncateWord;

             {4.24 - fixed problem where last truncated word was not added to the result lines}
             { if (liTruncationPos = 0) or (liTruncationPos = Length(lsWord)) then}

              if (liTruncationPos = 0) then
                begin
                  lsSaveLine := '';
                  lsWord := '';

                  lbTruncationComplete := True
                end

              else
                begin
                  lsSaveLine := Copy(lsWord, 1, liTruncationPos);
                  lsWord := Copy(lsWord, liTruncationPos + 1, Length(lsWord));

                  lsLine := lsWord;

                  AddLine;

                  lbEndOfLine := False;
                end;

            end;

        end

      else if (Length(lsSaveLine) = 0) and (Length(lsWord) > 0) and not(aCharWrap) then
        begin
          lsSaveLine := lsWord;

          lsWord := '';
          lsLine := '';

          lbEndOfLine := False;

          AddLine;
        end

      else
        AddLine;

    end; {procedure, SaveLine}

  {add a word to the current wrapped line}
  procedure SaveWord;
    begin

      {clean-up the word}
      lsWord := ppStripCharacter(lsWord, lcNull);
      lsWord := ppStripCharacter(lsWord, lcCR);
      lsWord := ppStripCharacter(lsWord, lcLF);

      {add word to line}
      lsLine := lsLine + lsWord;

    end; {procedure, SaveWord}


begin

  {always clear these first}
  aWrappedLines.Clear;

  if (aTextBuf = nil) then Exit;

  {get the canvas}
  if (aPrinter <> nil) and (TppPrinter(aPrinter).DC <> 0) then
    begin
      lCanvas := TppPrinter(aPrinter).Canvas;
      lBitmap := nil;
    end
  else
    begin
      lBitmap := TBitmap.Create;
      lCanvas := lBitmap.Canvas;
    end;

  lCanvas.Font := aFont;

  {convert tab stops to printer pixels}
  if aTabStopList = nil then
    liTabStops := 0
  else
    ppConvertTabStopPos(utPrinterPixels, aTabStopList, lTabStopArray, liTabStops, aPrinter);

  {calculate max lines which will fit}
  if (aTruncateLines) then
    begin
      llLineHeight := 0;
      liMaxLines := ppMaxLinesFit(aFont, aLeading, (aRect.Bottom - aRect.Top), aPrinter, llLineHeight);
    end;

  if (liMaxLines = 0) then Exit;

  {calculate width available in printer pixels}
  llWidthAvailable := Trunc(ppFromMMThousandths((aRect.Right - aRect.Left), utPrinterPixels, pprtHorizontal, aPrinter));

  lbAllTextWrapped := False;
  liLine := 0;
  lsLine := '';
  lsSaveLine := '';
  llCharPos := aCharPos;
  llTextLength := StrLen(aTextBuf);
  lbEndOfLine := False;
  lbWasWrapped := False;

  while (llCharPos < llTextLength) and not(lbAllTextWrapped) do
    begin

      {get the next word}
      lsWord := ppGetWord(aTextBuf, llCharPos);

      {check for end of line}
      if (llCharPos = -1) then
        lbEndOfLine := True

      else if (Pos(lcCRLF, lsWord) <> 0) or (Pos(lcLF, lsWord) <> 0) then
        lbEndOfLine := True;

      {add the word to the line}
      SaveWord;

      {if line completed, save it}
      if ppLineTooLong(lsLine, llWidthAvailable, lCanvas, liTabStops, lTabStopArray) then
        begin
          {save the word which did not fit}
          lsLine := lsWord;

          if (aCharWrap) and (Length(lsSaveLine) > 0) then
            AddLine;

          SaveLine;

          lbWasWrapped := True;
        end;

      {end the line}
      if (lbEndOfLine) and not(lbAllTextWrapped) then
        begin
          lsSaveLine := lsLine;

          lsLine := '';

          SaveLine;

          lbWasWrapped := False;

          lbEndOfLine := False;
        end;

      {save the current line}
      lsSaveLine := lsLine;

      {indicate we're done}
      if (llCharPos = -1) then
        lbAllTextWrapped := True;

    end; {while, not all text wrapped}

  aCharPos := llCharPos;

  {free the canvas}
  if (lBitmap <> nil) then
    lBitmap.Free;

end; {procedure, ppWordWrap}


{------------------------------------------------------------------------------}
{ ppAllTrim }

function  ppAllTrim(const aString: String): String;
begin

  Result := ppTrimLeft(aString);
  Result := ppTrimRight(Result);

end; {function, ppAllTrim}

{------------------------------------------------------------------------------}
{ ppTrimLeft }

function ppTrimLeft(const aString: String): String;
begin
  Result := TrimLeft(aString);
end; {procedure, ppTrimLeft}

{------------------------------------------------------------------------------}
{ ppTrimRight }

function ppTrimRight(const aString: String): String;
begin
  Result := TrimRight(aString);
end; {procedure, ppTrimRight}

{------------------------------------------------------------------------------}
{ ppStripCharacter }

function ppStripCharacter(const aString: String; aChar: Char): String;
var
  liPosition: Integer;
begin

  Result := aString;

  repeat
    liPosition := Pos(aChar, Result);

    if (liPosition > 0) then
      Result := Copy(Result, 1, liPosition - 1) + Copy(Result, liPosition + 1, Length(Result));

  until (liPosition = 0);


end; {procedure, ppStripCharacter}


{------------------------------------------------------------------------------}
{ ppCalcAspectRatio}

function ppCalcAspectRatio(aSourceWidth, aSourceHeight, aDestWidth, aDestHeight: Single): Single;
var
  lfScaleHeight: Single;
  lfScaleWidth:  Single;

begin

  Result := 0;

  if (aSourceWidth <=0) or (aSourceHeight <= 0) then Exit;

  lfScaleHeight := aDestWidth  / aSourceWidth;
  lfScaleWidth  := aDestHeight / aSourceHeight;

  {scale by the lesser of the two factors }
  if lfScaleHeight > lfScaleWidth then
    Result := lfScaleWidth
  else
    Result := lfScaleHeight;

end;

function ppBytesPerScanline(aPixelsPerScanline, aBitsPerPixel, aAlignment: Longint): Longint;
var
  liBitsPerScanLine: Longint;

begin
  Dec(aAlignment);
  liBitsPerScanLine := aPixelsPerScanline * aBitsPerPixel;
  Result := (liBitsPerScanLine + aAlignment) and not aAlignment;
  Result := Result div 8;
end;

{------------------------------------------------------------------------------}
{ ppGetDIBitmapInfo }

procedure ppGetDIBitmapInfo(aHBitmap: HBITMAP; var aBitmapInfoHeader: TBitmapInfoHeader);
var
 lBitmapDescription: Windows.TBitmap;
begin

  {get bitmap description (i.e. organization)}
  GetObject(aHBitmap, SizeOf(lBitmapDescription), @lBitmapDescription);

  {initialize DIB bitmap header info}
  aBitmapInfoHeader.biSize     := SizeOf(TBitmapInfoHeader);
  aBitmapInfoHeader.biWidth    := lBitmapDescription.bmWidth;
  aBitmapInfoHeader.biHeight   := lBitmapDescription.bmHeight;
  aBitmapInfoHeader.biBitCount := lBitmapDescription.bmBitsPixel * lBitmapDescription.bmPlanes;

  aBitmapInfoHeader.biPlanes        := 1;
  aBitmapInfoHeader.biXPelsPerMeter := 0;
  aBitmapInfoHeader.biYPelsPerMeter := 0;
  aBitmapInfoHeader.biClrUsed       := 0;
  aBitmapInfoHeader.biClrImportant  := 0;
  aBitmapInfoHeader.biCompression   := BI_RGB;

  if aBitmapInfoHeader.biBitCount in [16, 32] then
    aBitmapInfoHeader.biBitCount := 24;


  aBitmapInfoHeader.biSizeImage := ppBytesPerScanLine(aBitmapInfoHeader.biWidth, aBitmapInfoHeader.biBitCount, 32)
                                                               * Abs(aBitmapInfoHeader.biHeight);

end;

{------------------------------------------------------------------------------}
{ ppGetDIBSizes }

procedure ppGetDIBSizes(aHBitmap: HBITMAP; var aInfoHeaderSize: Integer; var aImageSize: DWORD);
var
  lBitmapInfoHeader: TBitmapInfoHeader;
begin

  ppGetDIBitmapInfo(aHBitmap, lBitmapInfoHeader);

  if lBitmapInfoHeader.biBitCount > 8 then
    aInfoHeaderSize := SizeOf(TBitmapInfoHeader)
  else
    aInfoHeaderSize := SizeOf(TBitmapInfoHeader) + SizeOf(TRGBQuad) * (1 shl lBitmapInfoHeader.biBitCount);

  aImageSize := lBitmapInfoHeader.biSizeImage;

end;

{------------------------------------------------------------------------------}
{ ppGetDIB }

function ppGetDIB(aHBitmap: HBITMAP; aPalette: HPALETTE; var aBitmapInfo; var aBits): Boolean;
var
  lDC: HDC;

begin

  ppGetDIBitmapInfo(aHBitmap, TBitmapInfoHeader(aBitmapInfo));

  lDC := CreateCompatibleDC(0);

  try

    {realize palette}
    if aPalette <> 0 then
      begin
        SelectPalette(lDC, aPalette, False);
        RealizePalette(lDC);
      end;

    Result := GetDIBits(lDC, aHBitmap, 0, TBitmapInfoHeader(aBitmapInfo).biHeight, @aBits,
                                          TBitmapInfo(aBitmapInfo), DIB_RGB_COLORS) <> 0;

  finally

    DeleteDC(lDC);

  end;

end;




{------------------------------------------------------------------------------}
{ ppGetHBitmap }

function ppGetHBitmap(aBitmap: TBitmap): HBITMAP;
var
 lHBitmap: HBITMAP;
 lSaveHBitmap: HBITMAP;
 lMemDC, lDC: HDC;
 lSavePalette: HPALETTE;
 lbRestorePalette: Boolean;

begin


  aBitmap.IgnorePalette := False;

  lDC := GetDC(0);

  lMemDC := CreateCompatibleDC(lDC);

  lHBitmap := CreateCompatibleBitmap(lDC, aBitmap.Width, aBitmap.Height);

  DeleteDC(lDC);

  lSaveHBitmap := SelectObject(lMemDC, lHBitmap);

  lbRestorePalette := False;
  lSavePalette := 0;

  if aBitmap.Palette <> 0 then
    begin
      lSavePalette := SelectPalette(lMemDC, aBitmap.Palette, False);
      RealizePalette(lMemDC);
      lbRestorePalette := True;
    end
  else
    begin
      SelectPalette(lMemDC, SystemPalette16, False);
      RealizePalette(lMemDC);

    end;


  BitBlt(lMemDC, 0, 0, aBitmap.Width, aBitmap.Height,
         aBitmap.Canvas.Handle, 0, 0, cmSrcCopy);


  {restore original bitmap}
  SelectObject(lMemDC, lSaveHBitmap);

  {restore palette}
  if lbRestorePalette then
    SelectPalette(lMemDC, lSavePalette, False);

  {delete mem DC}
  DeleteDC(lMemDC);

  Result := lHBitmap;

end; {function, ppGetHBitmap}

{------------------------------------------------------------------------------}
{ ppTransparentStretchBlt }

function ppTransparentStretchBlt(aDstDC: HDC; aDstX, aDstY, aDstW, aDstH: Integer;
  aSrcDC: HDC; aSrcX, aSrcY, aSrcW, aSrcH: Integer; aMaskDC: HDC; aMaskX, aMaskY: Integer): Boolean;

var
  lMemDC: HDC;
  lMemBmp: HBITMAP;
  lSaveBmp: HBITMAP;
  lSavePal: HPALETTE;
  lSaveTextColor, lSaveBkColor: TColorRef;

begin

  Result := True;

  lSavePal := 0;

  {create compatible device context}
  lMemDC := CreateCompatibleDC(aSrcDC);

  try

    {create compatible bitmap and select into compatible DC}
    lMemBmp := CreateCompatibleBitmap(aSrcDC, aSrcW, aSrcH);
    lSaveBmp := SelectObject(lMemDC, lMemBmp);

    {get the current palette}
    lSavePal := SelectPalette(aSrcDC, SystemPalette16, False);

    SelectPalette(aSrcDC, lSavePal, False);

    {initialize memDC with appropriate palette}
    if lSavePal <> 0 then
      lSavePal := SelectPalette(lMemDC, lSavePal, True)
    else
      lSavePal := SelectPalette(lMemDC, SystemPalette16, True);

    RealizePalette(lMemDC);

    {copy the mask to the memDC and then copy the source using SrcErase }
    StretchBlt(lMemDC, 0, 0, aSrcW, aSrcH, aMaskDC, aMaskX, aMaskY, aSrcW, aSrcH, SrcCopy);
    StretchBlt(lMemDC, 0, 0, aSrcW, aSrcH, aSrcDC, aSrcX, aSrcY, aSrcW, aSrcH, SrcErase);

    {set text and background color for destination DC}
    lSaveTextColor := SetTextColor(aDstDC, $0);
    lSaveBkColor   := SetBkColor(aDstDC, $FFFFFF);

    {copy mask to destDC and then copy the MemDC using SrcInvert}
    StretchBlt(aDstDC, aDstX, aDstY, aDstW, aDstH, aMaskDC, aMaskX, aMaskY, aSrcW, aSrcH, SrcAnd);
    StretchBlt(aDstDC, aDstX, aDstY, aDstW, aDstH, lMemDC, 0, 0, aSrcW, aSrcH, SrcInvert);

    {restore the text and background colors}
    SetTextColor(aDstDC, lSaveTextColor);
    SetBkColor(aDstDC,   lSaveBkColor);

    {restore the mem bmp}
    if lSaveBmp <> 0 then
      SelectObject(lMemDC, lSaveBmp);

    {delete the memDbmp}
    DeleteObject(lMemBmp);

  finally
  
    {restore the palette and delete the memDC}
    if lSavePal <> 0 then
      SelectPalette(lMemDC, lSavePal, False);
    DeleteDC(lMemDC);

  end;


end;  {function, ppTransparentStretchBlt}

{$IFDEF NOTUSED}

{------------------------------------------------------------------------------}
{ ppDrawTransparentDIBitmapWithoutStretchBlt }

procedure ppDrawTransparentDIBitmapWithoutStretchBlt(aCanvas: TCanvas; const aRect: TRect; aBitmap: TBitmap; aCopyMode: TCopyMode);

var
  lSaveTextColor, lSaveBkColor: TColorRef;
  liBitmapWidth: Integer;
  liBitmapHeight: Integer;
  lMaskBmp: TBitmap;
  lTempBmp: TBitmap;

begin

  liBitmapWidth  := aBitmap.Width;
  liBitmapHeight := aBitmap.Height;

  {create a mask bmp}
  lMaskBmp := TBitmap.Create;
  lMaskBmp.Assign(aBitmap);
 {  lMaskBmp.SaveToFile('c:\temp\bitmap.bmp');}

  lMaskBmp.Mask(clWhite);
  lMaskBmp.Canvas.Brush.Style := bsClear;

 { lMaskBmp.SaveToFile('c:\temp\mask.bmp');}

  lTempBmp := TBitmap.Create;
  lTempBmp.Width  := liBitmapWidth;
  lTempBmp.Height := liBitmapHeight;

 { lTempBmp.Assign(lMaskBmp);}
  lTempBmp.Canvas.Brush.Style := bsClear;

  StretchBlt(lTempBmp.Canvas.Handle, 0, 0, liBitmapWidth, liBitmapHeight,
             lMaskBmp.Canvas.Handle, 0, 0, liBitmapWidth, liBitmapHeight, SrcCopy);

  StretchBlt(lTempBmp.Canvas.Handle, 0, 0, lTempBmp.Width, lTempBmp.Height,
             aBitmap.Canvas.Handle, 0, 0, liBitmapWidth, liBitmapHeight, SrcErase);


  {set text and background color for destination DC}
  lSaveTextColor := SetTextColor(aCanvas.Handle, $0);
  lSaveBkColor   := SetBkColor(aCanvas.Handle, $FFFFFF);

  aCanvas.Brush.Style := bsClear;

  {copy mask to destDC and then copy the MemDC using SrcInvert}
  ppDrawDIBitmap(aCanvas, aRect, lMaskBmp, SrcAnd);
  ppDrawDIBitmap(aCanvas, aRect, lTempBmp, SrcInvert);


  {restore the text and background colors}
  SetTextColor(aCanvas.Handle, lSaveTextColor);
  SetBkColor(aCanvas.Handle,   lSaveBkColor);


  lMaskBmp.Free;
  lTempBmp.Free;


end;  {function, ppDrawTransparentDIBitmapWithoutStretchBlt}
{$ENDIF}



{------------------------------------------------------------------------------}
{ ppDrawTransparentDIBitmapUsingStretchBlt }

procedure ppDrawTransparentDIBitmapUsingStretchBlt(aCanvas: TCanvas; const aRect: TRect; aBitmap: TBitmap; aCopyMode: TCopyMode);
var
  liDrawWidth: Integer;
  liDrawHeight: Integer;
  liBitmapWidth: Integer;
  liBitmapHeight: Integer;
  lMaskBmp: TBitmap;
  lMaskCanvas: TppDeviceCompatibleCanvas;
  lMemCanvas: TppDeviceCompatibleCanvas;
  liDeviceBPP: Integer;

begin


  liDrawWidth := aRect.Right  - aRect.Left;
  liDrawHeight:= aRect.Bottom - aRect.Top;

  {get device bitmap bits per pixel}
  liDeviceBPP := GetDeviceCaps(aCanvas.Handle, BITSPIXEL) * GetDeviceCaps(aCanvas.Handle, PLANES);

  {if device is monochrome, size bitmap based on printer pixels,
                            otherwise use screen pixels (to minimize memory}
  if (liDeviceBPP = 1) then
    begin
     liBitmapWidth  := aRect.Right  - aRect.Left;
     liBitmapHeight := aRect.Bottom - aRect.Top;

    end
  else
    begin
     liBitmapWidth  := aBitmap.Width;
     liBitmapHeight := aBitmap.Height;

    end;

  {create a device compatible canvas in memory - with the required dimensions}
  lMemCanvas := TppDeviceCompatibleCanvas.Create(aCanvas.Handle, liBitmapWidth, liBitmapHeight,
                                                 aBitmap.Palette);

  {draw the bmp to the mem canvas}
  ppDrawDIBitmap(lMemCanvas, Rect(0 ,0, liBitmapWidth, liBitmapHeight), aBitmap, cmSrcCopy);

  {create a mask bmp}
  lMaskBmp := TBitmap.Create;
  lMaskBmp.Assign(aBitmap);
  lMaskBmp.Mask(clWhite);
  lMaskCanvas := TppDeviceCompatibleCanvas.Create(aCanvas.Handle, liBitmapWidth,
                                                                  liBitmapHeight,
                                                                  aBitmap.Palette);

   {draw the mask bmp to the mask mem canvas}
   ppDrawDIBitmap(lMaskCanvas, Rect(0, 0, liBitmapWidth, liBitmapHeight), lMaskBmp, cmSrcCopy);


   aCanvas.Brush.Style := bsClear;

   {use mem canvas and mask canvas to draw to the device canvas}
   ppTransparentStretchBlt(aCanvas.Handle, aRect.Left, aRect.Top,
                                         liDrawWidth, liDrawHeight,
                                         lMemCanvas.Handle, 0, 0, liBitmapWidth, liBitmapHeight,
                                         lMaskCanvas.Handle, 0, 0);

  lMaskBmp.Free;                                       
  lMaskCanvas.Free;
  lMemCanvas.Free;

end; {procedure, ppDrawTransparentDIBitmapUsingStretchBlt}



{------------------------------------------------------------------------------}
{ ppDrawTransparentDIBitmap }

procedure ppDrawTransparentDIBitmap(aCanvas: TCanvas; const aRect: TRect; aBitmap: TBitmap; aCopyMode: TCopyMode);
var
  liRasterCaps: Integer;
  lbStretchBlt: Boolean;
  {liDeviceBPP: Integer;}

begin

  {check whether device supports StretchBlt}
  liRasterCaps := GetDeviceCaps(aCanvas.Handle, RASTERCAPS);

  lbStretchBlt := (liRasterCaps and RC_STRETCHBLT) > 0;

  {get device bitmap bits per pixel}
 { liDeviceBPP := GetDeviceCaps(aCanvas.Handle, BITSPIXEL) * GetDeviceCaps(aCanvas.Handle, PLANES);
  }

  if (lbStretchBlt) then
    ppDrawTransparentDIBitmapUsingStretchBlt(aCanvas, aRect, aBitmap, aCopyMode)

 { else if liDeviceBPP > 1 then
    ppDrawTransparentDIBitmapWithoutStretchBlt(aCanvas, aRect, aBitmap, aCopyMode)}

  else
    ppDrawDIBitmap(aCanvas, aRect, aBitmap, aCopyMode);


end; {procedure, ppDrawTransparentDIBitmap}

{------------------------------------------------------------------------------}
{ ppDrawDIBitmap }

procedure ppDrawDIBitmap(aCanvas: TCanvas; const aRect: TRect; aBitmap: TBitmap; aCopyMode: TCopyMode);
var
  lpBitMapInfo: PBitmapInfo;
  lpImage: Pointer;
  liInfoSize: Integer;
  lSavePalette: HPalette;
  lbRestorePalette: Boolean;
  liImageSize: DWord;
  lbHalftone: Boolean;
  lPoint: TPoint;
  lBitmapDescription: Windows.TBitmap;
  lbMonochrome: Boolean;
  liBitmapBPP, liDeviceBPP: Integer;
  lHBitmap: HBITMAP;
begin


  lHBitmap := ppGetHBitmap(aBitmap);

  lSavePalette := 0;
  lbRestorePalette := False;

  if aBitmap.Palette <> 0 then
    begin
      lSavePalette := SelectPalette(aCanvas.Handle, aBitmap.Palette, False);
      RealizePalette(aCanvas.Handle);
      lbRestorePalette := True;
    end
  else
    begin
      SelectPalette(aCanvas.Handle, SystemPalette16, False);
      RealizePalette(aCanvas.Handle);

    end;

  {get bitmap description (i.e. organization)}
  GetObject(lHBitmap, SizeOf(lBitmapDescription), @lBitmapDescription);

  {determine the number of bits required to describe each pixel }
  liBitmapBPP := (lBitmapDescription.bmBitsPixel * lBitmapDescription.bmPlanes);

  {determine the devices color cababilities }
  liDeviceBPP := GetDeviceCaps(aCanvas.Handle, BITSPIXEL) * GetDeviceCaps(aCanvas.Handle, PLANES);

  lbHalftone := (liDeviceBPP <= 8) and (liDeviceBPP < liBitmapBPP);

  lbMonochrome := (liBitmapBPP = 1);

  {set the stretch blit mode}
  if lbHalftone then
    begin
      GetBrushOrgEx(aCanvas.Handle, lPoint);
      SetStretchBltMode(aCanvas.Handle, HALFTONE);

      SetBrushOrgEx(aCanvas.Handle, lPoint.x, lPoint.y, @lPoint);
    end

  else if not lbMonochrome then
    SetStretchBltMode(aCanvas.Handle, STRETCH_DELETESCANS);

  {initialize }
  liInfoSize   := 0;
  liImageSize  := 0;

  {get info needed to convert bitmap to DIB}
  ppGetDIBSizes(lHBitmap, liInfoSize, liImageSize);

  lpBitMapInfo  := AllocMem(liInfoSize);
  lpImage       := AllocMem(liImageSize);

  {convert bitmap to Device Independent Bitmap}
  ppGetDIB(lHBitmap, aBitmap.Palette, lpBitMapInfo^, lpImage^);

  {draw bitmap to printer canvas }
  StretchDIBits(aCanvas.Handle,
                aRect.Left, aRect.Top, aRect.Right - aRect.Left, aRect.Bottom - aRect.Top,
                0, 0, lpBitMapInfo^.bmiHeader.biWidth, lpBitMapInfo^.bmiHeader.biHeight,
                lpImage, lpBitMapInfo^, DIB_RGB_COLORS, aCopyMode);

  FreeMem(lpBitmapInfo, liInfoSize);
  FreeMem(lpImage, liImageSize);


  if lbRestorePalette then
    SelectPalette(aCanvas.Handle, lSavePalette, False);

  DeleteObject(lHBitmap);

end; {procedure, DrawDIBitmap}

{------------------------------------------------------------------------------}
{ ppCopyPalette }

function ppCopyPalette(aPalette: HPalette): HPalette;
begin
   Result := CopyPalette(aPalette);
end;

{------------------------------------------------------------------------------}
{ ppGetSystemDefaultLanguage }

function ppGetSystemDefaultLanguage: TppLanguageType;
var
  lwLang1: Word;
  lwLang2: Word;
begin

  lwLang1 := Lo(GetSystemDefaultLangId);
  lwLang2 := Hi(GetSystemDefaultLangId);

  case lwLang1 of
    LANG_DANISH:      Result := lgDanish;
    LANG_DUTCH:       Result := lgDutch;
    LANG_FRENCH:      Result := lgFrench;
    LANG_GERMAN:      Result := lgGerman;
    LANG_ITALIAN:     Result := lgItalian;
    LANG_NORWEGIAN:   Result := lgNorwegian;
    LANG_SWEDISH:     Result := lgSwedish;

    LANG_SPANISH:
      begin
        if (lwLang2 = SUBLANG_SPANISH) then
          Result := lgSpanish
        else
          Result := lgSpanishMexico;
      end;

    LANG_PORTUGUESE:
      begin
        if (lwLang2 = SUBLANG_PORTUGUESE_BRAZILIAN) then
          Result := lgPortugueseBrazil
        else
          Result := lgPortuguese;
      end;

    else
      Result := lgEnglish;

  end;

end; {function, ppGetSystemDefaultLanguage}

{******************************************************************************
 *
 ** F O N T L I S T  S T U F F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ EnumFontsProc }

function EnumFontsProc2(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).AddObject(StrPas(LogFont.lfFaceName), TObject(FontType));
  Result := 1;
end;

{------------------------------------------------------------------------------}
{ TppFontList.ppGetFontNames }

procedure ppGetFontNames(aDC: HDC; aFontList: TStrings);
var
  Proc: TFarProc;
  lDC: HDC;
begin

  aFontList.Clear;

  if (aDC = 0) then
    lDC := GetDC(0)
  else
    lDC := aDC;

  Proc := MakeProcInstance(@EnumFontsProc2, HInstance);

  EnumFonts(lDC, nil, Proc, Pointer(aFontList));
  FreeProcInstance(Proc);

  if (aDC = 0) then
    ReleaseDC(0, lDC);

end;

{------------------------------------------------------------------------------}
{ TppDebugLog.WriteMessage }

procedure TppDebugLog.WriteMessage(aMessage: String);
begin
  Add(aMessage);
  SaveToFile('c:\temp\debug.txt');
end;

{------------------------------------------------------------------------------}
{ ppResourceManager }

function ppResourceManager: TppResourceManager;
begin

  if  FResourceManager = nil then
    FResourceManager := TppResourceManager.Create;

  Result := FResourceManager;

end;

{------------------------------------------------------------------------------}
{ ppDebugLog }

function ppDebugLog: TppDebugLog;
begin
  if FDebugLog = nil then
    begin
      FDebugLog := TppDebugLog.Create;
      {clear it out}
      FDebugLog.SaveToFile('c:\temp\debug.txt');
    end;
  Result := FDebugLog;
end;

{------------------------------------------------------------------------------}
{ ppCapitalize }

function ppCapitalize(aString: String): String;
var
  liPos: Integer;
  liLength: Integer;
  lsWord: String;
begin

  Result := aString;

  liLength := Length(Result);

  if (liLength = 0) then Exit;

  Result := LowerCase(Result);

  Result[1] := UpperCase(Result[1])[1];

  lsWord := Result;


  liPos := Pos(#32, lsWord);

  while (liPos <> 0) and (liPos < liLength) do
    begin
      lsWord[liPos + 1] := UpperCase(lsWord[liPos + 1])[1];

      lsWord := Copy(lsWord, liPos + 1, Length(lsWord));

      Result := Copy(Result, 1, Length(Result) - Length(lsWord)) + lsWord;

      liPos := Pos(#32, lsWord);
    end;


  liPos := Pos('_', lsWord);

  while (liPos <> 0) and (liPos < liLength) do
    begin
      lsWord[liPos] := #32;

      lsWord[liPos + 1] := UpperCase(lsWord[liPos + 1])[1];

      lsWord := Copy(lsWord, liPos, Length(lsWord));

      Result := Copy(Result, 1, Length(Result) - Length(lsWord)) + lsWord;

      liPos := Pos('_', lsWord);
    end;

end; {function, ppCapitalize}

{------------------------------------------------------------------------------}
{ ppStrToDateTime }

function ppStrToDateTime(aValue: String): TDateTime;
begin

{$IFDEF Delphi5}
    Result := StrToDateTime(aValue);
{$ELSE}

  {use existing century window value}
  if TwoDigitYearCenturyWindow <> 0 then
    Result := StrToDateTime(aValue)

  else
    try

      {handle pre-Delphi Y2K issues by temp setting CenturyWindow to 50}
      TwoDigitYearCenturyWindow := 50;

      Result := StrToDateTime(aValue);
    finally
      TwoDigitYearCenturyWindow  := 0;
    end;

{$ENDIF}

end;  {function, ppStrToDateTime}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FResourceManager.Free;
  FResourceManager := nil;

  FDebugLog.Free;
  FDebugLog := nil;

end.


