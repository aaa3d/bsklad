unit SelectValuta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Db, IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl,B_utils,B_DButils;

type
  TSelect_VALUTA = class(TForm)
    ValutaTransaction: TIBTransaction;
    QueryValuta: TIBQuery;
    DsValuta: TDataSource;
    RxDBGrid1: TRxDBGrid;
    QueryValutaVALUTA_ID: TIntegerField;
    QueryValutaVALUTA_FULL: TIBStringField;
    QueryValutaVALUTA_SHORT: TIBStringField;
    procedure QueryValutaAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_VALUTA: TSelect_VALUTA;

implementation

{$R *.DFM}

procedure TSelect_VALUTA.QueryValutaAfterOpen(DataSet: TDataSet);
var
   n:integer;
begin
     n:=QueryValuta.recordcount;
     Select_Valuta.Height:=(n)*20;

end;

procedure TSelect_VALUTA.FormKeyPress(Sender: TObject; var Key: Char);
begin
     IF KEY=#27 THEN CLOSE;
end;

procedure TSelect_VALUTA.FormShow(Sender: TObject);
begin
     ValutaTransaction.Active:=False;
     QueryValuta.Close;
     QueryValuta.Open;
     tag:=0;
end;

procedure TSelect_VALUTA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QueryValuta.Close;
     ValutaTransaction.Active:=False;
end;

procedure TSelect_VALUTA.RxDBGrid1DblClick(Sender: TObject);
begin
     tag:=QueryValuta.fieldByname('VALUTA_ID').asinteger;
     VALUTA_TMP1:=QueryValuta.fieldByname('VALUTA_FULL').asstring;
     VALUTA_TMP2:=QueryValuta.fieldByname('VALUTA_SHORT').asstring;
     close;
end;

procedure TSelect_VALUTA.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
        tag:=QueryValuta.fieldByname('VALUTA_ID').asinteger;
        VALUTA_TMP1:=QueryValuta.fieldByname('VALUTA_FULL').asstring;
        VALUTA_TMP2:=QueryValuta.fieldByname('VALUTA_SHORT').asstring;
       close;
     end;
     if key=#27 then close;
end;

end.
