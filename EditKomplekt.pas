unit EditKomplekt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils, RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase,
  StdCtrls, ComCtrls, ToolWin,B_DButils, Mask, ToolEdit, CurrEdit, Grids,
  DBGrids, RXDBCtrl, ExtCtrls, RxMemDS,VclUtils;

type
  TEDIT_KOMPLEKT = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    DicTransaction: TIBTransaction;
    DicEd: TIBQuery;
    DicEdED_ID: TIntegerField;
    DicEdED_SHORT: TIBStringField;
    DicEdED_FULL: TIBStringField;
    DicEdED_AUTO1: TIBStringField;
    DicEdED_AUTO2: TIBStringField;
    DicEdED_AUTO3: TIBStringField;
    DicEdTM: TDateTimeField;
    DsEd: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    IbQrValuta: TIBQuery;
    IbQrValutaVALUTA_ID: TIntegerField;
    IbQrValutaVALUTA_FULL: TIBStringField;
    IbQrValutaVALUTA_SHORT: TIBStringField;
    IbQrValutaKURS_KURS: TFloatField;
    IbQrValutaKURS_DATE: TDateTimeField;
    DsQrValuta: TDataSource;
    IbQrTwKtg: TIBQuery;
    IbQrTwKtgTWKTG_ID: TIntegerField;
    IbQrTwKtgTWKTG_NAM: TIBStringField;
    IbQrTwKtgTWKTG_PRIM: TIBStringField;
    IbQrTwKtgTWKTG_COLOR: TIntegerField;
    DsQrTwKtg: TDataSource;
    ToolButton1: TToolButton;
    BtnDel: TToolButton;
    ToolButton4: TToolButton;
    BtnCalc: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TW_ART: TEdit;
    TW_NAM: TEdit;
    ED_ID: TRxDBLookupCombo;
    Label16: TLabel;
    TWKTG: TRxDBLookupCombo;
    Label6: TLabel;
    VALUTA_ID: TRxDBLookupCombo;
    TW_MROZ: TRxCalcEdit;
    TW_MROZ2: TRxCalcEdit;
    Label12: TLabel;
    RxDBGrid1: TRxDBGrid;
    MemTW: TRxMemoryData;
    MemTWTW_ID: TIntegerField;
    MemTWTW_ART: TIntegerField;
    MemTWTW_NAME: TStringField;
    MemTWTW_KOL: TFloatField;
    MemTWED_SHORT: TStringField;
    MemTWTW_MROZ: TFloatField;
    MemTWTW_MROZ_NEW: TFloatField;
    MemTWTW_SKID: TFloatField;
    DsMemTW: TDataSource;
    MemTWTWKOMPL_ID: TIntegerField;
    MemTWTW_COLOR: TIntegerField;
    Label4: TLabel;
    MON2: TRxCalcEdit;
    Label5: TLabel;
    QueryWork2: TIBQuery;
    WorkTransaction2: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TW_MROZChange(Sender: TObject);
    procedure TWKTGChange(Sender: TObject);
    procedure TW_NAMChange(Sender: TObject);
    procedure ED_IDChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MemTWAfterPost(DataSet: TDataSet);
    procedure Show_sost;
    procedure ADD_TW(TW_ID:integer;KOL:double);
    procedure DsMemTWDataChange(Sender: TObject; Field: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BtnDelClick(Sender: TObject);
    procedure MemTWCalcFields(DataSet: TDataSet);
    procedure BtnCalcClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_KOMPLEKT: TEDIT_KOMPLEKT;
  Save:boolean;
  CanInsert:boolean;
  STR:ansistring;
  CNT_DEL:integer;
  TW_DEL:array[1..1000] of integer;
  Sost:integer;
  IDBRAK:integer;

implementation

uses DicTowar, SetKolvo, WaitForm;

{$R *.DFM}

procedure TEDIT_KOMPLEKT.FormShow(Sender: TObject);
begin
   label4.caption:='';
   DicTransaction.Active:=False;
   DicEd.close;
   DicEd.Open;
   IbQrValuta.close;
   IbQrValuta.open;
   IbQrTWKTG.close;
   IbQrTWKTG.open;
   MemTW.EmptyTable;
   CanInsert:=False;
  if tag<0 then begin
      TW_ART.text:='Новый';
      TW_NAM.text:='';
      ED_ID.Value:=inttostr(DEFAULT_TW_ED);
      TWKTG.Value:=inttostr(DEFAULT_TW_TWKTG);
      TWKTGChange(Sender);
      Sost:=1;
   end else begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select tw.*, (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
        '(select max(kurs_date) from kurs where '+
        'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz2  from TW where tw_id=:tw_id');
     QueryWork.ParamByname('TW_ID').asinteger:=tag;
     QueryWork.Open;
     if QueryWork.eof then Messbox('Ошибка чтения комплекта!',MessSystem,48) else begin
       TW_ART.text:=QueryWork.fieldbyname('TW_ART').asstring;
       TW_NAM.text:=QueryWork.fieldbyname('TW_NAM').asstring;
       ED_ID.value:=QueryWork.fieldbyname('ED_ID').asstring;
       TWKTG.value:=QueryWork.fieldByname('TWKTG_ID').asstring;
       TW_MROZ.value:=QueryWork.fieldByname('TW_MROZ2').value;
       TW_MROZ2.displayFormat:=',#0.0000 '+IbQrValuta.fieldByname('VALUTA_SHORT').asstring;
       WorkTransaction2.Active:=False;
       ADD_SQL(QueryWork2,'select * from TWKOMPL where TWK_ID=:TW_ID');
       QueryWork2.ParamByName('TW_ID').asinteger:=EDIT_KOMPLEKT.tag;
       QueryWork2.Open;
       CanInsert:=True;
       while not QueryWork2.Eof do begin
          ADD_TW(QueryWork2.fieldByname('TW_ID').asinteger,QueryWork2.fieldByname('TW_KOL').asfloat);
          MemTW.Locate('TW_ID',QueryWork2.fieldByname('TW_ID').asinteger,[]);
          MemTW.Edit;
          MemTW.fieldByname('TWKOMPL_ID').asinteger:=QueryWork2.fieldByname('TWKOMPL_ID').asinteger;
          MemTW.Post;
          QueryWork2.next;
       end;
       MemTW.first;
       CanInsert:=False;
     end;
     Sost:=0;
   end;
   CNT_DEL:=0;
   Show_sost;
   BtnCalc.click;
   SAVE:=True;
end;

procedure TEDIT_KOMPLEKT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DicEd.close;
   DicTransaction.Active:=False;
end;

procedure TEDIT_KOMPLEKT.TW_MROZChange(Sender: TObject);
begin
     TW_MROZ2.value:=TW_MROZ.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
     SAVE:=False;
end;

procedure TEDIT_KOMPLEKT.TWKTGChange(Sender: TObject);
begin
     if strtoint(TWKTG.value) in [1,5] then VALUTA_ID.value:='1'
                                        else VALUTA_ID.value:='0';
     TW_MROZChange(Sender);
     Save:=False;
end;

procedure TEDIT_KOMPLEKT.TW_NAMChange(Sender: TObject);
begin
   Save:=False;
end;

procedure TEDIT_KOMPLEKT.ED_IDChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_KOMPLEKT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose:=True;
     if not SAVE then begin
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений!',MessSubmit,4+48+256)<>6
        then CanClose:=False;
     end;
end;

procedure TEDIT_KOMPLEKT.MemTWAfterPost(DataSet: TDataSet);
var
  EN:boolean;
begin
   if MemTW.recordcount>0 then EN:=True else EN:=False;
   BtnDel.enabled:=EN;
   BtnSave.enabled:=EN;
   BtnApply.enabled:=EN;
end;

procedure TEDIT_KOMPLEKT.Show_sost;
var
   s:ansistring;
   TwEmpty:boolean;
begin
     if Edit_komplekt.Tag<0 then
       Edit_komplekt.caption:='Комплект товаров. Новый'
     else begin
       Edit_komplekt.caption:='Комплект товаров. Редактирование'
     end;
     if MemTW.RecordCount=0 then TwEmpty:=true else TwEmpty:=false;
     begin
        case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel1.Color:=clBtnFace;
                   Panel1.Font.color:=ClWindowText;
                end;
             1: begin
                   s:='Ввод товаров...';
                   if TW_FON>=0 then Panel1.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel1.Font.color:=TW_COLOR;
                end;
        end;
     end;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;
end;

procedure TEDIT_KOMPLEKT.ADD_TW(TW_ID:integer;KOL:double);
var
   TW_TEMP:integer;
   TW_STR:ansistring;
   ISS:boolean;
   VALUTA_ID:integer;
   KURS1,KURS2:double;
begin
    begin
     TW_TEMP:=0;
     {Проверяем, нет ли в комплекте уже такого товара}
     if MemTW.RecordCount>0 then TW_TEMP:=MemTW.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemTW.Disablecontrols;
     MemTW.first;
     while (not MemTW.eof) and (not ISS) do begin
           if MemTW.fieldByname('TW_ID').asinteger=TW_ID then begin
              // Товар есть в комплекте
              ISS:=true;
              TW_STR:=MemTW.fieldByname('TW_ART').asstring+'-'+MemTW.fieldByname('TW_NAME').asstring;
           end;
           if TW_ID=EDIT_KOMPLEKT.tag then begin
              // Попытка добавить в комплект его же
              ISS:=true;
              TW_STR:='настоящий комплект';
           end;
           MemTW.next;
     end;
     MemTW.EnableControls;
     if ISS then Messbox('Комплект уже содержит товар "'+TW_STR+'" и он не может быть добавлен!',MessSystem,48) else
     begin
          SAVE:=False;
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select twktg.twktg_color,tw.valuta_id,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short, '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.twktg_id=twktg.twktg_id and tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID');
          QueryWork.Parambyname('TW_ID').asinteger:=TW_ID;
          QueryWork.Open;
          CanInsert:=True;
          MemTW.Append;
          MemTW.Fieldbyname('TWKOMPL_ID').asinteger:=-1;
          MemTW.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemTW.Fieldbyname('TW_COLOR').asinteger:=QueryWork.Fieldbyname('TWKTG_COLOR').asinteger;
          MemTW.Fieldbyname('TW_ART').asinteger:=QueryWork.Fieldbyname('TW_ART').asinteger;
          MemTW.Fieldbyname('TW_NAME').asstring:=QueryWork.Fieldbyname('TW_NAM').asstring;
          MemTW.Fieldbyname('ED_SHORT').asstring:=QueryWork.Fieldbyname('ED_SHORT').asstring;
          MemTW.Fieldbyname('TW_MROZ').asfloat:=QueryWork.Fieldbyname('TW_MROZ').asfloat;
          MemTW.Fieldbyname('TW_MROZ_NEW').asfloat:=QueryWork.Fieldbyname('TW_MROZ').asfloat;
          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=QueryWork.fieldByname('TW_ART').asstring+
                            QueryWork.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemTW.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemTW.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemTW.Post;
          CanInsert:=False;
     end;
     QueryWork.Close;
     try
       RxDbGrid1.setfocus;
     Except
     End;
  end;
end;

procedure TEDIT_KOMPLEKT.DsMemTWDataChange(Sender: TObject; Field: TField);
begin
     if MemTW.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemTW.State in [dsInsert]) and ( not CanInsert) then MemTW.Cancel;
end;

procedure TEDIT_KOMPLEKT.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
  begin
     if (key='*') and (sost=0) then begin
        sost:=1;
        key:=#0;
        STR:='';
     end else
     if (key='*') and (sost=1) then begin
        sost:=0;
        key:=#0;
        STR:='';
     end;
     if (sost=1) and (key in ['0','1','2','3','4','5','6','7','8','9',#8,#13,#27]) then begin
       case key of
         #8: begin
             if length(STR)>0 then begin
                if length(STR)=1 then STR:=''
                else begin
                  if (length(STR)=2) and (B_Utils.left(STR,1)='Б') then STR:='' else
                  STR:=B_utils.left(STR,length(STR)-1);
                end;
             end;
         end;
         #13: begin
              {Ввод закончен}
              key:=#0;
              if length(STR)>0 then begin
                 {Добавляем строку}
                 WorkTransaction.Active:=False;
                 QueryWork.close;
                 ADD_SQL(QueryWork,'select TW_ID from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                 if B_utils.left(STR,1)='Б' then begin
                    N:=strtoint(B_Utils.right(STR,length(STR)-1));
                    QueryWork.ParamByname('TW_ART').asinteger:=N;
                    QueryWork.ParamByname('TW_BRAK').asstring:='1';
                 end else begin
                    N:=strtoint(STR);
                    QueryWork.ParamByname('TW_ART').asinteger:=N;
                    QueryWork.ParamByname('TW_BRAK').asstring:='0';
                 end;
                 QueryWork.Open;
                 if not QueryWork.eof then begin
                    ID:=QueryWork.fieldbyname('TW_ID').asinteger;
                    ADD_TW(ID,-1);
                    BtnCalc.click;
               end else messbox('Не существует товара с кодом: '+inttostr(N)+' !',MessSystem,48);
                 key:=#0;
                 STR:='';
              end;
         end;
         #27: begin
              sost:=0;
              key:=#0;
              STR:='';
         end;
         else begin
           if length(STR)<10 then begin
             if (key='0') and (STR='') then key:='Б';
             STR:=STR+key;
           end;
         end;
       end;
       key:=#0;
     end;
  end;
  Show_Sost;
end;

procedure TEDIT_KOMPLEKT.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     end;

end;

procedure TEDIT_KOMPLEKT.BtnDelClick(Sender: TObject);
begin
     if Messbox('Удалить из комплекта товар "'+MemTW.Fieldbyname('TW_NAME').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        if MemTW.Fieldbyname('TWKOMPL_ID').asinteger>0 then begin
          inc(CNT_DEL);
          TW_DEL[CNT_DEL]:=MemTW.Fieldbyname('TWKOMPL_ID').asinteger;
        end;
        SAVE:=False;
        MemTW.delete;
        Show_Sost;
     end;
end;

procedure TEDIT_KOMPLEKT.MemTWCalcFields(DataSet: TDataSet);
var
   MON1,MON2,SKID:double;
begin
   MON1:=MemTW.fieldByname('TW_MROZ').asfloat;
   MON2:=MemTW.fieldByname('TW_MROZ_NEW').asfloat;
   if MON1=0 then SKID:=-100 else SKID:=(MON2-MON1)/(MON1/100);
   MemTW.fieldByname('TW_SKID').asfloat:=SKID;
end;

procedure TEDIT_KOMPLEKT.BtnCalcClick(Sender: TObject);
var
  SUMM_ALL,SUMM_CURRENT:double;
  NEW_SUMM:double;
  KOP:integer;
  SKID:double;
  ID:integer;
  IS_ONE:integer;
  IS_TWO:integer;
  ID_ONE:integer;
  ID_TWO:integer;
begin
   // Расчет цен
   SUMM_ALL:=TW_MROZ.value;
   SUMM_CURRENT:=0;
   IS_ONE:=0;
   IS_TWO:=0;
   IF MemTW.RecordCount>0 then begin
     ID:=MemTW.Recno;
     MemTW.Disablecontrols;
     MemTW.First;
     while not MemTW.eof do begin
       SUMM_CURRENT:=SUMM_CURRENT+MemTW.fieldByname('TW_MROZ').asfloat*MemTW.fieldByname('TW_KOL').asfloat;
       if MemTW.fieldByname('TW_KOL').asfloat=1 then begin
          inc(IS_ONE);
          ID_ONE:=MemTW.recno;
       end;
       if MemTW.fieldByname('TW_KOL').asfloat=2 then begin
          inc(IS_TWO);
          ID_TWO:=MemTW.recno;
       end;
       MemTW.next;
     end;
     // Определяем текущую скидку
     if SUMM_CURRENT=0 then SKID:=100 else SKID:=(SUMM_CURRENT-SUMM_ALL)/(SUMM_CURRENT/100);
     // Разносим скидку по товарам и определяем остаток в копейках
     MemTW.First;
     NEW_SUMM:=0;
     while not MemTW.eof do begin
       MemTW.Edit;
       MemTW.fieldByname('TW_MROZ_NEW').asfloat:=okrug(
       MemTW.fieldByname('TW_MROZ').asfloat*(1-SKID/100),2);
       MemTW.Post;
       NEW_SUMM:=NEW_SUMM+MemTW.fieldByname('TW_MROZ_NEW').asfloat*MemTW.fieldByname('TW_KOL').asfloat;
       MemTW.next;
     end;
     KOP:=round(SUMM_ALL*100-NEW_SUMM*100); // Определяем дельту округлени
     // Пытаемся вписать цену в какой либо товар
     if KOP<>0 then begin
       if IS_ONE>0 then begin
          MemTW.RecNo:=ID_ONE;
          if MemTW.fieldByname('TW_MROZ_NEW').asfloat>-KOP then begin
            MemTW.edit;
            MemTW.fieldByname('TW_MROZ_NEW').asfloat:=MemTW.fieldByname('TW_MROZ_NEW').asfloat+KOP;
            MemTW.Post;
          end;
       end else begin
         case KOP of
           1,-1: begin
                 end;
           2,-2: begin
                 end;
           3,-3: begin
                 end;
         end;
       end;
     end;
     // перерасчет новой суммы
     MemTW.First;
     NEW_SUMM:=0;
     while not MemTW.eof do begin
       NEW_SUMM:=NEW_SUMM+MemTW.fieldByname('TW_MROZ_NEW').asfloat*MemTW.fieldByname('TW_KOL').asfloat;
       MemTW.next;
     end;
     MON2.value:=NEW_SUMM;
     KOP:=round(abs((NEW_SUMM-SUMM_ALL)*100));
     if KOP<>0 then label4.caption:='не соответствует на '+inttostr(KOP)+' '+B_utils.OKON_CHAR('копейку','копейки','копеек',KOP)+'!'
       else label4.caption:='';
     MemTW.Recno:=ID;
     MemTW.Enablecontrols;
   end;
end;

procedure TEDIT_KOMPLEKT.BtnApplyClick(Sender: TObject);
var
   r:double;
   n,a,ID,ID2:integer;
begin
 if MemTW.recordcount<2 then begin
       Messbox('Комплект должен содержать более одного товара!',MessSystem,48);
       Save:=False;
 end else begin
  if TW_NAM.text='' then begin
      messbox('Название комплекта не может быть пустой строкой!',MessSystem,48);
      Save:=False;
  end else begin
    if TW_MROZ.Value=0 then begin
       Messbox('Цена на комплект не можеть нулевой!',MessSystem,48);
       Save:=False;
    end else begin
       {Сохраняем}
       Wait_Form.StatusBar1.panels[0].text:='Запись карточки комплекта';
       Wait_Form.Gauge1.Progress:=2;
       Wait_Form.Show;
       Delay(1);
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         IBSAVE_CLEAR;
         IBSAVE_ADD('TW_NAM',TW_NAM.Text);
         IBSAVE_ADD('ED_ID',strtoint(ED_ID.value));
         IBSAVE_ADD('VALUTA_ID',strtoint(VALUTA_ID.value));
         IBSAVE_ADD('TW_MADE','');
         IBSAVE_ADD('TW_RAZM','');
         IBSAVE_ADD('TW_UP','');
         IBSAVE_ADD('TW_POST','');
         IBSAVE_ADD('TW_LAND','');
         IBSAVE_ADD('TW_TAM','');
         IBSAVE_ADD('TW_PRIM','');
         IBSAVE_ADD('TW_SEK',0);
         IBSAVE_ADD('TW_KASSA',0);
         IBSAVE_ADD('TW_RASPR',false);
         IBSAVE_ADD('TW_MROZ',TW_MROZ2.value);
         IBSAVE_ADD('TWKTG_ID',strtoint(TWKTG.value));
         IBSAVE_ADD('TWTREE_ID',Dic_Towar.Treeview1.selected.stateindex);
         IBSAVE_ADD('TW_BRAK',false);
         IBSAVE_ADD('TW_KOMPL',true);
         N:=IBSAVE_DOC('TW',Edit_komplekt.tag);
         if n<0 then r:=sqrt(-1) else begin
            Datamodule1.IBTransaction2.Commit;
            Datamodule1.IBTransaction2.Active:=False;
            {Определяем артикул}
            Wait_Form.Gauge1.Progress:=20;
            Delay(1);
            WorkTransaction.Active:=False;
            ADD_SQL(QueryWork,'select TW_ART from TW where TW_ID= :TW_ID');
            QueryWork.ParamByname('TW_ID').asinteger:=N;
            QueryWork.Open;
            if QueryWork.eof then Messbox('Ошибка в чтении артикула!',MessSystem,16);
            TW_ART.Text:=QueryWork.fieldByname('TW_ART').asstring;
            QueryWork.close;
            Datamodule1.IBTransaction2.StartTransaction;
            IBSAVE_ADD('TW_ART',TW_ART.Text);
            IBSAVE_ADD('TW_MROZ',TW_MROZ2.value);
            IBSAVE_ADD('TW_NAM','(Б) '+TW_NAM.Text);
            IBSAVE_ADD('TW_BRAK',true);
            IDBRAK:=IBSAVE_DOC('TW',IDBRAK);
            IBSAVE_CLEAR;
            IBSAVE_ADD('US_ID',USERID);
            IBSAVE_ADD('SHOP_ID',SHOPID);
            if EDIT_Komplekt.tag<0 then IBSAVE_ADD('MESS','Создан в группе "'+Dic_TOWAR.treeview1.selected.text+'"')
            else IBSAVE_ADD('MESS','Изменен');
            if EDIT_komplekt.tag<0 then IBSAVE_ADD('DOP1',1) // Метка вставки
                             else IBSAVE_ADD('DOP1',-1); // Метка изменени
            IBSAVE_ADD('DOP2',n);
            IBSAVE_ADD('DOC','TW'); // Название таблицы
            IBSAVE_DOC('ARCUPDATE',-1);
            edit_komplekt.tag:=n;
            Wait_Form.Gauge1.Progress:=40;
            Delay(1);
            IF IDBRAK<0 then r:=Sqrt(-1) else begin
               for a:=1 to CNT_DEL do begin
                  if not IBDELETE_DOC('TWKOMPL',TW_DEL[a])
                      then r:=Sqrt(-1);
               end;
               Wait_Form.Gauge1.Progress:=70;
               Delay(1);
               MemTW.Disablecontrols;
               MemTW.first;
               while not MemTW.eof do begin
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('TWK_ID',Edit_komplekt.tag);
                     IBSAVE_ADD('TW_ID',MemTW.fieldByname('TW_ID').asinteger);
                     IBSAVE_ADD('TW_KOL',MemTW.fieldByname('TW_KOL').asfloat);
                     IBSAVE_ADD('TWKOMPL_ORDER',MemTW.recno);
                     ID2:=Ibsave_Doc('TWKOMPL',MemTW.fieldByname('TWKOMPL_ID').asinteger);
                     if ID2<0 then r:=Sqrt(-1) else begin
                        MemTW.edit;
                        MemTW.fieldByname('TWKOMPL_ID').asinteger:=ID2;
                        MemTW.Post;
                     end;
                     MemTW.next;
               end;
               Wait_Form.Gauge1.Progress:=100;
               Delay(100);
               Wait_Form.Hide;
               CNT_DEL:=0;
               Datamodule1.IBTransaction2.Commit;
               Datamodule1.IBTransaction2.Active:=False;
               SAVE:=True;
            end;
         end;
       except
          Datamodule1.IBTransaction2.Rollback;
       end;
    end;
  end;
 end;
 Datamodule1.IBTransaction2.Active:=False

end;

procedure TEDIT_KOMPLEKT.BtnSaveClick(Sender: TObject);
begin
   BtnApply.click;
   if SAVE then close;
end;

end.