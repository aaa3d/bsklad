unit DefaultJournal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  B_Utils,B_DButils,Data1, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TDefault_Journal = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    BtnCopy: TToolButton;
    ToolButton5: TToolButton;
    BtnProw: TToolButton;
    BtnUnProw: TToolButton;
    ToolButton8: TToolButton;
    BtnPrint: TToolButton;
    BtnPropertis: TToolButton;
    BtnFind: TToolButton;
    BtnAnaliz: TToolButton;
    ToolButton14: TToolButton;
    Panel1: TPanel;
    StatusBar2: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    BtnSubDoc: TToolButton;
    ToolButton16: TToolButton;
    BtnAdm: TToolButton;
    BtnInterval: TToolButton;
    ToolButton2: TToolButton;
    Image1: TImage;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    btnOpenSale: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Default_Journal: TDefault_Journal;

implementation

uses Mainform;

{$R *.DFM}

procedure TDefault_Journal.FormShow(Sender: TObject);
begin
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-28;
end;

procedure TDefault_Journal.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

end.
