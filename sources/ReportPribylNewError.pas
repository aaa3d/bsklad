unit ReportPribylNewError;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Grids, DBGrids, RXDBCtrl;

type
  TREPORT_PRIBYL_NEW_ERROR = class(TForm)
    RxDBGrid1: TRxDBGrid;
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_PRIBYL_NEW_ERROR: TREPORT_PRIBYL_NEW_ERROR;



implementation



{$R *.DFM}

procedure TREPORT_PRIBYL_NEW_ERROR.RxDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#27 then close;
end;

end.
