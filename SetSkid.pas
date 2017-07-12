unit SetSkid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit,b_dbutils;

type
  TSet_Skid = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MONEY1: TRxCalcEdit;
    MONEY2: TRxCalcEdit;
    BtnApply: TButton;
    Button2: TButton;
    SKID: TRxCalcEdit;
    Timer1: TTimer;
    Image1: TImage;
    Label4: TLabel;
    OSN: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure MONEY2Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MONEY2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_Skid: TSet_Skid;

implementation

{$R *.DFM}

procedure TSet_Skid.FormShow(Sender: TObject);
begin
     tag:=0;
     if MONEY1.value=0 then begin
        timer1.Enabled:=true;
        BtnApply.enabled:=false;
        Money2.enabled:=false;
     end;
end;

procedure TSet_Skid.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TSet_Skid.BtnApplyClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TSet_Skid.MONEY2Change(Sender: TObject);
begin
     if MONEY1.value=0 then begin
        SKID.value:=0;
        GLOBAL_SKID:=0;
     end else begin
        SKID.value:=(MONEY1.value-MONEY2.value)/(MONEY1.Value/100);
        GLOBAL_SKID:=(MONEY1.value-MONEY2.value)/(MONEY1.Value/100);
{        SKID.value:=-(Money2.value/GLOBAL_MON1-1)*100;
        GLOBAL_SKID:=-(Money2.value/GLOBAL_MON1-1)*100;}
     end;
end;

procedure TSet_Skid.Timer1Timer(Sender: TObject);
begin
   Try
     Money1.Visible:=not Money1.Visible;
   Except
   End;
end;

procedure TSet_Skid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     timer1.Enabled:=false;

end;

procedure TSet_Skid.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TSet_Skid.MONEY2KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
        key:=#9;
        BtnApply.click;
     end;
end;

end.
