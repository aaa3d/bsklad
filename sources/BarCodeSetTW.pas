unit BarCodeSetTW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,b_utils,b_dbutils,Unit_AMC100F, Db, IBCustomDataSet,
  IBQuery, Mask, ToolEdit, CurrEdit, Buttons;

type
  TBAR_CODE_SET_TW = class(TForm)
    SaveButton: TButton;
    IBQuery1: TIBQuery;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    RxCalcEdit1: TRxCalcEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure SaveButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RxCalcEdit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    
  private
    { Private declarations }
    CFG_ID: integer;



  public
    { Public declarations }
  end;

var
  BAR_CODE_SET_TW: TBAR_CODE_SET_TW;

implementation

uses DATA1, MAINFORM, DicTowar;

{$R *.DFM}



procedure TBAR_CODE_SET_TW.SaveButtonClick(Sender: TObject);
begin
if Label2.tag=0 then
  exit;
  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('BAR_CODE_VALUE', Edit1.Text);
    IBSAVE_ADD('tW_id', Label2.tag);
    IBSAVE_ADD('us_id', USERID);
    IBSAVE_DOC('BAR_CODE', -1);

    Datamodule1.IBTransaction2.Commit;
  except
    Datamodule1.IBTransaction2.Rollback;
  end;


  

  Close;
end;

procedure TBAR_CODE_SET_TW.FormActivate(Sender: TObject);
begin
 Edit1.Text:=gl_LAST_BAR_CODE;
end;

procedure TBAR_CODE_SET_TW.RxCalcEdit1Change(Sender: TObject);
begin
 ibquery1.SQL.Text:='select tw_id, tw_nam from tw where tw_art=:tw_art and tw_brak=0';
 ibquery1.ParamByName('tw_art').asinteger:=round(RxCalcEdit1.value);
 ibquery1.Open;
 if not ibquery1.Eof then
 begin
  label2.Caption:=ibquery1.fieldbyname('tw_nam').asstring;
  label2.tag:=ibquery1.fieldbyname('tw_id').asinteger;
 end
 else
 begin
  label2.Caption:='';
  label2.tag:=0;
 end;
 ibquery1.close;
end;

procedure TBAR_CODE_SET_TW.BitBtn1Click(Sender: TObject);
var
   a:integer;
begin
     DicTowarSet:=4; {¬вод товара из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then
          RxCalcEdit1.Value:=DIC_TOWAR.SELECT_ART;
     

end;

end.
