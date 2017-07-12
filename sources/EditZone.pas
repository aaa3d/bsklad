unit Editzone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBQuery, IBDatabase, ActnList, Mask, ToolEdit,
  CurrEdit, StdCtrls, ComCtrls, ToolWin, b_dbutils, b_utils, RxLookup;

type
  TEDIT_ZONE = class(TForm)
    Label1: TLabel;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnApply: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    GroupBox1: TGroupBox;
    cbZoneClosed: TCheckBox;
    ZoneType2: TRadioButton;
    ZoneType1: TRadioButton;
    GroupBox2: TGroupBox;
    ZonePlaceVist: TRadioButton;
    ZonePlaceSkl: TRadioButton;
    Label2: TLabel;
    SKL: TRxDBLookupCombo;
    Label51: TLabel;
    Label52: TLabel;
    zone_length: TRxCalcEdit;
    Label53: TLabel;
    zone_width: TRxCalcEdit;
    Label54: TLabel;
    zone_height: TRxCalcEdit;
    Label43: TLabel;
    ZONE_KUBATURA: TRxCalcEdit;
    zone_type: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ZONE_DESCR: TEdit;
    ZONE_NAME: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure zone_lengthChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_ZONE: TEDIT_ZONE;
  SAVE: boolean=false;

implementation

uses Data1;

{$R *.DFM}

procedure TEDIT_ZONE.FormShow(Sender: TObject);
begin
    if EDIT_ZONE.tag<=0 then begin
       ZONE_NAME.text:='';
    end else begin
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select * from ZONE where ZONE_id=:zone_id');
       QueryWork.ParamByname('zone_id').asinteger:=EDIT_ZONE.tag;

       QueryWork.open;
       ZONE_NAME.text:=QueryWork.fieldByname('zone_name').asstring;
       SKL.value := QueryWork.fieldByname('skl_id').asstring;


       zone_width.value:=QueryWork.fieldByname('zone_width').asFloat;
       zone_height.value:=QueryWork.fieldByname('zone_height').asFloat;
       zone_length.value:=QueryWork.fieldByname('zone_length').asFloat;
       zone_kubatura.value:=QueryWork.fieldByname('zone_kubatura').asFloat;
       zone_type.Text:=QueryWork.fieldByname('zone_type').asstring;

       zone_descr.Text := QueryWork.fieldByname('zone_descr').asstring;

       querywork.Close;
    end;
    SAVE:=true;
    zone_name.SetFocus;
    zone_name.SelectAll;
end;

procedure TEDIT_ZONE.btnApplyClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   SAVE:=false;
   if trim(zone_name.text)='' then messbox('Название зоны не может быть пустым!',MessSystem,48) else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     try
       ibsave_clear;
       ibsave_add('zone_name',zone_name.Text);
       ibsave_add('skl_id',SKL.value);
       ibsave_add('zone_descr', zone_descr.Text);
       ibsave_add('zone_width',zone_width.value);
       ibsave_add('zone_length',zone_length.value);
       ibsave_add('zone_height',zone_height.value);
       ibsave_add('zone_kubatura',zone_kubatura.value);
       ibsave_add('zone_type',zone_type.Text);



       ID:=ibsave_doc('ZONE',EDIT_ZONE.tag);
       if ID<0 then r:=sqrt(-1);
       EDIT_ZONE.tag:=ID;


       Datamodule1.IBTransaction2.Commit;
       SAVE:=true;
     except
       Datamodule1.IBTransaction2.Rollback;
     end;
     Datamodule1.IBTransaction2.Active:=False;
   end;
end;

procedure TEDIT_ZONE.ToolButton1Click(Sender: TObject);
begin
   // Сохранить
   btnapply.click;
   if SAVE then close;
end;

procedure TEDIT_ZONE.zone_lengthChange(Sender: TObject);
begin
        zone_kubatura.value:=zone_width.value*zone_height.value*zone_length.value;
end;

end.
