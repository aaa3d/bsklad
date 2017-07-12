unit StfaktError;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery,
  IBDatabase;

type
  TStFakt_Error = class(TForm)
    Label1: TLabel;
    STFAKT_NUM: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StFakt_Error: TStFakt_Error;

implementation

{$R *.DFM}

procedure TStFakt_Error.Button1Click(Sender: TObject);
begin
     close;
end;

procedure TStFakt_Error.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TStFakt_Error.FormCreate(Sender: TObject);
begin
     Memo1.tag:=0;  // Счетчик ошибок
     Memo1.lines.clear;
     {Определяем, есть ли накладные на данную счёт-фактуру}
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * FROM STFAKT WHERE STFAKT_ID=:STFAKT_ID');
     QueryWork.ParamByname('STFAKT_ID').asinteger:=StFakt_Error.tag;
     QueryWork.Open;
     STFAKT_NUM.text:=QueryWork.FieldByname('STFAKT_NUM').asstring+' от '+
       date_sokr(QueryWork.FieldByname('STFAKT_DATE').asdatetime);
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'Select RN_ID,RN_DATE,RN_NUM,SHOP_PREFIX,SHOP_POSTFIX,RNTYP_SHORT,KLN_PREFIX '+
     ' FROM STFAKTS,RN,SHOP,KLN,RNTYP WHERE STFAKTS.RN_ID=RN.RN_ID AND STFAKTS.STFAKT_ID=:STFAKT_ID '+
     ' and rn.shop_id=shop.shop_id and rn.rntyp_id=rntyp.rntyp_id and rn.frm_id=kln.kln_id ');
     QueryWork.ParamByname('STFAKT_ID').asinteger:=StFakt_Error.tag;
     QueryWork.Open;
     if QueryWork.eof then begin
        Memo1.lines.add('Все накладные, на основании которых оформлен счёт фактура удалены из бызы. Счёт-фактуру следует считатать безвозвратно потерянным!');
        Memo1.tag:=Memo1.tag+1;
     end else begin
          while not QueryWork.eof do begin
            //Перечень накладных
            Memo1.lines.add(QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
            QueryWork.fieldByname('SHOP_PREFIX').asstring+QueryWork.fieldByname('RNTYP_SHORT').asstring+
            inttostr(date_year(QueryWork.fieldByname('RN_DATE').asdatetime))+
            b_utils.right('000000'+QueryWork.fieldByname('RN_NUM').asstring,6)+
            QueryWork.fieldByname('SHOP_POSTFIX').asstring+' от '+
            date_sokr(QueryWork.fieldByname('RN_DATE').asdatetime));
            QueryWork.Next;
          end;
          ADD_SQL(QueryWork,'select MAX(RN.RN_PROW) as MAX_PROW,MIN(RN.RN_PROW) AS MIN_PROW, '+
           'MAX(RN.KLN_ID) as MAX_KLN,MIN(RN.KLN_ID) AS MIN_KLN, '+
           'MAX(RN.FRM_ID) as MAX_FRM,MIN(RN.FRM_ID) AS MIN_FRM, '+
           'MAX(RN.NDS) as MAX_NDS,MIN(RN.NDS) AS MIN_NDS, '+
           'MAX(RN.NP) as MAX_NP,MIN(RN.NP) AS MIN_NP '+
           'FROM STFAKTS,RN WHERE STFAKTS.RN_ID=RN.RN_ID AND STFAKTS.STFAKT_ID=:STFAKT_ID');
          QueryWork.ParamByname('STFAKT_ID').asinteger:=StFakt_Error.tag;
          QueryWork.Open;
          if ((QueryWork.recordcount=0) or (QueryWork.fieldByname('MAX_PROW').asstring=''))then begin
             // Счет-фактура с "мертвого" архива
          end else begin
            if QueryWork.fieldByname('MAX_PROW').asinteger<>
               QueryWork.fieldByname('MIN_PROW').asinteger then begin
                 Memo1.lines.add('Не все накладные имеют одинаковое состояние проводки!');
                 Memo1.tag:=Memo1.tag+1;
            end;
            if QueryWork.fieldByname('MAX_KLN').asinteger<>
               QueryWork.fieldByname('MIN_KLN').asinteger then begin
                 Memo1.lines.add('Накладные выписаны на разных клиентов!');
                 Memo1.tag:=Memo1.tag+1;
            end;
            if QueryWork.fieldByname('MAX_FRM').asinteger<>
               QueryWork.fieldByname('MIN_FRM').asinteger then begin
                 Memo1.lines.add('Накладные выписаны от разных фирм!');
                 Memo1.tag:=Memo1.tag+1;
            end;
            if abs(QueryWork.fieldByname('MAX_NDS').asfloat-
               QueryWork.fieldByname('MIN_NDS').asfloat)>0.001 then begin
                 Memo1.lines.add('Накладные имеют разную ставку НДС!');
                 Memo1.tag:=Memo1.tag+1;
            end;
            if abs(QueryWork.fieldByname('MAX_NP').asfloat-
               QueryWork.fieldByname('MIN_NP').asfloat)>0.001 then begin
                 Memo1.lines.add('Накладные имеют разную ставку НП!');
                 Memo1.tag:=Memo1.tag+1;
            end;
            {Проверяем товары}
            ADD_SQL(QueryWork,'SELECT TW.TW_ART,TW.TW_NAM,RNS.TW_ID, '+
             'max(BG_FIXEDPOINT ((cast(((rns.tw_money*(1-rns.tw_skiddoll/100))*(1-(rns.tw_skid+rn.rn_skid)/100))*100 as integer))/100,2)) as MON1, '+
             'min(BG_FIXEDPOINT ((cast(((rns.tw_money*(1-rns.tw_skiddoll/100))*(1-(rns.tw_skid+rn.rn_skid)/100))*100 as integer))/100,2)) as MON2, '+
              'sum(rns.tw_kol) '+
             'from stfakt,stfakts,rn,rns,TW '+
             'where stfakt.stfakt_id= :STFAKT_ID and stfakt.stfakt_id=stfakts.stfakt_id '+
             'and stfakts.rn_id=rn.rn_id and rn.rn_id=rns.rn_id and (rns.tw_id=tw.tw_id) '+
             'group by rns.tw_id,tw.tw_art,tw.tw_nam');
            QueryWork.ParamByname('STFAKT_ID').asinteger:=StFakt_Error.tag;
            QueryWork.Open;
            while not QueryWork.eof do begin
                  if QueryWork.fieldByname('MON1').asfloat<>
                    QueryWork.fieldByname('MON2').asfloat then begin
                      Memo1.lines.add('Товар "'+QueryWork.fieldByname('TW_ART').asstring+': '+
                     QueryWork.fieldByname('TW_NAM').asstring+'" имеет разную цену в разных накладных!');
                     Memo1.tag:=Memo1.tag+1;
                  end;
                  QueryWork.next;
            end;
            QueryWork.Close;
          end;
     end
end;

end.
