unit StfaktFast;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,B_DButils, ComCtrls, Grids, DBGrids, RXDBCtrl, ToolWin,
  Menus, Db, RxMemDS, StdCtrls, ExtCtrls, Buttons, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TStfakt_FAST = class(TForm)
    ToolBar1: TToolBar;
    RxDBGrid1: TRxDBGrid;
    BtnDel: TToolButton;
    ToolButton2: TToolButton;
    BtnPrint: TToolButton;
    MemStFakt: TRxMemoryData;
    DsStfakt: TDataSource;
    MemStFaktRN_ID: TIntegerField;
    MemStFaktRN_FULL: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    MnDel: TMenuItem;
    MnPrint: TMenuItem;
    StatusBar1: TStatusBar;
    MemStFaktSUMM: TFloatField;
    MemStFaktSTFAKT: TStringField;
    MemStFaktRN_DATE: TDateField;
    Panel1: TPanel;
    Label1: TLabel;
    STFAKT_DOW: TEdit;
    Panel2: TPanel;
    WorkTransaction: TIBTransaction;
    QueryWork1: TIBQuery;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    GP1: TRadioButton;
    GP2: TRadioButton;
    STFAKT_GP: TEdit;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MemStFaktAfterDelete(DataSet: TDataSet);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure CalcSumm;
    procedure GP1Click(Sender: TObject);
    procedure SHOW_KLN;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stfakt_FAST: TStfakt_FAST;

implementation

uses DicKlient;

{$R *.DFM}

procedure TStfakt_FAST.CalcSumm;
var
   a,b:integer;
   r:double;
begin
    if MemStFakt.recordcount>0 then begin
      a:=MemStFakt.recno;
      r:=0;
      MemStFakt.Disablecontrols;
      MemStFakt.First;
      while not MemStFakt.eof do begin
        r:=r+MemStFakt.fieldByname('SUMM').asfloat;
        MemStFakt.Next;
      end;
      MemStFakt.First;
      for b:=1 to a-1 do MemStFakt.Next;
      MemStFakt.Enablecontrols;
      Statusbar1.panels[1].text:=RUB_SOKR(r);

    end else Statusbar1.panels[1].text:=RUB_SOKR(0);

end;

procedure TStfakt_FAST.FormShow(Sender: TObject);
begin
   // Устанавливаем позицию
   STFAKT_FAST.Top:=58;
   STFAKT_FAST.Left:=Screen.Width-STFAKT_FAST.Width-6;
   MemStFaktAfterDelete(MemStFakt);
end;

procedure TStfakt_FAST.N1Click(Sender: TObject);
begin
     Hide;
end;

procedure TStfakt_FAST.MemStFaktAfterDelete(DataSet: TDataSet);
var
   EN:boolean;
   a:integer;
begin
     if MemStFakt.recordcount>0 then EN:=true else en:=False;
     BtnDel.enabled:=En;
     BtnPrint.enabled:=En;
     MnDel.enabled:=En;
     MnPrint.enabled:=En;
     // Вычисляем размер
     if MemStFakt.recordcount>20 then a:=20 else a:=MemStFakt.recordcount;
     if a=0 then a:=1;
     STFAKT_FAST.Height:=a*18+Statusbar1.Height+Toolbar1.Height+Panel1.Height+Panel2.Height+28;
     CalcSumm;
end;

procedure TStfakt_FAST.BtnDelClick(Sender: TObject);
begin
     if Messbox('Удалить из списка накладную "'+MemStFakt.fieldByname('RN_FULL').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then MemStFakt.Delete;
end;

procedure TStfakt_FAST.BtnPrintClick(Sender: TObject);
var
   r:double;
   ID2,ID:integer;
   NALOG5:boolean;
   a,b,c:integer;
   STFAKT_DATE:tdatetime;
   FRM_ID: integer;
begin
  // Проверяем, а вдруг накладные уже имеют счета
  a:=0;
  MemStfakt.disablecontrols;
  MemStfakt.First;


  queryWork1.SQL.Text:='SELECT FRM_ID FROM RN WHERE RN_ID=:RN_ID';
  QueryWork1.ParamByName('RN_ID').asinteger:=MemStFakt.fieldbyname('RN_ID').asinteger;
  Querywork1.open;
  FRM_ID:=QueryWork1.FieldByName('FRM_Id').asinteger;
  QueryWork1.close;
  QueryWork1.Transaction.Active:=false;


  while not MemStfakt.eof do begin
    inc(a,length(trim(MemStfakt.fieldByname('STFAKT').asstring)));
    MemStfakt.Next;
  end;
  MemStfakt.First;
  MemStfakt.EnableControls;
  if a>0 then Messbox('Накладные уже имеют оформленные счета-фактуры!',MessSystem,48)
  else begin
     {Формируем счёт-фактуру}
     NALOG5:=False;
     // Определяем дату
     STFAKT_DATE:=encodedate(1990,1,1);
     MemSTFAKT.First;
     while not MemSTFAKT.eof do begin
       if MemSTFAKT.fieldbyname('RN_DATE').asdatetime>STFAKT_DATE
       then STFAKT_DATE:=MemSTFAKT.fieldbyname('RN_DATE').asdatetime;
       MemSTFAKT.next;
     end;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('STFAKT_DATE',STFAKT_DATE);
        IBSAVE_ADD('STFAKT_DOW',trim(STFAKT_DOW.text));
        if GP1.checked then IBSAVE_ADD('STFAKT_GP',-1)
                                  else IBSAVE_ADD('STFAKT_GP',STFAKT_GP.tag);
        IBSAVE_ADD('STFAKT_NUM',NEW_STFAKT_NUM(FRM_ID, date()));
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        ID:=IBSAVE_DOC('STFAKT',-1);
        if ID<0 then r:=Sqrt(-1)
        else begin
           MemSTFAKT.First;
           while not MemSTFAKT.eof do begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('STFAKT_ID',ID);
                 IBSAVE_ADD('RN_ID',MemSTFAKT.fieldByname('RN_ID').asinteger);
                 ID2:=IBSAVE_DOC('STFAKTS',-1);
                 if ID2<0 then r:=Sqrt(-1);
                 MemSTFAKT.next;
           end;
        end;
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        PRINT_STFAKTDOC_2012(ID, 0);
        STFAKT_DOW.text:='';
        MemSTFAKT.EmptyTable;
        close;
     Except
        Datamodule1.IBTransaction2.RollBAck;
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TStfakt_FAST.GP1Click(Sender: TObject);
begin
   SpeedButton1.Enabled:=GP2.checked;
end;

procedure TStfakt_FAST.SHOW_KLN;
begin
  // Отображаем поставщика и его банк
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork1,'select KLN_FULL,KLN_REKW from KLN_DATA(:KLN_ID)');
  QueryWork1.ParamByname('KLN_ID').asinteger:=STFAKT_GP.tag;
  QueryWork1.Open;
  STFAKT_GP.text:=QueryWork1.fieldByname('KLN_FULL').asstring;
//  PN_POST_REKW.text:=QueryWork1.fieldByname('KLN_REKW').asstring;
  QueryWork1.Close;
end;


procedure TStfakt_FAST.SpeedButton1Click(Sender: TObject);
begin
   // Выбор поставщика
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=STFAKT_GP.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>STFAKT_GP.tag then begin
        STFAKT_GP.tag:=DIC_KLIENT.tag;
        SHOW_KLN;
     end;
     DIC_KLIENT.Destroy;
end;

end.
