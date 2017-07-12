unit ZpRlUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls,Data1,
  b_utils,b_dbutils, RXSpin;

type
  TZP_RL_USER = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Memo1: TMemo;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Label1: TLabel;
    MES: TComboBox;
    ToolButton4: TToolButton;
    Label2: TLabel;
    YEAR: TRxSpinEdit;
    procedure MESChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure YEARChange(Sender: TObject);
    procedure refresh_rulez;
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_RL_USER: TZP_RL_USER;
  CanRefresh:boolean;

implementation

uses EditZpRulez;

{$R *.DFM}

procedure TZP_RL_USER.MESChange(Sender: TObject);
begin
  if MES.itemindex<0 then MES.itemindex:=0;
    refresh_rulez;
end;

procedure TZP_RL_USER.FormShow(Sender: TObject);
var
  yy,mm,dd:word;
begin
    // ¬ыставл€ем текущий мес€ц
    CanRefresh:=False;
    decodedate(date(),yy,mm,dd);
    mes.itemindex:=mm-1;
    year.value:=yy;
    CanRefresh:=True;
    refresh_rulez;
end;

procedure TZP_RL_USER.YEARChange(Sender: TObject);
begin
    refresh_rulez;
end;

procedure TZP_RL_USER.refresh_rulez;
begin
   // перезапросить правила
end;
procedure TZP_RL_USER.ToolButton1Click(Sender: TObject);
begin
    Application.createForm(TEDIT_ZP_RULEZ,EDIT_ZP_RULEZ);
    EDIT_ZP_RULEZ.showmodal;
    EDIT_ZP_RULEZ.destroy;
end;

end.
