unit HistoryKursRN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls,Data1,B_Utils,B_DButils, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  THistory_Kurs_RN = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RNTYP_FULL: TEdit;
    RxDBGrid1: TRxDBGrid;
    HistoryTransaction: TIBTransaction;
    QueryHistory: TIBQuery;
    QueryHistoryKURS_KURS: TFloatField;
    QueryHistoryKURS_DATE: TDateTimeField;
    DsHistory: TDataSource;
    Image3: TImage;
    QueryHistoryUS_FULL: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  History_Kurs_RN: THistory_Kurs_RN;

implementation

{$R *.DFM}

procedure THistory_Kurs_RN.FormShow(Sender: TObject);
begin
     HistoryTransaction.Active:=False;
     QueryHistory.close;
     QueryHistory.ParamByname('TYP').asinteger:=History_Kurs_RN.tag;
     QueryHistory.Open;
end;

procedure THistory_Kurs_RN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QueryHistory.close;
     HistoryTransaction.Active:=False;
end;

procedure THistory_Kurs_RN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

end.
