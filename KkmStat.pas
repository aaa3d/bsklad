unit KkmStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TKKM_STAT = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KKM_STAT: TKKM_STAT;

implementation

{$R *.DFM}

procedure TKKM_STAT.Button1Click(Sender: TObject);
begin
   close;
end;

end.
