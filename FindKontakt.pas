unit FindKontakt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, ComCtrls,Data1,B_DBUtils,B_Utils,
  Db, IBCustomDataSet, IBDatabase, IBQuery;

type
  TFind_Kontakt = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Btn_GO: TButton;
    Btn_CLOSE: TButton;
    RxDBGrid1: TRxDBGrid;
    QueryFind: TIBQuery;
    FindTransaction: TIBTransaction;
    DsFind: TDataSource;
    Button1: TButton;
    QueryFindKLN_ID: TIntegerField;
    QueryFindKLN_FULL: TIBStringField;
    QueryFindKLN_TEL: TIBStringField;
    QueryFindKLN_BNK: TIBStringField;
    QueryFindISMAN: TIntegerField;
    procedure QueryFindAfterOpen(DataSet: TDataSet);
    procedure Btn_CLOSEClick(Sender: TObject);
    procedure Btn_GOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Find_Kontakt: TFind_Kontakt;

implementation

uses DicTowar, DicKlient;

{$R *.DFM}

procedure TFind_Kontakt.QueryFindAfterOpen(DataSet: TDataSet);
begin
     Btn_GO.enabled:=not QueryFind.eof;
     if Btn_GO.enabled then RxDbgrid1.setfocus;
end;

procedure TFind_Kontakt.Btn_CLOSEClick(Sender: TObject);
begin
     close;
end;

procedure TFind_Kontakt.Btn_GOClick(Sender: TObject);
begin
     tag:=QueryFind.fieldbyname('KLN_ID').asinteger;
     close;
end;

procedure TFind_Kontakt.FormShow(Sender: TObject);
begin
     tag:=-1;
     Find_Kontakt.Top:=Dic_Klient.Top;
     Find_Kontakt.Left:=Dic_Klient.Left;
end;

procedure TFind_Kontakt.RxDBGrid1DblClick(Sender: TObject);
begin
     if Btn_GO.enabled then Btn_GO.click;
end;

procedure TFind_Kontakt.RxDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
var
   s:ansistring;
   Key2:Char;
begin
     if (key=#13) and (Btn_GO.enabled) then Btn_GO.click;
     s:=AnsiUpperCase(Key);
     Key2:=s[1];
     if ((key2>='А') and (key2<='Я')) or ((key2>='A') and (key2<='Z')) then begin
        Edit1.text:=Key;
        Edit1.SelStart:=1;
        Key:=#0;
        Edit1.setfocus;
     end;
end;

procedure TFind_Kontakt.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then Btn_Close.click
end;

procedure TFind_Kontakt.FormActivate(Sender: TObject);
begin
     Edit1.SelStart:=1;
     Edit1.setfocus;
end;

procedure TFind_Kontakt.Button1Click(Sender: TObject);
begin
     if Find_Kontakt.Visible then begin
        QueryFind.DisableControls;
        QueryFind.Close;
        FindTransaction.Active:=False;
        if length(trim(Edit1.text))<3 then begin
          Btn_GO.enabled:=False;
        end else begin
          QueryFind.Parambyname('KLN_NAM').asstring:=Edit1.text;
          QueryFind.Open;
        end;
        QueryFind.EnableControls;
     end;
end;

procedure TFind_Kontakt.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  Var
    IsMan:integer;
    Pic:INteger;
begin
  RxDbgrid1.Canvas.Font.color:=clWindowText;
  RxDbgrid1.Canvas.Brush.color:=clWindow;
  if (GdSelected in State ) then begin
     RxDbgrid1.Canvas.Font.color:=clHighlighttext;
     RxDbgrid1.Canvas.Brush.color:=clHighlight;
  end;
  if Column.Index>0 then
  RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
  else begin
      Isman:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('IsMan').Asinteger;
      if Isman>0 then begin
         RxDbgrid1.Canvas.FillRect(Rect);
         Case Isman of
           1: Pic:=30; {ЧП}
           2: Pic:=14; {Организация}
           3: Pic:=27;
           4: Pic:=31; {ЧП c закрытым входом}
         end;
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         Pic,True);
      end else RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
  end;

end;

procedure TFind_Kontakt.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TFind_Kontakt.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
        if key=#13 then begin
           key:=#0;
           Button1.setfocus;
           Button1.click;
        end;
end;

end.