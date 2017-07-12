unit HistoryPeriod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  StdCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls;

type
  THistory_Period = class(TForm)
    HTransaction: TIBTransaction;
    QueryH: TIBQuery;
    DsH: TDataSource;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    QueryHTM: TDateTimeField;
    QueryHMESS: TIBStringField;
    QueryHSHOP_NAME: TIBStringField;
    QueryHUS_FULL: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  History_Period: THistory_Period;

implementation

{$R *.DFM}

procedure THistory_Period.FormShow(Sender: TObject);
begin
  HTransaction.Active:=False;
  QueryH.close;
  QueryH.Parambyname('USGROUP_ID').asinteger:=History_period.tag;
  QueryH.open;
end;

procedure THistory_Period.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QueryH.close;
  HTransaction.Active:=False;
end;

end.
