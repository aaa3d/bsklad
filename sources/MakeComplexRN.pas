unit MakeComplexRN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Mask, ToolEdit;

type
  TMAKE_COMPLEX_RN = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    DateEdit2: TDateEdit;
    PROC_FRM: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PROC_FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAKE_COMPLEX_RN: TMAKE_COMPLEX_RN;

implementation

uses Data1, b_dbutils;

{$R *.DFM}

procedure TMAKE_COMPLEX_RN.FormShow(Sender: TObject);
begin
  RxDBLookupCombo1.Value:='160010005';
  RxDBLookupCombo2.Value:='2';

end;

procedure TMAKE_COMPLEX_RN.Button1Click(Sender: TObject);
begin
  datamodule1.IbSaveSQL.Close;

  if PROC_FRM.ItemIndex=0 then
    datamodule1.IbSaveSQL.SQL.Text:='SELECT NUM_FULL FROM MAKE_COMPLEX_RN(:in_rntyp_id1, :in_rntyp_id2, :in_dt, :in_dt2, :us_id)';

  if PROC_FRM.ItemIndex=1 then
    datamodule1.IbSaveSQL.SQL.Text:='SELECT NUM_FULL FROM MAKE_COMPLEX_RN_ROZ(:in_rntyp_id1, :in_rntyp_id2, :in_dt, :in_dt2, :us_id)';

  if PROC_FRM.ItemIndex=2 then
    datamodule1.IbSaveSQL.SQL.Text:='SELECT NUM_FULL FROM MAKE_COMPLEX_RN_TK(:in_rntyp_id1, :in_rntyp_id2, :in_dt, :in_dt2, :us_id)';


  datamodule1.IbSaveSQL.ParamByName('in_rntyp_id1').asstring:=RxDBLookupCombo1.Value;
  datamodule1.IbSaveSQL.ParamByName('in_rntyp_id2').asstring:=RxDBLookupCombo2.Value;
  datamodule1.IbSaveSQL.ParamByName('in_dt').asdatetime:=DateEdit1.Date;
  datamodule1.IbSaveSQL.ParamByName('in_dt2').asdatetime:=DateEdit2.Date;
  datamodule1.IbSaveSQL.ParamByName('us_id').asinteger:=USERID;
  datamodule1.IbSaveSQL.Open;

  memo1.Lines.Add('создана РН '+datamodule1.IbSaveSQL.fieldbyname('NUM_FULL').asstring);
  datamodule1.IbSaveSQL.Transaction.Commit;


end;

procedure TMAKE_COMPLEX_RN.FormCreate(Sender: TObject);
begin
  PROC_FRM.ItemIndex:=0;
end;

procedure TMAKE_COMPLEX_RN.PROC_FRMChange(Sender: TObject);
begin
  self.Caption :='Создание сводных расходных накладных' + PROC_FRM.Text;
end;

end.
