unit KkmWait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,b_utils,b_dbutils,Unit_AMC100F;

type
  TKKM_WAIT = class(TForm)
    Label1: TLabel;
    CancelButton: TButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KKM_WAIT: TKKM_WAIT;

implementation

{$R *.DFM}

procedure TKKM_WAIT.CancelButtonClick(Sender: TObject);
begin
  StopFlag:=True;
  StopWaiting;
  Close;
end;

procedure TKKM_WAIT.FormActivate(Sender: TObject);
begin
  StopFlag:=False;
  CancelButton.SetFocus;
end;

procedure TKKM_WAIT.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  StopWaiting;
end;

procedure TKKM_WAIT.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#27 then exit;
  StopWaiting;
  Close;
end;

end.
