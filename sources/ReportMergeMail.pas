unit ReportMergeMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TREPORT_MERGE_MAIL = class(TForm)
    Memo1: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_MERGE_MAIL: TREPORT_MERGE_MAIL;

implementation

{$R *.DFM}

procedure TREPORT_MERGE_MAIL.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then begin
      key:=#0;
      close;
   end;
end;

end.
