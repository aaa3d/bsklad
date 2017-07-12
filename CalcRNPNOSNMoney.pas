unit CalcRNPNOSNMoney;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBCustomDataSet, IBQuery, IBDatabase, Mask, ToolEdit,
  Grids, DBGrids, ExtCtrls;

type
  TCalcRNPN_OSN_Money = class(TForm)
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    QueryWorkRNS_TD_ID: TIntegerField;
    QueryWorkPNS_TD_ID: TIntegerField;
    QueryWorkSEB: TFloatField;
    QueryWorkROZN: TFloatField;
    QueryWorkMONEY: TFloatField;
    QueryWorkPERCENT: TFloatField;
    QueryWorkTW_ID: TIntegerField;
    QueryWorkTW_KOL: TFloatField;
    Panel1: TPanel;
    Button1: TButton;
    QueryWorkMET: TIBStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalcRNPN_OSN_Money: TCalcRNPN_OSN_Money;

implementation

uses Mainform;

{$R *.DFM}

procedure TCalcRNPN_OSN_Money.Button1Click(Sender: TObject);
begin
      WorkTransaction.Active:=False;
      QueryWork.Open;


end;

end.
