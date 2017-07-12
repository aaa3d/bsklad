{*****************************************************}
{                                                     }
{               FastReport v2.4                       }
{              ExcelExportFilter                      }
{       (C) Konstantin Butov for FR 2.4               }
{     For question mail to : kos@sp.iae.nsk.su        }
{                ICQ: 48750138                        }
{*****************************************************}
{Histo :                                              }
{ 14/10/00 : Version 1.001 Create                     }
{*****************************************************}

unit FR_E_BsExl;

{$I FR.inc}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Forms, StdCtrls,
  FR_Class, Controls, olectrls, FR_progr, Excel97
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  //Excel97;


Type

   PmyfrView = ^TmyfrView;
   TmyfrView = record
      X,Y, dx: Integer;
      Text: String;
      FontName: String[32];
      FontSize, FontStyle, FontColor, FontCharset, FillColor: Integer;
      DrawRect: TRect;
      FrameTyp: Integer;
      Alignment: Integer;
   end;


   TfrExcelExportFilter = class(TfrExportFilter)
   protected
      Fexcel    : TExcelApplication;
      FWorksheet: _Worksheet;
      FWorkbook : _Workbook;
      Flcid : LCID;

      FRow, FCol: Integer;
      FPage :Integer;

      FScaleX, FScaleY: Double;
      FKillEmptyLines,  FExportFrames,
      FUsePseudographic, FPageBreaks: Boolean;
          public
           constructor Create(AOwner: TComponent); override;
       destructor Destroy; override;
       procedure ClearLines; override;
                                procedure  OnBeginDoc; override;
                                procedure  OnEndDoc;  override;
       procedure OnBeginPage; override;
       procedure OnEndPage; override;
       procedure OnData(x, y: Integer; View: TfrView); override;
  published
    property ScaleX: Double read FScaleX write FScaleX;
    property ScaleY: Double read FScaleY write FScaleY;
    property KillEmptyLines: Boolean read FKillEmptyLines write FKillEmptyLines default True;
    property ExportFrames: Boolean read FExportFrames write FExportFrames default False;
    property UsePseudographic: Boolean read FUsePseudographic write FUsePseudographic default False;
    property PageBreaks: Boolean read FPageBreaks write FPageBreaks default True;
   end;

implementation

uses FR_Utils, FR_Const
  //OleServer, Activex ,
//  Excel2000
;

{ TfrExcelExportFilter }

procedure TfrExcelExportFilter.ClearLines;
var
  i: Integer;
  p: PmyfrView;
begin
  for i := 0 to Lines.Count - 1 do
  begin
    p := PmyfrView(Lines[i]);
    Dispose(p);
  end;
  Lines.Clear;
end;

constructor TfrExcelExportFilter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  frRegisterExportFilter(Self, 'Excel file (*.xls)', '*.xls');

  ShowDialog := True;
  ScaleX := 1;
  ScaleY := 1;
  KillEmptyLines := True;
  ExportFrames := False;
  UsePseudographic := False;
  PageBreaks := True;
  FRow := 1;
  FCol := 1;
end;

destructor TfrExcelExportFilter.Destroy;
begin
  frUnRegisterExportFilter(Self);
  inherited Destroy;
end;

procedure TfrExcelExportFilter.OnBeginDoc;
begin
        try
 Fexcel := TExcelApplication.Create(self);
 FExcel.Connect;
        except
   on E: Exception do
   begin
    Application.MessageBox('Failed to open Excel.', Pchar(e.Message), MB_ICONERROR);
    exit;
   end;
 end;
 Flcid := GetUserDefaultLCID;
 FExcel.Visible[Flcid]:=True;
 FWorkbook := FExcel.WorkBooks.Add(EmptyParam, Flcid );
 FWorkSheet := FExcel.ActiveSheet as _Worksheet;
// FWorksheet.Name := FileName;
 FRow :=1 ;FCol := 1;
 FPage := 0;
end;

procedure TfrExcelExportFilter.OnBeginPage;
begin
   ClearLines;
end;

procedure TfrExcelExportFilter.OnData(x, y: Integer; View: TfrView);
Var //p : PfrView ;
      P: PmyfrView;
     I: integer;
//     TfrMemoView
begin
  if View = nil then Exit;
  New(p);
  p^.X := View.X;
  p^.Y := View.Y;
  p^.dx := View.dx;
  p^.Text :='';  // View.Memo.Text не работает...
  for i :=0 to View.Memo.Count -1 do
  begin
     p^.Text := p^.Text + View.Memo[i];//+#13#10;
     if View.Memo.Count > 1 then
        p^.Text := p^.Text + ' ';
  end;
  if trim(p^.Text) ='' then
  begin
     Dispose(p);
     exit;
  end;
  if View is TfrMemoView then
    with View as TfrMemoView do
    begin
      p^.Alignment := Alignment;
      p^.FontName := Font.Name;
      p^.FontSize := Font.Size;
      p^.FontStyle := frGetFontStyle(Font.Style);
      p^.FontColor := Font.Color;
{$IFNDEF Delphi2}
      p^.FontCharset := Font.Charset;
{$ENDIF}
  p^.FrameTyp := View.FrameTyp;
  p^.FillColor := View.FillColor;
  end;
  Lines.Add(p);
end;

procedure TfrExcelExportFilter.OnEndDoc;
begin
{       FWorkbook.SaveAs(FileName+'_1',
             xlTextWindows, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
             xlNoChange, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
             1);}
//   FWorkbook.Disconnect;
//   FWorkSheet.Disconnect;
  FExcel.Visible[Flcid]:=True;
//   FExcel.Disconnect;
                FExcel.Free;
end;

procedure TfrExcelExportFilter.OnEndPage;
var
  i,iMin : Integer;
  P: PmyfrView;
  s, s1,s2, sRow, sCol: String;
//        rn1 :Range;
begin

  iMin := 100; // ћинимальна€ ширина колонки
  for i := 0 to Lines.Count - 1 do
  begin
     p := PmyfrView(Lines[i]);
     if iMin > p.dx then
        iMin := p.dx;
  end;
  for i := 0 to Lines.Count - 1 do
  begin
    s := '';
    p := PmyfrView(Lines[i]); //PfrTextRec(Lines[i]);
    begin
      FCol := Round(p^.X / (iMin / ScaleX)); // 85
      FRow := Round(p^.Y / (16 / ScaleY));   //14
      if FRow < 1 then FRow := 1;
      if FCol < 1 then FCol := 1;
      INC(FRow,Fpage);

     FWorksheet.Cells.Item[FRow, FCol].Value := p.Text;
     if(p.FrameTyp and frftTop) <> 0 then
        FWorksheet.Cells.Item[FRow, FCol].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     if (p.FrameTyp and frftLeft) <> 0 then
        FWorksheet.Cells.Item[FRow, FCol].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     if (p.FrameTyp and frftRight) <> 0 then
        FWorksheet.Cells.Item[FRow, FCol].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     if (p.FrameTyp and frftBottom) <> 0 then
         FWorksheet.Cells.Item[FRow, FCol].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;


      if p.FillColor <> 536870911 then
        FWorksheet.Cells.Item[FRow, FCol].Interior.Color := p.FillColor;
      FWorksheet.Cells.Item[FRow, FCol].EntireRow.Font.Name := p.FontName;
      FWorksheet.Cells.Item[FRow, FCol].EntireRow.Font.Size := p.FontSize;
      FWorksheet.Cells.Item[FRow, FCol].EntireRow.Font.Color:=p.FontColor;
       if (p.FontStyle = 0 ) then
         FWorksheet.Cells.Item[FRow, FCol].EntireRow.Font.fontStyle := 'Bold';
       if p.FontStyle = 1 then
         FWorksheet.Cells.Item[FRow, FCol].EntireRow.Font.fontStyle := 'Italic';
       if p.FontStyle = 2 then
         FWorksheet.Cells.Item[FRow, FCol].EntireRow.Font.fontStyle := 'UnderLine';
//frtaLeft, frtaRight, frtaCenter, frtaVertical, frtaMiddle, frtaDown
      case p.Alignment of
       frtaRight : FWorksheet.Cells.Item[FRow, FCol].EntireRow.HorizontalAlignment := xlRight;
       frtaLeft  : FWorksheet.Cells.Item[FRow, FCol].EntireRow.HorizontalAlignment := xlLeft;
       frtaCenter: FWorksheet.Cells.Item[FRow, FCol].EntireRow.HorizontalAlignment := xlCenter;
      end;
      INC(FCol);

      Application.ProcessMessages;
//      if FR_Class.frProgressForm.ModalResult := mrCancel then
//         break;
    end;
   end;
  FPage := FRow;
end;


end.
//******************************************************************************************************
//******************************************************************************************************
//******************************************************************************************************


