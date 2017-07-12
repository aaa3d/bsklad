unit DocZRemon;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,
  VclUtils, ActnList, StdCtrls, Mask, ToolEdit, Db, RxLookup, RxMemDS,
  IBDatabase, IBCustomDataSet, IBQuery,WaitForm, Placemnt, RXSplit, ImgList,
  RXSpin;

type
  TDOC_ZREMON = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    Panel2: TPanel;
    ActionList1: TActionList;
    Label1: TLabel;
    Label2: TLabel;
    USER: TEdit;
    ZREMON_NUM: TEdit;
    ZREMON_DATE: TDateEdit;
    Label4: TLabel;
    ZREMON_OSN: TMemo;
    ZREMON_OSN2: TMemo;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    RxDBGrid2: TRxDBGrid;
    ActSave: TAction;
    ActApply: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    MemDop: TRxMemoryData;
    MemDopSTAT_ID: TIntegerField;
    MemDopSTAT_NAME: TStringField;
    ZREMON_STAT: TRxDBLookupCombo;
    DsDop: TDataSource;
    MemZRemons: TRxMemoryData;
    DsZRemons: TDataSource;
    MemZRemonsZREMONS_ID: TIntegerField;
    MemZRemonsMET: TIntegerField;
    MemZRemonsTW_ID: TIntegerField;
    MemZRemonsTW_ART: TIntegerField;
    MemZRemonsTW_NAM: TStringField;
    MemZRemonsED_SHORT: TStringField;
    MemZRemonsTWKTG_COLOR: TIntegerField;
    MemZRemonsOLD_MROZ: TFloatField;
    MemZRemonsNEW_MROZ: TFloatField;
    MemZRemonsUTW_MROZ: TFloatField;
    MemZRemonsOLD_OPT1: TFloatField;
    MemZRemonsNEW_OPT1: TFloatField;
    MemZRemonsUTW_OPT1: TFloatField;
    MemZRemonsOLD_OPT2: TFloatField;
    MemZRemonsNEW_OPT2: TFloatField;
    MemZRemonsUTW_OPT2: TFloatField;
    MemZRemonsOLD_OPT3: TFloatField;
    MemZRemonsNEW_OPT3: TFloatField;
    MemZRemonsUTW_OPT3: TFloatField;
    MemZRemonsOLD_OPT4: TFloatField;
    MemZRemonsCOMMENT1: TStringField;
    MemZRemonsLAST_SEB1: TFloatField;
    MemZRemonsLAST_SEB2: TFloatField;
    MemZRemonsLAST_DT: TDateField;
    MemZRemonsLAST_DAYS: TIntegerField;
    MemZRemonsLAST_KOL: TFloatField;
    MemZRemonsCOMMENT2: TStringField;
    MemZRemonsOST: TFloatField;
    MemZRemonsSpeed1: TFloatField;
    MemZRemonsSpeed2: TFloatField;
    MemZRemonsSpeed3: TFloatField;
    IBQuery1: TIBQuery;
    Query1Transaction: TIBTransaction;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DicTW: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActDetal: TAction;
    ActAnaliz: TAction;
    ActMarketing: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ActLock: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ActDel: TAction;
    ToolButton11: TToolButton;
    ActPrint: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ActHistory: TAction;
    MemDopROZN: TFloatField;
    MemDopMOPT: TFloatField;
    MemDopOPT: TFloatField;
    MemDopKOPT: TFloatField;
    MemDopSPEC: TFloatField;
    MemDopDAY: TIntegerField;
    MemStat: TRxMemoryData;
    MemStatSTAT_ID: TIntegerField;
    MemStatSTAT_NAME: TStringField;
    DsStat: TDataSource;
    MemDopDT: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    MemDopseb: TStringField;
    Panel5: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    MemZRemonsS_SEB1: TStringField;
    MemZRemonsS_SEB2: TStringField;
    MemZRemonsS_DT: TStringField;
    MemZRemonsS_DAYS: TStringField;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ActRefresh: TAction;
    ActOk: TAction;
    ToolButton17: TToolButton;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    ZREMON_SHOP: TRxDBLookupCombo;
    SHOP2: TRadioButton;
    SHOP1: TRadioButton;
    MemZRemonsMET_MONEY_SHOP: TIntegerField;
    btnSelectTWDynSet: TToolButton;
    btnSelectTWSet: TToolButton;
    ToolButton20: TToolButton;
    GroupBox2: TGroupBox;
    price_dest: TComboBox;
    price_PERCENT: TRxSpinEdit;
    price_source: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    price_round_type: TComboBox;
    Label9: TLabel;
    MemZRemonsnew_opt4: TFloatField;
    MemZRemonsutw_opt4: TFloatField;
    MemZRemonsmoney5: TFloatField;
    MemDopakziya: TFloatField;
    Label25: TLabel;
    Edit3: TEdit;
    Label26: TLabel;
    Edit4: TEdit;
    Label27: TLabel;
    Edit5: TEdit;
    Label11: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    PriceDestUtw: TComboBox;
    MemZRemonsOLD_OPT6: TFloatField;
    MemZRemonsNEW_OPT6: TFloatField;
    MemZRemonsUTW_OPT6: TFloatField;
    MemDopspec2: TFloatField;
    Label12: TLabel;
    Edit8: TEdit;
    Label13: TLabel;
    Edit9: TEdit;
    Label14: TLabel;
    Edit10: TEdit;
    MemDopmoney7: TFloatField;
    MemDopmoney8: TFloatField;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure show_sost;
    procedure refresh_summ;
    procedure ADD_ZREMONS(tw_id:integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DsZRemonsDataChange(Sender: TObject; Field: TField);
    procedure DicTWExecute(Sender: TObject);
    procedure ActDetalExecute(Sender: TObject);
    procedure ActAnalizExecute(Sender: TObject);
    procedure ActMarketingExecute(Sender: TObject);
    procedure ActLockExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure DsDopDataChange(Sender: TObject; Field: TField);
    procedure MemZRemonsAfterPost(DataSet: TDataSet);
    procedure ZREMON_DATEChange(Sender: TObject);
    procedure MemZRemonsCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActRefreshExecute(Sender: TObject);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ZREMON_STATChange(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MemZRemonsUTW_MROZChange(Sender: TField);
    procedure SHOP1Click(Sender: TObject);
    procedure ZREMON_SHOPChange(Sender: TObject);
    procedure refresh_mroz;
    procedure btnSelectTWDynSetClick(Sender: TObject);
    procedure btnSelectTWSetClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Can_Utw:boolean;
  PREV_STAT:integer;
  CanRefresh:boolean;
  SAVE:boolean;
  CanInsert:boolean;
  CanInsertDop:boolean;
  DOC_ZREMON: TDOC_ZREMON;
  ZREMON_NUMS:integer;
  USER_ID:integer;
  Sost:integer=0;
  STR:ansistring='';
  ZREMONS_DEL:array[1..10000] of integer;
  ZREMONS_DEL_MESS:array[1..10000] of string;
  CNT_DEL:integer=0;
  SHOP_ID:integer;
  ZSTAT:integer;

implementation

uses Mainform, DicTowar, DicTwDynGroup;

{$R *.DFM}

procedure TDOC_ZREMON.ActSaveExecute(Sender: TObject);
begin
   // Сохранить
     SAVE:=false;
     ActApply.Execute;
     if SAVE then begin
        Close;
     end;
end;

procedure TDOC_ZREMON.ActApplyExecute(Sender: TObject);
var
   A,ZREMON_ID,ID,OLDID:integer;
   r,IDR:double;
   warnString: string;

   warnCount: integer;


begin
     if (MemZremons.State in [dsInsert,DsEdit]) then MemZremons.Post;

     {проверим что цены правильные (розн больше чем опт больше чем кр. опт больше чем спец больше чем закупка}

     if strtoint(ZREMON_STAT.value)=1 then
     begin
       memZRemons.DisableControls;
       memZRemons.First;




       warnString:='Новые цены'+chr(10);
       warnCount:=0;
       while not memZRemons.eof do
       begin
        if memZRemons.FieldByName('new_mroz').asfloat<memZRemons.FieldByName('new_opt1').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': розничная цена ниже оптовой'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('new_opt1').asfloat<memZRemons.FieldByName('new_opt2').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': оптовая цена ниже крупнооптовой'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('new_opt2').asfloat<memZRemons.FieldByName('new_opt3').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': крупнооптовая цена ниже спец-цены'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('new_opt3').asfloat<=memZRemons.FieldByName('money5').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': спец-цена цена ниже или равна цене закупки'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('new_mroz').asfloat<=memZRemons.FieldByName('money5').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': розничная цена ниже или равна цене закупки'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;


        memZRemons.next;
       end;

       memZremons.EnableControls;


       if warnCount>0 then
        messBox(warnString, messSystem, 48);
     end;


     if strtoint(ZREMON_STAT.value)=2 then
     begin
       memZRemons.DisableControls;
       memZRemons.First;




       warnString:='Утвержденые цены'+chr(10);
       warnCount:=0;
       while not memZRemons.eof do
       begin
        if memZRemons.FieldByName('utw_mroz').asfloat<memZRemons.FieldByName('utw_opt1').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': розничная цена ниже оптовой'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('utw_opt1').asfloat<memZRemons.FieldByName('utw_opt2').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': оптовая цена ниже крупнооптовой'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('utw_opt2').asfloat<memZRemons.FieldByName('utw_opt3').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': крупнооптовая цена ниже спец-цены'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('utw_opt3').asfloat<=memZRemons.FieldByName('money5').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': спец-цена цена ниже или равна цене закупки'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;

        if memZRemons.FieldByName('utw_mroz').asfloat<=memZRemons.FieldByName('money5').asfloat then
        begin
          inc(warnCount);
          if warnCount<20 then
             warnString:=warnString+memZRemons.FieldByName('tw_art').asstring+' '+memZRemons.FieldByName('tw_nam').asstring+': розничная цена ниже или равна цене закупки'+chr(13)
          else
          begin
              warnString:='и это не все.....';
              break;
          end;
        end;


        memZRemons.next;
       end;

       memZremons.EnableControls;


       if warnCount>0 then
        messBox(warnString, messSystem, 48);
     end;



     {Сохраняем документа (Apply)}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemZremons.recno;
     Try
        IBSAVE_CLEAR;
        if ZREMON_NUMS<0 then ZREMON_NUMS:=NEW_ZREMON_NUM(ZREMON_DATE.date);
        IBSAVE_ADD('SHOP_ID',SHOP_ID);
        if SHOP1.Checked then IBSAVE_ADD('ZREMON_SHOP',0)
        else IBSAVE_ADD('ZREMON_SHOP',strtoint(ZREMON_SHOP.value));
        IBSAVE_ADD('ZREMON_NUM',ZREMON_NUMS);
        IBSAVE_ADD('ZREMON_DATE',strtodatetime(datetostr(ZREMON_DATE.date)+' '+timetostr(time())));
        IBSAVE_ADD('US_ID',USER_ID); // записываем пользователя, который изначально создавал документ
        IBSAVE_ADD('ZREMON_OSN',ZREMON_OSN.text);
        IBSAVE_ADD('ZREMON_STAT',ZSTAT);
        IBSAVE_ADD('ZREMON_OSN2',ZREMON_OSN2.text);
        ZREMON_ID:=IBSAVE_DOC('ZREMON',DOC_ZREMON.tag);
        if ZREMON_ID<=0 then IDR:=SQRT(-1)
        else begin
             // Фиксируем удаление товаров
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','ZREMON');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',ZREMONS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',ZREMON_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if ZREMONS_DEL[A]>0 then if not IBDELETE_DOC('ZREMONS',ZREMONS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemZREMONS.DisableControls;
             MemZREMONS.First;
             while not MemZREMONS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('ZREMON_ID',ZREMON_ID);
                   IBSAVE_ADD('MET',MemZREMONS.fieldbyname('MET').asinteger);
                   IBSAVE_ADD('TW_ID',MemZREMONS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('OLD_MROZ',MemZREMONS.fieldbyname('OLD_MROZ').asfloat);
                   IBSAVE_ADD('NEW_MROZ',MemZREMONS.fieldbyname('NEW_MROZ').asfloat);
                   IBSAVE_ADD('UTW_MROZ',MemZREMONS.fieldbyname('UTW_MROZ').asfloat);
                   IBSAVE_ADD('OLD_OPT1',MemZREMONS.fieldbyname('OLD_OPT1').asfloat);
                   IBSAVE_ADD('NEW_OPT1',MemZREMONS.fieldbyname('NEW_OPT1').asfloat);
                   IBSAVE_ADD('UTW_OPT1',MemZREMONS.fieldbyname('UTW_OPT1').asfloat);
                   IBSAVE_ADD('OLD_OPT2',MemZREMONS.fieldbyname('OLD_OPT2').asfloat);
                   IBSAVE_ADD('NEW_OPT2',MemZREMONS.fieldbyname('NEW_OPT2').asfloat);
                   IBSAVE_ADD('UTW_OPT2',MemZREMONS.fieldbyname('UTW_OPT2').asfloat);
                   IBSAVE_ADD('OLD_OPT3',MemZREMONS.fieldbyname('OLD_OPT3').asfloat);
                   IBSAVE_ADD('NEW_OPT3',MemZREMONS.fieldbyname('NEW_OPT3').asfloat);
                   IBSAVE_ADD('UTW_OPT3',MemZREMONS.fieldbyname('UTW_OPT3').asfloat);
                   IBSAVE_ADD('OLD_OPT4',MemZREMONS.fieldbyname('OLD_OPT4').asfloat);
                   IBSAVE_ADD('NEW_OPT4',MemZREMONS.fieldbyname('NEW_OPT4').asfloat);
                   IBSAVE_ADD('UTW_OPT4',MemZREMONS.fieldbyname('UTW_OPT4').asfloat);
                   IBSAVE_ADD('OLD_OPT6',MemZREMONS.fieldbyname('OLD_OPT6').asfloat);
                   IBSAVE_ADD('NEW_OPT6',MemZREMONS.fieldbyname('NEW_OPT6').asfloat);
                   IBSAVE_ADD('UTW_OPT6',MemZREMONS.fieldbyname('UTW_OPT6').asfloat);
                   IBSAVE_ADD('OLD_OPT7',MemZREMONS.fieldbyname('OLD_OPT7').asfloat);
                   IBSAVE_ADD('NEW_OPT7',MemZREMONS.fieldbyname('NEW_OPT7').asfloat);
                   IBSAVE_ADD('UTW_OPT7',MemZREMONS.fieldbyname('UTW_OPT7').asfloat);
                   IBSAVE_ADD('OLD_OPT8',MemZREMONS.fieldbyname('OLD_OPT8').asfloat);
                   IBSAVE_ADD('NEW_OPT8',MemZREMONS.fieldbyname('NEW_OPT8').asfloat);
                   IBSAVE_ADD('UTW_OPT8',MemZREMONS.fieldbyname('UTW_OPT8').asfloat);
                   IBSAVE_ADD('money5',MemZREMONS.fieldbyname('money5').asfloat);
                   IBSAVE_ADD('COMMENT1',MemZREMONS.fieldbyname('COMMENT1').asstring);
                   IBSAVE_ADD('LAST_SEB1',MemZREMONS.fieldbyname('LAST_SEB1').asfloat);
                   IBSAVE_ADD('LAST_SEB2',MemZREMONS.fieldbyname('LAST_SEB2').asfloat);
                   IBSAVE_ADD('LAST_DT',MemZREMONS.fieldbyname('LAST_DT').asdatetime);
                   IBSAVE_ADD('LAST_DAYS',MemZREMONS.fieldbyname('LAST_DAYS').asinteger);
                   IBSAVE_ADD('LAST_KOL',MemZREMONS.fieldbyname('LAST_KOL').asfloat);
                   IBSAVE_ADD('COMMENT2',MemZREMONS.fieldbyname('COMMENT2').asstring);
                   IBSAVE_ADD('SPEED1',MemZREMONS.fieldbyname('SPEED1').asfloat);
                   IBSAVE_ADD('SPEED2',MemZREMONS.fieldbyname('SPEED2').asfloat);
                   IBSAVE_ADD('SPEED3',MemZREMONS.fieldbyname('SPEED3').asfloat);
                   IBSAVE_ADD('OST',MemZREMONS.fieldbyname('OST').asfloat);
                   ID:=IBSAVE_DOC('ZREMONS',MemZREMONS.fieldbyname('ZREMONS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_ZREMON.tag>0) and (MemZREMONS.fieldbyname('ZREMONS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','ST');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен товар: '+MemZREMONS.Fieldbyname('TW_ART').asstring+' '+
                          MemZREMONS.Fieldbyname('TW_NAM').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',ZREMON_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemZREMONS.Edit;
                      MemZREMONS.fieldbyname('ZREMONS_ID').asinteger:=ID;
                      MemZREMONS.Post;
                   end;
                   MemZREMONS.next;
             end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_ZREMON.tag:=ZREMON_ID;
        ZREMON_NUM.text:=b_utils.right('0000000000'+inttostr(ZREMON_NUMS),10);
        MemZREMONS.First;
        while not MemZREMONS.eof do begin
              if MemZREMONS.fieldbyname('ZREMONS_ID').asinteger<0 then begin
                 MemZREMONS.Edit;
                 MemZREMONS.fieldbyname('ZREMONS_ID').asinteger:=-MemZREMONS.fieldbyname('ZREMONS_ID').asinteger;
                 MemZREMONS.Post;
              end;
              MemZREMONS.next;
        end;
        MemZREMONS.First;
        for a:=1 to OLDID-1 do MemZREMONS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemZREMONS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
     Except
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

procedure TDOC_ZREMON.FormShow(Sender: TObject);
begin
     Can_Utw:=Check_Dostup('$JOU.ZREMON.UTW');
     // Начальное заполнение таблицы MemDop
     CanInsertDop:=true;
     CanRefresh:=true;
     MemDop.EmptyTable;
     MemDop.Append;
     MemDop.fieldByname('stat_name').asstring:='Текущая';
     MemDop.Append;
     MemDop.fieldByname('stat_name').asstring:='Новая';
     MemDop.Append;
     MemDop.fieldByname('stat_name').asstring:='Утвержденная';
     MemDop.post;
     MemZremons.EmptyTable;
     CanInsert:=false;
     CanInsertDop:=false;
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-28;
     if tag<0 then begin
        // Новый документ

        PREV_STAT:=1; // Предудущее состояние - в работе
        SHOP_ID:=SHOPID;
        ZREMON_NUMS:=-1;
        ZREMON_NUM.text:='Новый';
        ZREMON_DATE.date:=date();
        // Заполняем ZREMON_STAT
        MemStat.append;
        MemStat.fieldByname('STAT_ID').asinteger:=1;
        MemStat.fieldByname('STAT_NAME').asstring:='В работе';
        MemStat.append;
        MemStat.fieldByname('STAT_ID').asinteger:=2;
        MemStat.fieldByname('STAT_NAME').asstring:='Готово к утверждению';
        MemStat.append;
        MemStat.fieldByname('STAT_ID').asinteger:=22;
        MemStat.fieldByname('STAT_NAME').asstring:='Готово к утверждению (ниже закупки)';

        if CHECK_DOSTUP('$JOU.ZREMON.UTW') then
        begin
          MemStat.append;
          MemStat.fieldByname('STAT_ID').asinteger:=23;
          MemStat.fieldByname('STAT_NAME').asstring:='На утверждении';
          MemStat.Post;
        end;
        ZREMON_STAT.Value:='1';
        USER.text:=USERFIO;
        USER_ID:=USERID;
        ZREMON_OSN.text:='';
        ZREMON_OSN2.text:='';
        sost:=1;
        ZREMON_SHOP.value:=inttostr(SHOPID);
        SHOP1.checked:=true;

     end else begin
       // Изменияем документ
        CanRefresh:=False;
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select zremon.*,(select klN_full from kln_data(zremon.us_id)) as us_full from zremon where zremon_id=:ID');
        QueryWork.paramByname('ID').asinteger:=tag;
        QueryWork.Open;
        if QueryWork.fieldByname('ZREMON_SHOP').asinteger=0 then begin
          SHOP1.checked:=true;
          ZREMON_SHOP.value:=inttostr(SHOPID);
        end else begin
          SHOP2.checked:=true;
          ZREMON_SHOP.value:=QueryWork.fieldByname('ZREMON_SHOP').asstring;
        end;
        SHOP_ID:=QueryWork.fieldByname('SHOP_ID').asinteger;
        ZREMON_NUMS:=QueryWork.fieldByname('ZREMON_NUM').asinteger;
        ZREMON_NUM.text:=b_utils.right('0000000000'+QueryWork.fieldByname('ZREMON_NUM').asstring,10);
        ZREMON_DATE.date:=QueryWork.fieldByname('ZREMON_DATE').asdatetime;
        USER_ID:=QueryWork.fieldByname('US_ID').asinteger;
        USER.text:=QueryWork.fieldByname('US_FULL').asstring;
        ZREMON_OSN.text:=QueryWork.fieldByname('ZREMON_OSN').asstring;
        ZREMON_OSN2.text:=QueryWork.fieldByname('ZREMON_OSN2').asstring;
        PREV_STAT:=QueryWork.fieldByname('ZREMON_STAT').asinteger; 
        MemStat.emptyTable;
        case QueryWork.fieldByname('ZREMON_STAT').asinteger of
           1,2,22,23: // В работе, готово к утверждению
             begin
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=1;
                MemStat.fieldByname('STAT_NAME').asstring:='В работе';
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=2;
                MemStat.fieldByname('STAT_NAME').asstring:='Готово к утверждению';
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=22;
                MemStat.fieldByname('STAT_NAME').asstring:='Готово к утверждению (ниже закупки)';
                MemStat.Post;
                if CHECK_DOSTUP('$JOU.ZREMON.UTW') then
                begin
                  MemStat.append;
                  MemStat.fieldByname('STAT_ID').asinteger:=23;
                  MemStat.fieldByname('STAT_NAME').asstring:='На утверждении';
                  MemStat.Post;
                end;
             end;
           3: // Утверждено без изменений
             begin
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=3;
                MemStat.fieldByname('STAT_NAME').asstring:='Утверждено без изменений';
                MemStat.Post;
             end;
           4: // Утверждено с изменениями
             begin
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=4;
                MemStat.fieldByname('STAT_NAME').asstring:='Утверждено с изменениями';
                MemStat.Post;
             end;
           5: // Отказано полностью
             begin
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=5;
                MemStat.fieldByname('STAT_NAME').asstring:='Отказано полностью';
                MemStat.Post;
             end;
           6: // Отказано полностью
             begin
                MemStat.append;
                MemStat.fieldByname('STAT_ID').asinteger:=6;
                MemStat.fieldByname('STAT_NAME').asstring:='Выполнено. (Создан акт переоценки)';
                MemStat.Post;
             end;
        end;
        ZREMON_STAT.Value:=QueryWork.fieldByname('ZREMON_STAT').asstring;

        ADD_SQL(QueryWork,'select tw.tw_art,tw.tw_nam,ed.ed_short,twktg.twktg_color,zremons.*, (select ost from ost_now_all(zremons.tw_id)) tw_ost '+
        'from zremons,tw,ed,twktg where zremons.zremon_id=:ID '+
        'and zremons.tw_id=tw.tw_id and tw.ed_id=ed.ed_id and tw.twktg_id=twktg.twktg_id '+
        'order by zremons_id ');
        QueryWork.paramByname('ID').asinteger:=tag;
        QueryWork.open;
        MemZremons.DisableControls;
        while not QueryWork.eof do begin
           CanInsert:=true;
           MemZremons.append;
           MemZremons.fieldByname('zremons_id').asinteger:=QueryWork.fieldByname('zremons_id').asinteger;
           MemZremons.fieldByname('met').asinteger:=QueryWork.fieldByname('met').asinteger;
           MemZremons.fieldByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
           MemZremons.fieldByname('tw_art').asinteger:=QueryWork.fieldByname('tw_art').asinteger;
           MemZremons.fieldByname('tw_nam').asstring:=QueryWork.fieldByname('tw_nam').asstring;
           MemZremons.fieldByname('ed_short').asstring:=QueryWork.fieldByname('ed_short').asstring;
           MemZremons.fieldByname('twktg_color').asinteger:=QueryWork.fieldByname('twktg_color').asinteger;
           MemZremons.fieldByname('comment1').asstring:=QueryWork.fieldByname('comment1').asstring;
           MemZremons.fieldByname('comment2').asstring:=QueryWork.fieldByname('comment2').asstring;
           MemZremons.fieldByname('old_mroz').asfloat:=QueryWork.fieldByname('old_mroz').asfloat;
           MemZremons.fieldByname('new_mroz').asfloat:=QueryWork.fieldByname('new_mroz').asfloat;
           MemZremons.fieldByname('utw_mroz').asfloat:=QueryWork.fieldByname('utw_mroz').asfloat;
           MemZremons.fieldByname('last_seb1').asfloat:=QueryWork.fieldByname('last_seb1').asfloat;
           MemZremons.fieldByname('last_seb2').asfloat:=QueryWork.fieldByname('last_seb2').asfloat;
           MemZremons.fieldByname('last_dt').asdatetime:=QueryWork.fieldByname('last_dt').asdatetime;
           MemZremons.fieldByname('last_days').asinteger:=QueryWork.fieldByname('last_days').asinteger;
           MemZremons.fieldByname('last_kol').asfloat:=QueryWork.fieldByname('last_kol').asfloat;
           MemZremons.fieldByname('old_opt1').asfloat:=QueryWork.fieldByname('old_opt1').asfloat;
           MemZremons.fieldByname('new_opt1').asfloat:=QueryWork.fieldByname('new_opt1').asfloat;
           MemZremons.fieldByname('utw_opt1').asfloat:=QueryWork.fieldByname('utw_opt1').asfloat;
           MemZremons.fieldByname('old_opt2').asfloat:=QueryWork.fieldByname('old_opt2').asfloat;
           MemZremons.fieldByname('new_opt2').asfloat:=QueryWork.fieldByname('new_opt2').asfloat;
           MemZremons.fieldByname('utw_opt2').asfloat:=QueryWork.fieldByname('utw_opt2').asfloat;
           MemZremons.fieldByname('old_opt3').asfloat:=QueryWork.fieldByname('old_opt3').asfloat;
           MemZremons.fieldByname('new_opt3').asfloat:=QueryWork.fieldByname('new_opt3').asfloat;
           MemZremons.fieldByname('utw_opt3').asfloat:=QueryWork.fieldByname('utw_opt3').asfloat;
           MemZremons.fieldByname('old_opt4').asfloat:=QueryWork.fieldByname('old_opt4').asfloat;
           MemZremons.fieldByname('new_opt4').asfloat:=QueryWork.fieldByname('new_opt4').asfloat;
           MemZremons.fieldByname('utw_opt4').asfloat:=QueryWork.fieldByname('utw_opt4').asfloat;

           MemZremons.fieldByname('old_opt6').asfloat:=QueryWork.fieldByname('old_opt6').asfloat;
           MemZremons.fieldByname('new_opt6').asfloat:=QueryWork.fieldByname('new_opt6').asfloat;
           MemZremons.fieldByname('utw_opt6').asfloat:=QueryWork.fieldByname('utw_opt6').asfloat;

           MemZremons.fieldByname('old_opt7').asfloat:=QueryWork.fieldByname('old_opt7').asfloat;
           MemZremons.fieldByname('new_opt7').asfloat:=QueryWork.fieldByname('new_opt7').asfloat;
           MemZremons.fieldByname('utw_opt7').asfloat:=QueryWork.fieldByname('utw_opt7').asfloat;
           MemZremons.fieldByname('old_opt8').asfloat:=QueryWork.fieldByname('old_opt8').asfloat;
           MemZremons.fieldByname('new_opt8').asfloat:=QueryWork.fieldByname('new_opt8').asfloat;
           MemZremons.fieldByname('utw_opt8').asfloat:=QueryWork.fieldByname('utw_opt8').asfloat;


           MemZremons.fieldByname('money5').asfloat:=QueryWork.fieldByname('money5').asfloat;
           MemZremons.fieldByname('ost').asfloat:=QueryWork.fieldByname('tw_ost').asfloat;
           MemZremons.fieldByname('speed1').asfloat:=QueryWork.fieldByname('speed1').asfloat;
           MemZremons.fieldByname('speed2').asfloat:=QueryWork.fieldByname('speed2').asfloat;
           MemZremons.fieldByname('speed3').asfloat:=QueryWork.fieldByname('speed3').asfloat;
           MemZremons.post;
           CanInsert:=false;
           QueryWork.next;
        end;
        MemZremons.First;
        MemZremons.EnableControls;
        sost:=0;

     end;
     SHOP1.onclick(Sender);
     SAVE:=true;

     CanRefresh:=true;
     refresh_mroz;
     show_sost;
     ZSTAT:=strtoint(ZREMON_STAT.value);
     if (ZSTAT=2) and (not Can_Utw) then Messbox('Вы не имеете прав для утверждения заявки!',MessSystem,48);

end;

procedure TDOC_ZREMON.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
     if (key='*') and (sost=0) and (ZSTAT=1) then begin
        sost:=1;
        key:=#0;
        STR:='';
     end else
     if (key='*') and (sost=1) and (ZSTAT=1)then begin
        sost:=0;
        key:=#0;
        STR:='';
     end;
     if (sost=1) and (key in ['0','1','2','3','4','5','6','7','8','9',#8,#13,#27]) and (ZSTAT=1)then begin
       case key of
         #8: begin
             key:=#0;
             if length(STR)>0 then begin
                if length(STR)=1 then STR:=''
                else begin
                  if (length(STR)=2) and (B_Utils.left(STR,1)='Б') then STR:='' else
                  STR:=B_utils.left(STR,length(STR)-1);
                end;
             end;
         end;
         #13: begin
              key:=#0;
              {Ввод закончен}
              if length(STR)>0 then begin
                 if CanRefresh then begin
                   {Добавляем строку}
                   Query1Transaction.Active:=False;
                   IBQuery1.close;
                   IBQuery1.SQL.clear;
                   IBQuery1.SQL.add('select TW_ID from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                   if B_utils.left(STR,1)='Б' then begin
                      N:=strtoint(B_Utils.right(STR,length(STR)-1));
                      IBQuery1.ParamByname('TW_ART').asinteger:=N;
                      IBQuery1.ParamByname('TW_BRAK').asstring:='1';
                   end else begin
                      N:=strtoint(STR);
                      IBQuery1.ParamByname('TW_ART').asinteger:=N;
                      IBQuery1.ParamByname('TW_BRAK').asstring:='0';
                   end;
                   IBQuery1.Open;
                   if not IBQuery1.eof then begin
                      ID:=IBQuery1.fieldbyname('TW_ID').asinteger;
                     ADD_ZREMONS(ID);
                       Refresh_summ;
                   end else messbox('Не существует товара с кодом: '+inttostr(N)+' !',MessSystem,48);
                 end;
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
     Show_Sost;
end;


procedure TDOC_ZREMON.ADD_ZREMONS(TW_ID:integer);
var
   TW_STR:ansistring;
   ISS:boolean;
   MSHOP:integer;
   MSKID:double;
   NEW_MROZ:double;
   fq: FastQuery;

begin
   // добавляем товар
   {Проверяем, нет ли в счёте уже такого товара}
   ISS:=false;
   MemZremons.Disablecontrols;
   MemZremons.first;
   while (not MemZremons.eof) and (not ISS) do begin
         if MemZremons.fieldByname('TW_ID').asinteger=TW_ID then begin
            ISS:=true;
            TW_STR:=MemZremons.fieldByname('TW_ART').asstring+'-'+MemZremons.fieldByname('TW_NAM').asstring;
         end;
         MemZremons.next;
   end;
   MemZremons.EnableControls;
   if ISS then Messbox('Документ уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
   begin
     SAVE:=False;
     CanRefresh:=False;
     SHOW_WAIT('Запрос общих данных...',10);
     WorkTransaction.Active:=false;
     ADD_SQL(Querywork,'select ((select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
     '(select max(kurs_date) from kurs where '+
     'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0))*TW.TW_MROZ) as tw_mroz,twktg.twktg_color,tw_id,tw_art,tw_nam,ed_short from twktg,tw,ed where tw.twktg_id=twktg.twktg_id and tw.ed_id=ed.ed_id and tw.tw_id=:tw_id');
     Querywork.paramByname('tw_id').asinteger:=tw_id;
     Querywork.open;
     CanInsert:=true;
     MemZremons.append;
     MemZremons.fieldByname('zremons_id').asinteger:=-1;
     MemZremons.fieldByname('met').asinteger:=0; // изначально - в работе
     MemZremons.fieldByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
     MemZremons.fieldByname('tw_art').asinteger:=QueryWork.fieldByname('tw_art').asinteger;
     MemZremons.fieldByname('tw_nam').asstring:=QueryWork.fieldByname('tw_nam').asstring;
     MemZremons.fieldByname('ed_short').asstring:=QueryWork.fieldByname('ed_short').asstring;
     MemZremons.fieldByname('twktg_color').asinteger:=QueryWork.fieldByname('twktg_color').asinteger;
     MemZremons.fieldByname('comment1').asstring:='';
     MemZremons.fieldByname('comment2').asstring:='';
     MemZremons.fieldByname('old_mroz').asfloat:=QueryWork.fieldByname('tw_mroz').asfloat;
     // Запрашиваем данные себестоимости
     SHOW_WAIT('Запрос данных последней поставки...',20);
     add_sql(QueryWork,'SELECT pn$_date, tw_money, tw_moneyd as tw_money$, cast(cast("now" as date)-pn$_date as integer) as days, tw_kol from last_zak_frm(:tw_id, :frm_id)');


//     add_sql(QueryWork,'select pn$.pn$_date,pns$.tw_summ/pns$.tw_kol as tw_money,(pns$.tw_summ/pns$.tw_kol)/pn$.pn$_kurs as tw_money$, '+
//     'cast(cast("now" as date)-pn$.pn$_date as integer) as days,pns$.tw_kol '+
//     'from pn$,pns$,kln  where pn$.pn$_id=pns$.pn$_id and pns$.tw_id=:tw_id  and pns$.wozw_id=0 and not pn$.pn$_prow=0 and kln.kln_id=pn$.kln_id and bg_abs(kln.kln_frm)in (0 '+
//     'order by pn$_date desc');
     QueryWork.paramByname('tw_id').asinteger:=tw_id;
     QueryWork.paramByname('frm_id').asinteger:=GL_FRM_WORK_MODE;
     QueryWork.open;
     if QueryWork.eof then begin
        // Поставок не было
     end else begin
       MemZremons.fieldByname('last_seb1').asfloat:=QueryWork.fieldByname('tw_money').asfloat;
       MemZremons.fieldByname('last_seb2').asfloat:=QueryWork.fieldByname('tw_money$').asfloat;
       MemZremons.fieldByname('last_dt').asdatetime:=QueryWork.fieldByname('pn$_date').asdatetime;
       MemZremons.fieldByname('last_days').asinteger:=QueryWork.fieldByname('days').asinteger;
       MemZremons.fieldByname('last_kol').asfloat:=QueryWork.fieldByname('tw_kol').asfloat;
     end;
     // запрашиваем остаток
     SHOW_WAIT('Запрос остатка...',30);
     ADD_SQL(QueryWork,'select ost from ost_now_all(:tw_id)');
     QueryWork.paramByname('tw_id').asinteger:=tw_id;
     QueryWork.open;
     MemZremons.fieldByname('ost').asfloat:=QueryWork.fieldByname('ost').asfloat;
     // запрашиваем скорость продаж за последние 3 месяца
     SHOW_WAIT('Запрос продаж текущего месяца...',50);
//     add_sql(QueryWork,'select sum(-tw_kol) as speed from reg where tw_id=:tw_id '+
//     'and typ=1 and reg.dt between :dt1 and :dt2');
     add_sql(QueryWork,'select sum(-reg.tw_kol) as speed from reg where reg.tw_id = :tw_id '+
       'and reg.typ - 1 = 0 '+
       'and reg.dt between :dt1 and :dt2 '+
       'and exists(select rn_id from rn, rns, rntyp where rn.rn_id = rns.rn_id and rns.rns_id = reg.id and rntyp.rntyp_id = rn.rntyp_id   and not rntyp.rntyp_speed = "0" )');

     QueryWork.paramByname('tw_id').asinteger:=tw_id;
     QueryWork.paramByname('dt1').asdatetime:=date()-30;
     QueryWork.paramByname('dt2').asdatetime:=date();
     QueryWork.open;
     if QueryWork.eof then MemZremons.fieldByname('speed1').asfloat:=0
     else MemZremons.fieldByname('speed1').asfloat:=QueryWork.fieldByname('speed').asfloat;
     // 2-й месяц
     QueryWork.close;
     SHOW_WAIT('Запрос продаж предыдущего месяца...',60);
     QueryWork.paramByname('dt1').asdatetime:=date()-60;
     QueryWork.paramByname('dt2').asdatetime:=date()-30;
     QueryWork.open;
     if QueryWork.eof then MemZremons.fieldByname('speed2').asfloat:=0
     else MemZremons.fieldByname('speed2').asfloat:=QueryWork.fieldByname('speed').asfloat;
     // 3-й месяц
     QueryWork.close;
     SHOW_WAIT('Запрос продаж 3 месяца назад...',70);
     QueryWork.paramByname('dt1').asdatetime:=date()-90;
     QueryWork.paramByname('dt2').asdatetime:=date()-60;
     QueryWork.open;
     if QueryWork.eof then MemZremons.fieldByname('speed3').asfloat:=0
     else MemZremons.fieldByname('speed3').asfloat:=QueryWork.fieldByname('speed').asfloat;
     SHOW_WAIT('Запрос оптовых цен...',80);


      fq:=FastQuery.Create('SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)');
      fq.ParamByName('TW_ID').asinteger:=TW_ID;
      fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;
      fq.Open;

      while not fq.eof do
      begin
        if fq.FieldByName('TWPRICE_TYP').asinteger=1 then
          begin MemZremons.Fieldbyname('new_opt1').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt1').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt1').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=2 then
          begin MemZremons.Fieldbyname('new_opt2').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt2').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt2').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=3 then
          begin MemZremons.Fieldbyname('new_opt3').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt3').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt3').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=4 then
          begin MemZremons.Fieldbyname('new_opt4').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt4').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt4').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=6 then
          begin MemZremons.Fieldbyname('new_opt6').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt6').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt6').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=7 then
          begin MemZremons.Fieldbyname('new_opt7').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt7').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt7').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=8 then
          begin MemZremons.Fieldbyname('new_opt8').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('old_opt8').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemZremons.Fieldbyname('utw_opt8').asfloat:=0; end;
        if fq.FieldByName('TWPRICE_TYP').asinteger=5 then
          begin MemZremons.Fieldbyname('money5').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;


        fq.next;
      end;
      fq.close;
      fq.Destroy;

     {
     MemZremons.fieldByname('old_opt1').asfloat:=0;
     MemZremons.fieldByname('new_opt1').asfloat:=0;
     MemZremons.fieldByname('utw_opt1').asfloat:=0;
     MemZremons.fieldByname('old_opt2').asfloat:=0;
     MemZremons.fieldByname('new_opt2').asfloat:=0;
     MemZremons.fieldByname('utw_opt2').asfloat:=0;
     MemZremons.fieldByname('old_opt3').asfloat:=0;
     MemZremons.fieldByname('new_opt3').asfloat:=0;
     MemZremons.fieldByname('utw_opt3').asfloat:=0;
     MemZremons.fieldByname('old_opt4').asfloat:=0;
     MemZremons.fieldByname('new_opt4').asfloat:=0;
     MemZremons.fieldByname('utw_opt4').asfloat:=0;
     }
     // Запрашиваем, есть ли цена в этом магазине
     SHOW_WAIT('Запрос обособленных цен...',30);
     ADD_SQL(QueryWork,'select count(*) as cc from twmonshop where tw_id=:tw_id');
     QueryWork.paramByname('tw_id').asinteger:=tw_id;
     QueryWork.open;
     // Определяем, есть ли обособленные цены на этот товар
     if QueryWork.eof then MSHOP:=0 else MSHOP:=QueryWork.fieldByname('cc').asinteger;
     if MSHOP>0 then begin
        // Обособленная цена есть - ставим цветовую метку
        MemZremons.fieldByname('MET_MONEY_SHOP').asinteger:=1;
        if SHOP2.checked then begin
          // Перезапрашиваем цену по указанному магазину
          ADD_SQL(QueryWork,'select min(skid_percent) as mskid from twmonshop where tw_id=:tw_id and shop_id=:shop_id ');
          QueryWork.paramByname('tw_id').asinteger:=tw_id;
          QueryWork.paramByname('shop_id').asinteger:=strtoint(ZREMON_SHOP.value);
          QueryWork.open;
          if QueryWork.eof then MSKID:=0 else MSKID:=QueryWork.fieldByname('MSKID').asinteger;
          // Изменяем цену
          NEW_MROZ:=MemZremons.fieldByname('old_mroz').asfloat*(1-MSKID/100);
          // Запрашиваем округление
          ADD_SQL(QueryWork,'select money from price_okrug(:CURRENT_MROZ)');
          QueryWork.paramByname('CURRENT_MROZ').asfloat:=NEW_MROZ;
          QueryWork.open;
          MemZremons.fieldByname('old_mroz').asfloat:=QueryWork.fieldByname('money').asfloat;
        end;
     end else MemZremons.fieldByname('MET_MONEY_SHOP').asinteger:=0;
     MemZremons.fieldByname('new_mroz').asfloat:=MemZremons.fieldByname('old_mroz').asfloat;
     MemZremons.fieldByname('utw_mroz').asfloat:=0;

     CanRefresh:=true;
     MemZremons.post;
     wait_form.hide;
     Statusbar1.panels[2].text:=''; delay(1);
     CanInsert:=false;
   end;
end;

procedure TDOC_ZREMON.refresh_summ;
begin
   // Процедура перезапрашивает остатки по товарам
end;




procedure TDOC_ZREMON.DsZRemonsDataChange(Sender: TObject; Field: TField);
begin
     if MemZremonS.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemZremonS.State in [dsInsert]) and ( not CanInsert) then MemZremonS.Cancel;
end;

procedure TDOC_ZREMON.DicTWExecute(Sender: TObject);
var
   a:integer;
begin
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_ZREMONS(ARR_TW[a].ID);
        end;
     end;
     Refresh_summ;
     Show_sost;
end;

procedure TDOC_ZREMON.ActDetalExecute(Sender: TObject);
begin
   SHOW_DETAL_TW(MemZremons.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_ZREMON.ActAnalizExecute(Sender: TObject);
begin
   SHOW_ANALIZ_TW(MemZremons.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_ZREMON.ActMarketingExecute(Sender: TObject);
begin
   SHOW_MARKETING_TW(MemZremons.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_ZREMON.ActLockExecute(Sender: TObject);
begin
   My_lock;
end;

procedure TDOC_ZREMON.ActDelExecute(Sender: TObject);
begin
     if Messbox('Удалить из заявки товар "'+MemZremons.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemZremons.Fieldbyname('ZREMONS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          ZREMONS_DEL[CNT_DEL]:=MemZremons.Fieldbyname('ZREMONS_ID').asinteger;
          ZREMONS_DEL_MESS[CNT_DEL]:='Удален товар: '+MemZremons.Fieldbyname('TW_ART').asstring+' '+
          MemZremons.Fieldbyname('TW_NAM').asstring;
        end;
        MemZremons.delete;
        Refresh_summ;
        Show_Sost;
     end;
end;

procedure TDOC_ZREMON.ActPrintExecute(Sender: TObject);
begin
   // Печать
end;

procedure TDOC_ZREMON.ActHistoryExecute(Sender: TObject);
begin
   // История документа
end;

procedure TDOC_ZREMON.DsDopDataChange(Sender: TObject; Field: TField);
begin
     if (MemDop.State in [dsInsert]) and ( not CanInsertDop) then MemDop.Cancel;
end;

procedure TDOC_ZREMON.MemZRemonsAfterPost(DataSet: TDataSet);
begin
   if CanRefresh then begin
     Edit1.text:=MemZremons.fieldByname('tw_nam').asstring;
     Edit2.text:=MemZremons.fieldByname('tw_art').asstring;
   // Заполняем таблицу детализации
     MemDop.DisableControls;
     CanInsertDop:=true;
     MemDop.EmptyTable;
     MemDop.Append;
     MemDop.fieldByname('stat_name').asstring:='Текущая';
     // Заполняем текущие цены
     MemDop.fieldByname('rozn').asfloat:=MemZremons.fieldByname('old_mroz').asfloat;
     MemDop.fieldByname('mopt').asfloat:=MemZremons.fieldByname('old_opt1').asfloat;
     MemDop.fieldByname('opt').asfloat:=MemZremons.fieldByname('old_opt2').asfloat;
     MemDop.fieldByname('kopt').asfloat:=MemZremons.fieldByname('old_opt3').asfloat;
     MemDop.fieldByname('pprod').asfloat:=MemZremons.fieldByname('old_opt4').asfloat;
     MemDop.fieldByname('spec').asfloat:=MemZremons.fieldByname('money5').asfloat;
     MemDop.fieldByname('spec2').asfloat:=MemZremons.fieldByname('old_opt6').asfloat;
     MemDop.fieldByname('money7').asfloat:=MemZremons.fieldByname('old_opt7').asfloat;
     MemDop.fieldByname('money8').asfloat:=MemZremons.fieldByname('old_opt8').asfloat;
     if MemZremons.fieldByname('last_dt').asdatetime<encodedate(1980,1,1) then begin
        MemDop.fieldByname('dt').asstring:='нет поставок';
     end else begin
        MemDop.fieldByname('seb').asstring:=floattostrf(MemZremons.fieldByname('last_seb1').asfloat,fffixed,19,2)+' руб';
        MemDop.fieldByname('dt').asstring:=datetostr(MemZremons.fieldByname('last_dt').asdatetime);
        MemDop.fieldByname('day').asinteger:=MemZremons.fieldByname('last_days').asinteger;
     end;
     MemDop.Append;
     MemDop.fieldByname('stat_name').asstring:='Новая';
     if MemZremons.fieldByname('last_dt').asdatetime>=encodedate(1980,1,1) then begin
        MemDop.fieldByname('seb').asstring:=floattostrf(MemZremons.fieldByname('last_seb2').asfloat,fffixed,19,2)+' usd';
     end;
     MemDop.fieldByname('rozn').asfloat:=MemZremons.fieldByname('new_mroz').asfloat;
     MemDop.fieldByname('mopt').asfloat:=MemZremons.fieldByname('new_opt1').asfloat;
     MemDop.fieldByname('opt').asfloat:=MemZremons.fieldByname('new_opt2').asfloat;
     MemDop.fieldByname('kopt').asfloat:=MemZremons.fieldByname('new_opt3').asfloat;
     MemDop.fieldByname('pprod').asfloat:=MemZremons.fieldByname('new_opt4').asfloat;
     MemDop.fieldByname('spec').asfloat:=MemZremons.fieldByname('money5').asfloat;
     MemDop.fieldByname('spec2').asfloat:=MemZremons.fieldByname('new_opt6').asfloat;
     MemDop.fieldByname('money7').asfloat:=MemZremons.fieldByname('new_opt7').asfloat;
     MemDop.fieldByname('money8').asfloat:=MemZremons.fieldByname('new_opt8').asfloat;

     MemDop.Append;
     MemDop.fieldByname('stat_name').asstring:='Утвержденная';
     MemDop.fieldByname('rozn').asfloat:=MemZremons.fieldByname('utw_mroz').asfloat;
     MemDop.fieldByname('mopt').asfloat:=MemZremons.fieldByname('utw_opt1').asfloat;
     MemDop.fieldByname('opt').asfloat:=MemZremons.fieldByname('utw_opt2').asfloat;
     MemDop.fieldByname('kopt').asfloat:=MemZremons.fieldByname('utw_opt3').asfloat;
     MemDop.fieldByname('pprod').asfloat:=MemZremons.fieldByname('utw_opt4').asfloat;
     MemDop.fieldByname('spec').asfloat:=MemZremons.fieldByname('money5').asfloat;
     MemDop.fieldByname('spec2').asfloat:=MemZremons.fieldByname('utw_opt6').asfloat;
     MemDop.fieldByname('money7').asfloat:=MemZremons.fieldByname('utw_opt7').asfloat;
     MemDop.fieldByname('money8').asfloat:=MemZremons.fieldByname('utw_opt8').asfloat;

     MemDop.post;
     MemDop.EnableControls;
   end;


   if strtoint(ZREMON_STAT.value) in [2,22,23] then
   begin
     if ( MemZremons.fieldByname('money5').asfloat<>0) then
    begin
      edit6.Text:= floattostrf((MemZremons.fieldByname('utw_mroz').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit3.Text:= floattostrf((MemZremons.fieldByname('utw_opt1').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit4.Text:= floattostrf((MemZremons.fieldByname('utw_opt2').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit5.Text:= floattostrf((MemZremons.fieldByname('utw_opt3').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit7.Text:= floattostrf((MemZremons.fieldByname('utw_opt4').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit8.Text:= floattostrf((MemZremons.fieldByname('utw_opt6').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit9.Text:= floattostrf((MemZremons.fieldByname('utw_opt7').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit10.Text:= floattostrf((MemZremons.fieldByname('utw_opt7').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
    end;
   end
   else
   begin
   if ( MemZremons.fieldByname('money5').asfloat<>0) then
    begin
      edit6.Text:= floattostrf((MemZremons.fieldByname('new_mroz').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit3.Text:= floattostrf((MemZremons.fieldByname('new_opt1').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit4.Text:= floattostrf((MemZremons.fieldByname('new_opt2').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit5.Text:= floattostrf((MemZremons.fieldByname('new_opt3').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit7.Text:= floattostrf((MemZremons.fieldByname('new_opt4').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit8.Text:= floattostrf((MemZremons.fieldByname('new_opt6').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit9.Text:= floattostrf((MemZremons.fieldByname('new_opt7').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit10.Text:= floattostrf((MemZremons.fieldByname('new_opt8').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
    end;

   end;


end;

procedure TDOC_ZREMON.ZREMON_DATEChange(Sender: TObject);
begin
  save:=False;
end;

procedure TDOC_ZREMON.MemZRemonsCalcFields(DataSet: TDataSet);
begin
     if MemZremons.fieldByname('last_dt').asdatetime<encodedate(1980,1,1) then begin
        MemZremons.fieldByname('s_dt').asstring:='нет поставок';
     end else begin
        MemZremons.fieldByname('s_seb1').asstring:=floattostrf(MemZremons.fieldByname('last_seb1').asfloat,fffixed,19,2)+' руб';
        MemZremons.fieldByname('s_seb2').asstring:=floattostrf(MemZremons.fieldByname('last_seb2').asfloat,fffixed,19,2)+' usd';
        MemZremons.fieldByname('s_dt').asstring:=datetostr(MemZremons.fieldByname('last_dt').asdatetime);
        MemZremons.fieldByname('s_days').asinteger:=MemZremons.fieldByname('last_days').asinteger;
     end;


   if strtoint(ZREMON_STAT.value) in [2,22,23] then
   begin
     if ( MemZremons.fieldByname('money5').asfloat<>0) then
    begin
      edit6.Text:= floattostrf((MemZremons.fieldByname('utw_mroz').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit3.Text:= floattostrf((MemZremons.fieldByname('utw_opt1').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit4.Text:= floattostrf((MemZremons.fieldByname('utw_opt2').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit5.Text:= floattostrf((MemZremons.fieldByname('utw_opt3').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit7.Text:= floattostrf((MemZremons.fieldByname('utw_opt4').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit8.Text:= floattostrf((MemZremons.fieldByname('utw_opt6').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit9.Text:= floattostrf((MemZremons.fieldByname('utw_opt7').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit10.Text:= floattostrf((MemZremons.fieldByname('utw_opt8').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
    end;
   end
   else
   begin
   if ( MemZremons.fieldByname('money5').asfloat<>0) then
    begin
      edit6.Text:= floattostrf((MemZremons.fieldByname('new_mroz').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit3.Text:= floattostrf((MemZremons.fieldByname('new_opt1').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit4.Text:= floattostrf((MemZremons.fieldByname('new_opt2').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit5.Text:= floattostrf((MemZremons.fieldByname('new_opt3').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit7.Text:= floattostrf((MemZremons.fieldByname('new_opt4').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit8.Text:= floattostrf((MemZremons.fieldByname('new_opt6').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit9.Text:= floattostrf((MemZremons.fieldByname('new_opt7').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
      edit10.Text:= floattostrf((MemZremons.fieldByname('new_opt8').asfloat-MemZremons.fieldByname('money5').asfloat)*100/MemZremons.fieldByname('money5').asfloat,fffixed,19,2)+'%';
    end;

   end;


end;

procedure TDOC_ZREMON.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (ActApply.enabled) then begin
        if Messbox('Документ был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_ZREMON.ActRefreshExecute(Sender: TObject);
var
  a,ID:integer;
  TW_ID:integer;
begin
   // Обновить данныек
   if Messbox('Обновление данных может занять значительное время! Обновить расчетные данные по товарам в заявке?',MessSubmit,4+48+256)=6 then begin
      ID:=MemZremons.recno;
      MemZremons.first;
      Save:=False;
      while not MemZremons.eof do begin
        tw_id:=MemZremons.fieldByname('tw_id').asinteger;
        SHOW_WAIT('Запрос общих данных...',10);
        WorkTransaction.Active:=false;
        ADD_SQL(Querywork,'select ((select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
        '(select max(kurs_date) from kurs where '+
        'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0))*TW.TW_MROZ) as tw_mroz from tw where tw.tw_id=:tw_id');
        Querywork.paramByname('tw_id').asinteger:=tw_id;
        Querywork.open;
        MemZremons.Edit;
        MemZremons.fieldByname('old_mroz').asfloat:=QueryWork.fieldByname('tw_mroz').asfloat;
        // Запрашиваем данные себестоимости
        SHOW_WAIT('Запрос данных последней поставки...',20);
        add_sql(QueryWork,'select pn$.pn$_date,pns$.tw_summ/pns$.tw_kol as tw_money,(pns$.tw_summ/pns$.tw_kol)/pn$.pn$_kurs as tw_money$, '+
        'cast(cast("now" as date)-pn$.pn$_date as integer) as days,pns$.tw_kol '+
        'from pn$,pns$ where pn$.pn$_id=pns$.pn$_id and pns$.tw_id=:tw_id and pns$.wozw_id=0 and not pn$.pn$_prow=0 '+
        'order by pn$_date desc');
        QueryWork.paramByname('tw_id').asinteger:=tw_id;
        QueryWork.open;
        if QueryWork.eof then begin
          // Поставок не было
        end else begin
           MemZremons.fieldByname('last_seb1').asfloat:=QueryWork.fieldByname('tw_money').asfloat;
           MemZremons.fieldByname('last_seb2').asfloat:=QueryWork.fieldByname('tw_money$').asfloat;
           MemZremons.fieldByname('last_dt').asdatetime:=QueryWork.fieldByname('pn$_date').asdatetime;
           MemZremons.fieldByname('last_days').asinteger:=QueryWork.fieldByname('days').asinteger;
           MemZremons.fieldByname('last_kol').asfloat:=QueryWork.fieldByname('tw_kol').asfloat;
        end;
        // запрашиваем остаток
        SHOW_WAIT('Запрос остатка...',30);
        ADD_SQL(QueryWork,'select ost from ost_now_all(:tw_id)');
        QueryWork.paramByname('tw_id').asinteger:=tw_id;
        QueryWork.open;
        MemZremons.fieldByname('ost').asfloat:=QueryWork.fieldByname('ost').asfloat;
        // запрашиваем скорость продаж за последние 3 месяца
        SHOW_WAIT('Запрос продаж текущего месяца...',50);
        add_sql(QueryWork,'select sum(-tw_kol) as speed from reg where tw_id=:tw_id '+
        'and typ=1 and reg.dt between :dt1 and :dt2');
        QueryWork.paramByname('tw_id').asinteger:=tw_id;
        QueryWork.paramByname('dt1').asdatetime:=date()-30;
        QueryWork.paramByname('dt2').asdatetime:=date();
        QueryWork.open;
        if QueryWork.eof then MemZremons.fieldByname('speed1').asfloat:=0
        else MemZremons.fieldByname('speed1').asfloat:=QueryWork.fieldByname('speed').asfloat;
        // 2-й месяц
        QueryWork.close;
        SHOW_WAIT('Запрос продаж предыдущего месяца...',60);
        QueryWork.paramByname('dt1').asdatetime:=date()-60;
        QueryWork.paramByname('dt2').asdatetime:=date()-30;
        QueryWork.open;
        if QueryWork.eof then MemZremons.fieldByname('speed2').asfloat:=0
        else MemZremons.fieldByname('speed2').asfloat:=QueryWork.fieldByname('speed').asfloat;
        // 3-й месяц
        QueryWork.close;
        SHOW_WAIT('Запрос продаж 3 месяца назад...',70);
        QueryWork.paramByname('dt1').asdatetime:=date()-90;
        QueryWork.paramByname('dt2').asdatetime:=date()-60;
        QueryWork.open;
        if QueryWork.eof then MemZremons.fieldByname('speed3').asfloat:=0
        else MemZremons.fieldByname('speed3').asfloat:=QueryWork.fieldByname('speed').asfloat;
        SHOW_WAIT('Запрос оптовых цен...',80);
        MemZremons.post;
        wait_form.hide;
        Statusbar1.panels[2].text:=''; delay(1);
        MemZremons.next;
      end;
      MemZremons.DisableControls;
      MemZremons.first;
      for a:=1 to ID-1 do MemZremons.next;
      MemZremons.Enablecontrols;
   end;
   Show_sost;

end;

procedure TDOC_ZREMON.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COL,COL2:integer;
  TXT,TXT2:integer;
begin
     {Выделяем цветом ненулевой остаток}
     COL2:=clWindow; COL:=COL2;
     TXT2:=clWindowText; TXT:=TXT2;
     // Изменение новой цены
     if (Field.FieldName='OLD_MROZ') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1')
       then begin
            COL:=$009FFF9F;
            TXT:=ClGreen;
       end;
     if (Field.FieldName='NEW_MROZ') and (MemZremons.fieldByname('OLD_MROZ').asfloat<>MemZremons.fieldByname('NEW_MROZ').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_MROZ').asfloat>MemZremons.fieldByname('OLD_MROZ').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_MROZ').asfloat<MemZremons.fieldByname('OLD_MROZ').asfloat
           then COL:=DownColor;
     end;
     if (Field.FieldName='NEW_OPT1') and (MemZremons.fieldByname('OLD_OPT1').asfloat<>MemZremons.fieldByname('NEW_OPT1').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT1').asfloat>MemZremons.fieldByname('OLD_OPT1').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT1').asfloat<MemZremons.fieldByname('OLD_OPT1').asfloat
           then COL:=DownColor;
     end;
     if (Field.FieldName='NEW_OPT2') and (MemZremons.fieldByname('OLD_OPT2').asfloat<>MemZremons.fieldByname('NEW_OPT2').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT2').asfloat>MemZremons.fieldByname('OLD_OPT2').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT2').asfloat<MemZremons.fieldByname('OLD_OPT2').asfloat
           then COL:=DownColor;
     end;
     if (Field.FieldName='NEW_OPT3') and (MemZremons.fieldByname('OLD_OPT3').asfloat<>MemZremons.fieldByname('NEW_OPT3').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT3').asfloat>MemZremons.fieldByname('OLD_OPT3').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT3').asfloat<MemZremons.fieldByname('OLD_OPT3').asfloat
           then COL:=DownColor;
     end;
     if (Field.FieldName='NEW_OPT4') and (MemZremons.fieldByname('OLD_OPT4').asfloat<>MemZremons.fieldByname('NEW_OPT4').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT4').asfloat>MemZremons.fieldByname('OLD_OPT4').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT4').asfloat<MemZremons.fieldByname('OLD_OPT4').asfloat
           then COL:=DownColor;
     end;

     if (Field.FieldName='NEW_OPT6') and (MemZremons.fieldByname('OLD_OPT6').asfloat<>MemZremons.fieldByname('NEW_OPT6').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT6').asfloat>MemZremons.fieldByname('OLD_OPT6').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT6').asfloat<MemZremons.fieldByname('OLD_OPT6').asfloat
           then COL:=DownColor;
     end;
     if (Field.FieldName='NEW_OPT7') and (MemZremons.fieldByname('OLD_OPT7').asfloat<>MemZremons.fieldByname('NEW_OPT7').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT7').asfloat>MemZremons.fieldByname('OLD_OPT7').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT7').asfloat<MemZremons.fieldByname('OLD_OPT7').asfloat
           then COL:=DownColor;
     end;
     if (Field.FieldName='NEW_OPT8') and (MemZremons.fieldByname('OLD_OPT8').asfloat<>MemZremons.fieldByname('NEW_OPT8').asfloat) then begin
        COL:=clWindow;
        if MemZremons.fieldByname('NEW_OPT8').asfloat>MemZremons.fieldByname('OLD_OPT8').asfloat
           then COL:=UpColor else
        if MemZremons.fieldByname('NEW_OPT8').asfloat<MemZremons.fieldByname('OLD_OPT8').asfloat
           then COL:=DownColor;
     end;



     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_MROZ') and (MemZremons.fieldByname('UTW_MROZ').asfloat<>MemZremons.fieldByname('NEW_MROZ').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT1') and (MemZremons.fieldByname('UTW_OPT1').asfloat<>MemZremons.fieldByname('NEW_OPT1').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT2') and (MemZremons.fieldByname('UTW_OPT2').asfloat<>MemZremons.fieldByname('NEW_OPT2').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT3') and (MemZremons.fieldByname('UTW_OPT3').asfloat<>MemZremons.fieldByname('NEW_OPT3').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT4') and (MemZremons.fieldByname('UTW_OPT4').asfloat<>MemZremons.fieldByname('NEW_OPT4').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT6') and (MemZremons.fieldByname('UTW_OPT6').asfloat<>MemZremons.fieldByname('NEW_OPT6').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT7') and (MemZremons.fieldByname('UTW_OPT7').asfloat<>MemZremons.fieldByname('NEW_OPT7').asfloat) then COL:=ChangeColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT8') and (MemZremons.fieldByname('UTW_OPT8').asfloat<>MemZremons.fieldByname('NEW_OPT8').asfloat) then COL:=ChangeColor;

     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_MROZ') and (MemZremons.fieldByname('UTW_MROZ').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT1') and (MemZremons.fieldByname('UTW_OPT1').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT2') and (MemZremons.fieldByname('UTW_OPT2').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT3') and (MemZremons.fieldByname('UTW_OPT3').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT4') and (MemZremons.fieldByname('UTW_OPT4').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT6') and (MemZremons.fieldByname('UTW_OPT6').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT7') and (MemZremons.fieldByname('UTW_OPT7').asfloat<0) then COL:=NoUtwColor;
     if (strtoint(Zremon_stat.value)>1) and (Field.FieldName='UTW_OPT8') and (MemZremons.fieldByname('UTW_OPT8').asfloat<0) then COL:=NoUtwColor;
     Background:=COL;
     Afont.color:=TXT;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if COL2<>COL then begin
         Afont.color:=COL;
      end;
      if TXT2<>TXT then begin
         Background:=TXT;
      end;
     end;
end;

procedure TDOC_ZREMON.ZREMON_STATChange(Sender: TObject);
begin
  save:=False;
  if (strtoint(ZREMON_STAT.Value)=1) and (PREV_STAT in [2,22,23]) then begin
      if Messbox('Открыть заявку для повторного редактирования ?',MessSubmit,4+48+256)=6 then begin
         // Прописываем цены для утверждения и сохраняем
         MemZremons.disableControls;
         MemZremons.First;
         while not MemZremons.eof do begin
            MemZremons.edit;
            MemZremons.fieldByname('MET').asinteger:=0;
            MemZremons.fieldByname('UTW_MROZ').asfloat:=0;
            MemZremons.fieldByname('UTW_OPT1').asfloat:=0;
            MemZremons.fieldByname('UTW_OPT2').asfloat:=0;
            MemZremons.fieldByname('UTW_OPT3').asfloat:=0;
            MemZremons.fieldByname('UTW_OPT4').asfloat:=0;
            MemZremons.fieldByname('UTW_OPT6').asfloat:=0;
            MemZremons.post;
            MemZremons.next;
         end;
         MemZremons.First;
         MemZremons.EnableControls;
         PREV_STAT:=1;
         ZSTAT:=strtoint(ZREMON_STAT.value);
      end else ZREMON_STAT.Value:=inttostr(PREV_STAT);
  end;

  if ((strtoint(ZREMON_STAT.Value)=2) or (strtoint(ZREMON_STAT.Value)=22)) and (PREV_STAT=1) then begin
      if Messbox('Завка готовая к утверждению будет недоступна для дальнейшего редактирования! Заявка закончена?',MessSubmit,4+48+256)=6 then begin
         // Прописываем цены для утверждения и сохраняем
         MemZremons.disableControls;
         MemZremons.First;
         while not MemZremons.eof do begin
            MemZremons.edit;
            MemZremons.fieldByname('MET').asinteger:=1;
            MemZremons.fieldByname('UTW_MROZ').asfloat:=MemZremons.fieldByname('NEW_MROZ').asfloat;
            MemZremons.fieldByname('UTW_OPT1').asfloat:=MemZremons.fieldByname('NEW_OPT1').asfloat;
            MemZremons.fieldByname('UTW_OPT2').asfloat:=MemZremons.fieldByname('NEW_OPT2').asfloat;
            MemZremons.fieldByname('UTW_OPT3').asfloat:=MemZremons.fieldByname('NEW_OPT3').asfloat;
            MemZremons.fieldByname('UTW_OPT4').asfloat:=MemZremons.fieldByname('NEW_OPT4').asfloat;
            MemZremons.fieldByname('UTW_OPT6').asfloat:=MemZremons.fieldByname('NEW_OPT6').asfloat;
            MemZremons.fieldByname('UTW_OPT7').asfloat:=MemZremons.fieldByname('NEW_OPT7').asfloat;
            MemZremons.fieldByname('UTW_OPT8').asfloat:=MemZremons.fieldByname('NEW_OPT8').asfloat;
            MemZremons.post;
            MemZremons.next;
         end;
         MemZremons.First;
         MemZremons.EnableControls;
         ZSTAT:=strtoint(ZREMON_STAT.value);
         if ActApply.Enabled then begin
            ActApply.Execute;
            if SAVE then close;
         end;
      end else ZREMON_STAT.Value:='1';
  end;
  RxDbGrid3.Refresh;
  show_sost;
  ZSTAT:=strtoint(ZREMON_STAT.value);

end;

procedure TDOC_ZREMON.ActOkExecute(Sender: TObject);
var
  CntChange,CntDel:integer;
begin
    // Закончить утверждение
    if (Messbox('Вы уверены, что закончили утверждение заявки на переоценку?',MessSubmit,4+48+256)=6) and (ActApply.enabled) then begin
       // Проверяем статус и записываем
       MemZremons.DisableControls;
       MemZremons.First;
       CntDel:=0;
       CntChange:=0;
       while not MemZremons.eof do begin
          if MemZremons.fieldByname('UTW_MROZ').asfloat<>MemZremons.fieldByname('NEW_MROZ').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt1').asfloat<>MemZremons.fieldByname('NEW_opt1').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt2').asfloat<>MemZremons.fieldByname('NEW_opt2').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt3').asfloat<>MemZremons.fieldByname('NEW_opt3').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt4').asfloat<>MemZremons.fieldByname('NEW_opt4').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt6').asfloat<>MemZremons.fieldByname('NEW_opt6').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt7').asfloat<>MemZremons.fieldByname('NEW_opt7').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_opt8').asfloat<>MemZremons.fieldByname('NEW_opt8').asfloat then inc(CntChange);
          if MemZremons.fieldByname('UTW_MROZ').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt1').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt2').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt3').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt4').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt6').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt7').asfloat<0 then inc(CntDel);
          if MemZremons.fieldByname('UTW_opt8').asfloat<0 then inc(CntDel);
          MemZremons.next;
       end;
       MemZremons.First;
       if (CntDel=0) and (CntChange=0) then ZSTAT:=3
       else if (CntDel=MemZremons.recordcount) then ZSTAT:=5
       else if CntChange>0 then ZSTAT:=4;
       MemZremons.EnableControls;
       ActApply.execute;
       if SAVE then close;
    end;
end;

procedure TDOC_ZREMON.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDOC_ZREMON.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='TW_ART' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='TW_ART' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
         ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - ImageList1.Height) div 2),
         (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET').Asinteger,True);
    end;
end;

procedure TDOC_ZREMON.MemZRemonsUTW_MROZChange(Sender: TField);
begin
   // Проверяем цены
   if strtoint(ZREMON_STAT.value)=2 then begin
     if not (MemZremonS.state in [dsinsert]) then begin
        if (MemZremonS.fieldbyname('UTW_MROZ').asfloat<>MemZremonS.fieldbyname('NEW_MROZ').asfloat)
        then MemZremonS.fieldbyname('MET').asinteger:=2 else MemZremonS.fieldbyname('MET').asinteger:=1;
        if MemZremonS.fieldbyname('UTW_MROZ').asfloat<0 then MemZremonS.fieldbyname('MET').asinteger:=3;
     end;
   end;

end;

procedure TDOC_ZREMON.Show_sost;
var
   s:ansistring;
   ZremonEmpty:boolean;
   c:integer;
   SHOW_COLUMN:ansistring;
   STATUS:integer;
   ZEmpty:boolean;
begin
     if DOC_ZREMON.Tag<0 then
       DOC_ZREMON.caption:='Заявка на переоценку. Новая'
     else DOC_ZREMON.caption:='Заявка на переоценку. Редактирование';
     if MemZremons.RecordCount=0 then ZremonEmpty:=true else ZremonEmpty:=false;
     case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel2.Color:=clBtnFace;
                   Panel2.Font.color:=ClWindowText;
                end;
             1: begin
                   s:='Ввод товаров...';
                   if TW_FON>=0 then Panel2.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel2.Font.color:=TW_COLOR;
                end;
     end;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;
     STATUS:=strtoint(ZREMON_STAT.value);
     if MemZremons.recordcount=0 then ZEmpty:=true else ZEmpty:=false;
     ActSave.enabled:=(Not Zempty) and (STATUS in [1,2,22,23]);
     ActApply.enabled:=(Not Zempty) and (STATUS in [1,2,22,23]);
     ActOk.enabled:=(Not Zempty) and (Status =23) and Can_Utw;
     ActPrint.enabled:=(Not Zempty);
     ActHistory.enabled:=(Not Zempty);
     DicTW.enabled:=(Status=1);
     ActDel.enabled:=(Not Zempty) and (Status=1);
     ActDetal.enabled:=(Not Zempty);
     ActAnaliz.enabled:=(Not Zempty);
     ActMarketing.enabled:=(Not Zempty);
     ActRefresh.enabled:=(Not Zempty) and (Status=1);
     Zremon_date.enabled:=(Status=1);
     Zremon_osn.enabled:=(Status=1);
     Zremon_osn2.enabled:=(Status in [2,22,23]) and Can_Utw;
     Zremon_Stat.enabled:=(STATUS in [1,2,22,23]);
     // Определяем доступность строк
     RxDbGrid3.Columns[5].ReadOnly:=not (Status=1);  // NEW_MROZ
     RxDbGrid3.Columns[6].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_MROZ

     RxDbGrid3.Columns[8].ReadOnly:=not (Status=1);  // NEW_OPT1
     RxDbGrid3.Columns[9].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT1

     RxDbGrid3.Columns[11].ReadOnly:=not (Status=1);  // NEW_OPT2
     RxDbGrid3.Columns[12].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT2

     RxDbGrid3.Columns[14].ReadOnly:=not (Status=1);  // NEW_OPT3
     RxDbGrid3.Columns[15].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT3

     RxDbGrid3.Columns[17].ReadOnly:=not (Status=1);  // NEW_OPT6
     RxDbGrid3.Columns[18].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT6

     RxDbGrid3.Columns[20].ReadOnly:=not (Status=1);  // NEW_OPT7
     RxDbGrid3.Columns[21].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT6

     RxDbGrid3.Columns[23].ReadOnly:=not (Status=1);  // NEW_OPT8
     RxDbGrid3.Columns[24].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT6

     RxDbGrid3.Columns[26].ReadOnly:=not (Status=1);  // NEW_OPT4
     RxDbGrid3.Columns[27].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // UTW_OPT4


     RxDbGrid1.Columns[8].ReadOnly:=not (Status=1);  // COMMENT1
     RxDbGrid1.Columns[9].ReadOnly:=(not (Status in [2,22,23])) or (not Can_Utw);  // COMMENT2

     btnSelectTWSet.Enabled:=(Status=1);
     btnSelectTWDynSet.Enabled:=(Status=1);

     SHOP1.enabled:=(Status=1);
     SHOP2.enabled:=(Status=1);
     ZREMON_SHOP.enabled:=(Status=1) and SHOP2.checked;

     GroupBox2.Visible:=(Status in [1,2,22,23]);
     PriceDestUtw.visible:=(Status in [2,22,23]);

end;




procedure TDOC_ZREMON.SHOP1Click(Sender: TObject);
begin
    refresh_mroz;
    ZREMON_SHOP.enabled:=(Zstat=1) and SHOP2.checked;
    SAVE:=False;
end;

procedure TDOC_ZREMON.ZREMON_SHOPChange(Sender: TObject);
begin
   SAVE:=False;
   // Нужно выполнить перезапрос цен по указанному магазину
   refresh_mroz;

end;


procedure TDOC_ZREMON.refresh_mroz;
VAR
  a,ID:integer;
  MSHOP:integer;
  MSKID:double;
  NEW_MROZ:double;
begin
   // Процедура выполняет перезапрос обособленных цен
   if CanRefresh then begin
     if MemZRemons.recordcount>0 then begin
        ID:=MemZRemons.recno;
        MemZRemons.Disablecontrols;
        MemZRemons.First;
        while not MemZRemons.eof do begin
              MemZremons.Edit;
              // Запрашиваем, есть ли цена в этом магазине
              ADD_SQL(QueryWork,'select count(*) as cc from twmonshop where tw_id=:tw_id');
              QueryWork.paramByname('tw_id').asinteger:=MemZRemons.fieldByname('TW_ID').asinteger;
              QueryWork.open;
              // Определяем, есть ли обособленные цены на этот товар
              if QueryWork.eof then MSHOP:=0 else MSHOP:=QueryWork.fieldByname('cc').asinteger;
              if MSHOP>0 then begin
                 // Обособленная цена есть - ставим цветовую метку
                 MemZremons.fieldByname('MET_MONEY_SHOP').asinteger:=1;
                 WorkTransaction.Active:=false;
                 ADD_SQL(Querywork,'select ((select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
                 '(select max(kurs_date) from kurs where '+
                 'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0))*TW.TW_MROZ) as tw_mroz from tw where tw.tw_id=:tw_id');
                 Querywork.paramByname('tw_id').asinteger:=MemZRemons.fieldByname('TW_ID').asinteger;
                 Querywork.open;
                 MemZremons.fieldByname('old_mroz').asfloat:=QueryWork.fieldByname('tw_mroz').asfloat;
                 if SHOP2.checked then begin
                    // Запрашиваем, есть ли цена в этом магазине
                    ADD_SQL(QueryWork,'select count(*) as cc from twmonshop where tw_id=:tw_id');
                    QueryWork.paramByname('tw_id').asinteger:=MemZRemons.fieldByname('TW_ID').asinteger;
                    QueryWork.open;
                    // Определяем, есть ли обособленные цены на этот товар
                    if QueryWork.eof then MSHOP:=0 else MSHOP:=QueryWork.fieldByname('cc').asinteger;
                    if MSHOP>0 then begin
                       // Обособленная цена есть - ставим цветовую метку
                       MemZremons.fieldByname('MET_MONEY_SHOP').asinteger:=1;
                       if SHOP2.checked then begin
                          // Перезапрашиваем цену по указанному магазину
                          ADD_SQL(QueryWork,'select min(skid_percent) as mskid from twmonshop where tw_id=:tw_id and shop_id=:shop_id ');
                          QueryWork.paramByname('tw_id').asinteger:=MemZRemons.fieldByname('TW_ID').asinteger;
                          QueryWork.paramByname('shop_id').asinteger:=strtoint(ZREMON_SHOP.value);
                          QueryWork.open;
                          if QueryWork.eof then MSKID:=0 else MSKID:=QueryWork.fieldByname('MSKID').asfloat;
                          // Изменяем цену
                          NEW_MROZ:=MemZremons.fieldByname('old_mroz').asfloat*(1-MSKID/100);
                          // Запрашиваем округление
                          ADD_SQL(QueryWork,'select money from price_okrug(:CURRENT_MROZ)');
                          QueryWork.paramByname('CURRENT_MROZ').asfloat:=NEW_MROZ;
                          QueryWork.open;
                          MemZremons.fieldByname('old_mroz').asfloat:=QueryWork.fieldByname('money').asfloat;
                       end;
                    end else MemZremons.fieldByname('MET_MONEY_SHOP').asinteger:=0;
                 end;
              end else MemZremons.fieldByname('MET_MONEY_SHOP').asinteger:=0;
              MemZremons.post;
              MemZRemons.next;
        end;
        MemZRemons.first;
        for a:=1 to ID-1 do MemZRemons.next;
        MemZRemons.Enablecontrols;
     end;
   end;

end;

procedure TDOC_ZREMON.btnSelectTWDynSetClick(Sender: TObject);
var tw_group_id:integer;
    tw_group_typ: integer;
    fq: FastQuery;
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;


     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin

      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;

      fq:=FastQuery.Create('select tw_id from tw, LIST_TWDYNGROUP(:typ, :id) where tw.tw_id=list_twdyngroup.tw_id and tw.tw_brak=0');
      fq.parambyname('typ').asinteger:=tw_group_typ;
      fq.parambyname('id').asinteger:=tw_group_id;
      fq.open;

      while not fq.Eof do
      begin
        ADD_ZREMONS(fq.fieldbyname('tw_id').asinteger);
        fq.next;
      end;

      fq.Close;
      fq.Destroy;




     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TDOC_ZREMON.btnSelectTWSetClick(Sender: TObject);
var tw_group_id:integer;
    tw_group_typ: integer;
    fq: FastQuery;
begin
     DicTowarSet:=3; {Ввод одной группы товаров}

     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       fq:=FastQuery.Create('select tw_id from tw, LIST_TWDYNGROUP(:typ, :id) where tw.tw_id=list_twdyngroup.tw_id and tw.tw_brak=0');
       fq.parambyname('typ').asinteger:=tw_group_typ;
       fq.parambyname('id').asinteger:=tw_group_id;
       fq.open;

       while not fq.Eof do
       begin
        ADD_ZREMONS(fq.fieldbyname('tw_id').asinteger);
        fq.next;
       end;

       fq.Close;
       fq.Destroy;
     end;
     Refresh_summ;
     Show_sost;     
end;

procedure TDOC_ZREMON.Button1Click(Sender: TObject);
var fieldDest, fieldSource: string;

  newValue: double;

begin
  if ZREMON_STAT.Value='1' then
  if ((((price_dest.ItemIndex=-1)
  or (price_source.ItemIndex=-1))
  or (price_round_type.ItemIndex=-1)
  or (memZRemons.RecordCount=0))) then
    exit;

  if strtoint(ZREMON_STAT.Value) in [2,22,23] then
  if ((((pricedestutw.ItemIndex=-1)
  or (price_source.ItemIndex=-1))
  or (price_round_type.ItemIndex=-1)
  or (memZRemons.RecordCount=0))) then
    exit;


  if ZREMON_STAT.Value='1' then
  begin
    case price_dest.ItemIndex of
    0: fieldDest:='NEW_MROZ';
    1: fieldDest:='NEW_OPT1';
    2: fieldDest:='NEW_OPT2';
    3: fieldDest:='NEW_OPT3';
    4: fieldDest:='NEW_OPT4';
    5: fieldDest:='NEW_OPT6';
    end;
  end;
  if strtoint(ZREMON_STAT.Value) in [2,22,23] then
  begin
    case pricedestutw.ItemIndex of
    0: fieldDest:='UTW_MROZ';
    1: fieldDest:='UTW_OPT1';
    2: fieldDest:='UTW_OPT2';
    3: fieldDest:='UTW_OPT3';
    4: fieldDest:='UTW_OPT4';
    5: fieldDest:='UTW_OPT6';
    end;

  end;


   case price_source.ItemIndex of
    0: fieldSource:='OLD_MROZ';
    1: fieldSource:='OLD_OPT1';
    2: fieldSource:='OLD_OPT2';
    3: fieldSource:='OLD_OPT3';
    4: fieldSource:='OLD_OPT4';
    5: fieldSource:='money5';
    6: fieldSource:='OLD_OPT6';
   end;    

  memZRemons.First;
  while not memZRemons.Eof do
  begin

    memZRemons.Edit;


    newValue:=memZRemons.FieldByName(fieldSource).asfloat * (price_percent.Value+100)/100;;

   case price_round_type.ItemIndex of
   0: newValue:=  int(newValue+0.999999);
   1: newValue:=  int(newValue/10+0.999999)*10;
   2: newValue:=  int(newValue);
   3: newValue:=  int(newValue/10)*10;
   4: newValue:=  int(newValue*100)/100;
   5: newValue:=  int((newValue*10+0.99999))/10;
   6: newValue:=  int(newValue*10)/10;
   end;


   memZRemons.fieldByName(fieldDest).asfloat:=newValue;

    memZRemons.Post;

    memZRemons.Next;
  end;
  memZRemons.First;


end;

end.

