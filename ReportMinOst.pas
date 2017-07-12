unit ReportMinOst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin,Data1,B_Utils,B_DButils, Grids, DBGrids, RXDBCtrl,
  ExtCtrls, Buttons, StdCtrls, Db, IBCustomDataSet, IBQuery, RxMemDS,
  IBDatabase, Menus,
  RXSpin,VclUtils, DetalTw, DualList;

type
  TReport_Min_OSt = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Panel4: TPanel;
    Label1: TLabel;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TW: TEdit;
    BtnDic: TSpeedButton;
    Label2: TLabel;
    MES: TRxSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    VID: TComboBox;
    Panel5: TPanel;
    Label5: TLabel;
    Speed1: TRadioButton;
    Speed2: TRadioButton;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    ToolButton3: TToolButton;
    BtnExport: TToolButton;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N3: TMenuItem;
    MnExport: TMenuItem;
    N5: TMenuItem;
    MnDic: TMenuItem;
    BtnRefresh: TToolButton;
    N7: TMenuItem;
    MnRefresh: TMenuItem;
    BtnResult: TToolButton;
    ToolButton2: TToolButton;
    MnResult: TMenuItem;
    ToolButton4: TToolButton;
    BtnDetal: TToolButton;
    BtnAnaliz: TToolButton;
    BtnMarket: TToolButton;
    N6: TMenuItem;
    MnDetal: TMenuItem;
    MnAnaliz: TMenuItem;
    MnMarket: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemReport: TRxMemoryData;
    MemReportTW_ID: TIntegerField;
    MemReportTW_MROZ: TFloatField;
    MemReportTW_ART: TIntegerField;
    MemReportTW_COLOR: TIntegerField;
    MemReportED_SHORT: TStringField;
    MemReportTW_NAM: TStringField;
    MemReportSPEED_ALL: TFloatField;
    MemReportOST_ALL: TFloatField;
    MemReportMIN_ALL: TFloatField;
    MemReportRESULT: TStringField;
    MemReportRESULT_SEC: TStringField;
    DsReport: TDataSource;
    BtnStop: TToolButton;
    QueryWork2: TIBQuery;
    MemSet: TRxMemoryData;
    MemSetVID: TStringField;
    MemSetTYP: TIntegerField;
    MemSetF1: TIntegerField;
    MemSetF2: TIntegerField;
    MemSetF3: TIntegerField;
    MemSetF4: TIntegerField;
    MemSetF5: TIntegerField;
    MemSetF6: TIntegerField;
    MemSetF7: TIntegerField;
    MemSetF8: TIntegerField;
    MemSetF9: TIntegerField;
    MemSetF10: TIntegerField;
    MemSetF11: TIntegerField;
    MemSetF12: TIntegerField;
    MemSetF13: TIntegerField;
    MemSetF14: TIntegerField;
    MemSetF15: TIntegerField;
    MemSetF16: TIntegerField;
    MemSetF17: TIntegerField;
    MemSetF18: TIntegerField;
    MemSetF19: TIntegerField;
    MemSetF20: TIntegerField;
    DsSet: TDataSource;
    Timer1: TTimer;
    MemReportVALUTA_ID: TIntegerField;
    MemReportTWKTG_ID: TIntegerField;
    MemReportTW_RASPR: TStringField;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    CheckBox3: TCheckBox;
    RxSpinEdit1: TRxSpinEdit;
    Label7: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DualListDialog1: TDualListDialog;
    ComboBox3: TComboBox;
    MemReportMET_MONEY_SHOP: TIntegerField;
    BtnDynDic: TSpeedButton;
    procedure TW2Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure MemReportAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Speed1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DsSetDataChange(Sender: TObject; Field: TField);
    procedure MemSetF1Change(Sender: TField);
    procedure BtnResultClick(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BtnDetalClick(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure BtnMarketClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure MemReportAfterPost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
  private
    RNTYP_S: string;
    tW_group_typ: integer;
    tw_group_id: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _2STEP:integer;
  Report_Min_OSt: TReport_Min_OSt;
  CanTimer,CanInsert,CanEdit:boolean;
  ID,SKL:array[1..20] of integer;
  SAVE2:boolean;

implementation

uses Mainform, DicTowar, ReportMinResult, ANALIZTW, WaitForm, DicTwDynGroup;

{$R *.DFM}

procedure TReport_Min_OSt.TW2Click(Sender: TObject);
begin
     BtnDic.enabled:=TW2.checked;
     TW.enabled:=TW2.checked;
     MnDic.enabled:=TW2.checked;
end;

procedure TReport_Min_OSt.BtnSaveClick(Sender: TObject);
begin
     if not SAVE2 then BtnApply.click;
     if SAVE2 then close;
end;

procedure TReport_Min_OSt.BtnApplyClick(Sender: TObject);
var
   a,ID:integer;
   r:real;
begin
     SAVE2:=False;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        ADD_SQL(DataModule1.IbSaveSQL,'DELETE FROM CFG WHERE CFG_NAME="SAVE_MIN_OST" and cfg_set1=:US_ID');
        DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.ExecSQL;
        ID:=MemReport.recno;
        MemReport.Disablecontrols;
        MemReport.First;
        while not MemReport.eof do begin
              if length(MemReport.fieldByname('RESULT_SEC').asstring)>0 then begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('CFG_NAME','SAVE_MIN_OST');
                 IBSAVE_ADD('CFG_SET1',USERID);
                 IBSAVE_ADD('CFG_SET2',1);
                 IBSAVE_ADD('CFG_SET3',MemReport.fieldByname('TW_ID').asinteger);
                 IBSAVE_ADD('CFG_VALUE',MemReport.fieldByname('RESULT_SEC').asstring);
                 IBSAVE_ADD('CFG_BIG',MemReport.fieldByname('RESULT').asstring);
                 if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
              end;
              MemReport.next;
        end;
        {Сохраняем установки}
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','SAVE_MIN_OST');
        IBSAVE_ADD('CFG_SET1',USERID);
        IBSAVE_ADD('CFG_SET2',2);
        IBSAVE_ADD('CFG_VALUE',tw_group_id);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        IBSAVE_ADD('CFG_SET2',21);
        IBSAVE_ADD('CFG_VALUE',tw_group_typ);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);

        IBSAVE_ADD('CFG_SET2',3);
        IBSAVE_ADD('CFG_VALUE',floattostr(MES.value));
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        IBSAVE_ADD('CFG_SET2',4);
        if speed1.checked then IBSAVE_ADD('CFG_VALUE',1) else IBSAVE_ADD('CFG_VALUE',2);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        IBSAVE_ADD('CFG_SET2',5);
        IBSAVE_ADD('CFG_VALUE',VID.itemindex);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        IBSAVE_ADD('CFG_SET2',6);
        if CheckBox1.checked then IBSAVE_ADD('CFG_VALUE',1) else IBSAVE_ADD('CFG_VALUE',0);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        IBSAVE_ADD('CFG_SET2',7);
        if CheckBox2.checked then IBSAVE_ADD('CFG_VALUE',1) else IBSAVE_ADD('CFG_VALUE',0);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        Datamodule1.IBTransaction2.commit;
        SAVE2:=True;
        MemReport.First;
        for a:=1 to ID-1 do MemReport.next;
        MemReport.Enablecontrols;
     Except
           Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

procedure TReport_Min_OSt.BtnExportClick(Sender: TObject);
type
    SKLMOVE=record
      SKL_FROM:integer;
      SKL_TO:integer;
    end;
var
   NEWNUM:integer;
   arr_move:array[1..10000] of SKLMOVE;
   CNT_MOVE:integer;
   MetZAK:boolean;
   a,b,c,d,NEWID,NEWID2:integer;
   s1:ansistring;
   r:double;
   S_FROM,S_TO:integer;
   VALUT:integer;
   fq: FastQuery; 
begin
   CNT_MOVE:=0;
   if messbox('Вы уверены, что определили все решения?',MessSubmit,4+48+256)=6 then begin
     NEWNUM:=NEW_MAIL_NUM(gl_SHOP_FRM, date());
     Wait_Form.StatusBar1.panels[0].text:='Экспорт решений...';
     Wait_Form.Gauge1.Progress:=2;
     delay(1);
     Wait_Form.Show;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        Wait_Form.Gauge1.Progress:=10;
        delay(1);
        {Экспортируем решения}
        // Шаг первый - определяем, есть ли закупка
        MetZAK:=False;
        MemReport.disablecontrols;
        MemReport.first;
        while (not MemReport.eof) and (not MetZak) do begin
                if pos('ZAK',MemReport.fieldByname('RESULT_SEC').asstring)>0 then MetZAK:=True;
                MemReport.next;
        end;
        Wait_Form.Gauge1.Progress:=20;
        delay(1);
        // Шаг второй - определяем, есть ли перемещение
        MemReport.first;
        while (not MemReport.eof) do begin
           for a:=1 to argv(MemReport.fieldByname('RESULT_SEC').asstring) do begin
               s1:=trim(argc(MemReport.fieldByname('RESULT_SEC').asstring,a));
               for b:=1 to length(s1) do if s1[b]='@' then s1[b]:=' ';
               if pos('MOVE',s1)>0 then begin
                   if strtofloat('0'+argc(s1,2))<>0 then begin
                     S_FROM:=strtoint('0'+argc(s1,3));
                     S_TO:=strtoint('0'+argc(s1,4));
                   end;
                   d:=0;
                   for c:=1 to CNT_MOVE do if (arr_move[c].SKL_FROM=S_FROM) and (arr_move[c].SKL_TO=S_TO) then inc(d);
                   if d=0 then begin
                        inc(CNT_MOVE);
                        ARR_MOVE[CNT_MOVE].SKL_FROM:=S_FROM;
                        ARR_MOVE[CNT_MOVE].SKL_TO:=S_TO;
                   end;
               end;
           end;
           MemReport.next;
        end;
        Wait_Form.Gauge1.Progress:=30;
        delay(1);
        if CNT_MOVE>0 then begin // Формируем заявку на перемещение
          for a:=1 to CNT_MOVE do begin
           IBSAVE_CLEAR;
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('SHOP_ID',SHOPID);
           IBSAVE_ADD('TO_ID',USERID);
           IBSAVE_ADD('TO_TXT','');
           IBSAVE_ADD('MAILVID_ID',2); // Заявка на перемещение
           IBSAVE_ADD('MAIL_TEM','На основании отчета о рекомендации к закупке'); // Заявка на закупку
           IBSAVE_ADD('MAIL_CONF',False);
           IBSAVE_ADD('MAIL_REPLY',False);
           IBSAVE_ADD('MAIL_TXT','');
           IBSAVE_ADD('MAIL_DOP1',ARR_MOVE[a].SKL_FROM);
           IBSAVE_ADD('MAIL_DOP2',ARR_MOVE[a].SKL_TO);
           IBSAVE_ADD('MAIL_NUM',NEWNUM);

           IBSAVE_ADD('VALUTA_ID',0);
           IBSAVE_ADD('POST_ID',0);
           IBSAVE_ADD('MAIL_OSN','');
           IBSAVE_ADD('SKL_ID',default_sklad);
           IBSAVE_ADD('MAILOPL_ID',ZAY_PNTYP);
           IBSAVE_ADD('PRIM1','');
           IBSAVE_ADD('PRIM2','');
           IBSAVE_ADD('MAIL_SOST',1); // в работе
           IBSAVE_ADD('OPL_US',0);
           IBSAVE_ADD('UTW_US',0);
           IBSAVE_ADD('WYP_US',0);
           IBSAVE_ADD('MAIL_ODOBR',1);
           IBSAVE_ADD('MAIL_DEL',0);
           IBSAVE_ADD('MAIL_OLD',0);
           IBSAVE_ADD('MAIL_WYP',0);
           IBSAVE_ADD('MAIL_AUTO',0);
           NEWID:=IBSAVE_DOC('MAIL',-1);
           if NEWID<0 then r:=Sqrt(-1) else begin
                // Переносим содержимое заявки на перемещение
                MemReport.first;
                while (not MemReport.eof) do begin
                   for b:=1 to argv(MemReport.fieldByname('RESULT_SEC').asstring) do begin
                      s1:=argc(MemReport.fieldByname('RESULT_SEC').asstring,b);
                      for c:=1 to length(s1) do if s1[c]='@' then s1[c]:=' ';
                      if pos('MOVE',s1)>0 then begin
                         if strtofloat('0'+argc(s1,2))<>0 then begin
                            S_FROM:=strtoint('0'+argc(s1,3));
                            S_TO:=strtoint('0'+argc(s1,4));
                            if ((S_FROM=ARR_MOVE[a].SKL_FROM) and
                                (S_TO=ARR_MOVE[a].SKL_TO)) then begin
                                // Сохраняем
                                IBSAVE_CLEAR;


                                      fq:=FastQuery.Create('SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)');
                                      fq.ParamByName('TW_ID').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
                                      fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;
                                      fq.Open;


                                      while not fq.eof do
                                      begin
                                        if fq.FieldByName('TWPRICE_TYP').asinteger=1 then
                                        begin
                                            IBSAVE_ADD('NEW_MONEY1',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                            IBSAVE_ADD('OLD_MONEY1',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                        end;
                                        if fq.FieldByName('TWPRICE_TYP').asinteger=2 then
                                        begin
                                            IBSAVE_ADD('NEW_MONEY2',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                            IBSAVE_ADD('OLD_MONEY2',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                        end;
                                        if fq.FieldByName('TWPRICE_TYP').asinteger=3 then
                                        begin
                                            IBSAVE_ADD('NEW_MONEY3',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                            IBSAVE_ADD('OLD_MONEY3',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                        end;
                                        if fq.FieldByName('TWPRICE_TYP').asinteger=4 then
                                        begin
                                            IBSAVE_ADD('NEW_MONEY4',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                            IBSAVE_ADD('OLD_MONEY4',fq.FieldByName('TWPRICE_MONEY').asfloat);
                                        end;
                                        fq.next;
                                      end;
                                      fq.close;
                                      fq.Destroy;



                                IBSAVE_ADD('MAIL_ID',NEWID);
                                IBSAVE_ADD('TW_ID',MemReport.fieldByname('TW_ID').asinteger);
                                IBSAVE_ADD('OST',MemReport.fieldByname('OST_ALL').asfloat);
                                IBSAVE_ADD('TW_KOL',strtofloat('0'+argc(s1,2)));
                                IBSAVE_ADD('TW_KOL_OLD',strtofloat('0'+argc(s1,2)));
                                IBSAVE_ADD('MONEY_ZAK',0);
                                IBSAVE_ADD('NEW_MROZ',0);
                                IBSAVE_ADD('MAILS_SPEED',MemReport.fieldByname('SPEED_ALL').asfloat);
                                IBSAVE_ADD('MAILS_PRIM','');
                                IBSAVE_ADD('OLD_MZAK',0);
                                IBSAVE_ADD('VALUTA_ID',MemReport.fieldByname('VALUTA_ID').asinteger);
                                IBSAVE_ADD('TWKTG_ID',MemReport.fieldByname('TWKTG_ID').asinteger);
                                IBSAVE_ADD('TW_RASPR',MemReport.fieldByname('TW_RASPR').asstring);
                                if IBSAVE_DOC('MAILS',-1)<0 then r:=Sqrt(-1);
                            end
                         end;
                      end;
                   end;
                   MemReport.next;
                end;
           end;
          end;
        end;
        Wait_Form.Gauge1.Progress:=70;
        NEWNUM:=NEW_MAIL_NUM(gl_SHOP_FRM, date());
        delay(1);
        if MetZAK then begin
           if Messbox('Заявка на закупку валютная!',MessSubmit,4+48+256)=6 then VALUT:=1 else VALUT:=0;
           {Формируем заявку на закупку}
           IBSAVE_CLEAR;
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('SHOP_ID',SHOPID);
           IBSAVE_ADD('TO_ID',0);
           IBSAVE_ADD('TO_TXT','');
           IBSAVE_ADD('MAILVID_ID',3); // Заявка на закупку
           IBSAVE_ADD('MAIL_TEM','На основании отчета о рекомендации к закупке'); // Заявка на закупку
           IBSAVE_ADD('MAIL_CONF',False);
           IBSAVE_ADD('MAIL_REPLY',False);
           IBSAVE_ADD('MAIL_TXT','');
           IBSAVE_ADD('MAIL_DOP1',0);
           IBSAVE_ADD('MAIL_DOP2',0);
           IBSAVE_ADD('MAIL_NUM',NEWNUM);
           
           IBSAVE_ADD('VALUTA_ID',VALUT);
           IBSAVE_ADD('POST_ID',0);
           IBSAVE_ADD('MAIL_OSN','');
           IBSAVE_ADD('SKL_ID',default_sklad);
           IBSAVE_ADD('MAILOPL_ID',ZAY_PNTYP);
           IBSAVE_ADD('PRIM1','');
           IBSAVE_ADD('PRIM2','');
           IBSAVE_ADD('MAIL_SOST',0); // в работе
           IBSAVE_ADD('OPL_US',0);
           IBSAVE_ADD('UTW_US',0);
           IBSAVE_ADD('WYP_US',0);
           IBSAVE_ADD('MAIL_ODOBR',1);
           IBSAVE_ADD('MAIL_DEL',0);
           IBSAVE_ADD('MAIL_OLD',0);
           IBSAVE_ADD('MAIL_WYP',0);
           IBSAVE_ADD('MAIL_AUTO',0);
           NEWID:=IBSAVE_DOC('MAIL',-1);
           if NEWID<0 then r:=Sqrt(-1) else begin
                // Переносим содержимое заявки на закупку
                MemReport.first;
                while (not MemReport.eof) do begin
                  if pos('ZAK',MemReport.fieldByname('RESULT_SEC').asstring)>0 then begin
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('MAIL_ID',NEWID);
                     IBSAVE_ADD('TW_ID',MemReport.fieldByname('TW_ID').asinteger);
                     IBSAVE_ADD('OST',MemReport.fieldByname('OST_ALL').asfloat);
                     s1:=argc(MemReport.fieldByname('RESULT_SEC').asstring,1);
                     for a:=1 to length(s1) do if s1[a]='@' then s1[a]:=' ';
                     IBSAVE_ADD('TW_KOL',strtofloat('0'+argc(s1,2)));
                     IBSAVE_ADD('TW_KOL_OLD',strtofloat('0'+argc(s1,2)));
                     IBSAVE_ADD('MONEY_ZAK',0);
                     IBSAVE_ADD('NEW_MROZ',MemReport.fieldByname('TW_MROZ').asfloat);
                     IBSAVE_ADD('MAILS_SPEED',MemReport.fieldByname('SPEED_ALL').asfloat);
                     IBSAVE_ADD('MAILS_PRIM','');

                    fq:=FastQuery.Create('SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)');
                    fq.ParamByName('TW_ID').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
                    fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;
                    fq.Open;


                    while not fq.eof do
                    begin
                      if fq.FieldByName('TWPRICE_TYP').asinteger=1 then
                      begin
                          IBSAVE_ADD('NEW_MONEY1',fq.FieldByName('TWPRICE_MONEY').asfloat);
                          IBSAVE_ADD('OLD_MONEY1',fq.FieldByName('TWPRICE_MONEY').asfloat);
                      end;
                      if fq.FieldByName('TWPRICE_TYP').asinteger=2 then
                      begin
                          IBSAVE_ADD('NEW_MONEY2',fq.FieldByName('TWPRICE_MONEY').asfloat);
                          IBSAVE_ADD('OLD_MONEY2',fq.FieldByName('TWPRICE_MONEY').asfloat);
                      end;
                      if fq.FieldByName('TWPRICE_TYP').asinteger=3 then
                      begin
                          IBSAVE_ADD('NEW_MONEY3',fq.FieldByName('TWPRICE_MONEY').asfloat);
                          IBSAVE_ADD('OLD_MONEY3',fq.FieldByName('TWPRICE_MONEY').asfloat);
                      end;
                      if fq.FieldByName('TWPRICE_TYP').asinteger=4 then
                      begin
                          IBSAVE_ADD('NEW_MONEY4',fq.FieldByName('TWPRICE_MONEY').asfloat);
                          IBSAVE_ADD('OLD_MONEY4',fq.FieldByName('TWPRICE_MONEY').asfloat);
                      end;
                      fq.next;
                    end;
                    fq.close;
                    fq.Destroy;


                     // Определяем последнюю закупку
                     Worktransaction.Active:=False;
                     ADD_SQL(QueryWork,'select * from last_zak_frm(:tw_id, :frm_id)');
                     QueryWork.ParamByname('tw_id').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
                     QueryWork.paramByname('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
                     QueryWork.Open;
                     if QueryWork.eof then begin
                        IBSAVE_ADD('OLD_MZAK',0);
                     end else begin
                        if VALUT=0 then IBSAVE_ADD('OLD_MZAK',QueryWork.fieldByname('TW_MONEY').asfloat)
                                   else IBSAVE_ADD('OLD_MZAK',QueryWork.fieldByname('TW_MONEYD').asfloat);
                     end;
                     IBSAVE_ADD('VALUTA_ID',MemReport.fieldByname('VALUTA_ID').asinteger);
                     IBSAVE_ADD('TWKTG_ID',MemReport.fieldByname('TWKTG_ID').asinteger);
                     IBSAVE_ADD('TW_RASPR',MemReport.fieldByname('TW_RASPR').asstring);
                     NEWID2:=IBSAVE_DOC('MAILS',-1);
                     if NEWID2<0 then r:=Sqrt(-1)
                     else begin
                        {Сохраняем минимальные остатки}
                        WorkTransaction.Active:=False;
                        Add_SQL(QueryWork,'select * from TWMIN where tw_id=:tw_id');
                        QueryWork.ParamByname('TW_ID').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
                        QueryWork.Open;
                        while not QueryWork.eof do begin
                           if QueryWork.fieldByname('TW_MIN').asinteger>0 then begin
                                IBSAVE_CLEAR;
                                IBSAVE_ADD('MAILS_ID',NEWID2);
                                IBSAVE_ADD('SKL_ID',QueryWork.fieldByname('SKL_ID').asinteger);
                                IBSAVE_ADD('RASPR',0);
                                IBSAVE_ADD('OST_MIN',QueryWork.fieldByname('TW_MIN').asinteger);
                                if IBSAVE_DOC('MAILSS',-1)<0 then r:=Sqrt(-1);
                           end;
                           QueryWork.next;
                        end;
                     end;
                  end;
                  MemReport.next;
                end;
           end;
        end;
        Wait_Form.Gauge1.Progress:=95;
        delay(1);
        ADD_SQL(DataModule1.IbSaveSQL,'DELETE FROM CFG WHERE CFG_NAME="SAVE_MIN_OST" and cfg_set1=:US_ID');
        DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.commit;
        Datamodule1.IBTransaction2.Active:=False;
        close;
     Except
           Messbox('Ошибка при экспорте решений!',MessError,16);
           Datamodule1.IBTransaction2.Rollback;
     End;
     MemReport.Enablecontrols;
     Datamodule1.IBTransaction2.Active:=False;
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
   end;

end;

procedure TReport_Min_OSt.BtnRefreshClick(Sender: TObject);
var
   s:ansistring;
   n,all:integer;

begin
   Wait_Form.StatusBar1.panels[0].text:='Чтение списка товаров...';
   Wait_Form.Gauge1.Progress:=2;
   Wait_Form.Show;
   delay(100);
   BtnSave.enabled:=False;
   BtnApply.enabled:=False;
   MnSave.enabled:=False;
   MnApply.enabled:=False;
   BtnResult.enabled:=False;
   MnResult.enabled:=False;
   BtnExport.enabled:=False;
   MnExport.enabled:=False;
   BtnAnaliz.enabled:=False;
   MnAnaliz.enabled:=False;
   BtnDetal.enabled:=False;
   MnAnaliz.enabled:=False;
   BtnMarket.enabled:=False;
   MnMarket.enabled:=False;
   CanEdit:=False;
   Timer1.enabled:=False;
   CanTimer:=false;
   BtnStop.enabled:=True;
   BtnRefresh.Enabled:=False;
   MnRefresh.enabled:=False;
   WorkTransaction.Active:=False;
   if (CheckBox1.checked) and (not Checkbox2.checked) then ADD_SQL(QueryWork,'select count(*) as cc from tw,list_twdyngroup(:dyngroup_typ, :dyngroup_id) '+
   'where tw.tw_id=list_twdyngroup.tw_id and tw.tw_brak=0');
   if (not CheckBox1.checked) and (Checkbox2.checked) then ADD_SQL(QueryWork,'select count(*) as cc from tw,list_twdyngroup(:dyngroup_typ, :dyngroup_id) '+
   'where tw.tw_id=list_twdyngroup.tw_id and not tw.tw_brak=0');
   if (CheckBox1.checked) and (Checkbox2.checked) then ADD_SQL(QueryWork,'select count(*) as cc from tw,list_twdyngroup(:dyngroup_typ, :dyngroup_id) '+
   'where tw.tw_id=list_twdyngroup.tw_id');
   QueryWork.ParamByname('dyngroup_id').asinteger:=tw_group_id;
   QueryWork.ParamByname('dyngroup_typ').asinteger:=tw_group_typ;
   QueryWork.Open;
   if QueryWork.eof then all:=0 else all:=QueryWork.fieldByname('cc').asinteger;
   if all>0 then begin
     n:=0;
     if (CheckBox1.checked) and (not Checkbox2.checked) then
     ADD_SQL(QueryWork,'select tw.tw_raspr,tw.valuta_id,tw.twktg_id,tw.tw_id from tw,list_twdyngroup(:dyngroup_typ, :dyngroup_id) '+
     'where tw.tw_id=list_twdyngroup.tw_id and tw.tw_brak=0 order by tw.tw_nam desc,tw.tw_brak desc');
     if (not CheckBox1.checked) and (Checkbox2.checked) then
     ADD_SQL(QueryWork,'select tw.tw_raspr,tw.valuta_id,tw.twktg_id,tw.tw_id from tw,list_twdyngroup(:dyngroup_typ, :dyngroup_id) '+
     'where tw.tw_id=list_twdyngroup.tw_id and not tw.tw_brak=0 order by tw.tw_nam desc,tw.tw_brak desc');
     if (CheckBox1.checked) and (Checkbox2.checked) then
     ADD_SQL(QueryWork,'select tw.tw_raspr,tw.valuta_id,tw.twktg_id,tw.tw_id from tw,list_twdyngroup(:dyngroup_typ, :dyngroup_id) '+
     'where tw.tw_id=list_twdyngroup.tw_id order by tw.tw_art,tw.tw_brak desc');
   QueryWork.ParamByname('dyngroup_id').asinteger:=tw_group_id;
   QueryWork.ParamByname('dyngroup_typ').asinteger:=tw_group_typ;
     QueryWork.Open;
     Wait_Form.StatusBar1.panels[0].text:='Расчет минимальных остатков...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);

     MemReport.EmptyTable;


     while ((not QueryWork.eof) and (BtnStop.enabled)) do begin
           inc(n);
           Wait_Form.Gauge1.Progress:=trunc(10+90*(n/all));
           application.ProcessMessages;
           //delay(1);

           ADD_SQL(QueryWork2,'select * from report_min_ost(:tw_id,:mes, :check_ost, :check_usl_rntyps, :usl_value, :rntyps )');
           QueryWork2.ParamByname('TW_ID').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
           QueryWork2.ParamByname('MES').asfloat:=MES.value;
           if checkbox3.Checked then QueryWork2.ParamByname('check_ost').asinteger:=1 else QueryWork2.ParamByname('check_ost').asinteger:=0;
           QueryWork2.ParamByname('check_usl_rntyps').asinteger:=ComboBox3.ItemIndex;
           QueryWork2.ParamByname('usl_value').asfloat:=RxSpinEdit1.Value;
           QueryWork2.ParamByname('rntyps').asstring:=RNTYP_S;





           QueryWork2.Open;



           if not QueryWork2.eof then
           if ( (VID.ItemIndex=0) or (QueryWork2.fieldByname('MET').asinteger=1))  then begin
             MemReport.Insert;
             MemReport.fieldByname('TW_ID').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
             MemReport.fieldByname('TWKTG_ID').asinteger:=QueryWork.fieldByname('TWKTG_ID').asinteger;
             MemReport.fieldByname('VALUTA_ID').asinteger:=QueryWork.fieldByname('VALUTA_ID').asinteger;
             MemReport.fieldByname('TW_RASPR').asstring:=QueryWork.fieldByname('TW_RASPR').asstring;
             MemReport.fieldByname('TW_COLOR').asinteger:=QueryWork2.fieldByname('TW_COLOR').asinteger;
             MemReport.fieldByname('TW_ART').asinteger:=QueryWork2.fieldByname('TW_ART').asinteger;
             MemReport.fieldByname('TW_NAM').asstring:=QueryWork2.fieldByname('TW_NAM').asstring;
             MemReport.fieldByname('TW_MROZ').asfloat:=QueryWork2.fieldByname('TW_MROZ').asfloat;
             MemReport.fieldByname('ED_SHORT').asstring:=QueryWork2.fieldByname('ED_SHORT').asstring;
             MemReport.fieldByname('SPEED_ALL').asfloat:=QueryWork2.fieldByname('SPEED_ALL').asfloat;
             MemReport.fieldByname('OST_ALL').asfloat:=QueryWork2.fieldByname('OST_ALL').asfloat;
             MemReport.fieldByname('MIN_ALL').asfloat:=QueryWork2.fieldByname('MIN_ALL').asfloat;
             MemReport.fieldByname('MET_MONEY_SHOP').asinteger:=QueryWork2.fieldByname('MET_MONEY_SHOP').asinteger;

             MemReport.Post;
           end;



           QueryWork.next;
     end;
   end;
   QueryWork.Close;
   MemReport.First;
   BtnStop.enabled:=False;
   BtnRefresh.Enabled:=True;
   MnRefresh.enabled:=True;
   CanTimer:=True;
   Timer1.enabled:=True;
   if MemReport.RecordCount>0 then begin
     BtnDETAL.enabled:=CHECK_DOSTUP('$DICTW.DETAL_TW');
     MnDETAL.enabled:=CHECK_DOSTUP('$DICTW.DETAL_TW');
     BtnAnaliz.enabled:=CHECK_DOSTUP('$DICTW.ANALIZ_TW');
     MnAnaliz.enabled:=CHECK_DOSTUP('$DICTW.ANALIZ_TW');
     BtnMarket.enabled:=CHECK_DOSTUP('$DICTW.MARKETING_TW');
     MnMarket.enabled:=CHECK_DOSTUP('$DICTW.MARKETING_TW');
      BtnResult.enabled:=True;
      MnResult.enabled:=True;
   end;
   Wait_Form.Hide;
end;

procedure TReport_Min_OSt.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
       WorkTransaction.Active:=False;
     end;
end;

procedure TReport_Min_OSt.BtnStopClick(Sender: TObject);
begin
     if BtnStop.enabled then BtnStop.enabled:=False;
end;

procedure TReport_Min_OSt.MemReportAfterScroll(DataSet: TDataSet);
begin
     Timer1.enabled:=False;
     Timer1.enabled:=True;
     Statusbar1.Panels[1].text:=MemReport.fieldbyname('result').asstring;
end;

procedure TReport_Min_OSt.Timer1Timer(Sender: TObject);
var
   all,a:integer;
begin
   Try
     CanEdit:=False;
     Timer1.enabled:=False;
     if Cantimer then begin
        {Строим подробный отчёт}
        MemSet.Disablecontrols;
        MemSet.EmptyTable;
        CanInsert:=True;
        MemSet.Append;
        MemSet.fieldByname('TYP').asinteger:=1;
        if speed1.checked then MemSet.fieldByname('VID').asstring:='Остаток на складе по умолчанию'
                          else MemSet.fieldByname('VID').asstring:='Остаток на складе';
        MemSet.Append;
        MemSet.fieldByname('TYP').asinteger:=2;
        if speed1.checked then MemSet.fieldByname('VID').asstring:='Скорость магазином'
                          else MemSet.fieldByname('VID').asstring:='Скорость на складе';
        MemSet.Append;
        MemSet.fieldByname('TYP').asinteger:=3;
        if speed1.checked then MemSet.fieldByname('VID').asstring:='Минимум на складе по умолчанию'
                          else MemSet.fieldByname('VID').asstring:='Минимум на складе';
        MemSet.Post;
        CanInsert:=False;
        MemSet.First;
        if Speed1.checked then begin // скорость продаж магазинами
           WorkTransaction.Active:=False;
{           ADD_SQL(QueryWork,'select shop.shop_id,shop.shop_name, '+
           '(select cfg_value from cfg where cfg_name="DEFAULT_SKLAD" and cfg_set1=shop.shop_id) as skl_id, '+
           ' (select max(tw_min) from twmin where twmin.skl_id=(select cfg_value from cfg where cfg_name="DEFAULT_SKLAD" and cfg_set1=shop.shop_id) and twmin.tw_id=:TW_ID) as twmin, '+
           ' (select ost from ost_now(:TW_ID2,(select cfg_value from cfg where cfg_name="DEFAULT_SKLAD" and cfg_set1=shop.shop_id))) as ost, '+
           ' (select sum(rns.tw_kol) from rn,rns,rntyp where rn.rn_id=rns.rn_id and rns.tw_id=:TW_ID3 '+
           ' and rn.shop_id=shop.shop_id and not rn.rn_prow=0 and rn.rntyp_id=rntyp.rntyp_id '+
           ' and not rntyp.rntyp_speed=0 and rn.rn_date between :DT1 and :DT2 ) as speed '+
           ' from shop where shop_office=0 order by shop_name ');
}
           ADD_SQL(QueryWork,'select shop.shop_id,shop.shop_name, '+
           '(select cfg_value from cfg where cfg_name="DEFAULT_SKLAD" and cfg_set1=shop.shop_id) as skl_id, '+
           ' (select max(tw_min) from twmin where twmin.skl_id=(select cfg_value from cfg where cfg_name="DEFAULT_SKLAD" and cfg_set1=shop.shop_id) and twmin.tw_id=:TW_ID) as twmin, '+
           ' (select ost from ost_now(:TW_ID2,(select cfg_value from cfg where cfg_name="DEFAULT_SKLAD" and cfg_set1=shop.shop_id))) as ost, '+
 		   ' (select sum(-reg.tw_kol) from reg where  reg.tw_id = :tw_id3 and reg.typ - 1 = 0  and reg.dt between  :dt1 and :dt2 and reg.shop_id = shop.shop_id '+
 		   ' and exists (  select rn_id from rn, rns, rntyp where rn.rn_id = rns.rn_id and rns.rns_id = reg.id and rntyp.rntyp_id = rn.rntyp_id   and rntyp.rntyp_speed = 1 )) as speed '+
           ' from shop where shop.visible+0=1 order by shop_name ');


           QueryWork.ParamByname('tw_id').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
           QueryWork.ParamByname('tw_id2').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
           QueryWork.ParamByname('tw_id3').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
           QueryWork.ParamByname('DT1').asdatetime:=now()-mes.value*30.5;
           QueryWork.ParamByname('DT2').asdatetime:=now();
           QueryWork.open;
           all:=0;
           for a:=1 to 20 do RxDbgrid1.Columns[a].title.Caption:='';
           RxDbgrid1.Columns[0].title.caption:='Вид';
           while not QueryWork.eof do begin
                 inc(all);
                 ID[all]:=QueryWork.fieldByname('SHOP_ID').asinteger;
                 SKL[all]:=QueryWork.fieldByname('SKL_ID').asinteger;
                 RxDbgrid1.Columns[all].Title.Caption:=QueryWork.fieldByname('SHOP_NAME').asstring;
                 {Читаем данные}
                 MemSet.Locate('TYP',3,[]);
                 MemSet.Edit;
                 MemSet.fieldByname('F'+inttostr(all)).asfloat:=QueryWork.fieldByname('twmin').asfloat;
                 MemSet.Post;
                 if QueryWork.fieldByname('ost').asfloat<>0 then begin
                   MemSet.Locate('TYP',1,[]);
                   MemSet.Edit;
                   MemSet.fieldByname('F'+inttostr(all)).asfloat:=QueryWork.fieldByname('ost').asfloat;
                   MemSet.Post;
                 end;
                 if QueryWork.fieldByname('speed').asfloat<>0 then begin
                   MemSet.Locate('TYP',2,[]);
                   MemSet.Edit;
                   MemSet.fieldByname('F'+inttostr(all)).asfloat:=QueryWork.fieldByname('speed').asfloat;
                   MemSet.Post;
                 end;
                 QueryWork.next;
           end;
        end else begin // Скорость продаж со склада
           WorkTransaction.Active:=False;
{           ADD_SQL(QueryWork,'select skl.skl_id,skl.skl_short,(select max(tw_min) from twmin where twmin.skl_id=skl.skl_id and twmin.tw_id=:tw_id) as twmin, '+
           ' (select ost from ost_now(:tw_id,skl.skl_id)) as ost, '+
           ' (select sum(rns.tw_kol) from rn,rns,rntyp where rn.rn_id=rns.rn_id and rns.tw_id=:tw_id2 '+
           ' and rn.skl_id=skl.skl_id and not rn.rn_prow=0 and rn.rntyp_id=rntyp.rntyp_id '+
           ' and not rntyp.rntyp_speed=0 and rn.rn_date between :DT1 and :DT2 ) as speed '+
           ' from skl where skl_speed>0 order by skl_speed ');
}

           ADD_SQL(QueryWork,'select skl.skl_id,skl.skl_short,(select max(tw_min) from twmin where twmin.skl_id=skl.skl_id and twmin.tw_id=:tw_id) as twmin, '+
           ' (select ost from ost_now(:tw_id,skl.skl_id)) as ost, '+
           ' (select sum(-reg.tw_kol) from reg where  reg.tw_id = :tw_id2 and reg.typ - 1 = 0  and reg.dt between  :dt1 and :dt2 and reg.skl_id = skl.skl_id '+
 		   ' and exists (  select rn_id from rn, rns, rntyp where rn.rn_id = rns.rn_id and rns.rns_id = reg.id and rntyp.rntyp_id = rn.rntyp_id   and rntyp.rntyp_speed = 1 )) as speed '+
           ' from skl where skl_speed>0 order by skl_speed ');






           QueryWork.ParamByname('tw_id').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
           QueryWork.ParamByname('tw_id2').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
           QueryWork.ParamByname('DT1').asdatetime:=now()-mes.value*30.5;
           QueryWork.ParamByname('DT2').asdatetime:=now();
           QueryWork.open;
           all:=0;
           for a:=1 to 20 do RxDbgrid1.Columns[a].title.Caption:='';
           RxDbgrid1.Columns[0].title.caption:='Вид';
           MemSet.Disablecontrols;
           while not QueryWork.eof do begin
                 inc(all);
                 ID[all]:=QueryWork.fieldByname('SKL_ID').asinteger;
                 SKL[all]:=QueryWork.fieldByname('SKL_ID').asinteger;
                 RxDbgrid1.Columns[all].Title.Caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
                 {Читаем данные}
                 MemSet.Locate('TYP',3,[]);
                 MemSet.Edit;
                 MemSet.fieldByname('F'+inttostr(all)).asfloat:=QueryWork.fieldByname('twmin').asfloat;
                 MemSet.Post;
                 if QueryWork.fieldByname('ost').asfloat<>0 then begin
                   MemSet.Locate('TYP',1,[]);
                   MemSet.Edit;
                   MemSet.fieldByname('F'+inttostr(all)).asfloat:=QueryWork.fieldByname('ost').asfloat;
                   MemSet.Post;
                 end;
                 if QueryWork.fieldByname('speed').asfloat<>0 then begin
                   MemSet.Locate('TYP',2,[]);
                   MemSet.Edit;
                   MemSet.fieldByname('F'+inttostr(all)).asfloat:=QueryWork.fieldByname('speed').asfloat;
                   MemSet.Post;
                 end;
                 QueryWork.next;
           end;
           MemSet.first;
           MemSet.Enablecontrols;
        end;
        MemSet.Enablecontrols;
     end;
     CanEdit:=True;
   Except
    on e: Exception do
      messbox(e.message, 'Exception', 0);
   End;
end;

procedure TReport_Min_OSt.Speed1Click(Sender: TObject);
begin
     Timer1.enabled:=False;
     Timer1.enabled:=True;
end;

procedure TReport_Min_OSt.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     Afont.color:=clWindowText;
     Background:=clWindow;
     if B_utils.Left(Field.FieldName,1)='F' then begin
       if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TYP').asinteger=3) then begin
          Background:=clWindow;
          Afont.color:=clWindow;
          if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Field.FieldName).Asfloat>0) then begin
             Afont.color:=clHighlighttext;
             Background:=clHighLight;
          end;
          if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Field.FieldName).Asfloat<0) then begin
             if OST_COLOR3>0 then begin
                Background:=OST_COLOR3;
                Afont.color:=clBlack;
             end;
          end;
       end;
       if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Field.FieldName).Asfloat>0) and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TYP').asinteger=1) then begin
          Afont.color:=clHighlighttext;
          Background:=clHighLight;
       end;
       if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Field.FieldName).Asfloat<0) and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TYP').asinteger=1) then begin
             if OST_COLOR3>0 then begin
                Background:=OST_COLOR3;
                Afont.color:=clBlack;
             end;
       end;
     end;
end;

procedure TReport_Min_OSt.DsSetDataChange(Sender: TObject; Field: TField);
begin
     if (MemSet.State in [dsInsert]) and ( not CanInsert) then MemSet.Cancel;
end;

procedure TReport_Min_OSt.MemSetF1Change(Sender: TField);
var
   ID,N:integer;
begin
     if (CanEdit) and (MemSet.FieldByname('TYP').asinteger=3) then begin
        {Сохраняем распределение}
        N:=strtoint(B_utils.right(Sender.FieldName,length(Sender.FieldName)-1));
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select max(TWMIN_ID) as twmin_id from TWMIN where TW_ID=:TW_ID and SKL_ID=:SKL_ID');
        QueryWork.paramByname('TW_ID').asinteger:=MemReport.fieldByname('TW_ID').asinteger;
        QueryWork.paramByname('SKL_ID').asinteger:=SKL[N];
        QueryWork.Open;
        if QueryWork.eof then ID:=-1 else ID:=QueryWork.fieldByname('TWMIN_ID').asinteger;
        if ID=0 then id:=-1;

        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        try
          IBSAVE_CLEAR;
          IBSAVE_ADD('TW_ID',MemReport.fieldByname('TW_ID').asinteger);
          IBSAVE_ADD('SKL_ID',SKL[N]);
          IBSAVE_ADD('TW_MIN',MemSet.fieldByname(Sender.FieldName).asfloat);
          IBSAVE_DOC('TWMIN',ID);
          Datamodule1.IBTransaction2.commit;
        Except
          Datamodule1.IBTransaction2.Rollback;
        end;
        Datamodule1.IBTransaction2.Active:=False;
        QueryWork.Close;
        WorkTransaction.Active:=False;
        MemReport.Edit;
        MemReport.fieldByname('MIN_ALL').asfloat:=
          MemSet.FieldByname('F1').asfloat+
          MemSet.FieldByname('F2').asfloat+
          MemSet.FieldByname('F3').asfloat+
          MemSet.FieldByname('F4').asfloat+
          MemSet.FieldByname('F5').asfloat+
          MemSet.FieldByname('F6').asfloat+
          MemSet.FieldByname('F7').asfloat+
          MemSet.FieldByname('F8').asfloat+
          MemSet.FieldByname('F9').asfloat+
          MemSet.FieldByname('F10').asfloat+
          MemSet.FieldByname('F11').asfloat+
          MemSet.FieldByname('F12').asfloat+
          MemSet.FieldByname('F13').asfloat+
          MemSet.FieldByname('F14').asfloat+
          MemSet.FieldByname('F15').asfloat+
          MemSet.FieldByname('F16').asfloat+
          MemSet.FieldByname('F17').asfloat+
          MemSet.FieldByname('F18').asfloat+
          MemSet.FieldByname('F19').asfloat+
          MemSet.FieldByname('F20').asfloat;
        MemReport.Post;
     end;
end;

procedure TReport_Min_OSt.BtnResultClick(Sender: TObject);
var
   s:ansistring;
   a,b,c:integer;
   s1,s2,s3:ansistring;
begin
     Application.createForm(TREPORT_MIN_RESULT,REPORT_MIN_RESULT);
     with REPORT_MIN_RESULT do begin
          Edit1.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit2.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit3.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit4.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit5.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit6.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit7.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit8.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit9.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit10.text:=MemReport.fieldByname('ED_SHORT').asstring;
          Edit11.text:=MemReport.fieldByname('ED_SHORT').asstring;
          ZAK.Value:=0;
          MOVE1.value:=0; MOVE2.value:=0; MOVE3.value:=0; MOVE4.value:=0; MOVE5.value:=0;
          MOVE6.value:=0; MOVE7.value:=0; MOVE8.value:=0; MOVE9.value:=0; MOVE10.value:=0;
          SHOP1_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP1_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP2_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP2_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP3_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP3_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP4_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP4_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP5_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP5_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP6_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP6_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP7_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP7_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP8_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP8_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP9_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP9_2.Value:=inttostr(DEFAULT_SKLAD);
          SHOP10_1.Value:=inttostr(DEFAULT_SKLAD);  SHOP10_2.Value:=inttostr(DEFAULT_SKLAD);
     end;
     {Заполняем, если имеется}
     if pos('ZAK',MemReport.fieldByname('RESULT_SEC').asstring)>0 then begin
         // есть закупка
         s1:=argc(MemReport.fieldByname('RESULT_SEC').asstring,1);
         for a:=1 to length(s1) do if s1[a]='@' then s1[a]:=' ';
         REPORT_MIN_RESULT.ZAK.value:=strtofloat('0'+argc(s1,2));
     end;
     for a:=1 to argv(MemReport.fieldByname('RESULT_SEC').asstring) do begin
         s1:=argc(MemReport.fieldByname('RESULT_SEC').asstring,a);
         for b:=1 to length(s1) do if s1[b]='@' then s1[b]:=' ';
         if pos('MOVE1 ',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE1.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP1_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP1_2.value:=argc(s1,4);
         end;
         if pos('MOVE2',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE2.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP2_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP2_2.value:=argc(s1,4);
         end;
         if pos('MOVE3',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE3.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP3_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP3_2.value:=argc(s1,4);
         end;
         if pos('MOVE4',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE4.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP4_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP4_2.value:=argc(s1,4);
         end;
         if pos('MOVE5',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE5.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP5_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP5_2.value:=argc(s1,4);
         end;
         if pos('MOVE6',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE6.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP6_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP6_2.value:=argc(s1,4);
         end;
         if pos('MOVE7',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE7.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP7_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP7_2.value:=argc(s1,4);
         end;
         if pos('MOVE8',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE8.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP8_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP8_2.value:=argc(s1,4);
         end;
         if pos('MOVE9',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE9.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP9_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP9_2.value:=argc(s1,4);
         end;
         if pos('MOVE10',s1)>0 then begin
            REPORT_MIN_RESULT.MOVE10.value:=strtofloat('0'+argc(s1,2));
            REPORT_MIN_RESULT.SHOP10_1.value:=argc(s1,3);
            REPORT_MIN_RESULT.SHOP10_2.value:=argc(s1,4);
         end;
     end;
     REPORT_MIN_RESULT.showModal;
     REPORT_MIN_RESULT.Destroy;
     if MemReport.fieldByname('RESULT_SEC').asstring<>'' then begin
       BtnSave.enabled:=True;
       BtnApply.enabled:=True;
       MnSave.enabled:=True;
       MnApply.enabled:=True;
       BtnExport.enabled:=True;
       MnExport.enabled:=True;
     end;

end;

procedure TReport_Min_OSt.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
   if MemReport.recordcount>0 then begin
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     if Field.Fieldname='OST_ALL' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MIN_ALL').Asfloat)
           and (OST_COLOR1>0) then Background:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MIN_ALL').Asfloat)
           and (OST_COLOR2>0) then Background:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat=0)
           and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MIN_ALL').Asfloat>0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
     end;

     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
      if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MIN_ALL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MIN_ALL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST_ALL').Asfloat=0)
           and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MIN_ALL').Asfloat>0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;
     end;

     Afont.Style:=[];
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').AsInteger=1) and
     (Field.Fieldname='TW_MROZ') then begin
        BackGround:=$009FFF9F;
        Afont.Style:=[FsBold];
        Afont.color:=ClGreen;
     end;

   end;
end;

procedure TReport_Min_OSt.BtnDetalClick(Sender: TObject);
begin
   show_detal_tw(MemReport.fieldbyname('TW_ID').asinteger);
end;

procedure TReport_Min_OSt.BtnAnalizClick(Sender: TObject);
begin
  show_analiz_tw(MemReport.fieldbyname('TW_ID').asinteger);
end;

procedure TReport_Min_OSt.BtnMarketClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemReport.fieldbyname('TW_ID').asinteger);
end;

procedure TReport_Min_OSt.RxDBGrid2DblClick(Sender: TObject);
begin
     if BtnResult.enabled then BtnResult.click;
end;

procedure TReport_Min_OSt.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key=#13) and (BtnResult.enabled) then BtnResult.click;
end;

procedure TReport_Min_OSt.MemReportAfterPost(DataSet: TDataSet);
begin
     SAVE2:=False;
     Statusbar1.Panels[1].text:=MemReport.fieldbyname('result').asstring;
end;

procedure TReport_Min_OSt.FormActivate(Sender: TObject);
var
   InTree:integer;
   a,b,c:integer;
   s:ansistring;
begin
   inc(_2STEP);
   if _2STEP=1 then begin
     BtnSave.enabled:=False;
     BtnApply.enabled:=False;
     MnSave.enabled:=False;
     MnApply.enabled:=False;
     BtnExport.enabled:=False;
     MnExport.enabled:=False;
     BtnResult.enabled:=False;
     MnResult.enabled:=False;
     BtnAnaliz.enabled:=False;
     MnAnaliz.enabled:=False;
     BtnDetal.enabled:=False;
     MnAnaliz.enabled:=False;
     BtnMarket.enabled:=False;
     MnMarket.enabled:=False;
     CanEdit:=False;
     RxDbgrid1.Height:=20*(5)+6;
     Timer1.enabled:=False;
     CanTimer:=False;
     TW.text:='Все товары!';
     BtnStop.enabled:=False;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.DesktopWidth;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
     VID.itemindex:=0;
     MES.value:=2;
     TW1.checked:=True;
     TW.tag:=0;




     TW2Click(Sender);
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWOrk,'select * FROM CFG WHERE CFG_NAME="SAVE_MIN_OST" and cfg_set1=:US_ID and cfg_set2>1');
     QueryWOrk.ParamByname('US_ID').asinteger:=USERID;
     QueryWOrk.open;
     if not QueryWOrk.eof then  begin
        {Загружаем установки}
        if QueryWork.locate('CFG_SET2',2,[]) then begin
           tw_group_id:=QueryWork.fieldByname('CFG_VALUE').asinteger;
           if QueryWork.locate('CFG_SET2',21,[])
           then tw_group_typ:=QueryWork.fieldByname('CFG_VALUE').asinteger;


           if tw_group_id> 0 then
            tw2.checked:=true;


           {Загружаем название}
           if tw_group_typ=3 then
             ADD_SQL(QueryWork2,'SELECT TWTREE_FULL from TWTREE where TWTREE_ID=:TWTREE_ID')
           else
             ADD_SQL(QueryWork2,'SELECT TWDYNGROUP_NAM TWTREE_FULL from TWDYNGROUP where TWDYNGROUP_ID=:TWTREE_ID');

           QueryWork2.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
           QueryWork2.Open;
           if not QueryWork2.eof then TW.text:=QueryWork2.fieldByname('TWTREE_FULL').asstring;
           QueryWork2.Close;
        end;
        if QueryWork.locate('CFG_SET2',3,[]) then MES.value:=QueryWork.fieldByname('CFG_VALUE').asfloat;
        if QueryWork.locate('CFG_SET2',4,[]) then begin
           if QueryWork.fieldByname('CFG_VALUE').asinteger=1 then speed1.checked:=true else speed2.checked:=True;
        end;
        if QueryWork.locate('CFG_SET2',5,[]) then VID.itemindex:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        if QueryWork.locate('CFG_SET2',6,[]) then begin
           if QueryWork.fieldByname('CFG_VALUE').asinteger=1 then CheckBox1.checked:=true else CheckBox1.checked:=False;
        end;
        if QueryWork.locate('CFG_SET2',7,[]) then begin
           if QueryWork.fieldByname('CFG_VALUE').asinteger=1 then CheckBox2.checked:=true else CheckBox2.checked:=False;
        end;
        delay(1);
        BtnRefresh.click;
        ADD_SQL(QueryWOrk,'select * FROM CFG WHERE CFG_NAME="SAVE_MIN_OST" and cfg_set1=:US_ID and cfg_set2=1');
        QueryWOrk.ParamByname('US_ID').asinteger:=USERID;
        QueryWOrk.open;
        MemReport.disablecontrols;
        if not QueryWOrk.eof then BtnExport.enabled:=True;
        while not QueryWOrk.eof do begin
              BtnExport.enabled:=True;
              if MemReport.locate('TW_ID',QueryWork.fieldByname('CFG_SET3').asinteger,[]) then begin
                 MemReport.Edit;
                 MemReport.fieldByname('result').asstring:=QueryWork.fieldByname('CFG_BIG').asstring;
                 MemReport.fieldByname('result_sec').asstring:=QueryWork.fieldByname('CFG_VALUE').asstring;
                 MemReport.Post;
              end;
              QueryWOrk.next;
        end;
        QueryWOrk.Close;
        MemReport.First;
        MemReport.Enablecontrols;
        Delay(1);
     end;
     Save2:=True;
   end;
end;

procedure TReport_Min_OSt.FormCreate(Sender: TObject);
begin
        _2STEP:=0;
end;

procedure TReport_Min_OSt.CheckBox1Click(Sender: TObject);
begin
     if (not Checkbox1.checked) and (not Checkbox2.checked)
     then Checkbox1.checked:=True;
end;

procedure TReport_Min_OSt.ComboBox3Change(Sender: TObject);
begin
  if ComboBox3.ItemIndex=0 then
  begin
    rxSpinEdit1.Visible:=false;
    Edit1.Visible:=false;
    BitBtn1.Visible:=false;
    Label7.Visible:=false;
  end
  else
  begin
    rxSpinEdit1.Visible:=true;
    Edit1.Visible:=true;
    BitBtn1.Visible:=true;
    Label7.Visible:=true;
  end;

end;

procedure TReport_Min_OSt.FormShow(Sender: TObject);
var s, s4: string;
  a: integer;
begin
{Заполняем DualListDialog}
     s4:='';
     s:='%';

     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do
     begin
        DualListDialog1.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
        s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
        s:=s+QueryWork.fieldByname('RNTYP_ID').asstring+'%';
        QueryWork.next;
     end;



     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;
     RNTYP_S := s;

     ComboBox3.ItemIndex:=0;


     tw_group_id:=0;
     tw_group_typ:=3;

end;

procedure TReport_Min_OSt.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP order by RNTYP_ID');
     s:='%';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+QueryWork.fieldByname('RNTYP_ID').asstring+'%';
                 s2:=s2+''+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TReport_Min_OSt.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw2.Checked:=true;
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

end.
