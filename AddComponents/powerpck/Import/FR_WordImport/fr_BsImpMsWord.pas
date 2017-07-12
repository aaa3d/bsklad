{*****************************************************}
{                                                     }
{               FastReport v2.4                       }
{              Import from Ms Word Only Table         }
{       (C) Konstantin Butov for FR 2.4               }
{     For question mail to : kos@sp.iae.nsk.su        }
{                ICQ: 48750138                        }
{*****************************************************}
{For Install: Add this file in you project            }
{Histo :                                              }
{ 18/01/02 : Version 1.001 Create                     }
{ 25/04/02 : Version 1.002 add RegisterTool           }
{                          bug fixes                  }
{*****************************************************}
unit fr_BsImpMsWord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Word97, OleServer, ExtCtrls, StdCtrls, Printers,
  FR_Const,FR_Class, FR_Desgn, FR_BTyp, Spin, Buttons, ComCtrls,OleCtrls
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

  TFrmImpMsWord = class(TForm)
    PnlTop: TPanel;
    WordApp: TWordApplication;
    WordDoc: TWordDocument;
    OpenDialog: TOpenDialog;
    Pnl: TPanel;
    SpEdTable: TSpinEdit;
    Label1: TLabel;
    StBar: TStatusBar;
    SpButBend: TSpeedButton;
    ButNewRpt: TSpeedButton;
    ButOpen: TSpeedButton;
    ButNewPage: TSpeedButton;
    LblFileName: TLabel;
    ButImport: TSpeedButton;
    ButPageSetup: TSpeedButton;
    SpEdPage: TSpinEdit;
    LblPage: TLabel;
    procedure SpButBendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButNewRptClick(Sender: TObject);
    procedure ButOpenClick(Sender: TObject);
    procedure ButNewPageClick(Sender: TObject);
    procedure ButPageSetupClick(Sender: TObject);
    procedure ButImportClick(Sender: TObject);
    procedure SpEdTableChange(Sender: TObject);
    procedure SpEdPageChange(Sender: TObject);
  private
    FBandType    : TfrBandType;
    FcurPage     : integer;
    FcurTable    : integer;
    FCurTabRowMax: integer;
    FCurTabColMax: integer;
    BStartImport : Boolean;
    BGoToPage    : Boolean; // чтобы не зацикливалось
    FCellPlace   : array of array of TCellPlace;

    procedure AddBand(X, Y, X1, Y1: Integer);
    procedure Import;
    function  FindTableOnpage(Value:integer):Integer;
  public
    procedure OnMnImpMsWordClick(Sender: TObject);


  end;

var
  FrmImpMsWord: TFrmImpMsWord;
  Bmp01: TBitmap;
//const MsWordMM =2.835;

implementation

{$R *.DFM}

function FrUnits(x: Double):Integer;
begin
   Result := Round((x / 2.835) / 5 * 18 );
end;
function FrString(s:string):String ;
begin
//#$D#7
  While Pos(#$D, S) > 0 do
     S[Pos(#$D, S)] := ' ';
  While Pos(#7, S) > 0 do
     S[Pos(#7, S)] := ' ';
  result := S
end;

function FrColor(x:integer): TColor;
begin
//  result := PALETTEINDEX(x);    exit;
  case x of
  wdBlack      : Result :=  clBlack;
  wdBlue       : Result :=  clBlue;
  wdTurquoise  : Result :=  clBackground;
  wdBrightGreen: Result :=  clLime;
  wdPink       : Result :=  clFuchsia;
  wdRed        : Result :=  clRed;
  wdYellow     : Result :=  clYellow;
  wdWhite      : Result :=  clWhite;
  wdDarkBlue   : Result :=  clNavy;
  wdTeal       : Result :=  clTeal;
  wdGreen      : Result :=  clGreen;
  wdViolet     : Result :=  clBackground;
  wdDarkRed    : Result :=  clMaroon;
  wdDarkYellow : Result :=  clYellow;
  wdGray50     : Result :=  clDkGray; //clGray;
  wdGray25     : Result :=  clLtGray; //clGray;
  wdByAuthor   : Result :=  clDefault;
  wdAuto       : Result :=  clBlack;
 // wdNoHighlight: Result :=
 else
  Result := clNone;
end;
//  clOlive,  clPurple , clSilver, clAqua
end;

procedure TFrmImpMsWord.FormCreate(Sender: TObject);
begin
  FBandType := btNone;
  BGoToPage := False;
end;

procedure TFrmImpMsWord.AddBand(X, Y, X1, Y1: Integer);
Var   t: TfrView;
begin
   frDesigner.Page.Objects.Add(TfrBandView.Create);
   t := frDesigner.Page.Objects.Last;
   //t.Parent := frDesigner.Page   // t.y  := 20;   t.dy := 60;
   t.SetBounds(X, Y, X1, Y1);
   t.Name := frBandNames[Integer(FBandType)];
   (t as TfrBandView).BandType := FBandType;
   THackView(t).BaseName := frBandNames[Integer(FBandType)];
   frDesigner.Invalidate;
end;

procedure TFrmImpMsWord.ButOpenClick(Sender: TObject);
Var osFilename: OleVariant;
begin
  OpenDialog.InitialDir :=  ExtractFilePath(ParamStr(0));
  if Not OpenDialog.Execute then  exit;
  LblFileName.Caption := OpenDialog.FileName;
  try
    WordApp.Connect;
  except
    MessageDlg('Word may not be installed', mtError, [mbOk], 0);
    Abort;
  end;
  WordApp.Visible := True;
  osFilename:= OpenDialog.FileName;
  WordApp.Documents.Open(osFilename,
                            EmptyParam, EmptyParam, EmptyParam,
                            EmptyParam, EmptyParam, EmptyParam,
                            EmptyParam, EmptyParam, EmptyParam);
  // WordDoc.ConnectTo(WordApp.Documents.Item(WordApp.ActiveDocument));
   WordDoc.ConnectTo(WordApp.ActiveDocument);
   Pnl.Enabled := True;
   SpEdTable.MaxValue := WordDoc.Tables.Count;
   SpEdPage.MaxValue := WordApp.Selection.Information[wdNumberOfPagesInDocument];
   LblPage.Caption := 'Page (1-'+Inttostr(SpEdPage.MaxValue)+')';
end;

procedure TFrmImpMsWord.SpButBendClick(Sender: TObject);
var frBandTypesForm: TfrBandTypesForm;
begin
  frBandTypesForm := TfrBandTypesForm.Create(nil);
  if frBandTypesForm.ShowModal = mrOk then
  begin
    SpButBend.Caption := frBandNames[Integer(frBandTypesForm.SelectedTyp)];
    FBandType := frBandTypesForm.SelectedTyp;
  end;
end;


procedure TFrmImpMsWord.ButNewRptClick(Sender: TObject);
begin
   TfrDesignerForm(frDesigner).FileBtn1.Click;
end;

procedure TFrmImpMsWord.ButNewPageClick(Sender: TObject);
begin
 TfrDesignerForm(frDesigner).N29.Click
end;

procedure TFrmImpMsWord.ButPageSetupClick(Sender: TObject);
var iCountOle: OleVariant;
  oWhat, oWhich: OleVariant;
  oRange: Range;
begin
  iCountOle:=SpEdPage.Value; oWhat:=wdGoToPage; oWhich:=wdGoToAbsolute;
  oRange := WordDoc.GoTo_(oWhat, oWhich, iCountOle );
  frDesigner.Page.pgWidth          := FrUnits(oRange.PageSetup.Get_PageWidth);
  frDesigner.Page.pgHeight         := FrUnits(oRange.PageSetup.Get_PageHeight);
  frDesigner.Page.pgMargins.Left   := FrUnits(oRange.PageSetup.LeftMargin);
  frDesigner.Page.pgMargins.Right  := FrUnits(oRange.PageSetup.RightMargin);
  frDesigner.Page.pgMargins.Top    := FrUnits(oRange.PageSetup.TopMargin);
  frDesigner.Page.pgMargins.Bottom := FrUnits(oRange.PageSetup.BottomMargin);
  if oRange.PageSetup.Get_Orientation = 0 then
     frDesigner.Page.pgOr := poPortrait
  else frDesigner.Page.pgOr := poLandscape;
  TfrDesignerForm(frDesigner).CurPage := TfrDesignerForm(frDesigner).CurPage;
  frDesigner.RedrawPage;
end;

procedure TFrmImpMsWord.Import;
Var
 i1, i2, i3,
 RowY,RowX,RowYi,RowXi,oldHeight :Integer;
 wT: Table;
 wTCell , wTCell1 : Cell;
 v0, v1 : TfrView;
 v  : TfrMemoView;
 pgMargL, pgMargT :Integer;
 iT_Top,
 a1,a2,a3,a4,
 b1,b2,b3,b4,
 iRinS,iRinE,
 TabHeight :Integer;

 needCorectH:Boolean;
 oSelection :Selection;

  iSelCE ,
  iSelCS ,
  iSelRE ,
  iSelRS,
  MaxH,NewH :Integer;

 const BadH=20;

begin
   BStartImport := True;
   wT:= WordDoc.Tables.Item(SpEdTable.Value);
   FcurTable:= SpEdTable.Value;
   if FBandType <> btNone then
      AddBand(frDesigner.Page.pgMargins.Left, frDesigner.Page.pgMargins.Top, wT.Range.Start, wT.Range.End_);
   pgMargL := frDesigner.Page.pgMargins.Left;
   pgMargT := 0;//frDesigner.Page.pgMargins.Top;

   FCurTabRowMax := wT.Rows.Count;
   FCurTabColMax := wT.Columns.Count;
   SetLength (FCellPlace,FCurTabRowMax,FCurTabColMax) ;

   wTCell := wT.Cell(1,1);
   RowYi:=1; RowXi:=1;
   RowX:=0;
   oldHeight:= FrUnits(wTCell.Height);
   iT_Top := wT.Range.Information[wdVerticalPositionRelativeToPage];
   RowY   := FrUnits(iT_Top);
   if (oldHeight > 9999) then
   oldHeight := wTCell.Range.Information[wdVerticalPositionRelativeToPage]-iT_Top ;
   for i1:= 1 to FCurTabRowMax* FCurTabColMax do // while  wTRow. IsLast do
   begin
     v0 := TfrView(frCreateObject(gtMemo, ''));
     v := TfrMemoView(v0);  //v.ID := FR_Class.ObjID;  Not use (v as TfrMemoView).
     v.Name := 'Tbl'+IntToStr(FcurTable)+'_'+ IntToStr(wTCell.RowIndex)+'_'+ IntToStr(wTCell.ColumnIndex); // wTCol.Index);
     v.Memo.Text:= FrString(wTCell.Range.text);

     StBar.Panels[0].Text := v.Name;
     StBar.Panels[1].Text := wTCell.Range.text;
     Application.ProcessMessages;

    v.Font.Name := wTCell.Range.Font.Name;
    if wTCell.Range.Font.Size < 999 then
       v.Font.Size := Trunc(wTCell.Range.Font.Size)
    else v.Font.Size := 8;
     if wTCell.Range.Font.Bold <> 0 then
        v.Font.Style:= v.Font.Style+[fsBold];
     if wTCell.Range.Font.Italic <> 0 then
        v.Font.Style:= v.Font.Style+[fsItalic];
    // v.FillColor := wTCell.Range.HighlightColorIndex;
    //  wdBorderHorizontal = $FFFFFFFB;  wdBorderVertical = $FFFFFFFA;
    if wTCell.Borders.Item(wdBorderTop).Visible then
       v.FrameTyp := frftTop;
    if wTCell.Borders.Item(wdBorderBottom).Visible then
       v.FrameTyp :=  v.FrameTyp or  frftBottom;
    if wTCell.Borders.Item(wdBorderLeft).Visible then
       v.FrameTyp :=  v.FrameTyp or  frftLeft;
    if wTCell.Borders.Item(wdBorderRight).Visible then
       v.FrameTyp :=  v.FrameTyp or  frftRight;
//      if wTCell.Range.Borders.HasVertical then   v.FrameTyp := v.FrameTyp and frftBottom;

    case wTCell.Range.Paragraphs.Alignment of
        wdAlignParagraphLeft: v.Alignment   := frtaLeft;
        wdAlignParagraphRight : v.Alignment := frtaRight;
        wdAlignParagraphCenter: v.Alignment := frtaCenter;
        wdAlignParagraphJustify : v.Alignment := 3;//frtaMiddle;
       else v.Alignment := frtaLeft;
    end;
    case wTCell.VerticalAlignment  of
//         wdAlignVerticalTop     :  v.Alignment :=  This all Top
          wdCellAlignVerticalCenter :  v.Alignment := v.Alignment OR $8;
          wdCellAlignVerticalBottom :  v.Alignment := v.Alignment OR $10;
    end;
    case wTCell.Range.Orientation of
         2  :  v.Alignment := v.Alignment OR $4;
         3  :  v.Alignment := v.Alignment OR $4;
    end;

    IF wTCell.Range.HighlightColorIndex = wdAuto then
       v.FillColor := clWhite
    else
       v.FillColor := FrColor(wTCell.Range.HighlightColorIndex);
    v.Font.Color := FrColor(wTCell.Range.Font.Get_ColorIndex);

    wTCell.Select;
    oSelection := WordApp.Selection;
    iSelCE := oSelection.Information[wdEndOfRangeColumnNumber];
    iSelCS := oSelection.Information[wdStartOfRangeColumnNumber];
    iSelRE := oSelection.Information[wdEndOfRangeRowNumber];
    iSelRS := oSelection.Information[wdStartOfRangeRowNumber];

     v.x  := pgMargL+ RowX;
     if (wTCell.Width) < 9999 then
          v.dx := FrUnits(wTCell.Width)
     else
     begin v.dx := 0;
     end;
     v.y  := pgMargT + RowY;
     if wTCell.HeightRule = wdRowHeightExactly then
     begin
        v.dy:= FrUnits(wTCell.Height); needCorectH:=False;
     end else
         needCorectH:= True;
     if RowXi <> iSelCS then
     begin
         v.x  := FCellPlace[wTCell.RowIndex-2, wTCell.ColumnIndex-1].x;
     end;
     if ((iSelRE - iSelRS)> 0) and (v.dx = 0) then
        if iSelRS > 1 then
           v.dx := FCellPlace[wTCell.RowIndex-2, wTCell.ColumnIndex].x - v.x;
     if ((iSelRE - iSelRS)> 0) or (needCorectH) then
     begin
       if (iSelRE <= FCurTabRowMax)AND ( iSelCS <= FCurTabColMax) then
       begin
       {  try
         wTCell1 := wT.Cell(iSelRE+1, iSelCS );
         v.dy:= FrUnits(wTCell1.Range.Information[wdVerticalPositionRelativeToPage]-
                         wTCell.Range.Information[wdVerticalPositionRelativeToPage]);
         except end;}
       end;
     end;
     if v.dy = 0 then v.dy := BadH;
     RowX := RowX + v.dx;
     with FCellPlace[wTCell.RowIndex-1,wTCell.ColumnIndex-1] do
     begin
        Row := wTCell.RowIndex;
        Col := wTCell.ColumnIndex;
        x  := V.x;  dx := V.dx;
        y  := V.y;  dy := V.dy;
        NeedH := needCorectH;
        text  := wTCell.Range.text;
     end;
     frDesigner.Page.Objects.Add(V);
     wTCell := wTCell.Next; if wTCell = nil then  break;
     INC(RowXi);
     if wTCell.Get_RowIndex > RowYi then
     begin
       oldHeight := FrUnits(wTCell.Range.Information[wdVerticalPositionRelativeToPage]);
       RowY      := oldHeight;
       RowYi := wTCell.Get_RowIndex;
       RowX  := 0; RowXi :=1;
     end;
     Application.ProcessMessages;
     if Not ButImport.Down then
        break;
  end; //while Not wTRow.IsLast do

  MaxH := 0; // Found MaxDx
  for i2:= 0 to FCurTabColMax do
  begin
     NewH := FCellPlace[FCurTabRowMax-1, i2].y + FCellPlace[FCurTabRowMax-1, i2].dy;
     if NewH > MaxH  then
       MaxH := NewH;
  end;
  for i1:= 0 to FCurTabRowMax-1 do // Check H
    for i2:= 0 to FCurTabColMax-1 do
       if FCellPlace[i1, i2].NeedH then
       begin
         for i3:= i1+1 to FCurTabRowMax-1 do
           if (FCellPlace[i3, i2].y > 0) {and ((FCellPlace[i3, i2].dx -FCellPlace[i3, i2].x) >= FCellPlace[i1, i2].x)} then
           begin
             NewH := FCellPlace[i3, i2].y ;
             FCellPlace[i1, i2].NeedH:= False;
             break;
           end;
         v1 := frDesigner.Page.FindObject('Tbl'+IntToStr(FcurTable)+'_'+ IntToStr(i1+1)+'_'+ IntToStr(i2+1));
         if v1<> Nil then
         begin
            if Not FCellPlace[i1, i2].NeedH then
               v1.dy := NewH - v1.y
            else
               v1.dy := MaxH - v1.y;
         end;
       end;

  frDesigner.RedrawPage;
  BStartImport:= False;
  ButImport.Down := False;
  StBar.Panels[0].Text := 'End Import';
  StBar.Panels[1].Text := '';
end;

procedure TFrmImpMsWord.ButImportClick(Sender: TObject);
begin
  if Not BStartImport then
     Import;
end;

function TFrmImpMsWord.FindTableOnpage(Value:integer):Integer;
Var i,iPg:Integer;
begin
  Result := 1;
  for i:= 1 to WordDoc.Tables.Count do
  begin
     iPg := WordDoc.Tables.Item(i).Range.Information[wdActiveEndAdjustedPageNumber];
     if Value = iPg then
     begin
        Result := i;
        break;
     end;
  end;
end;

procedure TFrmImpMsWord.SpEdTableChange(Sender: TObject);
begin
  if BGoToPage then exit;
  BGoToPage := True;
  FcurPage := WordDoc.Tables.Item(SpEdTable.Value).Range.Information[wdActiveEndAdjustedPageNumber];
  FcurTable:= SpEdTable.Value;
  SpEdPage.Value := FcurPage;
  BGoToPage := False;
end;

procedure TFrmImpMsWord.SpEdPageChange(Sender: TObject);
begin
  if BGoToPage then exit;
  BGoToPage := True;
  SpEdTable.Value := FindTableOnpage(SpEdPage.Value);
  BGoToPage := False;
end;

procedure TFrmImpMsWord.OnMnImpMsWordClick(Sender: TObject);
begin
  FrmImpMsWord:=  TFrmImpMsWord.Create(Nil);
  with FrmImpMsWord do
  begin
    ShowModal;
    Free;
  end;
end;


initialization
  Bmp01 := TBitmap.Create;
  Bmp01.LoadFromFile('RfImpmsWordTable02.bmp');
//  Bmp01.Handle := LoadBitmap(hInstance, 'DP');
  frRegisterTool('Импорт из Word Таблиц ' //frLoadStr(S)
     , Bmp01,
    FrmImpMsWord.OnMnImpMsWordClick);

finalization
  Bmp01.Free;

end.


