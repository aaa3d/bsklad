unit FindTowarAbc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, ComCtrls,Data1,B_DBUtils,B_Utils,
  Db, IBCustomDataSet, IBDatabase, IBQuery,VclUtils;

type
  TFind_Towar_Abc = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Btn_GO: TButton;
    Btn_CLOSE: TButton;
    RxDBGrid1: TRxDBGrid;
    QueryFind: TIBQuery;
    FindTransaction: TIBTransaction;
    QueryFindTW_ID: TIntegerField;
    QueryFindTW_ART: TIntegerField;
    QueryFindTW_NAM: TIBStringField;
    QueryFindTWTREE_FULL: TIBStringField;
    QueryFindTW_MROZ: TFloatField;
    QueryFindTW_OST: TFloatField;
    QueryFindED_SHORT: TIBStringField;
    DsFind: TDataSource;
    Button1: TButton;
    QueryFindTW_KOMPL: TIBStringField;
    QueryFindMET_MONEY_SHOP: TIBStringField;
    procedure QueryFindAfterOpen(DataSet: TDataSet);
    procedure QueryFindAfterScroll(DataSet: TDataSet);
    procedure Btn_CLOSEClick(Sender: TObject);
    procedure Btn_GOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Find_Towar_Abc: TFind_Towar_Abc;

implementation

uses DicTowar;

{$R *.DFM}

procedure TFind_Towar_Abc.QueryFindAfterOpen(DataSet: TDataSet);
begin
     StatusBar1.panels[0].text:='Группа: '+QueryFind.fieldbyname('TWTREE_FULL').asstring;
     Btn_GO.enabled:=not QueryFind.eof;
     if Btn_GO.enabled then RxDbgrid1.setfocus;
end;

procedure TFind_Towar_Abc.QueryFindAfterScroll(DataSet: TDataSet);
begin
     StatusBar1.panels[0].text:='Группа: '+QueryFind.fieldbyname('TWTREE_FULL').asstring;
end;

procedure TFind_Towar_Abc.Btn_CLOSEClick(Sender: TObject);
begin
     close;
end;

procedure TFind_Towar_Abc.Btn_GOClick(Sender: TObject);
begin
     tag:=QueryFind.fieldbyname('TW_ID').asinteger;
     close;
end;

procedure TFind_Towar_Abc.FormShow(Sender: TObject);
begin
     tag:=-1;
     Find_Towar_ABC.Top:=Dic_Towar.Top;
     Find_Towar_ABC.Left:=Dic_Towar.Left;
end;

procedure TFind_Towar_Abc.RxDBGrid1DblClick(Sender: TObject);
begin
     if Btn_GO.enabled then Btn_GO.click;
end;

procedure TFind_Towar_Abc.RxDBGrid1KeyPress(Sender: TObject;
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

procedure TFind_Towar_Abc.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then Btn_Close.click
end;

procedure TFind_Towar_Abc.FormActivate(Sender: TObject);
begin
     Edit1.SelStart:=1;
     Edit1.setfocus;
end;

procedure TFind_Towar_Abc.Button1Click(Sender: TObject);
var
  s:string;
begin
     if Find_Towar_Abc.Visible then begin
        s:=Find_Towar_Abc.caption;
        Find_Towar_Abc.caption:=Find_Towar_Abc.caption+'. Идет поиск товара по наименованию...';
        delay(1);
        Button1.Enabled:=False;
        Btn_GO.enabled:=False;
        Btn_CLOSE.enabled:=False;
        QueryFind.DisableControls;
        QueryFind.Close;
        FindTransaction.Active:=False;
        if length(trim(Edit1.text))<3 then begin
          Btn_GO.enabled:=False;
        end else begin
          QueryFind.ParamByname('SHOP_ID').asinteger:=SHOPID;
          QueryFind.Parambyname('TW_NAM').asstring:=Edit1.text;
          QueryFind.Open;
        end;
        Find_Towar_Abc.caption:=s;
        delay(1);
        QueryFind.EnableControls;
        Button1.Enabled:=True;
        Btn_GO.enabled:=True;
        Btn_CLOSE.enabled:=True;
     end;
end;

procedure TFind_Towar_Abc.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOMPL').asstring='1' then
     Afont.style:=[FsBold] else Afont.style:=[];
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='TW_OST' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat>=0.0001 then Background:=clBtnFace;
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat<=-0.0001 then begin
           Afont.color:=clYellow;
           Background:=clRed;
        end;
     end;
     Afont.Style:=[];
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
     (Field.Fieldname='TW_MROZ') then begin
        BackGround:=$009FFF9F;
        Afont.Style:=[FsBold];
        Afont.color:=ClGreen;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='TW_OST' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat<0 then
             Afont.color:=clRed;
        end;
        Afont.Style:=[];
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
        (Field.Fieldname='TW_MROZ') then begin
           BackGround:=ClGreen;
           Afont.Style:=[FsBold];
           Afont.color:=$009FFF9F;
        end;
     end;
end;

procedure TFind_Towar_Abc.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
        if key=#13 then begin
           key:=#0;
           Button1.setfocus;
           Button1.click;
        end;
end;

end.
