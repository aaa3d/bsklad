unit MakeRemon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, ToolEdit, Mask, CurrEdit, Buttons,
  Data1,b_utils,b_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  VclUtils;

type
  TMAKE_REMON = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    KURS_OLD: TRxCalcEdit;
    KURS_NEW: TRxCalcEdit;
    DT: TDateEdit;
    FRM: TEdit;
    REMON_OWNER: TRxDBLookupCombo;
    REMON_OSN: TEdit;
    BtnRun: TButton;
    BtnClose: TButton;
    Label7: TLabel;
    Image1: TImage;
    BtnFrm: TSpeedButton;
    RemonTransaction: TIBTransaction;
    IbOwnerList: TIBQuery;
    IbOwnerListOWNER_ID: TIntegerField;
    IbOwnerListOWNER_NAME: TIBStringField;
    DsOwnerList: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    QueryWork3: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure BtnFrmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAKE_REMON: TMAKE_REMON;
  FRM_ID:integer;

implementation

uses DicKlient, WaitForm;

{$R *.DFM}

procedure TMAKE_REMON.FormShow(Sender: TObject);
begin
   KURS_OLD.value:=DEFAULT_KURS(1,0); // Курс ценообразования
   KURS_NEW.value:=DEFAULT_KURS(1,0); // Курс ценообразования
   RemonTransaction.Active:=False;
   IbOwnerList.close;
   IbOwnerList.Open;
   DT.date:=date();
   REMON_OSN.text:='';
   FRM_ID:=default_firma;
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
   QueryWork.parambyname('KLN_ID').asinteger:=FRM_ID;
   QueryWork.Open;
   FRM.text:=QueryWork.fieldByname('KLN_FULL').asstring;
   QueryWork.Close;
   REMON_OWNER.value:=inttostr(default_owner);
end;

procedure TMAKE_REMON.BtnFrmClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=FRM_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>FRM_ID then begin
        FRM_ID:=DIC_KLIENT.tag;
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
        QueryWork.parambyname('KLN_ID').asinteger:=FRM_ID;
        QueryWork.Open;
        FRM.text:=QueryWork.fieldByname('KLN_FULL').asstring;
        QueryWork.Close;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TMAKE_REMON.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IbOwnerList.close;
   RemonTransaction.Active:=False;
end;

procedure TMAKE_REMON.BtnCloseClick(Sender: TObject);
begin
   close;
end;

procedure TMAKE_REMON.BtnRunClick(Sender: TObject);
var
  ALL,Current:integer;
  REMON_ID:integer;
  REMON_NUM:integer;
  r:double;
  N,O:double;
  cntAkt:integer;
begin
    N:=KURS_NEW.value;
    O:=KURS_OLD.value;
    // Оформляем
    if KURS_OLD.value=KURS_NEW.value then messbox('Старый и новый курсы совпадают!',MessSystem,48) else begin
       KURS_OLD.enabled:=False;
       KURS_NEW.enabled:=False;
       DT.enabled:=False;
       BtnFRM.enabled:=False;
       REMON_OWNER.enabled:=False;
       REMON_OSN.enabled:=False;
       Wait_Form.StatusBar1.panels[0].text:='Определение количества товаров ...';
       Wait_Form.Gauge1.Progress:=1;
       Wait_Form.Show;
       delay(1);
       WorkTransaction.Active:=False;
       OPEN_SQL(QueryWork,'select count(tw_id) as cc from tw where tw.valuta_id=1');
       if QueryWork.Eof then ALL:=0 else ALL:=QueryWork.fieldByname('CC').asinteger;
       if ALL>0 then begin
         Wait_Form.StatusBar1.panels[0].text:='Запись заголовка акта переоценки...';
         Wait_Form.Gauge1.Progress:=10;
         delay(1);
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         Try
            IBSAVE_CLEAR;
            REMON_NUM:=NEW_REMON_NUM(0, DT.date);
            IBSAVE_ADD('REMON_NUM',REMON_NUM);
            IBSAVE_ADD('REMON_DATE',strtodatetime(datetostr(DT.date)+' '+timetostr(time())));
            IBSAVE_ADD('REMON_OSN',REMON_OSN.text);
            IBSAVE_ADD('US_ID',USERID);
            IBSAVE_ADD('REMON_PROW','1');
            IBSAVE_ADD('SHOP_ID',SHOPID);
            IBSAVE_ADD('FRM_ID',FRM_ID);
            IBSAVE_ADD('REMON_OWNER',strtoint(REMON_OWNER.value));
            REMON_ID:=IBSAVE_DOC('REMON',-1);
            if REMON_ID<0 then r:=sqrt(-1);
            Wait_Form.StatusBar1.panels[0].text:='Запрос остатков по магазинам...';
            Wait_Form.Gauge1.Progress:=20;
            delay(1);
            Current:=0;
            ADD_SQL(QueryWork,'select tw_id,(select money from price_okrug(tw.tw_mroz*:o)) as old_money, '+
            '(select money from price_okrug(tw.tw_mroz*:n)) as new_money '+
            'from tw '+
            'where tw.valuta_id=1 order by tw.tw_nam ');
            QueryWork.paramByname('N').asfloat:=KURS_NEW.value;
            QueryWork.paramByname('O').asfloat:=KURS_OLD.value;
            QueryWork.Open;
            Wait_Form.StatusBar1.panels[0].text:='Оформление остатков по магазинам...';
            Wait_Form.Gauge1.Progress:=26;
               cntAkt:=0;
            While not QueryWork.eof do begin
               if CntAkt>=100 then begin
                      CntAkt:=0;
                      // Закрываем предыдущий акт, создаем новый заголовок
                      IBSAVE_CLEAR;
                      inc(REMON_NUM);
		      IBSAVE_ADD('REMON_NUM',REMON_NUM);
	              IBSAVE_ADD('REMON_DATE',strtodatetime(datetostr(DT.date)+' '+timetostr(time())));
                      IBSAVE_ADD('REMON_OSN',REMON_OSN.text);
                      IBSAVE_ADD('US_ID',USERID);
                      IBSAVE_ADD('REMON_PROW','1');
                      IBSAVE_ADD('SHOP_ID',SHOPID);
                      IBSAVE_ADD('FRM_ID',FRM_ID);
                      IBSAVE_ADD('REMON_OWNER',strtoint(REMON_OWNER.value));
                      IBSAVE_ADD('REMON_SHOP',0); // смена базовой цены
                      REMON_ID:=IBSAVE_DOC('REMON',-1);
                   if REMON_ID<0 then r:=sqrt(-1);
               end;
               ADD_SQL(QueryWork2,'select sum(tw_kol) as ost ,skl_id from reg where tw_id=:tw_id '+
                'group by skl_id having not sum(tw_kol)=0');
               QueryWork2.parambyname('TW_ID').asinteger:=QueryWork.Fieldbyname('TW_ID').asinteger;
               QueryWork2.Open;
               // Ставим защиту, чтобы в акт попадали только товары с остатками
               if not QueryWork2.eof then begin
                  inc(CntAkt);
               end;
               while not QueryWork2.eof do begin
                  IBSAVE_CLEAR;
                  IBSAVE_ADD('REMON_ID',REMON_ID);
                  IBSAVE_ADD('TW_ID',QueryWork.fieldByname('TW_ID').asinteger);
                  IBSAVE_ADD('SKL_ID',QueryWork2.fieldByname('SKL_ID').asinteger);
                  IBSAVE_ADD('TW_KURS',KURS_NEW.value);
                  IBSAVE_ADD('TW_KOL',QueryWork2.fieldByname('OST').asfloat);
                  IBSAVE_ADD('OLD_TW_MONEY',QueryWork.fieldByname('OLD_MONEY').asfloat);
                  IBSAVE_ADD('NEW_TW_MONEY',QueryWork.fieldByname('NEW_MONEY').asfloat);
                  IBSAVE_ADD('REMONS_PRIM','Смена курса!');
                  if IBSAVE_DOC('REMONS',-1)<0 then r:=sqrt(-1);
                  QueryWork2.next;
               end;
               inc(Current);
               if Current mod 10=0 then begin
                  Wait_Form.Gauge1.Progress:=26+trunc(74*(Current/All));
                  delay(1);
               end;
               QueryWork.next;
            end;
            Wait_Form.Gauge1.Progress:=100;
            delay(100);
            Wait_Form.Hide;
            Datamodule1.IBTransaction2.Commit;
            Messbox('Оформлены акт переоценки до №№ '+b_utils.right('000000'+inttostr(REMON_NUM),5)+' включительно от '+date_sokr(DT.date),MessSystem,48);
         Except
           Wait_Form.Hide;
           Messbox('Акты переоценки не сформированы!',MessError,16);
           Datamodule1.IBTransaction2.Rollback;
         End;
         Datamodule1.IBTransaction2.Active:=False;
       end;
       QueryWork3.close;
       QueryWork2.close;
       QueryWork.close;
       Wait_Form.Hide;
       KURS_OLD.enabled:=True;
       KURS_NEW.enabled:=True;
       DT.enabled:=True;
       BtnFRM.enabled:=True;
       REMON_OWNER.enabled:=True;
       REMON_OSN.enabled:=True;
    end;
end;

end.
