{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppFilDev;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, ExtCtrls, SysUtils, Forms, Controls,
  ppDevice, ppTypes, ppUtils, ppForms, ppDrwCmd;


type

  { TppFileDevice }
  TppFileDevice = class(TppDevice)
    private
      FFileName: String;
      FFileStream: TFileStream;

      procedure SetFileName(aFileName: String);

    protected
      procedure DisplayMessage(aPage: TppPage);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function DefaultExt: String; virtual; abstract;
      class function DefaultExtFilter: String; virtual; abstract;
      class function DeviceDescription(aLanguageIndex: Longint): String; virtual; abstract;

      procedure EndJob; override;
      procedure StartJob; override;

      property FileName: String read FFileName write SetFileName;
      property FileStream: TFileStream read FFileStream;

  end; {class TppFileDevice}

  { TppTextFileDevice }
  TppTextFileDevice = class(TppFileDevice)
    private
      FEndingLine: Boolean;
      FEndingPage: Boolean;
      FFirstLine: Boolean;
      FLineItemNo: Longint;
      FLineNo: Longint;
      FLastLine: Boolean;
      FOnSave: TppTextDeviceSaveEvent;
      FStartingLine: Boolean;
      FStartingPage: Boolean;
      FTextFileType: TppFileType;

      procedure GetDrawTextCommands(aPage: TppPage; aList: TStringList);
      procedure SavePageToFile(aPage: TppPage);
      procedure SetTextFileType(aFileType: TppFileType);

    public
      constructor Create(aOwner: TComponent); override;

      class function DeviceName: String; override;
      class function DefaultExt: String; override;
      class function DefaultExtFilter: String; override;
      class function DeviceDescription(aLanguageIndex: Longint): String; override;

      procedure StartJob; override;
      procedure ReceivePage(aPage: TppPage); override;
      procedure EndJob; override;

      property EndingLine: Boolean read FEndingLine;
      property EndingPage: Boolean read FEndingPage;
      property FirstLine: Boolean read FFirstLine;
      property LineItemNo: Longint read FLineItemNo;
      property LineNo: Longint read FLineNo;
      property LastLine: Boolean read FLastLine;
      property OnSave: TppTextDeviceSaveEvent read FOnSave write FOnSave;
      property StartingLine: Boolean read FStartingLine;
      property StartingPage: Boolean read FStartingPage;
      property TextFileType: TppFileType read FTextFileType write SetTextFileType default ftComma;

  end; {class TppTextFileDevice}


  { TppReportTextFileDevice }
  TppReportTextFileDevice = class(TppFileDevice)
    private
      FAutoCalcGrid: Boolean;
      FCalculateOutputFontSize: Boolean;
      FCharsPerLine: Integer;
      FLinesPerPage: Integer;
      FOutputFontSize: Integer;

      procedure GetDrawTextCommands(aPage: TppPage; aList: TStringList);
      procedure SavePageToFile(aPage: TppPage);
      procedure SetOutputFontSize(Value: Integer);

    public
      constructor Create(aOwner: TComponent); override;

      {override from TppFileDevice}
      class function DeviceName: String; override;
      class function DefaultExt: String; override;
      class function DefaultExtFilter: String; override;
      class function DeviceDescription(aLanguageIndex: Longint): String; override;

      {override from TppDevice}
      procedure ReceivePage(aPage: TppPage); override;

      procedure CharacterGrid(aCharsPerLine, aLinesPerPage: Integer);

      property AutoCalcGrid: Boolean read FAutoCalcGrid write FAutoCalcGrid;
      property CalculateOutputFontSize: Boolean read FCalculateOutputFontSize write FCalculateOutputFontSize default True;
      property CharsPerLine: Integer read FCharsPerLine;
      property LinesPerPage: Integer read FLinesPerPage;
      property OutputFontSize: Integer read FOutputFontSize write SetOutputFontSize;

  end; {class TppReportTextFileDevice}

  { TppArchiveDevice }
  TppArchiveDevice = class(TppFileDevice)
    private
      FPageStream: TFileStream;
      FTempFile: String;

      procedure SavePageToFile(aPage: TppPage);

    public
      constructor Create(aOwner: TComponent); override;

      class function DeviceName: String; override;
      class function DefaultExt: String; override;
      class function DefaultExtFilter: String; override;
      class function DeviceDescription(aLanguageIndex: Longint): String; override;

      procedure StartJob; override;
      procedure ReceivePage(aPage: TppPage); override;
      procedure EndJob; override;

  end; {class TppArchiveDevice}


  TppFileDeviceClass = class of TppFileDevice;

implementation

{uses ppCtrls;}



{$IFDEF TESTING}
{------------------------------------------------------------------------------}
{ BinaryStreamToTextStream}

function BinaryStreamToTextStream(aBinaryStream: TStream): TMemoryStream;
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

end;

{$ENDIF}


{******************************************************************************
 *
 ** F I L E   D E V I C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFileDevice.Create }

constructor TppFileDevice.Create(aOwner: TComponent);

begin
  inherited Create(aOwner);

  FFileName   := '';
  FFileStream := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppFileDevice.Destroy }

destructor TppFileDevice.Destroy;
begin

  {free if they didn't call EndJob}
  if (FFileStream <> nil) then
    EndJob;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppFileDevice.SetFileName }

procedure TppFileDevice.SetFileName(aFileName: String);
begin

  if not(Busy) then
    FFileName := aFileName;

end; {procedure, SetTextFileName}

{------------------------------------------------------------------------------}
{ TppFileDevice.StartJob }

procedure TppFileDevice.StartJob;
var
  lMode: Word;
  lsMessage: String;
begin
  inherited StartJob;

  DisplayMessage(nil);

  lMode := fmOpenReadWrite or fmShareExclusive or fmCreate;

  {put exception handling here in case file can't be opened}
  try
    FFileStream := TFileStream.Create(FFileName, lMode);
  except
    lsMessage := ppLoadStr(67); {Unable to open file: <filename>.}
    lsMessage := ppSetMessageParameters(lsMessage);
    lsMessage := Format(lsMessage, [FFileName]);

    raise EPrintError.Create(lsMessage);
  end; {try, except}

  
end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppFileDevice.EndJob }

procedure TppFileDevice.EndJob;
begin
  inherited EndJob;

  if FFileStream <> nil then
    begin
      FFileStream.Free;
      FFileStream := nil;
    end;

end; {procedure, EndJob}

{------------------------------------------------------------------------------}
{ TppFileDevice.DisplayMessage }

procedure TppFileDevice.DisplayMessage(aPage: TppPage);
var
  lsMessage: String;
begin

  if (aPage = nil) then
    begin
      {message: Accessing data...}
      lsMessage := ppLoadStr(2);
    end

  else if IsMessagePage and not Publisher.ReportCompleted then
    begin

      if (CancelDialog <> nil) then
        lsMessage := CancelDialog.PrintProgress
      else
        lsMessage := '';

    end
  else if (PageRequest.PageSetting = psAll) and (aPage.PassSetting = psTwoPass) then
    begin
      {message: Printing Page 1 of 15 for <reportname> on <printername>}
      lsMessage := ppLoadStr(28);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), IntToStr(aPage.AbsolutePageCount),
                          aPage.DocumentName, FileName]);

    end

  else
    begin
      {message: Printing Page 1 for <reportname> on <printername>}
      lsMessage := ppLoadStr(27);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), aPage.DocumentName,
                                      FileName]);
    end;

  if (CancelDialog <> nil) and (CancelDialog.PrintProgress <> lsMessage) then
    begin
      CancelDialog.PrintProgress := lsMessage;
      Application.ProcessMessages;
    end;

end; {procedure, DisplayMessage}

{******************************************************************************
 *
 ** T E X T   F I L E   D E V I C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.Create }

constructor TppTextFileDevice.Create(aOwner: TComponent);

begin
  inherited Create(aOwner);

  FEndingLine := False;
  FFirstLine := False;
  FLineItemNo := 0;
  FLineNo := 0;
  FLastLine := False;
  FOnSave := nil;
  FStartingLine := False;
  FTextFileType := ftComma;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.DeviceName }

class function TppTextFileDevice.DeviceName: String;
begin
  Result := 'TextFile';
end; {class function, DeviceName}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.DefaultExt }

class function TppTextFileDevice.DefaultExt: String;
begin
  Result := 'txt';
end; {class function, DefaultExt}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.DefaultExtFilter }

class function TppTextFileDevice.DefaultExtFilter: String;
begin
  Result := 'Text files|*.TXT|All files|*.*';
end; {class function, DefaultExtFilter}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.DeviceDescription }

class function TppTextFileDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := ppLoadStr(37);
end; {class function, DeviceDescription}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.SetTextFileType }

procedure TppTextFileDevice.SetTextFileType(aFileType: TppFileType);
begin

  if not(Busy) then
    FTextFileType := aFileType;

end; {procedure, SetTextFileType}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.StartJob }

procedure TppTextFileDevice.StartJob;
begin
  inherited StartJob;

  FEndingLine := False;
  FEndingPage := False;
  FFirstLine := False;
  FLineItemNo := 0;
  FLineNo := 0;
  FLastLine := False;
  FStartingLine := False;
  FStartingPage := False;

end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.EndJob }

procedure TppTextFileDevice.EndJob;
begin
  FEndingLine := False;
  FEndingPage := False;
  FFirstLine := False;
  FLineItemNo := 0;
  FLineNo := 0;
  FLastLine := False;
  FStartingLine := False;
  FStartingPage := False;

  inherited EndJob;

end; {procedure, EndJob}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.ReceivePage }

procedure TppTextFileDevice.ReceivePage(aPage: TppPage);
begin

  inherited ReceivePage(aPage);

  if (IsRequestedPage) then
    begin
      DisplayMessage(aPage);

      if not(IsMessagePage) then
        SavePageToFile(aPage);
    end;

end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.SavePageToFile }

procedure TppTextFileDevice.SavePageToFile(aPage: TppPage);
var
  liCommand      : Integer;
  liCommands     : Integer;
  lDrawCommands  : TStringList;
  lDrawText      : TppDrawText;
  lsLine         : String;
  lsText         : String;
  liBandNo       : Longint;
  liSaveBandNo   : Longint;
  liLastBandNo   : Longint;
  lsDelimiter    : String;
  lsCRLF         : String;
  lsSaveLine     : String;

  procedure EndLine;
    begin
      lsSaveLine := lsLine;

      {write line to stream}
      if (Length(lsSaveLine) > 0) then
          begin
            FileStream.Write(lsSaveLine[1], Length(lsSaveLine));

            {if not end of file, add carriage return to end of line}
            if not((aPage.LastPage) and FEndingPage) and
               not(FTextFileType = ftCustom) then
              FileStream.Write(lsCRLF[1], Length(lsCRLF));
          end;

    end; {procedure, EndLine}

begin


  lsCRLF := #13#10;

  {get the draw text commands from the page}
  lDrawCommands := TStringList.Create;

  GetDrawTextCommands(aPage, lDrawCommands);

  if (lDrawCommands.Count = 0) then
    begin
      lDrawCommands.Free;

      Exit;
    end;

  {sort the commands into proper order}
  lDrawCommands.Sort;

  {get delimiter}
  case FTextFileType of
    ftComma:
      lsDelimiter := ',';

    ftTab:
      lsDelimiter := #9;

    else
      lsDelimiter := '';
  end;

  {init looping vars}
  liCommand := 0;
  liCommands := lDrawCommands.Count;

  FStartingPage := True;
  FEndingPage := False;

  FFirstLine := (aPage.AbsolutePageNo = 1);
  liLastBandNo := TppDrawText(lDrawCommands.Objects[liCommands - 1]).BandSaveNo;

  {loop through canvas commands, saving values to text file}
  while (liCommand < liCommands) do
    begin

      FLineItemNo := 0;

      FStartingLine := True;
      FEndingLine := False;

      lsLine := '';

      lDrawText := TppDrawText(lDrawCommands.Objects[liCommand]);

      liBandNo := lDrawText.BandSaveNo;
      liSaveBandNo := liBandNo;

      FLastLine := (aPage.LastPage) and (liBandNo = liLastBandNo);

      while (liBandNo = liSaveBandNo) do
        begin

          {set ending line, ending page indicators}
          if (liCommand = (liCommands - 1)) then
            begin
              FEndingLine := True;
              FEndingPage := True;
            end

          else if (liBandNo <> TppDrawText(lDrawCommands.Objects[liCommand + 1]).BandSaveNo) then
            FEndingLine := True;

          {get the text value}
          lsText := lDrawText.Text;

          {if fixed length, truncate or pad text as necessary}
          if (FTextFileType = ftFixedLength) then
            lsText := ppFixText(lsText, lDrawText.SaveLength, lDrawText.Alignment);

          if (FTextFileType = ftComma) and (Pos(',', lsText) <> 0) then
            lsText := '"' + lsText + '"';

          {fire the OnSave event}
          if Assigned(FOnSave) then FOnSave(Self, lDrawText.Component, lsText);

          if FStartingPage then
            FStartingPage := False;

          {add delimiter to text value}
          if FStartingLine then
            FStartingLine := False
          else
            lsText := lsDelimiter + lsText;

          lsLine := lsLine + lsText;

          Inc(FLineItemNo);

          Inc(liCommand);

          if (liCommand >= liCommands) then
            liBandNo := -1

          else
            begin
              lDrawText := TppDrawText(lDrawCommands.Objects[liCommand]);

              liBandNo := lDrawText.BandSaveNo;
            end;

      end; {while, line not complete}

      {save completed line to file}
      EndLine;

      if FFirstLine then
        FFirstLine := False;

      Inc(FLineNo);

    end; {while, each command}


    lDrawCommands.Free;

end; {procedure, SavePageToFile}

{------------------------------------------------------------------------------}
{ TppTextFileDevice.GetDrawTextCommands }

procedure TppTextFileDevice.GetDrawTextCommands(aPage: TppPage; aList: TStringList);
var
  liCommand: Integer;
  liCommands: Integer;
  lCommand: TppDrawCommand;
  lDrawText: TppDrawText;
begin

  {retrieve draw text commands which need to be saved to file}
  liCommands := aPage.DrawCommandCount;

  for liCommand := 0 to liCommands - 1 do
    begin

      lCommand := aPage.DrawCommands[liCommand];

      if (lCommand is TppDrawText) then
        begin
          lDrawText := TppDrawText(lCommand);

          if lDrawText.BandSave and lDrawText.ComponentSave then
            aList.AddObject(lDrawText.Order, lDrawText);

        end;

    end;

end; {procedure, GetDrawTextCommands}

{******************************************************************************
 *
 ** A R C H I V E   D E V I C E
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppArchiveDevice.Create }

constructor TppArchiveDevice.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FPageStream := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.DeviceName }

class function TppArchiveDevice.DeviceName: String;
begin
  Result := 'ArchiveFile';
end; {class function, DeviceName}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.DefaultExt }

class function TppArchiveDevice.DefaultExt: String;
begin
  Result := 'raf';
end; {class function, DefaultExt}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.DefaultExtFilter }

class function TppArchiveDevice.DefaultExtFilter: String;
begin
  Result := 'Archive files|*.RAF|All files|*.*';
end; {class function, DefaultExtFilter}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.DeviceDescription }

class function TppArchiveDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := ppLoadStr(34); {'Archive File'}
end; {class function, DeviceDescription}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.StartJob }

procedure TppArchiveDevice.StartJob;
var
  lMode: Word;
  lsMessage: String;
begin

  inherited StartJob;

  lMode := fmCreate or fmShareExclusive;

  FTempFile := ppGetTempFileName(ppGetTempPath, 'arc');

  {put exception handling here in case file can't be opened}
  try
    FPageStream := TFileStream.Create(FTempFile, lMode);

  except
    lsMessage := ppLoadStr(67); {Unable to open file: <filename>.}
    lsMessage := ppSetMessageParameters(lsMessage);
    lsMessage := Format(lsMessage, [FTempFile]);

    raise EPrintError.Create(lsMessage);
  end; {try, except}


  {save a space in the front of the stream to write the page directory size}
  FileStream.Position := SizeOf(Longint);

end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.EndJob }

procedure TppArchiveDevice.EndJob;
var
  llPageDirectorySize: Longint;

begin

  if FileStream = nil then Exit;

  llPageDirectorySize := FFileStream.Position;

  {copy pagestream to filestream,
    note: pass 0 as second paramter to copy entire stream}
  FileStream.CopyFrom(FPageStream, 0);

  {write the page directory size}
  FileStream.Position := 0;
  FileStream.Write(llPageDirectorySize, SizeOf(llPageDirectorySize));

  FPageStream.Free;
  FPageStream := nil;

  {delete the temp file}
  DeleteFile(FTempFile);

  inherited EndJob;

end; {procedure, EndJob}


{------------------------------------------------------------------------------}
{ TppArchiveDevice.ReceivePage }

procedure TppArchiveDevice.ReceivePage(aPage: TppPage);
begin

  inherited ReceivePage(aPage);

  if (IsRequestedPage) then
    begin
      DisplayMessage(aPage);

      if not(IsMessagePage) then
        SavePageToFile(aPage);
    end;

end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppArchiveDevice.SavePageToFile }

procedure TppArchiveDevice.SavePageToFile(aPage: TppPage);
var
  lPageEntry: TppPageEntryRec;

begin

  lPageEntry.Position       := FPageStream.Position;
  lPageEntry.AbsolutePageNo := aPage.AbsolutePageNo;

  {write the page directory}
  FileStream.Write(lPageEntry, SizeOf(lPageEntry));

  {write the page }
  FPageStream.WriteComponent(aPage);

end; {procedure, SavePageToFile}


{******************************************************************************
 *
 ** R E P O R T   T E X T   F I L E   D E V I C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.Create }

constructor TppReportTextFileDevice.Create(aOwner: TComponent);

begin
  inherited Create(aOwner);

  FAutoCalcGrid := True;
  FCalculateOutputFontSize := True;
  FCharsPerLine := 80;
  FLinesPerPage := 66;
  FOutputFontSize := 12;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.CharacterGrid }

procedure TppReportTextFileDevice.CharacterGrid(aCharsPerLine, aLinesPerPage: Integer);
begin
  FAutoCalcGrid := False;

  FCharsPerLine := aCharsPerLine;
  FLinesPerPage := aLinesPerPage;

end; {procedure, CharacterGrid}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.DeviceName }

class function TppReportTextFileDevice.DeviceName: String;
begin
  Result := 'ReportTextFile';
end; {class function, DeviceName}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.DefaultExt }

class function TppReportTextFileDevice.DefaultExt: String;
begin
  Result := 'txt';
end; {class function, DefaultExt}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.DefaultExtFilter }

class function TppReportTextFileDevice.DefaultExtFilter: String;
begin
  Result := 'Text files|*.TXT|All files|*.*';
end; {class function, DefaultExtFilter}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.DeviceDescription }

class function TppReportTextFileDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := ppLoadStr(12); {'Report Emulation Text File'}
end; {class function, DeviceDescription}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.ReceivePage }

procedure TppReportTextFileDevice.ReceivePage(aPage: TppPage);
begin

  inherited ReceivePage(aPage);

  if (IsRequestedPage) then
    begin
      DisplayMessage(aPage);

      if not(IsMessagePage) then
        SavePageToFile(aPage);
    end;

end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.SavePageToFile }

procedure TppReportTextFileDevice.SavePageToFile(aPage: TppPage);
var
  lDrawCommands: TStringList;
  lDrawText: TppDrawText;
  liCommand: Integer;
  lsCRLF: String;
  lsLine: String;
  liCharPos: Integer;
  liLineNo: Integer;
  llTextWidth: Longint;
  llTextHeight: Longint;
  lsText: String;

  function TopToLineNo(aTop: Longint): Integer;
  begin
    Result := (aTop div llTextHeight) + 1;
  end;

  function LeftToCharPos(aLeft: Longint): Integer;
  begin
    Result := (aLeft div llTextWidth) + 1;
  end;

  function JustifyText: String;
  var
    liLength: Integer;
    liWidth: Integer;
  begin
    Result := lDrawText.Text;

    liWidth := (lDrawText.Width div llTextWidth) + 1;

    if (lDrawText.AutoSize) then
      begin
        liLength := Length(lDrawText.Text);

        if (liLength < liWidth) then
          liLength := liWidth;
      end
    else
      liLength := liWidth;

    Result := ppFixText(Result, liLength, lDrawText.Alignment);
  end;

  function BlankLine: String;
  var
    liIndex: Integer;
  begin
    Result := '';

    for liIndex := 1 to FCharsPerLine do
      Result := Result + ' ';
  end;

  function GetNearestCourierSize(aFont: TFont): Integer;
  var
    lBitmap: TBitmap;
    liTextWidth8: Integer;
    liTextWidth10: Integer;
    liTextWidthAFont: Integer;
  begin
    {Default to Courier New 12}
    Result := 12;

    lBitmap := TBitmap.Create;
    try
      lBitmap.Canvas.Font.Name := 'Courier New';
      lBitmap.Canvas.Font.Size := 8;
      liTextWidth8 := lBitmap.Canvas.TextWidth('0');

      lBitmap.Canvas.Font.Size := 10;
      liTextWidth10 := lBitmap.Canvas.TextWidth('0');

      lBitmap.Canvas.Font := aFont;
      liTextWidthAFont := lBitmap.Canvas.TextWidth('0');

      if liTextWidthAFont <= liTextWidth8 then
        Result := 8
      else if liTextWidthAFont <= liTextWidth10 then
        Result := 10;

    finally
      lBitmap.Free;
    end;
  end;

  procedure CalcCharacterGrid;
  var
    lBitmap: TBitmap;
    lDrawText: TppDrawText;
    liTextWidth: Integer;
    liTextHeight: Integer;
    liFontSize: Integer;
  begin

    lBitmap := TBitmap.Create;

    lDrawText := TppDrawText(lDrawCommands.Objects[0]);

    if CalculateOutputFontSize then
      liFontSize := GetNearestCourierSize(lDrawText.Font)
    else
      liFontSize := OutputFontSize;

    lBitmap.Canvas.Font.Name := 'Courier New';
    lBitmap.Canvas.Font.Size := liFontSize;

    liTextWidth := lBitmap.Canvas.TextWidth('0');
    liTextHeight := lBitmap.Canvas.TextHeight('0');

    lBitmap.Free;

    if FAutoCalcGrid then
      begin
        llTextWidth := Round(ppFromScreenPixels(liTextWidth, utMMThousandths, pprtHorizontal, nil));
        llTextHeight := Round(ppFromScreenPixels(liTextHeight, utMMThousandths, pprtVertical, nil));

        FCharsPerLine := (aPage.PageDef.mmWidth div llTextWidth);
        FLinesPerPage := (aPage.PageDef.mmHeight div llTextHeight);
      end
    else
      begin
        llTextWidth := (aPage.PageDef.mmWidth div FCharsPerLine);
        llTextHeight := (aPage.PageDef.mmHeight div FLinesPerPage);
      end;

  end;

  procedure EndLine;
  begin

    lsLine := ppTrimRight(lsLine);

    {write line to stream}
    if (Length(lsLine) > 0) then
      FileStream.Write(lsLine[1], Length(lsLine));

    {if not end of file, add carriage return to end of line}
    if (liLineNo = FLinesPerPage) and (aPage.LastPage) then
      {do nothing}
    else
      FileStream.Write(lsCRLF[1], Length(lsCRLF));

    Inc(liLineNo);

  end; {procedure, EndLine}

begin

  lsCRLF := #13#10;

  {get the draw text commands from the page}
  lDrawCommands := TStringList.Create;

  GetDrawTextCommands(aPage, lDrawCommands);

  if (lDrawCommands.Count = 0) then
    begin
      lDrawCommands.Free;

      Exit;
    end;

  {sort the commands into proper order}
  lDrawCommands.Sort;

  {calculate character grid}
  CalcCharacterGrid;

  {init looping vars}
  liCommand := 0;
  lsLine := BlankLine;
  liLineNo := 1;

  {loop through canvas commands, saving values to text file}
  while (liCommand < lDrawCommands.Count) and (liLineNo <= FLinesPerPage) do
    begin
      lDrawText := TppDrawText(lDrawCommands.Objects[liCommand]);

      if (TopToLineNo(lDrawText.Top) = liLineNo) then
        begin
          liCharPos := LeftToCharPos(lDrawText.Left);

          lsText := JustifyText;

          Delete(lsLine, liCharPos, Length(lsText));
          Insert(lsText, lsLine, liCharPos);

          Inc(liCommand);
        end
      else
        begin
          EndLine;

          lsLine := BlankLine;
        end;

    end; {while, each command}

  while (liLineNo <= FLinesPerPage) do
    begin
      EndLine;

      lsLine := BlankLine;
    end;

  lDrawCommands.Free;

end; {procedure, SavePageToFile}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.SetOutputFontSize }
procedure TppReportTextFileDevice.SetOutputFontSize(Value: Integer);
begin

  if (Value <> FOutputFontSize) then
    begin
      FOutputFontSize := Value;
      FCalculateOutputFontSize := False;
    end;

end; {procedure, SetOutputFontSize}

{------------------------------------------------------------------------------}
{ TppReportTextFileDevice.GetDrawTextCommands }

procedure TppReportTextFileDevice.GetDrawTextCommands(aPage: TppPage; aList: TStringList);
var
  liCommand: Integer;
  liCommands: Integer;
  lCommand: TppDrawCommand;
  lDrawText: TppDrawText;
  lsOrder: String;
begin

  {retrieve draw text commands which need to be saved to file}
  liCommands := aPage.DrawCommandCount;

  for liCommand := 0 to liCommands - 1 do
    begin

      lCommand := aPage.DrawCommands[liCommand];

      if (lCommand is TppDrawText) then
        begin
          lDrawText := TppDrawText(lCommand);

          lsOrder := Format('%8d',[lDrawText.Top]) + Format('%8d',[lDrawText.Left]);

          aList.AddObject(lsOrder, lDrawText);
        end;

    end;

end; {procedure, GetDrawTextCommands}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterDevice(TppTextFileDevice);
  ppRegisterDevice(TppReportTextFileDevice);
  ppRegisterDevice(TppArchiveDevice);

finalization

  ppUnRegisterDevice(TppTextFileDevice);
  ppUnRegisterDevice(TppReportTextFileDevice);
  ppUnRegisterDevice(TppArchiveDevice);

end. 
