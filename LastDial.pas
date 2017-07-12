unit LastDial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl;

type
  TLAST_DIAL = class(TForm)
    RxDBGrid1: TRxDBGrid;
    LastTransaction: TIBTransaction;
    QrList: TIBQuery;
    DsList: TDataSource;
    QrListSHOP_NAME: TIBStringField;
    QrListTM: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LAST_DIAL: TLAST_DIAL;

implementation

{$R *.DFM}

procedure TLAST_DIAL.FormShow(Sender: TObject);
begin
  LastTransaction.Active:=False;
  QrList.close;
  QrList.Parambyname('SHOP_ID').asinteger:=SHOPID;
  QrList.open;
end;

procedure TLAST_DIAL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QrList.close;
  LastTransaction.Active:=False;
end;

procedure TLAST_DIAL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
end;

procedure TLAST_DIAL.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
      {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='TM' then begin
        if (((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TM').asdatetime >0)
        and

        ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TM').asdatetime < now-1/24 {час}))
        then Background:=clRed;
     end;
end;

end.
