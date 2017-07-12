unit EditCardReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ComCtrls, ToolWin, ActnList, StdCtrls, RXSpin,
  Mask, DBCtrls, RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ToolEdit, CurrEdit, RXDBCtrl, Buttons;

type
  TEDIT_CARD_REG = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ActApply: TAction;
    ActSave: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    CARD_NAME: TEdit;
    DIAP1: TRxSpinEdit;
    DIAP2: TRxSpinEdit;
    Check_Usl1: TRadioButton;
    Percent_Combo: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    CardTransaction: TIBTransaction;
    QuerySkid: TIBQuery;
    QuerySkidCARDSKID_ID: TIntegerField;
    QuerySkidCARDSKID_DT1: TDateTimeField;
    QuerySkidCARDSKID_DT2: TDateTimeField;
    QuerySkidCARDSKID_PERCENT: TFloatField;
    QuerySkidCARDSKID_TYP: TIntegerField;
    QuerySkidCARDSKID_NAME: TIBStringField;
    DsSkid: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Check_usl2: TRadioButton;
    USL2_SUMM: TRxCalcEdit;
    Label6: TLabel;
    KLN: TEdit;
    BTN_KLN: TBitBtn;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    GroupBox2: TGroupBox;
    Check_uch1: TRadioButton;
    Check_uch2: TRadioButton;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Check_activ: TCheckBox;
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
    procedure refresh_kln;
    procedure CARD_NAMEChange(Sender: TObject);
    procedure DIAP1Change(Sender: TObject);
    procedure DIAP2Change(Sender: TObject);
    procedure USL2_SUMMChange(Sender: TObject);
    procedure Check_uch1Click(Sender: TObject);
    procedure Check_Usl1Click(Sender: TObject);
    procedure Percent_ComboChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Check_activClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  CAP_EDIT='Пластиковые карты. Редактирование';
  CAP_Insert='Пластиковые карты. Создание нового диаппазона';
var
  EDIT_CARD_REG: TEDIT_CARD_REG;
  SAVE:boolean;

implementation

uses DicKlient;

{$R *.DFM}

procedure TEDIT_CARD_REG.ActApplyExecute(Sender: TObject);
var
  id:integer;
  sets:string;
  r:double;
begin
   // Применить
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   Save:=False;
   try
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','CARD_REG');
      IBSAVE_ADD('CFG_BIG',b_utils.left(CARD_NAME.text,64));
      if check_usl1.checked then sets:='1 ' else sets:='2 ';  // параметр 1
      if check_uch1.checked then sets:=sets+'1 ' else sets:=sets+'2 '; // параметр 2
      sets:=sets+inttostr(trunc(diap1.value))+' '+inttostr(trunc(diap2.value)); // параметр 3 и 4
      sets:=sets+' '+DoubleToFixedString(USL2_SUMM.value); // параметр 5
      sets:=sets+' '+Percent_Combo.value; // параметр 6
      IBSAVE_ADD('CFG_VALUE',sets);
      IBSAVE_ADD('CFG_SET1',KLN.tag);
      if Check_Activ.checked then IBSAVE_ADD('CFG_SET2',1) else IBSAVE_ADD('CFG_SET2',0);
      ID:=IBSAVE_DOC('CFG',EDIT_CARD_REG.tag);
      if ID<0 then r:=sqrt(-1);
      EDIT_CARD_REG.tag:=ID;
      EDIT_CARD_REG.caption:=CAP_EDIT;
      Datamodule1.IBTransaction2.Commit;
      SAVE:=true;
   except
      Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;


end;

procedure TEDIT_CARD_REG.ActSaveExecute(Sender: TObject);
begin
   // Сохранить
   if ActApply.enabled then ActApply.execute;
   if SAVE then close;
end;

procedure TEDIT_CARD_REG.FormShow(Sender: TObject);
var
  s:string;
begin
    CardTransaction.Active:=False;
    QuerySkid.close;
    QuerySkid.open;
    if EDIT_CARD_REG.tag>0 then begin
       // Существующий диапазон пластиковых карт
      EDIT_CARD_REG.caption:=CAP_EDIT;
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select * from cfg where cfg_id=:cfg_id');
      QueryWork.ParamByname('cfg_id').asinteger:=EDIT_CARD_REG.tag;
      QueryWork.open;
      CARD_NAME.text:=QueryWork.fieldByname('CFG_BIG').ASSTRING;
      s:=QueryWork.fieldByname('CFG_value').asstring;
      KLN.tag:=QueryWork.fieldByname('CFG_SET1').asinteger;
      if QueryWork.fieldByname('CFG_SET2').asinteger=1 then check_activ.checked:=true
                                                       else check_activ.checked:=false;
      if argc(s,1)='1' then check_usl1.checked:=true else check_usl2.checked:=true;
      if argc(s,2)='1' then check_uch1.checked:=true else check_uch2.checked:=true;
      diap1.value:=strtoint(argc(s,3));
      diap2.value:=strtoint(argc(s,4));
      USL2_SUMM.value:=FixedStringToDouble(argc(s,5));
      Percent_Combo.value:=argc(s,6);
    end else begin
       // Новый диапазон карт
       CARD_NAME.text:='';
       KLN.tag:=0;
       DIAP1.value:=0;
       DIAP2.value:=0;
       Check_Usl1.Checked:=true;
       Percent_Combo.Value:=QuerySkid.fieldByname('CARDSKID_ID').asstring;
       Check_Uch1.Checked:=true;
       EDIT_CARD_REG.caption:=CAP_INSERT;
    end;
    refresh_kln;
    Check_usl1.onclick(Sender);
    SAVE:=true;
end;

procedure TEDIT_CARD_REG.BTN_KLNClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN.tag then begin
        SAVE:=False;
        KLN.tag:=DIC_KLIENT.tag;
        Refresh_kln;
     end;
     DIC_KLIENT.Destroy;
end;

Procedure TEDIT_CARD_REG.Refresh_kln;
begin
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
   QueryWork.paramByname('KLN_ID').asinteger:=KLN.tag;
   QueryWork.Open;
   kln.text:=QueryWork.fieldByname('kln_full').asstring;
   WorkTransaction.Active:=False;

end;

procedure TEDIT_CARD_REG.CARD_NAMEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_CARD_REG.DIAP1Change(Sender: TObject);
begin
      SAVE:=False;
end;

procedure TEDIT_CARD_REG.DIAP2Change(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_CARD_REG.USL2_SUMMChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_CARD_REG.Check_uch1Click(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_CARD_REG.Check_Usl1Click(Sender: TObject);
begin
   SAVE:=False;
   USL2_SUMM.enabled:=Check_Usl2.checked;
   Percent_combo.enabled:=Check_Usl1.checked;
end;

procedure TEDIT_CARD_REG.Percent_ComboChange(Sender: TObject);
begin
   Save:=False;
end;

procedure TEDIT_CARD_REG.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TEDIT_CARD_REG.Check_activClick(Sender: TObject);
begin
   SAVE:=False;
end;

end.
