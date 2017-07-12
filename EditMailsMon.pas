unit EditMailsMon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, ToolWin, ComCtrls, Menus, StdCtrls, Mask,
  ToolEdit, CurrEdit;

type
  TEdit_Mails_mon = class(TForm)
    ToolBar1: TToolBar;
    BtnSAVE: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ROZN1: TRxCalcEdit;
    ROZN2: TRxCalcEdit;
    MON1: TRxCalcEdit;
    MON2: TRxCalcEdit;
    PERCENT: TRxCalcEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label6: TLabel;
    TW_KOL: TRxCalcEdit;
    Label7: TLabel;
    TW_PRIM: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnSAVEClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure MON1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Mails_mon: TEdit_Mails_mon;

implementation

{$R *.DFM}

procedure TEdit_Mails_mon.FormShow(Sender: TObject);
begin
     tag:=0;
     
end;

procedure TEdit_Mails_mon.BtnSAVEClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TEdit_Mails_mon.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

procedure TEdit_Mails_mon.MON1Change(Sender: TObject);
begin
     MON2.value:=MON1.value*TMP_COEFF;
     if ROZN1.value=0 then Percent.value:=100
     else Percent.value:=(ROZN1.value-MON1.value)/(ROZN1.value);
end;

end.
