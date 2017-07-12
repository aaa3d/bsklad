unit SetMinOst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, StdCtrls, Buttons, RXSpin,
  IBDatabase,Data1,b_utils,b_Dbutils, Db, RxMemDS, IBCustomDataSet, IBQuery;

type
  TSET_MIN_OST = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    Label2: TLabel;
    Period: TComboBox;
    Label3: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    Check_clear: TCheckBox;
    period2: TComboBox;
    Typ_period2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemTw: TRxMemoryData;
    MemTwtw_id: TIntegerField;
    MemTwtw_art: TIntegerField;
    MemTwtw_nam: TStringField;
    MemTwed_short: TStringField;
    MemTwskl1: TStringField;
    MemTwskl2: TStringField;
    MemTwskl3: TStringField;
    MemTwskl4: TStringField;
    MemTwskl5: TStringField;
    MemTwskl6: TStringField;
    MemTwskl7: TStringField;
    MemTwskl8: TStringField;
    MemTwskl9: TStringField;
    MemTwskl10: TStringField;
    MemTwskl: TStringField;
    DsTw: TDataSource;
    procedure PeriodChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Check_clearClick(Sender: TObject);
    procedure period2Change(Sender: TObject);
    procedure Typ_period2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_MIN_OST: TSET_MIN_OST;

var
   pern:array[1..9] of integer=(7,14,31,46,61,92,122,183,365);
   pers:array[1..9] of string=('неделю','2 недели','мес€ц','полтора мес€ца',
    '2 мес€ца','3 мес€ца','4 мес€ца','полгода','год');

implementation

uses DicTowar;

{$R *.DFM}

procedure TSET_MIN_OST.PeriodChange(Sender: TObject);
begin
   if period.itemindex<0 then period.itemindex:=0;
end;

procedure TSET_MIN_OST.FormShow(Sender: TObject);
var
  a:integer;
begin
    MemTw.EmptyTable;
    TW.tag:=0;
    TW.text:='¬се товары';
    period.Items.Clear;
    period2.Items.Clear;
    for a:=1 to 9 do begin
       period.Items.Add(pers[a]);
       period2.Items.Add(pers[a]);
    end;
    period.itemindex:=2;
    period2.itemindex:=5;
    checK_clear.checked:=false;
    checK_clear.OnClick(sender);


end;

procedure TSET_MIN_OST.Check_clearClick(Sender: TObject);
begin
  Period2.enabled:=ChecK_clear.Checked;
end;

procedure TSET_MIN_OST.period2Change(Sender: TObject);
begin
   if period2.itemindex<0 then period2.itemindex:=0;
end;

procedure TSET_MIN_OST.Typ_period2Change(Sender: TObject);
begin
   if typ_period2.itemindex<0 then typ_period2.itemindex:=0;
end;

procedure TSET_MIN_OST.Button3Click(Sender: TObject);
begin
    close;
end;

procedure TSET_MIN_OST.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {¬вод одной группы товаров}
     DIC_TOWAR.tag:=TW.tag;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {ќтображаем название}
       TW.tag:=DIC_TOWAR.tag;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=TW.tag;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
       WorkTransaction.Active:=False;
     end;
end;

procedure TSET_MIN_OST.Button1Click(Sender: TObject);
begin
   // ќтбираем товары
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select tw.tw_id,tw.tw_art,tw.tw_nam,ed.ed_short,list_twtree.twtree_id '+
   'from tw,ed,list_twtree(:par_id,0) '+
   'where tw.twtree_id=list_twtree.twtree_id '+
   'and tw.ed_id=ed.ed_id '+
   'order by twtree_id,tw_art');
   QueryWork.paramByname('par_id').asinteger:=tw.tag;
   QueryWork.open;
   while not QueryWork.eof do begin
      QueryWork.next;
   end;
end;

end.
