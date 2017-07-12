{*************************************************************}
{                                                             }
{               FastReport v2.4                               }
{              Import from Ms Excel                           }
{       (C) Sergey Tihanovcev                                 }
{With analogy TFrmImpMsWord ((C) Konstantin Butov for FR 2.4 )}
{                                                             }
{*************************************************************}
unit fr_BsImpMsExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Word97, OleServer, ExtCtrls, StdCtrls, Printers,
  FR_Const,FR_Class, FR_Desgn, FR_BTyp, Spin, Buttons, Excel97, ComCtrls,
  Mask, ToolEdit, CurrEdit
  ;

type


  THackView = class(TfrView)
  end;

  TCellPlace = record
           Row, Col :Integer;
        x, y, dx, dy: Integer;
        NeedH:Boolean;
        text :string ;// for debug
  end;

  TFrmImpMsExcel = class(TForm)
    PnlTop: TPanel;
    OpenDialog: TOpenDialog;
    Pnl: TPanel;
    StBar: TStatusBar;
    ButOpen: TSpeedButton;
    LblFileName: TLabel;
    ButImport: TSpeedButton;
    edRowTop: TCurrencyEdit;
    edColTop: TEdit;
    ExcelApp: TExcelApplication;
    edColBottom: TEdit;
    edRowBottom: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edKoef: TCurrencyEdit;
    cbEmpty: TCheckBox;
    function AddrCell(Col, Row: integer): string;
    function DecodeCol(Col: string): integer;
    procedure ButOpenClick(Sender: TObject);
    procedure ButImportClick(Sender: TObject);
    procedure OnMnImpMsExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    isImport: boolean;
    procedure Import;
  public
  end;

var
  FrmImpMsExcel: TFrmImpMsExcel;
  Bmp01: TBitmap;

implementation

{$R *.DFM}

function TFrmImpMsExcel.AddrCell(Col, Row: integer): string;
var kol, i: integer;
begin
  kol := ord('z') - ord('a') + 1;
  Result := '';
  while col > 0 do
    begin
    i := col mod kol;
    if i = 0 then
      i := 26;
    col := (col-1) div kol;
    Result := chr( ord('a') + i-1) + Result;
    end;
  Result := Result + IntToStr(row);
end;

function TFrmImpMsExcel.DecodeCol(Col: string): integer;
var kol, i: integer;
begin
  col := trim(LowerCase(Col));
  kol := ord('z') - ord('a') + 1;
  Result := 0;
  for i := 1 to length(col) do
    Result := Result * kol +  ord(col[i]) - ord('a') + 1;
end;

procedure TFrmImpMsExcel.ButOpenClick(Sender: TObject);
Var osFilename: OleVariant;
begin
  OpenDialog.InitialDir :=  ExtractFilePath(ParamStr(0));
  if Not OpenDialog.Execute then  exit;
  LblFileName.Caption := OpenDialog.FileName;
  try
    ExcelApp.Connect;
  except
    MessageDlg('Excel may not be installed', mtError, [mbOk], 0);
    Abort;
  end;
  ExcelApp.Visible[0] := true;
  osFilename:= OpenDialog.FileName;
  ExcelApp.Workbooks.Open( osFilename,
                            EmptyParam, EmptyParam, EmptyParam,
                            EmptyParam, EmptyParam, EmptyParam,
                            EmptyParam, EmptyParam, EmptyParam,
                            EmptyParam, EmptyParam, EmptyParam, 0);
  Pnl.Enabled := true;
end;

procedure TFrmImpMsExcel.Import;
var maxRow, maxCol, row, Col, nextRow, nextCol, firstX, firstY: integer;
    adr, txt: string;
    frType: word;
    isGroup: boolean;
    v: TfrMemoView;

function GetFrameType: word;
var b: byte;
begin
  Result := 0;
  b := ExcelApp.ActiveCell.Borders[1].LineStyle;
  if b = 1 then
    Result := Result + frftLeft;
  b := ExcelApp.ActiveCell.Borders[2].LineStyle;
  if b = 1 then
    Result := Result + frftTop;
  b := ExcelApp.ActiveCell.Borders[3].LineStyle;
  if b = 1 then
    Result := Result + frftRight;
  b := ExcelApp.ActiveCell.Borders[4].LineStyle;
  if b = 1 then
    Result := Result + frftBottom;
end;

procedure GetNextCell( var NextRow, NextCol: integer;
                       var isGroup: boolean);
var oldRow, oldCol, i: integer;
    oldAddr, adr: string;
//    oldFrame: word;
begin
  oldRow := ExcelApp.ActiveCell.Row;
  oldCol := ExcelApp.ActiveCell.Column;
  oldAddr := AddrCell(oldCol, oldRow);
  NextRow := oldRow;
  NextCol := oldCol + 1;
  try try
    // NextCol
    NextCol :=  ExcelApp.ActiveCell.End_[xlToRight].Column;
    if NextCol > maxCol then
      NextCol := maxCol + 1;
    // Уточнение NextCol
//    ExcelApp.Cells.Range_[oldAddr,oldAddr].Select;
//    oldFrame := GetFrameType;
    isGroup := false;
    for i := oldCol + 1 to NextCol do
      begin
      Adr := AddrCell(i, oldRow);
      ExcelApp.Cells.Range_[Adr,adr].Select;
      if ExcelApp.ActiveCell.Column = oldCol then
        begin
        isGroup := true;
        Continue;
        end;
      if isGroup then
        begin
        NextCol := i;
        break;
        end;
      if (trim(ExcelApp.ActiveCell.Text) <> '') then
        begin
        NextCol := i;
        break;
        end;
      if (ExcelApp.ActiveCell.Column <> i) then
        begin
        NextCol := i-1;
        break;
        end;
{      if (oldFrame <> GetFrameType) then      // GetFrameType hang-up
        begin                                  // 
        NextCol := i;                          // 
        break;
        end;}
      end;
    // Search NextRow
    ExcelApp.Cells.Range_[oldAddr,oldAddr].Select;
    for i := oldRow + 1 to maxRow do
      begin
      Adr := AddrCell(oldCol, i);
      ExcelApp.Cells.Range_[Adr,adr].Select;
      if ExcelApp.ActiveCell.Row <> oldRow then
        Break;
      NextRow := i;
      isGroup := true;
      end;
  except
  end;
  finally
    ExcelApp.Cells.Range_[oldAddr,oldAddr].Select;
  end;
end;      // GetNextCell

begin     // Import
  Row := edRowTop.AsInteger;
  maxRow := edRowBottom.AsInteger;
  col := DecodeCol( edColTop.Text );
  maxCol := DecodeCol( edColBottom.Text );
  adr := AddrCell(Col,row);
  ExcelApp.Cells.Range_[adr,adr].Select;
  firstX := ExcelApp.ActiveCell.Left;
  firstY := ExcelApp.ActiveCell.Top;
  while (col <= maxCol) and (row <= maxRow) do
    begin
    adr := AddrCell(Col,row);
    ExcelApp.Cells.Range_[adr,adr].Select;
    nextRow := row;
    nextCol := Col + 1;
    if (ExcelApp.ActiveCell.Column = Col) and
       (ExcelApp.ActiveCell.Row = Row) then
      begin
      GetNextCell(nextRow, nextCol, isGroup);
      txt := ExcelApp.ActiveCell.Text;
      StBar.Panels[0].Text := adr;
      StBar.Panels[1].Text := txt;
      StBar.Refresh;
      frType := GetFrameType;
      if (trim(txt) <> '') or isGroup or
         ( (frType > 0) and cbEmpty.Checked) then
        begin
        v:= TfrMemoView.Create;
        v.Memo.Text := txt;
        v.x := ExcelApp.ActiveCell.Left - firstX;
        v.y := ExcelApp.ActiveCell.Top - firstY;
        v.dx := ExcelApp.ActiveCell.Width;
        v.dy := ExcelApp.ActiveCell.Height;
        v.FrameTyp := frType;
        case ExcelApp.ActiveCell.HorizontalAlignment of
          xlHAlignRight: v.Alignment := frtaRight;
          xlHAlignCenter,
          xlHAlignCenterAcrossSelection: v.Alignment   := frtaCenter;
        else v.Alignment := frtaLeft;
        end;
        case ExcelApp.ActiveCell.VerticalAlignment of
          xlVAlignBottom: v.Alignment := v.Alignment or frtaDown;
          xlVAlignCenter,
          xlVAlignJustify: v.Alignment := v.Alignment or frtaMiddle;
        end;

        try
          if ExcelApp.ActiveCell.Font <> nil then
            begin
            if ExcelApp.ActiveCell.Font.Name <> Null then
              v.Font.Name := ExcelApp.ActiveCell.Font.Name;
            if ExcelApp.ActiveCell.Font.Size <> Null then
              v.Font.Size := ExcelApp.ActiveCell.Font.Size;
            v.Font.Style := [];
            if ExcelApp.ActiveCell.Font.Bold <> Null then
             if ExcelApp.ActiveCell.Font.Bold then
              v.Font.Style := v.Font.Style + [fsBold];
//            if ExcelApp.ActiveCell.Font.Underline <> Null then
//             if ExcelApp.ActiveCell.Font.Underline then
//              v.Font.Style := v.Font.Style + [fsUnderline];
            if ExcelApp.ActiveCell.Font.Italic <> Null then
             if ExcelApp.ActiveCell.Font.Italic then
              v.Font.Style := v.Font.Style + [fsItalic];
            end;
        except
        end;
        if nextCol > col then
          begin
          adr := AddrCell(nextCol,Row);
          v.dx := ExcelApp.Cells.Range_[adr,adr].Left - v.x - firstX;
          end;
        if nextRow > row then
          begin
          adr := AddrCell(Col,nextRow);
          v.dy := ExcelApp.Cells.Range_[adr,adr].Top +
                  ExcelApp.Cells.Range_[adr,adr].Height - v.y - firstY;
          end;
        v.x := Round( v.x * edKoef.Value);
        v.y := Round( v.y * edKoef.Value);
        v.dx := Round( v.dx * edKoef.Value);
        v.dy := Round( v.dy * edKoef.Value);
        frDesigner.Page.Objects.Add(v);
        end;
      end;
    if nextCol > maxCol then
      begin
      nextCol := 1;
      nextRow := row + 1;
      end
    else
      nextRow := row;
    col := nextCol;
    row := nextRow;
    end;
  frDesigner.RedrawPage;
  frDesigner.Modified := true;
  ButImport.Down := False;
  isImport := false;
end;

procedure TFrmImpMsExcel.ButImportClick(Sender: TObject);
begin
  if IsImport then
    Exit;
  isImport := true;
  Import;
end;

procedure TFrmImpMsExcel.OnMnImpMsExcelClick(Sender: TObject);
begin
  FrmImpMsExcel:=  TFrmImpMsExcel.Create(Nil);
  with FrmImpMsExcel do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TFrmImpMsExcel.FormCreate(Sender: TObject);
begin
  isImport := false;
end;

initialization
  Bmp01 := TBitmap.Create;
  Bmp01.LoadFromFile('ExlImp.bmp');
//  Bmp01.Handle := LoadBitmap(hInstance, 'DP');
  frRegisterTool('Import from Excel tables ' //frLoadStr(S)
     , Bmp01,
    FrmImpMsExcel.OnMnImpMsExcelClick);

finalization
  Bmp01.Free;

end.

