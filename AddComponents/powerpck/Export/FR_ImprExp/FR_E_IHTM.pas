
{******************************************}
{                                          }
{             FastReport v2.4              }
{       Improved HTM export filter         }
{                                          }
{     Original version by Tzyganenko A.    }
{     Improved version by Ishenin    P.    }
{                                          }
{******************************************}

{
  Изменения относительно FR_E_HTM:
  1. Добавлен вывод диаграмм как рисунков.
  2. При разном числе колонок на строках формируется новая таблица, что ведет
     к улучшению качества.
  3. Указывается положение текста в ячейке (лево, право, центр, ширина).
  4. Решена проблема с текстом, который не влезает в рамку(мемо). Теперь при
     экспорте не влезший текст выводится на следующей строке ячейке.
  5. Для простоты использования (хотя может быть для кого-то и нет)
     инициализация экспорта осуществляется в момент инициализации модуля, так
     что для использования достаточно просто в модуле проекта добавить этот
     экспорт в раздел uses.

Использовать в виде компоненты без переделки модуля не рекомендуется, т.к.
в текущей реализации вместо одного экземпляра класса у вас создастся второй
ненужный.

За вопросами и предложениями обращайтесь по e-mail : webpirat@mail.ru
                                            http   : free1c.narod.ru
Ишенин Павел
}
unit FR_E_IHTM; { Improved HTM export }

interface

{$I FR.inc}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Forms, StdCtrls, FR_Class, 
  Controls;

type
  PfrHtmRec = ^TfrHtmRec;
  TfrHtmRec = record
    Next: PfrHtmRec;
    X: Integer;
    Text: String;
    FontName: String[32];
    FontSize, FontStyle, FontColor, FontCharset, FillColor: Integer;
    DrawRect: TRect;
    FrameTyp: Integer;
    Alignment:integer;
  end;
  PRect = ^TRect;

  TfrIHTMExport = class(TfrExportFilter)
  private
    FScaleY: Double;
    FkillEmptyLines, FExportPictures: Boolean;
    DataList: TList;
    ImgNumber: Integer;
    CurCols : Integer;
  public
    constructor Create(AOwner: TComponent); override;
    function ShowModal: Word; override;
    procedure OnEndPage; override;
    procedure OnBeginPage; override;
    procedure OnData(x, y: Integer; View: TfrView); override;
    procedure OnBeginDoc; override;
    procedure OnEndDoc; override;
    procedure OnText(DrawRect: TRect; X, Y: Integer; const Text: String;
      FrameTyp: Integer; View: TfrView); override;
    procedure InsertTextRec(p: PfrHtmRec; LineIndex: Integer);
  published
    property ExportPictures: Boolean read FExportPictures write FExportPictures default False;
    property ScaleY: Double read FScaleY write FScaleY;
    property KillEmptyLines: Boolean read FKillEmptyLines write FKillEmptyLines default True;
  end;

  TfrHTMExportForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    E2: TEdit;
    CB2: TCheckBox;
    Label3: TLabel;
    CB1: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Localize;
  public
    { Public declarations }
  end;


implementation

uses FR_Utils, FR_Const {$IFDEF JPEG}, JPEG {$ENDIF}, FR_Chart;

{$R *.DFM}


{ TfrIHTMExport }

constructor TfrIHTMExport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ShowDialog := True;
  ScaleY := 1;
  KillEmptyLines := True;
  ExportPictures := False;
end;

procedure TfrIHTMExport.OnBeginDoc;
var
  s: String;
begin
  DataList := TList.Create;
  s := '<HTML>'#13#10'<Body bgColor="#FFFFFF">'#13#10; {'<Table>'#13#10;}
  Stream.Write(s[1], Length(s));
  ImgNumber := 0;
  CurCols := -1;
end;

procedure TfrIHTMExport.OnEndDoc;
var
  s: String;
begin
  s := '</Table>'#13#10'</Body>'#13#10'</HTML>'#13#10;
  Stream.Write(s[1], Length(s));
  DataList.Free;
end;

function TfrIHTMExport.ShowModal: Word;
begin
  if not ShowDialog then
    Result := mrOk
  else with TfrHTMExportForm.Create(nil) do
  begin
    CB1.Checked := KillEmptyLines;
    CB2.Checked := ExportPictures;
    E2.Text := FloatToStr(ScaleY);
    Result := ShowModal;
    try
      ScaleY := frStrToFloat(E2.Text);
    except
      ScaleY := 1;
    end;
    KillEmptyLines := CB1.Checked;
    ExportPictures := CB2.Checked;
    Free;
  end;
end;

procedure TfrIHTMExport.OnEndPage;
var
  i, n: Integer;
  p: PfrHtmRec;
  s, s1, s2, txt: String;
  Str: TStream;
  Pict: TPicture;
  Graphic: TGraphic;
  x, y, dx, dy: Integer;
  b: Byte;
  IsEmpty: Boolean;
  LineCol : Integer;

  function GetHTMLFontSize(Size: Integer): String;
  begin
    case Size of
      6, 7: Result := '1';
      8, 9: Result := '2';
      14..17: Result := '4';
      18..23: Result := '5';
      24..35: Result := '6'
    else
      Result := '7';
    end;
  end;

  function GetHTMLFontStyle(Style: Integer): String;
  begin
    Result := '';
    if (Style and $1) <> 0 then Result := '<i>';
    if (Style and $2) <> 0 then Result := Result + '<b>';
    if (Style and $4) <> 0 then Result := Result + '<u>';
  end;

begin
  if ExportPictures then
    for i := 0 to DataList.Count - 1 do
    begin
      Str := TStream(DataList[i]);
      Str.Position := 0;
      Pict := TPicture.Create;
      Str.Read(x, 4);
      Str.Read(y, 4);
      Str.Read(dx, 4);
      Str.Read(dy, 4);
      Str.Read(b, 1);

      Graphic := TBitmap.Create;
      s := 'htm' + IntToStr(ImgNumber) + '.bmp';
      if b = 1 then
      begin
{$IFDEF JPEG}
        Graphic.Free;
        Graphic := TJPEGImage.Create;
        s := 'htm' + IntToStr(ImgNumber) + '.jpg';
{$ENDIF}
      end;
      Pict.Graphic := Graphic;
      Graphic.Free;
      Pict.Graphic.LoadFromStream(Str);
      Pict.Graphic.SaveToFile(ExtractFilePath(FileName) + s);

      GetMem(p, SizeOf(TfrHtmRec));
      FillChar(p^, SizeOf(TfrHtmRec), 0);
      p^.X := x;
      p^.Text := s;
      p^.DrawRect := Rect(x, y, dx, dy);
      p^.FrameTyp := -1;
      InsertTextRec(p, Round(y / (14 / ScaleY)));

      Pict.Free;
      Str.Free;
      Inc(ImgNumber);
    end;
  DataList.Clear;

  n := Lines.Count - 1;
  while n >= 0 do
  begin
    if Lines[n] <> nil then break;
    Dec(n);
  end;

  for i := 0 to n do
  begin
    p := PfrHtmRec(Lines[i]);
    LineCol := 0;
    s := '<tr>';
    IsEmpty := True;
    while p <> nil do
    begin
      IsEmpty := False;
      s1 := ''; s2 := '';
      if p^.FrameTyp = -1 then
      begin
        s1 := '<img src="' + p^.Text + '" width="' +
          IntToStr(p^.DrawRect.Right) + '" height="' +
          IntToStr(p^.DrawRect.Bottom) + '">';
        s := s + '<td>' + s1 + '</td>';
        Inc(LineCol);
      end
      else
      begin
        if (p^.FontColor = clWhite) or (p^.FontColor = clNone) then
          p^.FontColor := clBlack;
        if p^.FontColor <> clBlack then
        begin
          s1 := IntToHex(p^.FontColor, 6);
          s1 := 'Color="#' + Copy(s1, 5, 2) + Copy(s1, 3, 2) +
            Copy(s1, 1, 2) + '"';
        end;
        if not (p^.FontSize in [10..13]) then
          s1 := s1 + ' Size=' + GetHTMLFontSize(p^.FontSize);
        if p^.FontStyle <> 0 then
          s2 := GetHTMLFontStyle(p^.FontStyle);
        if s1 <> '' then s1 := '<Font ' + s1 + '>';
        s := s + '<td';
        case p^.Alignment of
          1 :  s:=s+' align="right"';
          2 :  s:=s+' align="center"';
          3 :  s:=s+' align="justify"';
        end;
        txt := p^.Text;
        while (p^.Next <> nil) and (p^.DrawRect.Left = p^.Next^.DrawRect.Left) and
                                   (p^.DrawRect.Top = p^.Next^.DrawRect.Top)   do
        begin
          p := p^.Next;
          txt := p^.Text + ' <br> ' + txt;
        end;
        s := s + '>' + s1 + s2 + txt{p^.Text} + '</td>';
        Inc(LineCol);
      end;
      p := p^.Next;
    end;
    if not KillEmptyLines or not IsEmpty then
    begin
      s := s + '</tr>'#13#10;
      If LineCol <> CurCols then
      begin
        s := '<TABLE>' + s;
        If CurCols <> -1 then s := '</TABLE>'+#$D#$A + s;
        CurCols := LineCol;
      end;
      Stream.Write(s[1], Length(s));
    end;
  end;
end;

procedure TfrIHTMExport.OnData(x, y: Integer; View: TfrView);
var
  Str: TStream;
  b: Byte;
  Graphic: TGraphic;
begin
  if ExportPictures then
    if View is TfrPictureView then
    begin
      Graphic := TfrPictureView(View).Picture.Graphic;
      if not ((Graphic = nil) or Graphic.Empty) then
      begin
        Str := TMemoryStream.Create;
        Str.Write(x, 4);
        Str.Write(y, 4);
        Str.Write(View.dx, 4);
        Str.Write(View.dy, 4);
        b := 0;
{$IFDEF JPEG}
        if Graphic is TJPEGImage then
          b := 1;
{$ENDIF}
        Str.Write(b, 1);
        Graphic.SaveToStream(Str);
        DataList.Add(Str);
      end; 
    end 
{$IFDEF TeeChart}    
    else if View is TfrChartView then
    begin
      Graphic := TBitmap.Create;
      Graphic.Width  := View.x + View.dx + 1;
      Graphic.Height := View.y + View.dy + 1;
      (View as TfrChartView).Draw((Graphic as TBitmap).Canvas);
      (Graphic as TBitmap).Canvas.CopyRect(Rect(0, 0, View.dx + 1, View.dy + 1), (Graphic as TBitmap).Canvas,
                 Rect(View.x, View.y, View.x + View.dx + 1, View.y + View.dy + 1));
      Graphic.Width  := View.dx + 1;
      Graphic.Height := View.dy + 1;
      If not Graphic.Empty then
      begin
        Str := TMemoryStream.Create;
        Str.Write(x, 4);
        Str.Write(y, 4);
        Str.Write(View.dx, 4);
        Str.Write(View.dy, 4);
        b := 0;
        Str.Write(b, 1);
        Graphic.SaveToStream(Str);
        DataList.Add(Str);
      end;
      Graphic.Free;
    end
{$ENDIF};
end;


procedure TfrHTMExportForm.Localize;
begin
  Caption := frLoadStr(frRes + 1830);
  CB1.Caption := frLoadStr(frRes + 1801);
  CB2.Caption := frLoadStr(frRes + 1821);
  Label1.Caption := frLoadStr(frRes + 1806);
  Button1.Caption := frLoadStr(SOk);
  Button2.Caption := frLoadStr(SCancel);
end;

procedure TfrHTMExportForm.FormCreate(Sender: TObject);
begin
  Localize;
end;

procedure TfrIHTMExport.OnText(DrawRect: TRect; X, Y: Integer;
  const Text: String; FrameTyp: Integer; View: TfrView);
var
  p: PfrHtmRec;
begin
  if View = nil then Exit;
  Y := Round({Y} (DrawRect.Top + 1) / (14 / ScaleY)); 
  New(p);
  p^.X := X;
  p^.Text := Text;
  if View is TfrMemoView then
    with View as TfrMemoView do
    begin
      p^.FontName := Font.Name;
      p^.FontSize := Font.Size;
      p^.FontStyle := frGetFontStyle(Font.Style);
      p^.FontColor := Font.Color;
      p^.Alignment:=Alignment;
{$IFNDEF Delphi2}
      p^.FontCharset := Font.Charset;
{$ENDIF}
    end;
  p^.DrawRect := DrawRect;
  p^.FrameTyp := FrameTyp;
  p^.FillColor := View.FillColor;
  InsertTextRec(p, Y);
end;

procedure TfrIHTMExport.InsertTextRec(p: PfrHtmRec; LineIndex: Integer);
var
  p1, p2: PfrHtmRec;
begin
  p1 := PfrHtmRec(Lines[LineIndex]);
  p^.Next := nil;
  if p1 = nil then
    Lines[LineIndex] := TObject(p)
  else
  begin
    p2 := p1;
    while (p1 <> nil) and (p1^.X < p^.X) do
    begin
      p2 := p1;
      p1 := p1^.Next;
    end;
    if p2 <> p1 then
    begin
      p2^.Next := p;
      p^.Next := p1;
    end
    else
    begin
      Lines[LineIndex] := TObject(p);
      p^.Next := p1;
    end;
  end;
end;
var HtmExportFilter : TfrIHTMExport;
procedure TfrIHTMExport.OnBeginPage;
var
  i: Integer;
begin
  ClearLines;
  for i := 0 to 200 do Lines.Add(nil);
end;

initialization
  HtmExportFilter := TfrIHTMExport.Create(nil);
  frRegisterExportFilter(HtmExportFilter, frLoadStr(SHTMFile) + ' (*.htm)', '*.htm');
finalization
  frUnRegisterExportFilter(HtmExportFilter);
  HtmExportFilter.Free;
end.
