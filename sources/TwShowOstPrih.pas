unit TwShowOstPrih;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl;

type
  TTW_SHOW_OST_PRIH = class(TForm)
    RxDBGrid1: TRxDBGrid;
    QrTWPost: TIBQuery;
    DsTWPost: TDataSource;
    TWPostTransaction: TIBTransaction;
    QrTWPostPN_TYP: TIBStringField;
    QrTWPostPN_DATE: TDateTimeField;
    QrTWPostTW_KOL: TFloatField;
    QrTWPostBASE_DT: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    dt1, dt2, dt_rep: TDateTime;
    tw_id: integer;
  end;

var
  TW_SHOW_OST_PRIH: TTW_SHOW_OST_PRIH;

implementation

uses Data1;

{$R *.DFM}

procedure TTW_SHOW_OST_PRIH.FormShow(Sender: TObject);
var tw_name, shop_name: ansistring;
begin
//       self.Caption:=SHOP_name+': '+tw_name;
	     QrTWPost.close;
       QrTWPost.ParamByName('TW_ID').asinteger:= tw_id;
       QrTWPost.ParamByName('dt1').asdatetime:= dt1;
       QrTWPost.ParamByName('dt2').asdatetime:= dt2;
       QrTWPost.ParamByName('dt_rep').asdatetime:= dt_rep;
    	 TWPostTransaction.Active:=False;
	     QrTWPost.Open;
end;

procedure TTW_SHOW_OST_PRIH.FormDeactivate(Sender: TObject);
begin
	self.Close;
  TWPostTransaction.Active:=False;
end;

procedure TTW_SHOW_OST_PRIH.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=27) then self.Close;
end;

end.
