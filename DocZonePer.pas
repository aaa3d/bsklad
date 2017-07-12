unit DocZonePer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid;

type
  TDoc_ZONE_PER = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    ZONE_PER_OSN: TMemo;
    Label10: TLabel;
    ZONE_PER_NUM: TEdit;
    Label11: TLabel;
    ZONE_PER_DATE: TDateEdit;
    Btn_DicTow: TToolButton;
    Btn_DelTow: TToolButton;
    ToolButton4: TToolButton;
    Btn_Propertis: TToolButton;
    Btn_Print: TToolButton;
    Btn_FindTow: TToolButton;
    ToolButton8: TToolButton;
    Btn_Prow: TToolButton;
    Btn_Unprow: TToolButton;
    ToolButton11: TToolButton;
    Btn_SAVE: TToolButton;
    Btn_Apply: TToolButton;
    ToolButton14: TToolButton;
    Btn_Detal: TToolButton;
    Btn_Analiz: TToolButton;
    Btn_Marketing: TToolButton;
    Btn_Subdoc: TToolButton;
    IBQuery1: TIBQuery;
    MemZonePERS: TRxMemoryData;
    DsZonePERS: TDataSource;
    MemZonePERSTW_ID: TIntegerField;
    MemZonePERSTW_NAM: TStringField;
    MemZonePERSTW_MONEY: TFloatField;
    MemZonePERSTW_KOL: TFloatField;
    MemZonePERSTW_SUMM: TFloatField;
    MemZonePERSED_SHORT: TStringField;
    MemZonePERSSTS_ID: TIntegerField;
    MemZonePERSTW_ART: TIntegerField;
    Query1Transaction: TIBTransaction;
    IBQuery2: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N6: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnSubDoc: TMenuItem;
    N10: TMenuItem;
    MnTW: TMenuItem;
    MnFind: TMenuItem;
    MnDel: TMenuItem;
    N13: TMenuItem;
    MnDetal: TMenuItem;
    MnAnaliz: TMenuItem;
    MnMarketing: TMenuItem;
    N18: TMenuItem;
    MnCenn: TMenuItem;
    MnCennMore: TMenuItem;
    ToolButton1: TToolButton;
    Btn_PrintCenn: TToolButton;
    Btn_PrintCennMore: TToolButton;
    MemZonePERSOST: TFloatField;
    ToolButton2: TToolButton;
    Btn_RefreshOst: TToolButton;
    MnRefreshOst: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    SKL_FROM: TRxDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    N2: TMenuItem;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    MemZonePERSTW_COLOR: TIntegerField;
    N1: TMenuItem;
    MnFRM: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Btn_Ost: TToolButton;
    MnOst: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ZONE_FROM: TRxDBLookupCombo;
    Label6: TLabel;
    btnFastInfo: TToolButton;
    MemZonePERSPERS_WEIGHT: TFloatField;
    MemZonePERSTW_WEIGHT: TFloatField;
    in_place_combo: TRxDBLookupCombo;
    MemZonePERSZONE_TO_ID: TIntegerField;
    MemZonePERSZONE_TO_NAME: TStringField;
    MainDSZone: TDataSource;
    MainDicZone: TRxMemoryData;
    MainDicZoneZONE_ID: TIntegerField;
    MainDicZoneSKL_ID: TIntegerField;
    MainDicZoneZONE_NAME: TIBStringField;
    MainDicZoneZONE_DESCR: TIBStringField;
    MainDicZoneTM: TDateTimeField;
    MainDicZone1: TIBQuery;
    MainDicZone1ZONE_ID: TIntegerField;
    MainDicZone1SKL_ID: TIntegerField;
    MainDicZone1ZONE_NAME: TIBStringField;
    MainDicZone1ZONE_DESCR: TIBStringField;
    MainDicZone1TM: TDateTimeField;
    IBQuery3: TIBQuery;
    RxDBGrid11: TRxDBGrid;
    ds_tw_zone_distrib: TDataSource;
    q_tw_zone_distrib: TIBQuery;
    q_tw_zone_distribZONE_ID: TIntegerField;
    q_tw_zone_distribZONE_NAME: TIBStringField;
    q_tw_zone_distribTW_OST: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure MemZonePERSTW_IDChange(Sender: TField);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsZonePERSDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    procedure ADD_PERS(TW_ID:integer;KOL:double);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_PrintClick(Sender: TObject);
    procedure Btn_SubdocClick(Sender: TObject);
    procedure Btn_PropertisClick(Sender: TObject);
    procedure Btn_DicTowClick(Sender: TObject);
    procedure Btn_FindTowClick(Sender: TObject);
    procedure Btn_AnalizClick(Sender: TObject);
    procedure Btn_MarketingClick(Sender: TObject);
    procedure Btn_PrintCennClick(Sender: TObject);
    procedure Btn_PrintCennMoreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_RefreshOstClick(Sender: TObject);
    procedure SKL_FROMChange(Sender: TObject);
    procedure PER_WHOChange(Sender: TObject);
    procedure ZONE_PER_OSNChange(Sender: TObject);
    procedure ZONE_PER_DATEChange(Sender: TObject);
    procedure Btn_ProwClick(Sender: TObject);
    procedure Btn_UnprowClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Btn_OstClick(Sender: TObject);
    procedure MemZonePERSTW_KOLChange(Sender: TField);
    procedure ZONE_FROMChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure MemZonePERSAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure RxDBGrid1ColExit(Sender: TObject);
    procedure in_place_comboExit(Sender: TObject);
    procedure in_place_comboChange(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  CanRefreshSKL:boolean;
  CanInsert:Boolean=False;
  ZONE_PERS_DEL:array[1..1000] of integer;
  ZONE_PERS_DEL_TW:array[1..1000] of integer;
  ZONE_PERS_DEL_MESS:array[1..1000] of string;
  ZONE_PERS_DEL_MESS2:array[1..1000] of string;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_ZONE_PER: TDoc_ZONE_PER;
  Sost:integer=0;
  SHOP_ID:integer;
  ZONE_PER_NUMS:integer;
  STR:ansistring='';
  ZONE_PER_PROW:boolean;



  CAN_REFRESH: boolean;

implementation

uses Mainform, DicKlient, ANALIZTW, DicTowar, SelectPrint, SetKolvo, DocPer;

{$R *.DFM}

procedure TDoc_ZONE_PER.Show_sost;
var
   s:ansistring;
   ZONEPerEmpty:boolean;
begin
     if Doc_ZONE_Per.Tag<0 then
        Doc_ZONE_Per.caption:='Накладная перемещения между зонами. Новая'
     else begin
          if ZONE_PER_PROW then
            Doc_ZONE_Per.caption:='Накладная перемещения  между зонами. Просмотр'
          else
            Doc_ZONE_Per.caption:='Накладная перемещения между зонами. Редактирование';
     end;
     if MemZonePERS.RecordCount=0 then ZonePerEmpty:=true else ZonePerEmpty:=false;
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
     Btn_Prow.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     MnProw.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     Btn_UnProw.enabled:=(ZONE_PER_PROW) and (not ZonePerEmpty);
     MnUnProw.enabled:=(ZONE_PER_PROW) and (not ZonePerEmpty);
     Btn_SAVE.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     MnSAVE.enabled:= (not ZONE_PER_PROW) and (not ZonePerEmpty);
     Btn_Apply.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     MnApply.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     Btn_Print.enabled:=not ZonePerEmpty;
     MnPrint.enabled:=not ZonePerEmpty;
     Btn_Propertis.enabled:=true;
     MnHistory.enabled:=true;
     Btn_SubDoc.enabled:=not ZonePerEmpty;
     MnSubDoc.enabled:=not ZonePerEmpty;
     Btn_DicTow.enabled:=not ZONE_PER_PROW;
     MnTw.enabled:=not ZONE_PER_PROW;
     Btn_FindTow.enabled:=not ZonePerEmpty;
     MnFind.enabled:=not ZonePerEmpty;
     Btn_DelTow.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     MnDel.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     Btn_Ost.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     MnOst.enabled:=(not ZONE_PER_PROW) and (not ZonePerEmpty);
     Btn_DETAL.enabled:=not ZonePerEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not ZonePerEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not ZonePerEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not ZonePerEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not ZonePerEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not ZonePerEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=not ZonePerEmpty;
     MnCenn.enabled:=not ZonePerEmpty;
     Btn_PrintCennMore.enabled:=not ZonePerEmpty;
     MnCennMore.enabled:=not ZonePerEmpty;
     RxDbgrid1.ReadOnly:=ZONE_Per_PROW;
     SKL_FROM.enabled:=not ZONE_PER_PROW;
     ZONE_FROM.enabled:=not ZONE_PER_PROW;
     ZONE_PER_DATE.enabled:=not ZONE_PER_PROW;
     ZONE_PER_OSN.enabled:=not ZONE_PER_PROW;


end;

procedure TDoc_ZONE_PER.FormShow(Sender: TObject);
begin
     CAN_REFRESH:=false;
     IS_EDIT_ZONE_PER:=true;
     CanRefreshSKL:=false;





     Sost:=0;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-29;
     {Определяем название}
     if Doc_ZONE_PER.tag<0 then begin
       Sost:=1;
       ZONE_PER_PROW:=FALSE;
       Get_default;
       {Устанавливаем данные}
       SHOP_ID:=SHOPID;
       ZONE_PER_OSN.lines.clear;
       ZONE_PER_NUM.text:='Новая';
       ZONE_PER_DATE.date:=Date();
       ZONE_PER_NUMS:=-1;
       SKL_FROM.value := inttostr(DEFAULT_SKLAD);
       ZONE_FROM.value := inttostr(DEFAULT_SKLAD);


     end else begin
          {Читаем накладную}
          ADD_SQL(IbQuery1,'select ZONE_PER.* from ZONE_PER where ZONE_PER_ID=:ZONE_PER_ID');

          {Определяем, где накладная}
          IbQuery1.Parambyname('ZONE_PER_ID').asinteger:=Doc_ZONE_PER.tag;
          IbQuery1.Open;
          if IbQuery1.fieldbyname('ZONE_PER_PROW').asstring='1' then ZONE_PER_PROW:=true else ZONE_PER_PROW:=false;



          SKL_FROM.value := IbQuery1.fieldbyname('SKL_FROM').asstring;
          ZONE_FROM.value := IbQuery1.fieldbyname('ZONE_FROM').asstring;



          SHOP_ID:=IbQuery1.fieldbyname('SHOP_ID').asinteger;
          ZONE_PER_OSN.lines.clear;
          ZONE_PER_OSN.lines.add(IbQuery1.fieldbyname('ZONE_PER_OSN').asstring);

          ZONE_PER_NUM.text:=IbQuery1.fieldbyname('ZONE_PER_NUM').asstring;
          ZONE_PER_NUMS:=IbQuery1.fieldbyname('ZONE_PER_NUM').asinteger;
          ZONE_PER_DATE.date:=IbQuery1.fieldbyname('ZONE_PER_DATE').asdatetime;
          {Читаем содержимое накладной}



          {Читаем накладную перемещения}
          Add_SQL(IbQuery1,'select * from LIST_ZONE_PERS(:ZONE_PER_ID,1) order by ZONE_PERS_ID');
          IbQuery1.Parambyname('ZONE_PER_ID').asinteger:=Doc_ZONE_PER.tag;
          IbQuery1.Open;
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemZonePERS.Append;
                MemZonePERS.Fieldbyname('ZONE_PERS_ID').asinteger:=IbQuery1.Fieldbyname('ZONE_PERS_ID').asinteger;
                MemZonePERS.Fieldbyname('TW_ID').asinteger:=IbQuery1.Fieldbyname('TW_ID').asinteger;
                MemZonePERS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TW_COLOR').asinteger;
                MemZonePERS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
                MemZonePERS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
                MemZonePERS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
                MemZonePERS.Fieldbyname('TW_KOL').asfloat:=IbQuery1.Fieldbyname('TW_KOL').asfloat;
                MemZonePERS.Fieldbyname('ZONE_TO_ID').asinteger:=IbQuery1.Fieldbyname('ZONE_TO_ID').asinteger;
                MemZonePERS.Fieldbyname('ZONE_TO_NAME').asstring:=IbQuery1.Fieldbyname('ZONE_TO_NAME').asstring;

                MemZonePERS.Post;
                CanInsert:=False;
                IbQuery1.next;
          end;
     end;
     btn_refreshost.Click;
     CAN_REFRESH:=true;

     Show_Sost;
     CanRefreshSKL:=true;
     Pagecontrol1.ActivePage:=Tabsheet1;
     RxDbGrid1.setfocus;
     SAVE:=true;
end;

procedure TDoc_ZONE_PER.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
   if not ZONE_PER_PROW then begin
     if (key='*') and (sost=0)  then begin
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
              if length(STR)>0 then begin
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
                    ADD_PERS(ID,-1);

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
     Show_Sost;
   end;
end;

procedure TDoc_ZONE_PER.Btn_ApplyClick(Sender: TObject);
var
   A,ZONE_PER_ID,ID,OLDID:integer;
   r,IDR:double;
   new_rns_td_id: integer;
   new_pns_td_id: integer;
begin

  if SKL_FROM.value='' then messbox('Не указан склад-отправитель!',MessSystem,48)
  else
  if ZONE_FROM.value='' then messbox('Не указана зона-отправитель!',MessSystem,48)
  else


  begin
     {Сохраняем накладную (Apply)}
     caption:='Шаг1';
     if (MemZonePers.State in [dsInsert,DsEdit]) then MemZonePers.Post;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemZonePers.recno;
     Try
        if NOT ZONE_PER_PROW then begin
          IBSAVE_CLEAR;
          if ZONE_PER_NUMS<0 then ZONE_PER_NUMS:=NEW_ZONE_PER_NUM(ZONE_PER_DATE.date);
          IBSAVE_ADD('ZONE_PER_NUM',ZONE_PER_NUMS);
          IBSAVE_ADD('ZONE_PER_DATE',strtodatetime(datetostr(ZONE_PER_DATE.date)+' '+timetostr(time())));
          IBSAVE_ADD('SKL_FROM',strtoint(SKL_FROM.value));
          IBSAVE_ADD('ZONE_FROM',strtoint(ZONE_FROM.value));
          IBSAVE_ADD('SHOP_ID',SHOP_ID);
          IBSAVE_ADD('ZONE_PER_PROW','0');
          IBSAVE_ADD('ZONE_PER_OSN',Memotostr(ZONE_PER_OSN.lines));
          IBSAVE_ADD('US_ID',USERID);
          ZONE_PER_ID:=IBSAVE_DOC('ZONE_PER',DOC_ZONE_PER.tag);
          caption:='Шаг2';
        end else ZONE_PER_ID:=DOC_ZONE_PER.tag;
        if ZONE_PER_ID<=0 then IDR:=SQRT(-1)
        else begin
             // Фиксируем удаление товаров
             caption:='Шаг3';
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','ZONE_PER');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',ZONE_PERS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',ZONE_PER_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);

             end;
     caption:='Шаг4';
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if ZONE_PERS_DEL[A]>0 then if not IBDELETE_DOC('ZONE_PERS',ZONE_PERS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemZonePERS.DisableControls;
             MemZonePERS.First;
     caption:='Шаг5';
             while not MemZonePERS.eof do
             begin
                   caption:='Шаг5 ID='+inttostr(MemZonePers.recno);


                    ibquery3.SQL.Text:='SELECT ZONE_ID FROM ZONE WHERE ZONE_NAME=:zone_name and skl_id=:skl_id';
                    ibquery3.ParamByName('ZONE_NAME').asString := MemZonePers.FieldByName('ZONE_TO_NAME').ASString;
                    ibquery3.ParamByName('skl_id').asInteger := strtoint(SKL_FROM.value);

                    ibquery3.Open;

                    if (not ibquery3.Eof) then
                    begin
                      MemZonePers.Edit;
                      MemZonePers.FieldByName('ZONE_TO_ID').asInteger := ibquery3.fieldByName('ZONE_ID').asInteger;
                      MemZonePers.Post;
                    end

                    else
      //              if (RxMemoryData1.FieldByName('ZONE_ID').asstring = '') then
                    begin
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('ZONE_NAME', MemZonePers.FieldByName('ZONE_TO_NAME').ASString);
                      IBSAVE_ADD('SKL_ID', strtoint(SKL_FROM.value));
                      id := IBSAVE_DOC('ZONE', -1);
                      Datamodule1.IBTransaction2.Commit;
                      MemZonePers.Edit;
                      MemZonePers.FieldByName('ZONE_TO_ID').asInteger := id;
                      MemZonePers.Post;
                    end;

                    ibquery3.Close;




                   IBSAVE_CLEAR;
                   IBSAVE_ADD('ZONE_PER_ID',ZONE_PER_ID);

                   IBSAVE_ADD('TW_ID',MemZonePERS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('TW_KOL',MemZonePERS.fieldbyname('TW_KOL').asfloat);
                   IBSAVE_ADD('ZONE_TO_ID',MemZonePERS.fieldbyname('ZONE_TO_ID').asinteger);



                   ID:=IBSAVE_DOC('ZONE_PERS',MemZonePERS.fieldbyname('ZONE_PERS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_ZONE_PER.tag>0) and (MemZonePERS.fieldbyname('ZONE_PERS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','ZONE_PER');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен товар: '+MemZonePERS.Fieldbyname('TW_ART').asstring+' '+
                          MemZonePERS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemZonePERS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                          MemZonePERS.Fieldbyname('ED_SHORT').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',ZONE_PER_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemZonePERS.Edit;
                      MemZonePERS.fieldbyname('ZONE_PERS_ID').asinteger:=ID;
                      MemZonePERS.Post;
                   end;





                   MemZonePERS.next;
             end;
        end;
     caption:='Шаг6';
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_ZONE_PER.tag:=ZONE_PER_ID;
        ZONE_PER_NUM.text:=inttostr(ZONE_PER_NUMS);
        MemZonePERS.First;
        while not MemZonePERS.eof do begin
              if MemZonePERS.fieldbyname('ZONE_PERS_ID').asinteger<0 then begin
                 MemZonePERS.Edit;
                 MemZonePERS.fieldbyname('ZONE_PERS_ID').asinteger:=-MemZonePERS.fieldbyname('ZONE_PERS_ID').asinteger;
                 MemZonePERS.Post;
              end;
              // считаем, что товар в дополнительные накладные сохранился, и его больше сохранять НЕ НАДО

              MemZonePERS.next;
        end;
        MemZonePERS.First;
        for a:=1 to OLDID-1 do MemZonePERS.next;
        CNT_DEL:=0;
        MemZonePERS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
        SAVE:=TRUE;
     Except
        Messbox('Ошибка при сохранении накладной!',MessSystem,48);
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TDoc_ZONE_PER.MemZonePERSTW_IDChange(Sender: TField);
begin
     SAVE:=FALSE;
end;

procedure TDoc_ZONE_PER.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        if not ZONE_PER_PROW then Btn_Prow.Click;
        Close;
     end;
end;

procedure TDoc_ZONE_PER.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox('Накладная была изменёна! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_ZONE_PER.DsZonePERSDataChange(Sender: TObject; Field: TField);
begin
     if MemZonePERS.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemZonePERS.State in [dsInsert]) and ( not CanInsert) then MemZonePERS.Cancel;
end;

procedure TDoc_ZONE_PER.Btn_DelTowClick(Sender: TObject);

begin
     if Messbox('Удалить из накладной товар "'+MemZonePERS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemZonePERS.Fieldbyname('ZONE_PERS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          WorkTransaction.Active:=False;

          ZONE_PERS_DEL[CNT_DEL]:=MemZonePERS.Fieldbyname('ZONE_PERS_ID').asinteger;

          ZONE_PERS_DEL_TW[CNT_DEL]:=MemZonePERS.Fieldbyname('TW_ID').asinteger;
          ZONE_PERS_DEL_MESS[CNT_DEL]:='Удален товар: '+MemZonePERS.Fieldbyname('TW_ART').asstring+' '+
          MemZonePERS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemZonePERS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
          MemZonePERS.Fieldbyname('ED_SHORT').asstring;

        end;
        MemZonePERS.delete;
        Show_Sost;
     end;
end;

procedure TDoc_ZONE_PER.Btn_DetalClick(Sender: TObject);
begin
  SHOW_DETAL_TW(MemZonePERS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_ZONE_PER.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (sost=1) and (key=46) and Btn_DelTOW.enabled then Btn_DelTOW.click;
     if (key=113) and (Btn_DETAL.enabled) then Btn_DETAL.click; {F2}
     if (key=114) and (Btn_ANALIZ.enabled) then Btn_ANALIZ.click; {F3}
     if (key=115) and (Ssshift in Shift) and (Btn_MARKETING.enabled) then Btn_MARKETING.click; {F4}
     if (key=120) then begin {F9}
        key:=0;
        if Btn_Print.enabled then begin
          Application.createForm(TSelect_Print,Select_Print);
          Select_Print.Button1.caption:='Напечатать накладную перемещения';
          Select_Print.Button2.caption:='Напечатать Ценник на выбранный товар';
          Select_Print.Button3.caption:='Напечатать Ценники на все товары в счёте';
          Select_Print.showModal;
          if Select_Print.tag>0 then begin
             if (Btn_Print.Enabled) and (Select_Print.tag=1) then Btn_Print.click;
             if (Btn_PrintCenn.Enabled) and (Select_Print.tag=2) then Btn_PrintCenn.click;
             if (Btn_PrintCennMore.Enabled) and (Select_Print.tag=3) then Btn_PrintCennMore.click;
          end;
          Select_Print.Destroy;
        end;
     end;
     if (key=123) and (Btn_Propertis.enabled) then Btn_Propertis.click; {F12}
     if (key=192) and (ssCtrl in Shift) and (Btn_refreshOst.enabled) then begin
        key:=0;
        Btn_RefreshOst.click;
     end;
     if (key=192) and (btnFastInfo.enabled) then
     begin
     	key:=0;
     	btnFastInfo.click; {~}
     end;     
     if (key=13) and (ssCtrl in Shift) and (Btn_Save.enabled) then begin
        key:=0;
        Btn_SAve.click;
     end;
end;

procedure TDoc_ZONE_PER.ADD_PERS(TW_ID:integer;KOL:double);
var
   TW_TEMP:integer;
   TW_STR:ansistring;
   ISS:boolean;
begin
  begin

     Can_Refresh:=false;
     TW_TEMP:=0;
     {Проверяем, нет ли в накладной уже такого товара}
     if MemZonePERS.RecordCount>0 then TW_TEMP:=MemZonePERS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemZonePERS.Disablecontrols;
     MemZonePERS.first;
     while (not MemZonePERS.eof) and (not ISS) do begin
           if MemZonePERS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemZonePERS.fieldByname('TW_ART').asstring+'-'+MemZonePERS.fieldByname('TW_NAM').asstring;
           end;
           MemZonePERS.next;
     end;
     MemZonePERS.EnableControls;
     if ISS then Messbox('Накладная уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
               //Проверять только если продажа со склада, где нет фирмы-владельца

          SAVE:=False;
          Query1Transaction.Active:=False;
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select tw.tw_weight, twktg.twktg_color,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short,  '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id ');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery1.Open;

          CanInsert:=True;
          MemZonePERS.Append;
          MemZonePERS.Fieldbyname('ZONE_PERS_ID').asinteger:=-1;
          MemZonePERS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemZonePERS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemZonePERS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemZonePERS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemZonePERS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemZonePERS.Fieldbyname('TW_MONEY').asfloat:=IbQuery1.Fieldbyname('TW_MROZ').asfloat;
          MemZonePERS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
          MemZonePERS.fieldByname('OST').asfloat:=GetZoneOst(TW_ID,strtoint(SKL_FROM.value),strtoint('0'+ZONE_FROM.value));


          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemZonePERS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemZonePERS.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemZonePERS.Post;

          MemZonePERS.AfterScroll(nil);






          CanInsert:=False;
     end;
     IbQuery1.Close;
     RxDbGrid1.setfocus;
     Can_Refresh:=true;

  end;
end;

procedure TDoc_ZONE_PER.Btn_PrintClick(Sender: TObject);
begin
  //   if Not Save then
  //      if Btn_Apply.enabled then if Messbox('Документ был изменен! Сохранить изменения?',MessSubmit,4+48)=6 then Btn_Apply.click;
  //      {Печатаем}
   //     PRINT_PER(Doc_PER.tag);
end;

procedure TDoc_ZONE_PER.Btn_SubdocClick(Sender: TObject);
begin
  //   if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     {Создаём документ на основании имеющегося...}
   //  SUBDOC(5,0);
end;

procedure TDoc_ZONE_PER.Btn_PropertisClick(Sender: TObject);
begin
     {Отображаем "историю" накладной перемещения}
     SHOW_HISTORY_DOC('Накладная перемещения № '+ZONE_PER_NUM.text,'ZONE_PER',DOC_ZONE_PER.tag);
end;

procedure TDoc_ZONE_PER.Btn_DicTowClick(Sender: TObject);
var
   a:integer;
begin

     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_PERS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;

     Show_sost;
end;

procedure TDoc_ZONE_PER.Btn_FindTowClick(Sender: TObject);
begin
     {}
end;

procedure TDoc_ZONE_PER.Btn_AnalizClick(Sender: TObject);
begin
  SHOW_ANALIZ_TW(MemZonePERS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_ZONE_PER.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemZonePERS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_ZONE_PER.Btn_PrintCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(MemZonePERS.fieldbyname('TW_ID').asinteger,strtoint(skl_from.value));
     PRINT_CENNIK;
end;

procedure TDoc_ZONE_PER.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
     if MemZonePERS.RecordCount>0 then begin
         ID:=MemZonePERS.RecNo;
         MemZonePERS.DisableControls;
         MemZonePERS.First;
         while not MemZonePERS.eof do begin
               ADD_CENNIK(MemZonePERS.fieldbyname('TW_ID').asinteger,strtoint(skl_from.value));
               MemZonePERS.next;
         end;
         MemZonePERS.First;
         for a:=1 to ID-1 do MemZonePERS.next;
         MemZonePERS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDoc_ZONE_PER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_EDIT_ZONE_PER:=False;

end;

procedure TDoc_ZONE_PER.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
begin
     s:=Doc_ZONE_PER.caption;
     Doc_ZONE_PER.caption:=Doc_ZONE_PER.caption+'. Чтение остатков товаров';
     if MemZonePERS.RecordCount>0 then begin
         ID:=MemZonePERS.RecNo;
         MemZonePERS.DisableControls;
         MemZonePERS.First;
         Summ:=0;
         while not MemZonePERS.eof do begin
               MemZonePERS.Edit;
               MemZonePERS.fieldByname('OST').asfloat:=GetZoneOst(MemZonePERS.fieldByname('TW_ID').asinteger, strtoint(skl_from.value), strtoint('0'+zone_from.value));
               MemZonePERS.Post;
               MemZonePERS.next;
         end;
         MemZonePERS.First;
         for a:=1 to ID-1 do MemZonePERS.next;
         MemZonePERS.EnableControls;
     end;
     Doc_ZONE_PER.caption:=s;

end;

procedure TDoc_ZONE_PER.SKL_FROMChange(Sender: TObject);

begin

  save:=false;

  Btn_RefreshOstClick(nil);


  MainDicZone1.ParamByName('skl_id').asString := SKL_FROM.Value;
  MainDicZone1.Open;

  MainDicZone.EmptyTable;
  MainDicZone.LoadFromDataSet(MainDicZone1, 0, lmCopy);
  MainDicZone.Edit;
  MainDicZone.FieldByName('ZONE_NAME').asString := 'Пустая зона';
  MainDicZone.FieldByName('SKL_ID').asString := SKL_FROM.Value;
  MainDicZone.FieldByName('ZONE_ID').asInteger := 0;
  MainDicZone.Post;
 
  MainDicZone1.Close;



  show_sost;


end;

procedure TDoc_ZONE_PER.PER_WHOChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_ZONE_PER.ZONE_PER_OSNChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_ZONE_PER.ZONE_PER_DATEChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_ZONE_PER.Btn_ProwClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     if (SAVE) then begin
        if PROV_ZONE_PER(Doc_ZONE_Per.tag,'') then begin
                ZONE_PER_PROW:=True;
                Show_Sost;
                Btn_RefreshOst.click;
                SAVE:=true;
        end;
     end;
end;

procedure TDoc_ZONE_PER.Btn_UnprowClick(Sender: TObject);
begin
     if UNPROV_ZONE_PER(Doc_ZONE_Per.tag,'') then begin
                Btn_RefreshOst.click;
                ZONE_PER_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDoc_ZONE_PER.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Background:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Background:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
     end;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
      if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;
     end;
end;

procedure TDoc_ZONE_PER.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
     RxDbGrid1.setfocus;
end;

procedure TDoc_ZONE_PER.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDoc_ZONE_PER.Btn_OstClick(Sender: TObject);
begin
    MemZonePERS.edit;
    MemZonePERS.FieldByName('TW_KOL').asfloat:=
      MemZonePERS.fieldByname('OST').asfloat;
    MemZonePERS.Post;

end;

procedure TDoc_ZONE_PER.MemZonePERSTW_KOLChange(Sender: TField);
var
  val:double;
begin

   SAVE:=FALSE;
   val:=MemZonePERS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemZonePERS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;



end;

procedure TDoc_ZONE_PER.ZONE_FROMChange(Sender: TObject);
begin

  save:=false;

  Btn_RefreshOstClick(nil);


  show_sost;
end;

procedure TDoc_ZONE_PER.FRMChange(Sender: TObject);
begin
   	save:=false;
    Btn_RefreshOstClick(nil);
end;

procedure TDoc_ZONE_PER.MemZonePERSAfterScroll(DataSet: TDataSet);
begin
  in_place_combo.Visible := false;
   q_tw_zone_distrib.Close;

   q_tw_zone_distrib.ParamByName('tw_id').asinteger :=  MemZonePERS.fieldbyName('tw_id').asInteger;
   q_tw_zone_distrib.Open;

end;

procedure TDoc_ZONE_PER.RxDBGrid1ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
if (not Btn_Apply.enabled)
        then exit;

 if ((RxDBGrid1.col=6) ) then
    begin

      begin


      in_place_combo.Value:=MemZonePERS.fieldByname('ZONE_TO_ID').asstring;
      in_place_combo.Visible := True;
      AllowEdit:=false;
      end;
//      combo_kln_worktype.DropDown;
    end;
end;

procedure TDoc_ZONE_PER.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (gdFocused in State) then
 if ((Column.Index = 5) or (DataCol = 5) ) then
    begin
      in_place_combo.Left := Rect.Left + RxDBGrid1.Left;
      in_place_combo.Top := Rect.Top + RxDBGrid1.top;
      in_place_combo.Width := Rect.Right - Rect.Left+2;
//      in_place_combo_data.EmptyTable;

    end

end;

procedure TDoc_ZONE_PER.RxDBGrid1Exit(Sender: TObject);
begin
//   in_place_combo.CloseUp(false);
//   in_place_combo.Visible := false;
 
end;

procedure TDoc_ZONE_PER.RxDBGrid1ColExit(Sender: TObject);
begin
   in_place_combo.CloseUp(false);
  in_place_combo.Visible := false;
end;

procedure TDoc_ZONE_PER.in_place_comboExit(Sender: TObject);
begin
   in_place_combo.CloseUp(false);
  in_place_combo.Visible := false;
end;

procedure TDoc_ZONE_PER.in_place_comboChange(Sender: TObject);
begin
   if in_place_combo.Value<>'' then
   begin

   MemZonePERS.Edit;
   MemZonePERS.fieldByname('ZONE_TO_NAME').asstring:=in_place_combo.DisplayValue;
   MemZonePERS.fieldByname('ZONE_TO_ID').asstring:=in_place_combo.Value;
   MemZonePERS.Post;
   in_place_combo.CloseUp(false);
   in_place_combo.Visible := false;


   end;
end;

end.
