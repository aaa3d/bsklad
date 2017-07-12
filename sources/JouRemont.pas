unit JouRemont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DButils,B_Utils, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls,
  ToolWin;

type
  TJOU_REMONT = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    Panel1: TPanel;
    StatusBar2: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JOU_REMONT: TJOU_REMONT;

implementation

uses Mainform, EditRemont;

{$R *.DFM}

procedure TJOU_REMONT.FormShow(Sender: TObject);
begin
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
end;

procedure TJOU_REMONT.ToolButton1Click(Sender: TObject);
begin
     Application.CreateForm(TEdit_remont,Edit_remont);
     Edit_Remont.showModal;
     Edit_Remont.destroy;
end;

procedure TJOU_REMONT.ToolButton10Click(Sender: TObject);
begin
     My_lock;
end;

end.
