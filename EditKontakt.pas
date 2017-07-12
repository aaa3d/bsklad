unit EditKontakt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, ToolEdit,B_DButils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxLookup, IBDatabase, Menus, ToolWin, Buttons,
  CurrEdit, RXSpin, Grids, DBGrids, RXDBCtrl, RxMemDS, RXGrids, DualList;

type
  TEdit_Kontakt = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label1: TLabel;
    KLN_FAM: TEdit;
    Label2: TLabel;
    KLN_NAME: TEdit;
    Label3: TLabel;
    KLN_NAME2: TEdit;
    KLN_EMAIL: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    KLN_ORG: TEdit;
    Label6: TLabel;
    KLN_DOL: TEdit;
    Label7: TLabel;
    KLN_ADR: TMemo;
    Label8: TLabel;
    KLN_CITY: TEdit;
    Label9: TLabel;
    KLN_OBLAST: TEdit;
    Label10: TLabel;
    KLN_INDEX: TEdit;
    Label11: TLabel;
    KLN_LAND: TEdit;
    Label12: TLabel;
    KLN_TEL: TEdit;
    Label13: TLabel;
    KLN_SOTEL: TEdit;
    Label14: TLabel;
    KLN_FAX: TEdit;
    Label15: TLabel;
    KLN_PAGER: TEdit;
    Label16: TLabel;
    KLN_ORG_ADR: TMemo;
    Label17: TLabel;
    KLN_ORG_CITY: TEdit;
    Label18: TLabel;
    KLN_ORG_OBLAST: TEdit;
    Label19: TLabel;
    KLN_ORG_INDEX: TEdit;
    Label20: TLabel;
    KLN_ORG_LAND: TEdit;
    Label21: TLabel;
    KLN_ORG_TEL: TEdit;
    Label22: TLabel;
    KLN_ORG_FAX: TEdit;
    TabSheet6: TTabSheet;
    Bevel6: TBevel;
    Label25: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    KLN_OK2: TEdit;
    KLN_BNK: TEdit;
    Label26: TLabel;
    KLN_BNK_ADR: TMemo;
    Label27: TLabel;
    KLN_OK1: TEdit;
    Label28: TLabel;
    KLN_KB: TEdit;
    Label29: TLabel;
    KLN_RS: TEdit;
    Label30: TLabel;
    KLN_BIK: TEdit;
    Label31: TLabel;
    KLN_KS: TEdit;
    Label32: TLabel;
    KLN_PASS_SER: TEdit;
    Label33: TLabel;
    KLN_PASS_NUM: TEdit;
    Label34: TLabel;
    KLN_PASS_WYDD: TDateEdit;
    Label35: TLabel;
    KLN_PASS_WYD: TEdit;
    Label36: TLabel;
    KLN_SVID: TEdit;
    Label37: TLabel;
    KLN_OFFICE_ADR: TMemo;
    Label38: TLabel;
    KLN_OFFICE_TEL: TEdit;
    Label39: TLabel;
    KLN_OFFICE_FAX: TEdit;
    Label40: TLabel;
    KLN_OFFICE_TIME: TEdit;
    Label41: TLabel;
    KLN_OFFICE_CONTACT: TEdit;
    KLN_OFFICE_BIGAUTO: TCheckBox;
    KLN_SKL_ADR: TMemo;
    Label42: TLabel;
    Label43: TLabel;
    KLN_SKL_TEL: TEdit;
    KLN_SKL_FAX: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    KLN_SKL_TIME: TEdit;
    KLN_SKL_CONTACT: TEdit;
    Label46: TLabel;
    KLN_SKL_BIGAUTO: TCheckBox;
    TabSheet7: TTabSheet;
    Bevel7: TBevel;
    Label47: TLabel;
    Label48: TLabel;
    KLN_PASSWORD1: TEdit;
    KLN_PASSWORD2: TEdit;
    Label49: TLabel;
    Label50: TLabel;
    KLN_PRIM: TMemo;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    KLN_MEN: TCheckBox;
    KLN_CLOSE: TCheckBox;
    Label51: TLabel;
    Label52: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label53: TLabel;
    Label54: TLabel;
    Shape3: TShape;
    Label55: TLabel;
    Label56: TLabel;
    Shape4: TShape;
    Label57: TLabel;
    Label58: TLabel;
    Shape5: TShape;
    Label59: TLabel;
    Label60: TLabel;
    Shape6: TShape;
    Label62: TLabel;
    Shape7: TShape;
    Label63: TLabel;
    Label64: TLabel;
    IBQuery1: TIBQuery;
    KLN_PREFIX: TEdit;
    Label61: TLabel;
    KlnTransaction: TIBTransaction;
    QrUsgroup: TIBQuery;
    QrUsgroupUSGROUP_ID: TIntegerField;
    QrUsgroupUSGROUP_NAME: TIBStringField;
    DsUsgroup: TDataSource;
    USGROUP_ID: TRxDBLookupCombo;
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    WorkTransaction: TIBTransaction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label65: TLabel;
    CREDIT1: TRxCalcEdit;
    Label66: TLabel;
    MAINST_FULL: TEdit;
    BtnFind: TSpeedButton;
    MAINST_REKW: TEdit;
    QueryWork: TIBQuery;
    BtnDefault: TSpeedButton;
    TabSheet8: TTabSheet;
    RxDBGrid4: TRxDBGrid;
    MemProperty: TRxMemoryData;
    MemPropertyID: TIntegerField;
    MemPropertyvalue: TStringField;
    DsProperty: TDataSource;
    PropKLN: TRxMemoryData;
    DsPropKLN: TDataSource;
    QueryWork2: TIBQuery;
    QueryWork3: TIBQuery;
    Label67: TLabel;
    KLN_TABEL: TRxSpinEdit;
    Label68: TLabel;
    KLN_KPP: TEdit;
    Label69: TLabel;
    Label70: TLabel;
    KLN_DIR: TEdit;
    KLN_GB: TEdit;
    Label71: TLabel;
    KLN_KKM_NUM: TRxSpinEdit;
    Label72: TLabel;
    KLN_KKM_PASSWORD: TEdit;
    cbCredit1: TCheckBox;
    StringGrid1: TStringGrid;
    KLN_INN: TCurrencyEdit;
    in_place_combo: TRxDBLookupCombo;
    kln_worktype: TIBQuery;
    kln_worktypeKLN_WORKTYPE_ID: TIntegerField;
    kln_worktypeKLN_WORKTYPE_NAME: TIBStringField;
    kln_worktypeTM: TDateTimeField;
    ds_in_place: TDataSource;
    in_place_combo_data: TRxMemoryData;
    in_place_combo_datadisplace_value: TStringField;
    in_place_combo_datavalue: TStringField;
    PropKLNPROPKLN_ID: TIntegerField;
    PropKLNTYP: TIntegerField;
    PropKLNPROPKLN_NAME: TIBStringField;
    PropKLNVALUEINT: TIntegerField;
    PropKLNVALUESTR: TIBStringField;
    PropKLNMODYFIED: TIntegerField;
    Label73: TLabel;
    kln_money_edit_mode: TComboBox;
    TabSheet9: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    DsNaprKln: TDataSource;
    NaprKln: TIBQuery;
    SpeedButton1: TSpeedButton;
    ToolBar2: TToolBar;
    NewNapr: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    MemNapr: TRxMemoryData;
    MemNaprTW_NAM: TIBStringField;
    MemNaprSKID_KAT: TIntegerField;
    MemNaprTWGROUP_ID: TIntegerField;
    NaprKlnSKID_KAT: TIntegerField;
    NaprKlnKLN_NAPR_ID: TIntegerField;
    MemNaprKLN_NAPR_ID: TIntegerField;
    NaprKlnTW_NAM: TIBStringField;
    NaprKlnTWGROUP_ID: TIntegerField;
    NaprKlnTYP_KLN: TIntegerField;
    MemNaprTYP_KLN2: TIntegerField;
    MemNaprTyp: TStringField;
    Vid: TIBQuery;
    VidTransaction: TIBTransaction;
    MemNaprskid: TStringField;
    Ktg: TIBQuery;
    Label77: TLabel;
    cmbKLN_FRM: TComboBox;
    cbKlnUseNDS: TCheckBox;
    Label74: TLabel;
    PRICE_TYP: TComboBox;
    TabSheet10: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    RxDBGrid2: TRxDBGrid;
    DsTwSaler: TDataSource;
    twSaler: TIBQuery;
    twSalerTW_NAM: TIBStringField;
    twSalerSHOP_NAME: TIBStringField;
    twSalerFRM_ID: TIntegerField;
    twSalerSHOP_ID: TIntegerField;
    twSalerTWTREE_ID: TIntegerField;
    twSalerCFG_ID: TIntegerField;
    memtwSaler: TRxMemoryData;
    memtwSalerTW_NAM: TIBStringField;
    memtwSalerFRM_ID: TIntegerField;
    memtwSalerSHOP_ID: TIntegerField;
    memtwSalerTWTREE_ID: TIntegerField;
    memtwSalerCFG_ID: TIntegerField;
    memtwSalerSHOP_NAME1: TStringField;
    Label75: TLabel;
    KLN_FULL_NAME: TEdit;
    Label76: TLabel;
    KLN_MANAGER_TABEL: TRxCalcEdit;
    TabSheet11: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    RxDBGrid3: TRxDBGrid;
    mem_cards: TRxMemoryData;
    ds_cards: TDataSource;
    query_cards: TIBQuery;
    query_cardsCARD_ID: TIntegerField;
    query_cardsCARD_NUM: TIntegerField;
    mem_cardsCARD_ID: TIntegerField;
    mem_cardsCARD_NUM: TIntegerField;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    tran_cards: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    Function Check_Kontakt:boolean;
    function SAVE_KONTAKT:integer;
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure KLN_FAMChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnDefaultClick(Sender: TObject);
    procedure PropKLNAfterScroll(DataSet: TDataSet);
    procedure KLN_FRMClick(Sender: TObject);
    procedure KLN_KKM_NUMChange(Sender: TObject);
    procedure USGROUP_IDChange(Sender: TObject);
    procedure KLN_CLOSEClick(Sender: TObject);
    procedure KLN_TABELChange(Sender: TObject);
    procedure KLN_KKM_PASSWORDChange(Sender: TObject);
    procedure RxDBGrid4ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure RxDBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid4Exit(Sender: TObject);
    procedure in_place_comboChange(Sender: TObject);
    procedure in_place_comboExit(Sender: TObject);
    procedure RxDBGrid4ColExit(Sender: TObject);
    procedure PropKLNVALUEINTChange(Sender: TField);
    procedure PropKLNVALUESTRChange(Sender: TField);
    procedure NewNaprClick(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure TabSheet11Show(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  private
    { Private declarations }
    DEL_ARR: array[0..100] of integer;
    DEL_CNT: integer;
    DEL_ARR_SALER: array[0..100] of integer;
    DEL_CNT_SALER: integer;


  public
    { Public declarations }
  end;

var
  CanChange:boolean;
  CAN_SELECT_PROP:boolean;
  Edit_Kontakt: TEdit_Kontakt;
  EditKontaktChange:boolean;
  MAIN_ST:integer;
  NEW_DISKONT_NUM: string;

implementation

uses Data1, DicKlient, FindKontakt, DicTowar, DicTwDynGroup;

{$R *.DFM}

Function TEdit_Kontakt.Check_Kontakt:boolean;
{Функция проверки корректности данных в карточке контакта}
var
   EN:boolean;
begin
     result:=False;
     if (trim(KLN_ORG.text)='') and (trim(KLN_FAM.text)='') then Messbox('Необходимо указать либо название организации, либо фамилию и инициалы человека!','Некорректный ввод!',48)
     else begin
          if (trim(KLN_PASSWORD1.text)<>'') or (trim(KLN_PASSWORD2.text)<>'') then begin
             if trim(KLN_PASSWORD1.text)<>trim(KLN_PASSWORD2.text) then Messbox('Введённые пароли не совпадают!','Некорректный ввод!',48) else begin
                EN:=true;
                {Пароли не пустые и совпадают необходимо проверить наличие ФИО}
                if trim(KLN_FAM.text)='' then EN:=false;
                if trim(KLN_NAME.text)='' then EN:=false;
                if trim(KLN_NAME2.text)='' then EN:=false;
                if not EN then Messbox('Если введен пароль, то необходимо указать Фамилию, Имя и Отчество человека, т.к. они используются в документах!','Некорректный ввод!',48);
                if EN and (IS_EMAIL_CHECK) and (pos('@',KLN_EMAIL.text)<2) then begin
                   EN:=False;
                   Messbox('В соответсвии с настройкой системы необходимо обязательно указать e-mail сотрудника!',MessError,48);
                end;
                result:=EN;
             end;
          end else begin
              {Пароли пустые}
              result:=true;
          end;

          if result then begin
                // проверяем наличие такого-же табельного номера
                if trunc(kln_tabel.value)<>0 then begin
                  WorkTransaction.Active:=False;
                  ADD_SQL(QueryWork,'select kln_id,(select kln_full from kln_data(kln.kln_id)) as kln_full from kln where kln_tabel=:kln_tabel and not kln_id=:kln_id');
                  QueryWork.ParamByname('kln_tabel').asinteger:=trunc(KLN_TABEL.value);
                  QueryWork.ParamByname('kln_id').asinteger:=EDIT_KONTAKT.tag;
                  QueryWork.open;
                  if not QueryWork.eof then begin
                      messbox('Запись невозможна! У сотрудника: '+QueryWork.fieldbyname('kln_full').asstring+' имеется такой-же табельный номер ['+
                      inttostr(trunc(KLN_TABEL.value))+']!',MessSystem,48);
                      result:=false;
                  end;
                end;
          end;
          {14-20-2010 - проверка на сохранение организаций. запрет сохранения без указания полных реквизитов}
          if result then
          begin
           if KLN_ORG.text<>'' then //организация
           begin
            if KLN_INN.Text='' then
            begin
              messbox('Запись невозможна! не указан ИНН',MessSystem,48);
              result:=false;
            end;
            if KLN_ORG_ADR.Text='' then
            begin
              messbox('Запись невозможна! не указан адрес',MessSystem,48);
              result:=false;
            end;
            if KLN_ORG_TEL.Text='' then
            begin
              messbox('Запись невозможна! не указан телефон',MessSystem,48);
              result:=false;
            end;
            if KLN_OFFICE_ADR.Text='' then
            begin
              messbox('Запись невозможна! не указан адрес офиса',MessSystem,48);
              result:=false;
            end;
            if KLN_OFFICE_TEL.Text='' then
            begin
              messbox('Запись невозможна! не указан телефон офиса',MessSystem,48);
              result:=false;
            end;


            if KLN_BNK.Text='' then
            begin
              messbox('Запись невозможна! не указан банк',MessSystem,48);
              result:=false;
            end;
            if KLN_KS.Text='' then
            begin
              messbox('Запись невозможна! не указан кор счет банка',MessSystem,48);
              result:=false;
            end;
            if KLN_RS.Text='' then
            begin
              messbox('Запись невозможна! не указан расчетный счет',MessSystem,48);
              result:=false;
            end;
            if KLN_BIK.Text='' then
            begin
              messbox('Запись невозможна! не указан БИК банка',MessSystem,48);
              result:=false;
            end;
{
            if (KLN_MANAGER_TABEL.Text='') then
            begin
              messbox('Запись невозможна! Не указан табельный номер менеджера',MessSystem,48);
              result:=false;
            end;
}


           end;

          end;




          if result then begin
                // проверяем наличие такого-же ИНН
                if trim(kln_inn.Text)<>'' then begin
                  WorkTransaction.Active:=False;
                  ADD_SQL(QueryWork,'select kln_id,(select kln_full from kln_data(kln.kln_id)) as kln_full from kln where bg_rtrim(kln_inn)=:kln_inn and not kln_id=:kln_id');
                  QueryWork.ParamByname('kln_inn').asstring:=trim(kln_inn.Text);
                  QueryWork.ParamByname('kln_id').asinteger:=EDIT_KONTAKT.tag;
                  QueryWork.open;
                  if not QueryWork.eof then begin
                      messbox('Запись невозможна! У организации: '+QueryWork.fieldbyname('kln_full').asstring+' такой-же ИНН ['+
                      trim(kln_inn.Text)+']!',MessSystem,48);
                      result:=false;
                  end;
                end;
          end;


          if result then begin
                // проверяем длину ИНН
                if ((length(kln_inn.Text)>0) and ((length(kln_inn.Text)<>10) and (length(kln_inn.Text)<>12)))  then begin
                messbox('Запись невозможна! Нестандартная длина ИНН',MessSystem,48);
                      result:=false;
                end;
          end;



     end
end;

function TEdit_Kontakt.SAVE_KONTAKT:integer;
var
   r:double;
   ID2,i:integer;
begin
           BtnSave.Enabled:=False;
           BtnApply.Enabled:=False;
           result:=-1;
           {Сохраняем Контакт}
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try

                for i:=0 to DEL_CNT-1 do
                begin
                  IBDELETE_DOC('kln_napr', DEL_ARR[i]);
                end;

                if not MemNapr.IsEmpty then
                begin
                  MemNapr.DisableControls;
                  MemNapr.First;
                  while not MemNapr.Eof do
                  begin
                    IBSAVE_CLEAR;
                    IBSAVE_ADD('twgroup_id',MemNapr.FieldByName('twgroup_id').asinteger);
                    IBSAVE_ADD('kln_id',EDIT_Kontakt.tag);
                    IBSAVE_ADD('typ_kln',MemNapr.FieldByName('typ_kln').asinteger);
                    IBSAVE_ADD('skid_kat',MemNapr.FieldByName('skid_kat').asinteger);
                    if 0>IBSAVE_DOC('kln_napr', MemNapr.FieldByName('kln_napr_id').asinteger)
                    then r:=sqrt(-1);
                    MemNapr.Next;
                  end;
                  MemNapr.EnableControls;
                end;


                for i:=0 to DEL_CNT_SALER-1 do
                begin
                  IBDELETE_DOC('CFG', DEL_ARR_SALER[i]);
                end;

                if not twSaler.IsEmpty then
                begin
                  twSaler.DisableControls;
                  twSaler.First;
                  while not twSaler.Eof do
                  begin
                    IBSAVE_CLEAR;
                    IBSAVE_ADD('cfg_set3',twSaler.FieldByName('twgroup_id').asinteger);
                    IBSAVE_ADD('cfg_set1',EDIT_Kontakt.tag);
                    IBSAVE_ADD('cfg_set2',14);
                    IBSAVE_ADD('cfg_name','FRM_TW_ROZN_LIST');
                    if 0>IBSAVE_DOC('CFG', twSaler.FieldByName('cfg_id').asinteger)
                    then r:=sqrt(-1);
                    twSaler.Next;
                  end;
                  twSaler.EnableControls;
                end;



                IBSAVE_CLEAR;
                IBSAVE_ADD('KLN_FRM',cmbKLN_FRM.itemindex);
                IBSAVE_ADD('KLN_FAM',b_utils.ProperCaseFIO(KLN_FAM.text));
                IBSAVE_ADD('KLN_NAME',b_utils.ProperCaseFIO(KLN_NAME.text));
                IBSAVE_ADD('KLN_FULL_NAME',KLN_FULL_NAME.text);                
                IBSAVE_ADD('KLN_NAME2',b_utils.ProperCaseFIO(KLN_NAME2.text));
                IBSAVE_ADD('KLN_EMAIL',KLN_EMAIL.text);
                IBSAVE_ADD('KLN_PASS_SER',KLN_PASS_SER.text);
                IBSAVE_ADD('KLN_PREFIX',KLN_PREFIX.text);
                IBSAVE_ADD('KLN_PASS_NUM',KLN_PASS_NUM.text);
                IBSAVE_ADD('KLN_PASS_WYD',KLN_PASS_WYD.text);
                IBSAVE_ADD('KLN_PASS_WYDD',KLN_PASS_WYDD.Date);
                IBSAVE_ADD('KLN_SVID',KLN_SVID.text);
                IBSAVE_ADD('KLN_ADR',Memotostr(KLN_ADR.lines));
                IBSAVE_ADD('KLN_CITY',KLN_CITY.text);
                IBSAVE_ADD('KLN_OBLAST',KLN_OBLAST.text);
                IBSAVE_ADD('KLN_INDEX',KLN_INDEX.text);
                IBSAVE_ADD('KLN_LAND',KLN_LAND.text);
                IBSAVE_ADD('KLN_TEL',KLN_TEL.text);
                IBSAVE_ADD('KLN_FAX',KLN_FAX.text);
                IBSAVE_ADD('KLN_SOTEL',KLN_SOTEL.text);
                IBSAVE_ADD('KLN_PAGER',KLN_PAGER.text);
                IBSAVE_ADD('KLN_ORG',KLN_ORG.text);
                IBSAVE_ADD('KLN_DOL',KLN_DOL.text);
                IBSAVE_ADD('KLN_ORG_ADR',Memotostr(KLN_ORG_ADR.lines));
                IBSAVE_ADD('KLN_ORG_CITY',KLN_ORG_CITY.text);
                IBSAVE_ADD('KLN_ORG_OBLAST',KLN_ORG_OBLAST.text);
                IBSAVE_ADD('KLN_ORG_INDEX',KLN_ORG_INDEX.text);
                IBSAVE_ADD('KLN_ORG_LAND',KLN_ORG_LAND.text);
                IBSAVE_ADD('KLN_ORG_TEL',KLN_ORG_TEL.text);
                IBSAVE_ADD('KLN_ORG_FAX',KLN_ORG_FAX.text);
                IBSAVE_ADD('KLN_INN',KLN_INN.text);
                IBSAVE_ADD('KLN_OK1',KLN_OK1.text);
                IBSAVE_ADD('KLN_OK2',KLN_OK2.text);
                IBSAVE_ADD('KLN_BNK',KLN_BNK.text);
                IBSAVE_ADD('KLN_BNKADR',Memotostr(KLN_BNK_ADR.lines));
                IBSAVE_ADD('KLN_KB',KLN_KB.text);
                IBSAVE_ADD('KLN_KS',KLN_KS.text);
                IBSAVE_ADD('KLN_RS',KLN_RS.text);
                IBSAVE_ADD('KLN_BIK',KLN_BIK.text);
                IBSAVE_ADD('KLN_OFFICE_ADR',Memotostr(KLN_OFFICE_ADR.lines));
                IBSAVE_ADD('KLN_OFFICE_TEL',KLN_OFFICE_TEL.text);
                IBSAVE_ADD('KLN_OFFICE_FAX',KLN_OFFICE_FAX.text);
                IBSAVE_ADD('KLN_OFFICE_TIME',KLN_OFFICE_TIME.text);
                IBSAVE_ADD('KLN_OFFICE_BIGAUTO',KLN_OFFICE_BIGAUTO.checked);
                IBSAVE_ADD('KLN_OFFICE_CONTACT',KLN_OFFICE_CONTACT.text);
                IBSAVE_ADD('KLN_SKL_ADR',Memotostr(KLN_SKL_ADR.lines));
                IBSAVE_ADD('KLN_SKL_TEL',KLN_SKL_TEL.text);
                IBSAVE_ADD('KLN_SKL_FAX',KLN_SKL_FAX.text);
                IBSAVE_ADD('KLN_SKL_TIME',KLN_SKL_TIME.text);
                IBSAVE_ADD('KLN_SKL_BIGAUTO',KLN_SKL_BIGAUTO.checked);
                IBSAVE_ADD('KLN_SKL_CONTACT',KLN_SKL_CONTACT.text);
                IBSAVE_ADD('KLN_PRIM',Memotostr(KLN_PRIM.lines));
                IBSAVE_ADD('KLN_PASSWORD',KLN_PASSWORD1.text);
                IBSAVE_ADD('KLN_MEN',KLN_MEN.checked);
                IBSAVE_ADD('KLNTREE_ID',Dic_Klient.Treeview1.selected.stateindex);
                IBSAVE_ADD('KLN_CLOSE',KLN_CLOSE.checked);
                IBSAVE_ADD('KLN_USE_NDS',cbKlnUseNds.checked);
                IBSAVE_ADD('MAIN_ST',MAIN_ST);
                if cbCredit1.Checked then
                  IBSAVE_ADD('KLN_CREDIT1', -1.0)
                else
                  IBSAVE_ADD('KLN_CREDIT1',CREDIT1.value);

//--------                IBSAVE_ADD('KLN_CREDIT2',balance.value);
                IBSAVE_ADD('KLN_TABEL',int(KLN_TABEL.value));
                IBSAVE_ADD('KLN_MANAGER_TABEL',int(KLN_MANAGER_TABEL.value));





                IBSAVE_ADD('KLN_KPP',trim(kln_kpp.text));
                IBSAVE_ADD('KLN_DIR',trim(kln_dir.text));
                IBSAVE_ADD('KLN_GB',trim(kln_gb.text));
                IBSAVE_ADD('KLN_KKM_NUM',int(KLN_KKM_NUM.value));
                IBSAVE_ADD('KLN_KKM_PASSWORD',trim(KLN_KKM_PASSWORD.text));
                IBSAVE_ADD('USGROUP_ID',strtoint(USGROUP_ID.Value));
                IBSAVE_ADD('KLN_EDIT_MONEY_MODE',KLN_MONEY_EDIT_MODE.itemindex);

                result:=IBSAVE_DOC('KLN',EDIT_Kontakt.tag);
                if result<0 then r:=sqrt(-1);
                IBSAVE_CLEAR;
                IBSAVE_ADD('US_ID',USERID);
                IBSAVE_ADD('SHOP_ID',SHOPID);
                if EDIT_Kontakt.tag<0 then IBSAVE_ADD('MESS','Создан в группе "'+Dic_KLIENT.treeview1.selected.text+'"')
                else IBSAVE_ADD('MESS','Изменен');
                if EDIT_Kontakt.tag<0 then IBSAVE_ADD('DOP1',1) // Метка вставки
                                      else IBSAVE_ADD('DOP1',-1); // Метка изменения
                IBSAVE_ADD('DOP2',result);
                IBSAVE_ADD('DOC','KLN'); // Название таблицы
                IBSAVE_DOC('ARCUPDATE',-1);
                if (MAIN_ST=-1) and (Edit_kontakt.tag<0) then begin
                   ibsave_clear;
                   ibsave_add('MAIN_ST',result);
                   if IBSAVE_DOC('KLN',result)<0 then r:=sqrt(-1);
                end;
               // СОхраняем свойства
               CAN_SELECT_PROP:=False;
               PropKLN.Disablecontrols;
               PropKLN.first;
               while not PropKLN.eof do begin
                  if  propkln.fieldbyname('MODYFIED').asinteger=1 then
                  begin
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('KLN_ID',Edit_Kontakt.tag);
                     IBSAVE_ADD('TYP',PropKLN.fieldByname('TYP').asinteger);
                     IBSAVE_ADD('VALUEINT',PropKLN.fieldByname('VALUEINT').asinteger);
                     IBSAVE_ADD('VALUESTR',PropKLN.fieldByname('VALUESTR').asstring);
                     IBSAVE_ADD('US_ID',USERID);

                     IBSAVE_ADD('FRM_ID',GL_FRM_WORK_MODE);

                     ID2:=Ibsave_Doc('PROPKLN',PropKLN.fieldByname('PROPKLN_ID').asinteger);
                     if ID2<0 then r:=Sqrt(-1) else begin
                        PropKLN.edit;
                        PropKLN.fieldByname('PROPKLN_ID').asinteger:=ID2;
                        PropKLN.Post;
                     end;
                  end;
                  PropKLN.next;
               end;
               PropKLN.First;
               PropKLN.EnableControls;
               CAN_SELECT_PROP:=True;
               Datamodule1.IBTransaction2.Commit;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
           BtnSave.Enabled:=True;
           BtnApply.Enabled:=True;
end;


procedure TEdit_Kontakt.FormShow(Sender: TObject);
var saldo_date, MONEY_date: TDateTime;
    curr_saldo: double;
begin
     cmbKLN_FRM.enabled:=CHECK_DOSTUP('$DICKLN.KLN_IS_FRM');
     KLN_TABEL.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_TABEL');
     KLN_MANAGER_TABEL.enabled:=CHECK_DOSTUP('$DICKLN.KLN_CHANGE_MANAGER_TABEL');

     RxDBGrid4.enabled:=CHECK_DOSTUP('$DICKLN.EDIT_KLN_SETTINGS');

     KLN_FULL_NAME.Enabled:=CHECK_DOSTUP('$DICKLN.KLN_IS_FRM');





     RxDBGrid1.Enabled:=CHECK_DOSTUP('$DICKLN.EDIT_KLN_KTG');
     NewNapr.Enabled:=CHECK_DOSTUP('$DICKLN.EDIT_KLN_KTG');
     ToolButton5.Enabled:=CHECK_DOSTUP('$DICKLN.EDIT_KLN_KTG');

     CAN_SELECT_PROP:=False;
     KlnTransaction.Active:=False;
     QrUsgroup.close;
     QrUsgroup.Open;
     MAINST_FULL.text:='';
     MAINST_REKW.text:='';
     if tag<0 then begin
        caption:='Новый контакт';
        cmbKLN_FRM.itemindex := 0;
        PageControl1.ActivePage:=Tabsheet1;
        USGROUP_ID.value:=inttostr(DEFAULT_USGROUP);
        CREDIT1.value:=0;
        MAIN_ST:=-1;
        MAINST_FULL.text:='Он же';
        MAINST_REKW.text:='Он же';
        KLN_KPP.text:='';
        KLN_DIR.text:='';
        KLN_GB.text:='';
        KLN_KKM_NUM.value:=0;
        KLN_KKM_PASSWORD.text:='';
        kln_money_edit_mode.ItemIndex:=0;
     end else begin
        caption:='Контакт. Редактирование';
        USGROUP_ID.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_DOSTUP');
        KLN_CLOSE.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_DOSTUP');
        KLN_KKM_NUM.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_DOSTUP');
        KLN_KKM_PASSWORD.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_DOSTUP');

        KLN_INN.enabled:=((CHECK_DOSTUP('$DICKLN.KLN_CHANGE_INN')) or (KLN_INN.Text=''));


        if EDIT_Kontakt.tag=USERID then begin
           KLN_PASSWORD1.enabled:=True;
           KLN_PASSWORD2.enabled:=True;
        end else begin
            KLN_PASSWORD1.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_PASSWORD');
            KLN_PASSWORD2.enabled:=CHECK_DOSTUP('$DICKLN.CHANGE_PASSWORD');
        end;
        {Читаем данные}
        WorkTransaction.Active:=False;
        IbQuery1.close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select * from KLN left join klnbalance on klnbalance.kln_id = kln.kln_id and klnbalance.frm_id=:frm_id WHERE kln.KLN_ID=:KLN_ID ');

        IbQuery1.Parambyname('KLN_ID').asinteger:=EDIT_Kontakt.tag;
        if gl_FRM_WORK_MODE=0 then
          IbQuery1.Parambyname('FRM_ID').asinteger:=2702542
        else
          IbQuery1.Parambyname('FRM_ID').asinteger:=gl_FRM_WORK_MODE;


        IbQuery1.open;
        if IbQuery1.fieldByname('USGROUP_ID').asinteger=0 then
        USGROUP_ID.value:=QrUsgroup.fieldByname('USGROUP_ID').asstring
        else USGROUP_ID.value:=IbQuery1.fieldByname('USGROUP_ID').asstring;
        MAIN_ST:=IbQuery1.fieldbyname('MAIN_ST').asinteger;

        CREDIT1.value:= abs( IbQuery1.fieldbyname('KLN_CREDIT1').asfloat);
        if IbQuery1.fieldbyname('KLN_CREDIT1').asfloat < 0 then
          cbCredit1.Checked:=true
          else
          cbCredit1.checked := false;
        if cbCredit1.Checked then credit1.Value:=0;


        if not (Check_Dostup('$DIC.DIC_KLN.CHANGE_CREDIT')) then
        begin
          credit1.Enabled:=false;
          cbcredit1.Enabled:=false;
          KLN_MANAGER_TABEL.Enabled:=false;
        end;


        if (Check_Dostup('$DIC.DIC_KLN.SHOW_BALANCE')) then
        begin

          saldo_date := IbQuery1.fieldbyname('saldo_date').asdatetime;
          money_date := IbQuery1.fieldbyname('money_date').asdatetime;

          if saldo_date > 0 then
          begin

            StringGrid1.Cells[0, 0] := 'Дата закрытия периода (ДЗП)';
            StringGrid1.Cells[1, 0] := datetimetostr(saldo_date);
            StringGrid1.Cells[0, 1] := 'Дата выгрузки баланса (ДВБ)';
            StringGrid1.Cells[1, 1] := datetimetostr(MONEY_date);

            StringGrid1.Cells[0, 2] := 'Сальдо на ДЗП';
            StringGrid1.Cells[1, 2] := formatfloat('#,##0.00',  IbQuery1.fieldbyname('SALDO').asfloat);
            curr_saldo := IbQuery1.fieldbyname('SALDO').asfloat;
            StringGrid1.Cells[0, 3] := 'Сумма платежей с ДЗП по ДВБ';
            StringGrid1.Cells[1, 3] := formatfloat('#,##0.00',  IbQuery1.fieldbyname('money').asfloat);
            curr_saldo := curr_saldo + IbQuery1.fieldbyname('money').asfloat;



          end;
        end
      	else
        begin

          stringgrid1.Visible:=false;

        end;



        cmbKLN_FRM.itemindex:=IbQuery1.fieldbyname('KLN_FRM').asinteger;
        KLN_FAM.text:=IbQuery1.fieldbyname('KLN_FAM').asstring;
        KLN_PREFIX.text:=IbQuery1.fieldbyname('KLN_PREFIX').asstring;
        KLN_NAME.text:=IbQuery1.fieldbyname('KLN_NAME').asstring;
        KLN_FULL_NAME.text:=IbQuery1.fieldbyname('KLN_FULL_NAME').asstring;        
        KLN_NAME2.text:=IbQuery1.fieldbyname('KLN_NAME2').asstring;
        KLN_EMAIL.text:=IbQuery1.fieldbyname('KLN_EMAIL').asstring;
        KLN_PASS_SER.text:=IbQuery1.fieldbyname('KLN_PASS_SER').asstring;
        KLN_PASS_NUM.text:=IbQuery1.fieldbyname('KLN_PASS_NUM').asstring;
        KLN_PASS_WYD.text:=IbQuery1.fieldbyname('KLN_PASS_WYD').asstring;
        KLN_PASS_WYDD.Date:=IbQuery1.fieldbyname('KLN_PASS_WYDD').asDatetime;
        KLN_SVID.text:=IbQuery1.fieldbyname('KLN_SVID').asstring;
        KLN_ADR.lines.clear;
        KLN_ADR.lines.add(IbQuery1.fieldbyname('KLN_ADR').asstring);
        KLN_CITY.text:=IbQuery1.fieldbyname('KLN_CITY').asstring;
        KLN_OBLAST.text:=IbQuery1.fieldbyname('KLN_OBLAST').asstring;
        KLN_INDEX.text:=IbQuery1.fieldbyname('KLN_INDEX').asstring;
        KLN_LAND.text:=IbQuery1.fieldbyname('KLN_LAND').asstring;
        KLN_TEL.text:=IbQuery1.fieldbyname('KLN_TEL').asstring;
        KLN_FAX.text:=IbQuery1.fieldbyname('KLN_FAX').asstring;
        KLN_SOTEL.text:=IbQuery1.fieldbyname('KLN_SOTEL').asstring;
        KLN_PAGER.text:=IbQuery1.fieldbyname('KLN_PAGER').asstring;
        KLN_ORG.text:=IbQuery1.fieldbyname('KLN_ORG').asstring;
        KLN_DOL.text:=IbQuery1.fieldbyname('KLN_DOL').asstring;
        KLN_ORG_ADR.lines.clear;
        KLN_ORG_ADR.lines.add(IbQuery1.fieldbyname('KLN_ORG_ADR').asstring);
        KLN_ORG_CITY.text:=IbQuery1.fieldbyname('KLN_ORG_CITY').asstring;
        KLN_ORG_OBLAST.text:=IbQuery1.fieldbyname('KLN_ORG_OBLAST').asstring;
        KLN_ORG_INDEX.text:=IbQuery1.fieldbyname('KLN_ORG_INDEX').asstring;
        KLN_ORG_LAND.text:=IbQuery1.fieldbyname('KLN_ORG_LAND').asstring;
        KLN_ORG_TEL.text:=IbQuery1.fieldbyname('KLN_ORG_TEL').asstring;
        KLN_ORG_FAX.text:=IbQuery1.fieldbyname('KLN_ORG_FAX').asstring;
        KLN_INN.text:=IbQuery1.fieldbyname('KLN_INN').asstring;
        KLN_OK1.text:=IbQuery1.fieldbyname('KLN_OK1').asstring;
        KLN_OK2.text:=IbQuery1.fieldbyname('KLN_OK2').asstring;
        KLN_BNK.text:=IbQuery1.fieldbyname('KLN_BNK').asstring;
        KLN_BNK_ADR.lines.clear;
        KLN_BNK_ADR.lines.add(IbQuery1.fieldbyname('KLN_BNKADR').asstring);
        KLN_KB.text:=IbQuery1.fieldbyname('KLN_KB').asstring;
        KLN_KS.text:=IbQuery1.fieldbyname('KLN_KS').asstring;
        KLN_RS.text:=IbQuery1.fieldbyname('KLN_RS').asstring;
        KLN_BIK.text:=IbQuery1.fieldbyname('KLN_BIK').asstring;
        KLN_OFFICE_ADR.lines.clear;
        KLN_OFFICE_ADR.lines.add(IbQuery1.fieldbyname('KLN_OFFICE_ADR').asstring);
        KLN_OFFICE_TEL.text:=IbQuery1.fieldbyname('KLN_OFFICE_TEL').asstring;
        KLN_OFFICE_FAX.text:=IbQuery1.fieldbyname('KLN_OFFICE_FAX').asstring;
        KLN_OFFICE_TIME.text:=IbQuery1.fieldbyname('KLN_OFFICE_TIME').asstring;
        if IbQuery1.fieldbyname('KLN_OFFICE_BIGAUTO').asinteger=1
         then KLN_OFFICE_BIGAUTO.checked:=true else KLN_OFFICE_BIGAUTO.checked:=false;
        KLN_OFFICE_CONTACT.text:=IbQuery1.fieldbyname('KLN_OFFICE_CONTACT').asstring;
        KLN_SKL_ADR.lines.clear;
        KLN_SKL_ADR.lines.add(IbQuery1.fieldbyname('KLN_SKL_ADR').asstring);
        KLN_SKL_TEL.text:=IbQuery1.fieldbyname('KLN_SKL_TEL').asstring;
        KLN_SKL_FAX.text:=IbQuery1.fieldbyname('KLN_SKL_FAX').asstring;
        KLN_SKL_TIME.text:=IbQuery1.fieldbyname('KLN_SKL_TIME').asstring;
        if IbQuery1.fieldbyname('KLN_SKL_BIGAUTO').asinteger=1
         then KLN_SKL_BIGAUTO.checked:=true else KLN_SKL_BIGAUTO.checked:=false;
        KLN_SKL_CONTACT.text:=IbQuery1.fieldbyname('KLN_SKL_CONTACT').asstring;
        KLN_PRIM.lines.clear;
        KLN_PRIM.lines.add(IbQuery1.fieldbyname('KLN_PRIM').asstring);
        KLN_PASSWORD1.text:=IbQuery1.fieldbyname('KLN_PASSWORD').asstring;
        KLN_PASSWORD2.text:=IbQuery1.fieldbyname('KLN_PASSWORD').asstring;
        KLN_TABEL.value:=IbQuery1.fieldbyname('KLN_TABEL').asinteger;
        KLN_MANAGER_TABEL.value:=IbQuery1.fieldbyname('KLN_MANAGER_TABEL').asinteger;







        KLN_KPP.text:=IbQuery1.fieldbyname('KLN_KPP').asstring;
        KLN_DIR.text:=IbQuery1.fieldbyname('KLN_DIR').asstring;
        KLN_GB.text:=IbQuery1.fieldbyname('KLN_GB').asstring;
        KLN_KKM_NUM.value:=IbQuery1.fieldbyname('KLN_KKM_NUM').asinteger;
        KLN_KKM_PASSWORD.text:=IbQuery1.fieldbyname('KLN_KKM_PASSWORD').asstring;
        if IbQuery1.fieldbyname('KLN_MEN').asinteger=1
         then KLN_MEN.checked:=true else KLN_MEN.checked:=false;
        if IbQuery1.fieldbyname('KLN_CLOSE').asinteger=1
         then KLN_CLOSE.checked:=true else KLN_CLOSE.checked:=false;

         KLN_MONEY_EDIT_MODE.itemindex:=IbQuery1.fieldbyname('KLN_EDIT_MONEY_MODE').asinteger;



        if IbQuery1.fieldbyname('KLN_USE_NDS').asinteger=1
         then cbKlnUseNds.checked:=true else cbKlnUseNds.checked:=false;
        {Определяем, какую страницу выводить первой}
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select kln_full,kln_rekw from kln_data(:KLN_ID)');
        QueryWork.ParamByname('KLN_ID').asinteger:=MAIN_ST;
        QueryWork.Open;
        if not QueryWork.eof then begin
             if MAIN_ST=Edit_kontakt.tag then begin
                   MAINST_FULL.text:='Он же';
                   MAINST_REKW.text:='Он же';
             end else begin
               MAINST_FULL.text:=QueryWork.FieldByname('KLN_FULL').asstring;
               MAINST_REKW.text:=QueryWork.FieldByname('KLN_REKW').asstring;
             end;
        end;
        if length(trim(KLN_ORG.Text))>0 then begin
           PageControl1.ActivePage:=Tabsheet2;
           KLN_ORG.setFocus;
        end
        else begin
             PageControl1.ActivePage:=Tabsheet1;
             KLN_FAM.setFocus;
        end;
        IbQuery1.close;
     end;

     //Считаем сумму продаж клиенту с даты баланса, если она (дата) есть
     if (saldo_date > 0) then
     begin
      WorkTransaction.Active:=False;

                   {
KLN_ID	KLN_PREFIX
2669809	ТК
2702542	РОЗ
2697090	ПРОМ
2705144	СД
2705194	ГАЛ

                   }

   	  ADD_SQL(QueryWork2,'select sum(rns.tw_kol*roundd((rns.tw_money*(1-rns.tw_skiddoll/100))*(1-(rns.tw_skid+rn.rn_skid)/100),2)) rn_sum '+
						 'from rn, rntyp, rns where rn.rn_prow=1 and rns.rn_id = rn.rn_id and rn.rn_date > :dt1 and rn.rntyp_id = rntyp.rntyp_id and rntyp.real_typ=1 and rn.kln_id = :kln_id ');
      QueryWork2.ParamByname('KLN_ID').asinteger:=Edit_Kontakt.tag;
      QueryWork2.ParamByname('dt1').asdatetime:=saldo_date;
      {if gl_FRM_WORK_MODE=0 then
      begin
          QueryWork2.Parambyname('FRM_ID').asinteger:=2705194;
          QueryWork2.Parambyname('FRM_ID1').asinteger:=2705144;
          QueryWork2.Parambyname('FRM_ID2').asinteger:=2697090;
      end
      else
      begin
          QueryWork2.Parambyname('FRM_ID').asinteger:=gl_FRM_WORK_MODE;
          QueryWork2.Parambyname('FRM_ID1').asinteger:=gl_FRM_WORK_MODE;
          QueryWork2.Parambyname('FRM_ID2').asinteger:=gl_FRM_WORK_MODE;
      end;  }

   	  QueryWork2.Open;
   	  if  not QueryWork2.eof then
 	    begin
         StringGrid1.Cells[0, 4] := 'Сумма расходных накладных с ДЗП';
         StringGrid1.Cells[1, 4] := formatfloat('#,##0.00',  Querywork2.FieldByName('rn_sum').asfloat);

         curr_saldo := curr_saldo - Querywork2.FieldByName('rn_sum').asfloat;
 	    end;

      StringGrid1.Cells[0, 5] := 'Текущее сальдо' ;
      StringGrid1.Cells[1, 5] := formatfloat('#,##0.00',  curr_saldo);



     end;

     // Наполняем справочник свойств
     WorkTransaction.Active:=False;
     // Читаем значения
     ADD_SQL(QueryWork2,'select * from LIST_PROP_KLN_FRM(:KLN_ID, :FRM_ID) order by TYP');
     QueryWork2.ParamByname('KLN_ID').asinteger:=Edit_Kontakt.tag;

     QueryWork2.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;

     QueryWork2.ParamByname('KLN_ID').asinteger:=Edit_Kontakt.tag;
     QueryWork2.Open;

     propkln.LoadFromDataSet(queryWork2, 0, lmAppend);

     propkln.DisableControls;
     propkln.First;
     while not propkln.Eof do
     begin
      propkln.Edit;
      propkln.fieldbyname('modyfied').asinteger:=0;
      propkln.Post;
      propkln.next;
     end;
     propkln.First;
     propkln.EnableControls;


     CAN_SELECT_PROP:=True;
     PROPKLN.first;
     EditKontaktChange:=false;


end;

procedure TEdit_Kontakt.TabSheet1Show(Sender: TObject);
begin
     KLN_FAM.setfocus;

end;

procedure TEdit_Kontakt.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_KONTAKT then begin
                Newtag:=SAVE_KONTAKT;
                if Newtag>0 then begin
                        EditKontaktChange:=false;
                        tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TEdit_Kontakt.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_KONTAKT then begin
                Newtag:=SAVE_KONTAKT;
                if Newtag>=0 then begin
                        EDIT_KONTAKT.tag:=Newtag;
                        EditKontaktChange:=false;
                end;
        end;
end;

procedure TEdit_Kontakt.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if EditKontaktChange then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

procedure TEdit_Kontakt.KLN_FAMChange(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.Button4Click(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then Close;


   if ((key='%') or (key=';') ) and ( PageControl1.ActivePage = TabSheet11) then begin
     NEW_DISKONT_NUM:='';
     Timer1.enabled:=True;
   end;



   if Timer1.enabled then begin
      if key=#13 then begin
        key:=#0;
        Timer1.Enabled:=False;
        Timer1.OnTimer(Sender);
      end;
      if key in ['0'..'9'] then begin
         NEW_DISKONT_NUM:=NEW_DISKONT_NUM+KEY;
         key:=#0;
      end;
      Statusbar1.panels[1].text:=NEW_DISKONT_NUM;
      key:=#0;
   end;


end;

procedure TEdit_Kontakt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QrUsgroup.close;
     KlnTransaction.Active:=False;
     WorkTransaction.Active:=False;

end;

procedure TEdit_Kontakt.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TEdit_Kontakt.BtnFindClick(Sender: TObject);
begin
     Find_Kontakt.showmodal;
     if Find_Kontakt.tag>0 then begin
        {Начинаем искать}
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select kln_full,kln_rekw from kln_data(:KLN_ID)');
        QueryWork.ParamByname('KLN_ID').asinteger:=Find_Kontakt.tag;
        QueryWork.Open;
        if QueryWork.eof then Messbox('В базе контакт не обнаружен!',MessSystem,48)
        else begin
             MAIN_ST:=Find_Kontakt.tag;
             if MAIN_ST=Edit_kontakt.tag then begin
                   MAINST_FULL.text:='Он же';
                   MAINST_REKW.text:='Он же';
             end else begin
               MAINST_FULL.text:=QueryWork.FieldByname('KLN_FULL').asstring;
               MAINST_REKW.text:=QueryWork.FieldByname('KLN_REKW').asstring;
             end;
        end;
     end;
end;

procedure TEdit_Kontakt.BtnDefaultClick(Sender: TObject);
begin
    MAIN_ST:=Edit_kontakt.tag;
    MAINST_FULL.text:='Он же';
    MAINST_REKW.text:='Он же';
end;

procedure TEdit_Kontakt.PropKLNAfterScroll(DataSet: TDataSet);
begin
  in_place_combo.Visible := false;
end;

procedure TEdit_Kontakt.KLN_FRMClick(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.KLN_KKM_NUMChange(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.USGROUP_IDChange(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.KLN_CLOSEClick(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.KLN_TABELChange(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.KLN_KKM_PASSWORDChange(Sender: TObject);
begin
     EditKontaktChange:=True;
end;

procedure TEdit_Kontakt.RxDBGrid4ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin

//  if propkln.FieldByName('propkln_id').asinteger=1 then
//      combo_kln_worktype.Visible:=true;


    if ((RxDBGrid4.col=2) and  (propkln.fieldbyname('TYP').asinteger in[1,2,3,4,5,6,11])) then
    begin
      if not ( (Check_USER_Dostup('$DICKLN.EDIT_KLN_KTG')=-1) and (propkln.fieldbyname('TYP').asinteger in [2])) then
      begin


      in_place_combo.Value:=propkln.fieldbyname('VALUEINT').asstring;
      in_place_combo.Visible := True;
      AllowEdit:=false;
      end;
//      combo_kln_worktype.DropDown;
    end;

//    AllowEdit:=false;
//
end;

procedure TEdit_Kontakt.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage.Name='TabSheet8' then
      kln_worktype.Open;
  if PageControl1.ActivePage.Name='TabSheet9' then
      kln_worktype.Open;

end;

procedure TEdit_Kontakt.RxDBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (gdFocused in State) then
  begin
    if ((DataCol = 1) and (propkln.fieldbyname('TYP').asinteger in [1,2,3,4,5,6,11])) then
    begin
      in_place_combo.Left := Rect.Left + RxDBGrid4.Left;
      in_place_combo.Top := Rect.Top + RxDBGrid4.top;
      in_place_combo.Width := Rect.Right - Rect.Left+2;
      in_place_combo_data.EmptyTable;


      if propkln.fieldbyname('TYP').asinteger =1 then
      begin
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Обычный'; in_place_combo_data.FieldByName('VALUE').asinteger:=1;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Служебный'; in_place_combo_data.FieldByName('VALUE').asinteger:=2;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Устаревший'; in_place_combo_data.FieldByName('VALUE').asinteger:=3;  in_place_combo_data.Post;
      end;

      if propkln.fieldbyname('TYP').asinteger =2 then
      begin
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Розничный (РЦ)'; in_place_combo_data.FieldByName('VALUE').asinteger:=0;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Оптовый (ОЦ)'; in_place_combo_data.FieldByName('VALUE').asinteger:=1;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Крупнооптовый (КОЦ)'; in_place_combo_data.FieldByName('VALUE').asinteger:=2;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Спец. Клиент (СОЦ)'; in_place_combo_data.FieldByName('VALUE').asinteger:=3;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='По перепродаже (ПП)'; in_place_combo_data.FieldByName('VALUE').asinteger:=4;  in_place_combo_data.Post;
      end;

      if propkln.fieldbyname('TYP').asinteger =3 then
      begin
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Разовый клиент'; in_place_combo_data.FieldByName('VALUE').asinteger:=1;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Постоянный клиент'; in_place_combo_data.FieldByName('VALUE').asinteger:=2;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Конкурент'; in_place_combo_data.FieldByName('VALUE').asinteger:=3;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Постоянный клиент по СЭЗ'; in_place_combo_data.FieldByName('VALUE').asinteger:=4;  in_place_combo_data.Post;
      end;

      if propkln.fieldbyname('TYP').asinteger =4 then
      begin
        kln_worktype.First;
        while not kln_worktype.Eof do
        begin
          in_place_combo_data.Append;
          in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:=kln_worktype.fieldbyname('kln_worktype_name').asstring;
          in_place_combo_data.FieldByName('VALUE').asstring:=kln_worktype.fieldbyname('kln_worktype_id').asstring;
          in_place_combo_data.Post;
          kln_worktype.Next;
        end;
      end;

      if propkln.fieldbyname('TYP').asinteger =5 then
      begin
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Не покупатель'; in_place_combo_data.FieldByName('VALUE').asinteger:=1;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Покупатель по дог.'; in_place_combo_data.FieldByName('VALUE').asinteger:=2;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Покупатель без  дог.'; in_place_combo_data.FieldByName('VALUE').asinteger:=3;  in_place_combo_data.Post;
      end;
      if propkln.fieldbyname('TYP').asinteger =6 then
      begin
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Не поставщик'; in_place_combo_data.FieldByName('VALUE').asinteger:=1;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Поставщик по дог.'; in_place_combo_data.FieldByName('VALUE').asinteger:=2;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Поставщик без  дог.'; in_place_combo_data.FieldByName('VALUE').asinteger:=3;  in_place_combo_data.Post;
      end;
      if propkln.fieldbyname('TYP').asinteger =11 then
      begin
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='По факту'; in_place_combo_data.FieldByName('VALUE').asinteger:=1;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Реализация'; in_place_combo_data.FieldByName('VALUE').asinteger:=2;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Предоплата'; in_place_combo_data.FieldByName('VALUE').asinteger:=3;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='Предоплата 50%'; in_place_combo_data.FieldByName('VALUE').asinteger:=4;  in_place_combo_data.Post;
          in_place_combo_data.Append; in_place_combo_data.FieldByName('DISPLAY_VALUE').asstring:='кредит безлимитный'; in_place_combo_data.FieldByName('VALUE').asinteger:=5;  in_place_combo_data.Post;
      end;


    end;
  end;
end;

procedure TEdit_Kontakt.RxDBGrid4Exit(Sender: TObject);
begin
  if not propkln.fieldbyname('TYP').asinteger in [1,2,3,4,5,6,11] then
    in_place_combo.Visible := false;
end;

procedure TEdit_Kontakt.in_place_comboChange(Sender: TObject);
begin
   if in_place_combo.Value<>'' then
   begin

   propkln.Edit;
   propkln.fieldbyname('VALUESTR').asstring:=in_place_combo.DisplayValue;
   propkln.fieldbyname('VALUEINT').asstring:=in_place_combo.Value;
   propkln.Post;
   in_place_combo.CloseUp(false);
   in_place_combo.Visible := false;


   end;
end;

procedure TEdit_Kontakt.in_place_comboExit(Sender: TObject);
begin
   in_place_combo.CloseUp(false);
  in_place_combo.Visible := false;
end;

procedure TEdit_Kontakt.RxDBGrid4ColExit(Sender: TObject);
begin
   in_place_combo.CloseUp(false);
     in_place_combo.Visible := false;
end;

procedure TEdit_Kontakt.PropKLNVALUEINTChange(Sender: TField);
begin
   EditKontaktChange:=true;
   propkln.fieldbyname('MODYFIED').asinteger:=1;
end;

procedure TEdit_Kontakt.PropKLNVALUESTRChange(Sender: TField);
begin


  if not ( propkln.fieldbyname('TYP').asinteger in [1,2,3,4,5,6,11]) then
  begin
    EditKontaktChange:=true;
    propkln.fieldbyname('MODYFIED').asinteger:=1;
    propkln.fieldbyname('VALUEINT').asinteger:=strtoint( trim(stringreplace( stringreplace(propkln.fieldbyname('VALUESTR').asstring, '%', '', [rfReplaceAll]), 'дней', '', [rfReplaceAll]  )));;
  end;
  if ( propkln.fieldbyname('TYP').asinteger in [7,12]) then
  begin
    if(propkln.fieldbyname('VALUESTR').asstring='') then
      propkln.fieldbyname('VALUESTR').asstring:='0';
  end;

  if (Check_USER_Dostup('$DICKLN.EDIT_KLN_KTG')=-1)
  then
    propkln.fieldbyname('MODYFIED').asinteger:=0;



end;

procedure TEdit_Kontakt.NewNaprClick(Sender: TObject);
begin
  DicTowarSet:=3; {Ввод одной группы товаров}
  DIC_TOWAR.tag:=NewNapr.tag;
  DIC_TOWAR.showmodal;
  if DIC_TOWAR.tag>0 then
  begin
    {Отображаем название}
    EditKontaktChange:=true;
    QueryWork.close;
    QueryWork.SQL.clear;
    QueryWork.SQL.add('select TWTREE_NAM FROM TWTREE_full(:TWTREE_ID, '''')');
    QueryWork.ParamByname('TWTREE_ID').asinteger:=DIC_TOWAR.tag;
    QueryWork.Open;
    if not QueryWork.eof then
    begin
      memNapr.DisableControls;
      memNapr.Append;
      memNapr.fieldbyname('TWGROUP_ID').asinteger:=DIC_TOWAR.tag;
//      memNapr.fieldbyname('typ_kln').asinteger:=1;
      memNapr.fieldbyname('tw_nam').asstring:=QueryWork.fieldByname('TWTREE_NAM').asstring;
      memNapr.fieldbyname('kln_napr_id').asinteger:=-1;
      memNapr.Post;
      memNapr.EnableControls;
    end;
  end;

end;

procedure TEdit_Kontakt.TabSheet9Show(Sender: TObject);
begin
  if TabSheet9.tag<>1 then
  begin
    DEL_CNT:=0;
    NaprKln.Close;
    NaprKln.ParamByName('kln_id').asinteger:=EDIT_Kontakt.tag;
    NaprKln.Open;
    MemNapr.EmptyTable;
    MemNapr.LoadFromDataSet(NaprKln,0,lmappend);
 //   NaprKln.Close;
    TabSheet9.tag:=1;
  end;
    NaprKln.Open;
end;

procedure TEdit_Kontakt.ToolButton5Click(Sender: TObject);
begin
  if MemNapr.Fieldbyname('kln_napr_id').asinteger>0 then
  begin
    DEL_ARR[DEL_CNT]:=MemNapr.Fieldbyname('kln_napr_id').asinteger;
    inc(DEL_CNT);
  end;
  MemNapr.delete;
end;

procedure TEdit_Kontakt.ToolButton3Click(Sender: TObject);
begin
  DicTowarSet:=3; {Ввод одной группы товаров}
  DIC_TOWAR.tag:=ToolButton3.tag;
  DIC_TOWAR.showmodal;
  if DIC_TOWAR.tag>0 then
  begin
    {Отображаем название}
    EditKontaktChange:=true;
    QueryWork.close;
    QueryWork.SQL.clear;
    QueryWork.SQL.add('select TWTREE_NAM FROM TWTREE_full(:TWTREE_ID, '''')');
    QueryWork.ParamByname('TWTREE_ID').asinteger:=DIC_TOWAR.tag;
    QueryWork.Open;
    if not QueryWork.eof then
    begin

      memtwSaler.DisableControls;
      memtwSaler.Append;
      memtwSaler.fieldbyname('TWTREE_ID').asinteger:=DIC_TOWAR.tag;
//      memNapr.fieldbyname('typ_kln').asinteger:=1;
      memtwSaler.fieldbyname('tw_nam').asstring:=QueryWork.fieldByname('TWTREE_NAM').asstring;
      memtwSaler.fieldbyname('cfg_id').asinteger:=-1;
      memtwSaler.Post;
      memtwSaler.EnableControls;
    end;
  end;
end;





procedure TEdit_Kontakt.TabSheet11Show(Sender: TObject);
begin
//  if TabSheet11.tag<>1 then
  begin
    DEL_CNT:=0;
    query_cards.Close;
    query_cards.ParamByName('kln_id').asinteger:=EDIT_Kontakt.tag;
    query_cards.Open;
    mem_cards.EmptyTable;
    mem_cards.LoadFromDataSet(query_cards,0,lmappend);
    query_cards.Close;
    tran_cards.Commit;
 //   NaprKln.Close;
    TabSheet11.tag:=1;
  end;
//    NaprKln.Open;
end;

procedure TEdit_Kontakt.Timer1Timer(Sender: TObject);
var NEW_DISKONT_ID: integer;

   DISKONT_PERCENT:double;
   NEW_KLN_ID:integer;
   NEW_KLN_FULL:ansistring;
      summ: double;
begin
//добавить дисконт к контакту

//1. удалить его из связей с другими владельцами
//2. сохранить его связь с данным контактом


Try
     Timer1.Enabled:=False;
     Statusbar1.panels[1].text:='';
     {Определяем ID дисконтной карты}


     NEW_DISKONT_ID:=GET_DISKONT(NEW_DISKONT_NUM,DISKONT_PERCENT,NEW_KLN_ID,NEW_KLN_FULL, false, true, summ);

     if NEW_DISKONT_ID>0 then begin

        DataModule1.IbSaveSQL.SQL.Text := 'DELETE FROM RELATION WHERE relation.relation_typ = 10 and relation.relation_name=''KLN_CARD_RELATION'' and relation.child_id=:card_id';
        DataModule1.IbSaveSQL.ParamByName('CARD_ID').asInteger:= NEW_DISKONT_ID;
        DataModule1.IbSaveSQL.ExecSQL;

        DataModule1.IbSaveSQL.SQL.Text := 'INSERT INTO RELATION (relation_typ, relation_name, child_id, parent_id) values(10, ''KLN_CARD_RELATION'', :card_id, :kln_id)';
        DataModule1.IbSaveSQL.ParamByName('CARD_ID').asInteger:= NEW_DISKONT_ID;
        DataModule1.IbSaveSQL.ParamByName('kln_id').asInteger:= EDIT_Kontakt.tag;;
        DataModule1.IbSaveSQL.ExecSQL;

        DataModule1.IbSaveSQL.Transaction.Commit;


        TabSheet11Show(nil);

     end;
     NEW_DISKONT_NUM:='';


   Except
   End;






end;

end.
