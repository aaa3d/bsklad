unit EditGarant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, ComCtrls, DBCtrls, RxLookup, Db,
  IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, RXSpin, CurrEdit, Mask,
  ToolEdit, ToolWin, Menus;

type
  TEdit_Garant = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    GARANT_NUM: TEdit;
    Label2: TLabel;
    GARANT_DT: TDateEdit;
    Label3: TLabel;
    TW_NAM: TEdit;
    Label4: TLabel;
    TW_NUM: TEdit;
    Label5: TLabel;
    TW_MONEY: TRxCalcEdit;
    TW_KURS: TRxCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GARANT_MES: TRxSpinEdit;
    GARANT_NAK: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    GarantTransaction: TIBTransaction;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    QrSKL: TIBQuery;
    DsSKL: TDataSource;
    QrSKLSKL_ID: TIntegerField;
    QrSKLSKL_SHORT: TIBStringField;
    QrSKLSKL_FULL: TIBStringField;
    QrSKLSKL_ADR: TIBStringField;
    QrSKLSKL_TEL: TIBStringField;
    QrSKLSKL_TIME: TIBStringField;
    QrSKLSKL_SPEED: TIntegerField;
    SKL_ID: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BtnSAVE: TToolButton;
    BtnApply: TToolButton;
    ToolButton3: TToolButton;
    BtnPrint: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    CtrlEnter1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BtnDicTowar: TToolButton;
    N4: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure GARANT_NUMChange(Sender: TObject);
    procedure GARANT_NAKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnSAVEClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnDicTowarClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Garant: TEdit_Garant;
  SAVE:boolean;
  GARANT_NUMS:integer;
  GARANT_SHOP:integer;

implementation

uses DicTowar;

{$R *.DFM}

procedure TEdit_Garant.FormShow(Sender: TObject);
begin
     GET_DEFAULT;
     GarantTransaction.Active:=False;
     QrSKL.close;
     QrSKL.Open;
     if Edit_GARANT.tag>0 then begin
        WorkTranSaction.Active:=False;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select * from GARANT WHERE GARANT_ID=:GARANT_ID');
        IbQuery1.ParamByname('GARANT_ID').asinteger:=Edit_GARANT.tag;
        IbQuery1.Open;
        GARANT_NUM.text:=IbQuery1.FieldByname('GARANT_NUM').asstring;
        GARANT_NUMS:=IbQuery1.FieldByname('GARANT_NUM').asinteger;
        GARANT_DT.date:=IbQuery1.FieldByname('GARANT_DT').asdatetime;
        TW_NAM.text:=IbQuery1.FieldByname('TW_NAM').asstring;
        TW_NUM.text:=IbQuery1.FieldByname('TW_NUM').asstring;
        TW_MONEY.value:=IbQuery1.FieldByname('TW_MONEY').asfloat;
        TW_KURS.value:=IbQuery1.FieldByname('TW_KURS').asfloat;
        GARANT_MES.value:=IbQuery1.FieldByname('GARANT_MES').asinteger;
        if IbQuery1.FieldByname('GARANT_NAK').asstring='1'
        then GARANT_NAK.checked:=true else GARANT_NAK.checked:=false;
        SKL_ID.value:=IbQuery1.FieldByname('SKL_ID').asstring;
        GARANT_SHOP:=IbQuery1.FieldByname('SHOP_ID').asinteger;
     end else begin
        GARANT_NUM.text:='НОВЫЙ';
        GARANT_NUMS:=-1;
        GARANT_DT.date:=Date();
        TW_NAM.text:='';
        TW_NUM.text:='';
        TW_MONEY.value:=0;
        TW_KURS.value:=DEFAULT_KURS(DEFAULT_VALUTA_KURS,TYP_KKM);
        GARANT_MES.value:=6;
        GARANT_NAK.checked:=False;
        SKL_ID.value:=inttostr(DEFAULT_SKLAD);
        GARANT_SHOP:=SHOPID;
     end;
     SAVE:=TRUE;
end;

procedure TEdit_Garant.GARANT_NUMChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TEdit_Garant.GARANT_NAKClick(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TEdit_Garant.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     Canclose:=True;
     if (not SAVE) then begin
        if Messbox('Данные были изменены! Вы подтверждаете выход без их сохранения?',MessSubmit,4+48+256)<>6 then CanClose:=False;
     end;
end;

procedure TEdit_Garant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QrSKL.close;
     GarantTransaction.Active:=False;
end;

procedure TEdit_Garant.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#10 then begin
        key:=#0;
        TW_NAM.setfocus;
        TW_NUM.setfocus;
        BtnSAVE.click;
     end;
end;

procedure TEdit_Garant.BtnPrintClick(Sender: TObject);
begin
     SAVE:=FALSe;
     BtnApply.click;
     if SAVE then PRINT_GARANT_TALON(Edit_Garant.tag);
end;

procedure TEdit_Garant.BtnSAVEClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     If SAVE then close;
end;

procedure TEdit_Garant.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
 if trim(TW_NAM.text)='' then Messbox('Наименование изделия не может быть пустой строкой!',MessSystem,48) else begin
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   Try
     IBSAVE_CLEAR;
     IF GARANT_NUMS<0 then GARANT_NUMS:=NEW_GARANT_NUM(GARANT_DT.date);
     GARANT_NUM.text:=inttostr(GARANT_NUMS);
     IBSAVE_ADD('GARANT_NUM',GARANT_NUMS);
     IBSAVE_ADD('GARANT_DT',GARANT_DT.date);
     IBSAVE_ADD('TW_NAM',TW_NAM.text);
     IBSAVE_ADD('TW_NUM',TW_NUM.text);
     IBSAVE_ADD('TW_MONEY',TW_MONEY.value);
     IBSAVE_ADD('TW_KURS',TW_KURS.value);
     IBSAVE_ADD('GARANT_MES',Int(GARANT_MES.value));
     IBSAVE_ADD('GARANT_NAK',GARANT_NAK.checked);
     IBSAVE_ADD('SKL_ID',strtoint(SKL_ID.value));
     IBSAVE_ADD('SHOP_ID',GARANT_SHOP);
     IBSAVE_ADD('US_ID',USERID);
     Edit_Garant.tag:=IbSAVE_DOC('GARANT',Edit_Garant.tag);
     if Edit_Garant.tag<0 then r:=Sqrt(-1);
     Datamodule1.IBTransaction2.Commit;
     SAVE:=True;
   except
     Datamodule1.IBTransaction2.RollBAck;
   end;
   Datamodule1.IBTransaction2.Active:=False;
 end;
end;

procedure TEdit_Garant.BtnDicTowarClick(Sender: TObject);
begin
     DicTowarSet:=1; {Ввод одного товара}
     CNT_TW:=0;
     DIC_TOWAR.Treeview1.Tag:=strtoint(SKL_ID.value);
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
       WorkTransaction.Active:=False;
       ADD_SQL(IbQuery1,'select tw_nam from tw where tw_id=:tw_id');
       ibQuery1.parambyname('TW_ID').asinteger:=ARR_TW[1].ID;
       ibQuery1.open;
       if not ibQuery1.eof then TW_NAM.text:=ibQuery1.fieldbyname('TW_NAM').asstring;
     end;
end;

procedure TEdit_Garant.ToolButton1Click(Sender: TObject);
begin
     My_lock;
     
end;

end.
