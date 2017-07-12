unit EditKKM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_DButils, ToolWin, ComCtrls, ActnList, Mask, ToolEdit,
  CurrEdit, StdCtrls, Db, IBCustomDataSet, IBQuery, IBDatabase, RxLookup;

type
  TEDIT_KKM = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ActSave: TAction;
    ActApply: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    COMP_NAME: TEdit;
    MODEL: TComboBox;
    COM: TComboBox;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label5: TLabel;
    IBShop: TIBQuery;
    SHOPTrans: TIBTransaction;
    IBShopSHOP_ID: TIntegerField;
    IBShopSHOP_NAME: TIBStringField;
    IBShopSHOP_LAST: TDateTimeField;
    IBShopSHOP_OFFICE: TIBStringField;
    IBShopSHOP_PREFIX: TIBStringField;
    IBShopSHOP_POSTFIX: TIBStringField;
    IBShopSHOP_COLOR: TIntegerField;
    IBShopSHOP_TM: TDateTimeField;
    IBShopSHOP_VISIBLE: TIBStringField;
    DataSource1: TDataSource;
    shop: TRxDBLookupCombo;
    DsFrm: TDataSource;
    FRM: TRxDBLookupCombo;
    Label8: TLabel;
    QryFrm: TIBQuery;
    FrmTransaction: TIBTransaction;
    CODE: TEdit;
    Label6: TLabel;
    KKM_NAME: TEdit;
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure COMChange(Sender: TObject);
    procedure MODELChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure COMP_NAMEChange(Sender: TObject);
    procedure NUMChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CODEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_KKM: TEDIT_KKM;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_KKM.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   SAVE:=false;
   if trim(comp_name.text)='' then messbox('Имя компьютера не может быть пустым!',MessSystem,48) else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     try
       ibsave_clear;
       ibsave_add('cfg_name','$$LIST_KKM');
       ibsave_add('cfg_value',trim(ansiuppercase(stringreplace(COMP_NAME.Text, '|', '-', [rfReplaceAll])))+'|' + stringreplace(KKM_NAME.Text, '|', '-', [rfReplaceAll])) ;
       ibsave_add('cfg_set1',MODEL.itemindex+1);

       if model.ItemIndex=3 then
              ibsave_add('cfg_set2',strtoint(FRM.value))
         else
         	  ibsave_add('cfg_set2',COM.itemindex+1);
       ibsave_add('cfg_set3',strtoint('0'+SHOP.Value));
       ibsave_add('cfg_BIG',CODE.text);
       ID:=ibsave_doc('CFG',EDIT_KKM.tag);
       if ID<0 then r:=sqrt(-1);
       EDIT_KKM.tag:=ID;
       SAVE:=true;
       Datamodule1.IBTransaction2.Commit;
       SAVE:=true;
     except
       Datamodule1.IBTransaction2.Rollback;
     end;
     Datamodule1.IBTransaction2.Active:=False;
   end;
end;

procedure TEDIT_KKM.ActSaveExecute(Sender: TObject);
begin
   // Сохранить
   ActApply.execute;
   if SAVE then close;
end;

procedure TEDIT_KKM.COMChange(Sender: TObject);
begin
   if COM.itemindex<0 then COM.itemindex:=0;
   SAVE:=False;
end;

procedure TEDIT_KKM.MODELChange(Sender: TObject);
var s: string;
begin
   if MODEL.itemindex<0 then MODEL.itemindex:=0;
   SAVE:=False;

   if Model.ItemIndex=3 then
   begin
    FRM.Visible:=true;
    COM.Visible:=false;
    label4.Visible:=false;
    label8.Visible:=true;
    label3.Caption:='Зав. номер :';
   s := FRM.Value;

   FrmTransaction.Active:=false;
   QryFrm.close;
   QryFrm.open;
   FRM.Value:=s;
   end
   else
   begin
   FRM.Visible:=false;
   COM.Visible:=true;
       label4.Visible:=true;
    label8.Visible:=false;
    label3.Caption:='Код активации';
   end;
end;

procedure TEDIT_KKM.FormShow(Sender: TObject);
var f, n: integer;
	buf: string;
begin
    ibshop.Active:=true;


    if EDIT_KKM.tag<=0 then begin
       COMP_NAME.text:='';
       MODEL.itemindex:=0;
       COM.itemindex:=0;
    end else begin
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select * from LIST_KKM where CFG_ID=:cfg_id');
       QueryWork.ParamByname('cfg_id').asinteger:=EDIT_KKM.tag;
       QueryWork.open;

       COMP_NAME.text:=QueryWork.fieldbyname('COMP_NAME').asstring;
       KKM_NAME.text:=QueryWork.fieldbyname('KKM_NAME').AsString;
       shop.value :=QueryWork.fieldbyname('SHOP_ID').asstring;
       MODEL.itemindex:=QueryWork.fieldByname('MODEL').asinteger-1;
       CODE.Text := QueryWork.fieldByname('MODEL_NUM').asString;
       COM.itemindex:=QueryWork.fieldByname('COM').asinteger-1;
       FRM.Value := QueryWork.fieldByname('FRM_ID').asstring;
    end;
    MODELChange(nil);
    SAVE:=true;
end;

procedure TEDIT_KKM.COMP_NAMEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_KKM.NUMChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_KKM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	ibshop.Close;
end;

procedure TEDIT_KKM.CODEKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key  in ['0'..'9']) then 
         key:=#0;
end;

end.
