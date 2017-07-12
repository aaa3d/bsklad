unit EditZpRulez;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, ExtCtrls, RXSpin, Mask, ToolEdit, CurrEdit,
  RxLookup,Data1,b_utils,b_dbutils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Buttons, DualList, Grids, DBGrids, RXDBCtrl, ActnList;

type
  TEdit_Zp_Rulez = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    procedure ActNewPocketExecute(Sender: TObject);
    procedure ActOpenPocketExecute(Sender: TObject);
    procedure ActDelPocketExecute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Zp_Rulez: TEdit_Zp_Rulez;

implementation

uses ZpPlusVid;

{$R *.DFM}

procedure TEdit_Zp_Rulez.ActNewPocketExecute(Sender: TObject);
begin
   // Новый набор правил
end;

procedure TEdit_Zp_Rulez.ActOpenPocketExecute(Sender: TObject);
begin
   // Изменяем набор правил
end;

procedure TEdit_Zp_Rulez.ActDelPocketExecute(Sender: TObject);
begin
   // Удаляем набор правил
end;

procedure TEdit_Zp_Rulez.ToolButton1Click(Sender: TObject);
begin
   Application.createForm(TZP_PLUS_VID,ZP_PLUS_VID);
   ZP_PLUS_VID.showModal;
   if ZP_PLUS_VID.tag>0 then begin
   end;
   ZP_PLUS_VID.Destroy;
end;

end.
