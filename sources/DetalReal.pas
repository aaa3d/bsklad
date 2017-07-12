unit DetalReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, RXSpin, StdCtrls, ExtCtrls,Data1,
  B_utils,B_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase,VclUtils;

type
  TDetal_real = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    TW_NAM: TEdit;
    Label2: TLabel;
    MES: TRxSpinEdit;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryReal1: TIBQuery;
    QueryReal1RNTYP_ID: TIntegerField;
    QueryReal1RNTYP_SHORT: TIBStringField;
    QueryReal1TW_KOL: TFloatField;
    DsReal1: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detal_real: TDetal_real;

implementation

uses WaitForm;

{$R *.DFM}

procedure TDetal_real.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if key=#27 then begin
                key:=#0;
                close;
        end;
end;

procedure TDetal_real.FormShow(Sender: TObject);
begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select TW_NAM from tw where tw_id=:tw_id');
     QueryWork.ParamByname('TW_ID').asinteger:=DETAL_REAL.tag;
     QueryWork.Open;
     TW_NAM.text:=QueryWork.FieldByname('TW_NAM').asstring;
     MES.value:=TMP_MES;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     QueryReal1.ParamByname('TW_ID').asinteger:=DETAL_REAL.tag;
     QueryReal1.ParamByname('MES').asfloat:=TMP_MES;
     QueryReal1.Open;
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
end;

procedure TDetal_real.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryWork.Close;
     QueryReal1.Close;
     WorkTransaction.Active:=False;
end;

end.
