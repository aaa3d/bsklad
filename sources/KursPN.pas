unit KursPN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Db, IBCustomDataSet, IBDatabase, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, ComCtrls, ExtCtrls, ToolWin,SetKurs,B_Utils,B_DButils, Menus;

type
  TKurs_PN = class(TForm)
    ToolBar1: TToolBar;
    BtnOpen: TToolButton;
    ToolButton2: TToolButton;
    BtnPropertis: TToolButton;
    BtnPrint: TToolButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    RxDBGrid1: TRxDBGrid;
    IbQrKursPN: TIBQuery;
    IbTrKursPN: TIBTransaction;
    DsQrKursMoney: TDataSource;
    IbQrKursPNKURS_KURS: TFloatField;
    IbQrKursPNKURS_DATE: TDateTimeField;
    IbQrKursPNPNTYP_ID: TIntegerField;
    IbQrKursPNPNTYP_SHORT: TIBStringField;
    IbQrKursPNPNTYP_FULL: TIBStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IbQrKursPNAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kurs_PN: TKurs_PN;

implementation

uses HistoryKursPN;

{$R *.DFM}

procedure TKurs_PN.FormShow(Sender: TObject);
begin
     IbTrKursPN.Active:=false;
     IbQrKursPN.close;
     IbQrKursPN.open;
end;

procedure TKurs_PN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IbQrKursPN.close;
end;

procedure TKurs_PN.IbQrKursPNAfterOpen(DataSet: TDataSet);
begin
     if IbQrKursPN.Eof then begin
        BtnOpen.Enabled:=False;
        BtnPrint.Enabled:=False;
     end else begin
       BtnOpen.Enabled:=True;
       BtnPrint.Enabled:=true;;
     end;
end;

procedure TKurs_PN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TKurs_PN.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TKurs_PN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.Enabled) then BtnOpen.click;
     if (key=#27) then close;
end;

procedure TKurs_PN.BtnOpenClick(Sender: TObject);
var
   TYP:integer;
begin
     application.createForm(TSET_KURS,SET_KURS);
     SET_KURS.OLD_KURS.value:=IbQrKURSPN.fieldByname('KURS_KURS').asfloat;
     SET_KURS.NEW_KURS.value:=IbQrKURSPN.fieldByname('KURS_KURS').asfloat;
     SET_KURS.Edit1.text:=IbQrKURSPN.fieldByname('PNTYP_FULL').asstring;
     SET_KURS.showModal;
     if SET_KURS.tag=2 then begin
        TYP:=IbQrKURSPN.fieldByname('PNTYP_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBSAVE_CLEAR;
        IBSAVE_ADD('KURS_KURS',SET_KURS.NEW_KURS.value);
        IBSAVE_ADD('KURS_TYP',IbQrKURSPN.fieldByname('PNTYP_ID').asinteger);
        IBSAVE_ADD('VALUTA_ID',1);
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_DOC('KURS',-1);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        IbQrKursPN.DisableControls;
        IbQrKursPN.close;
        IbTrKursPN.Active:=false;
        IbQrKursPN.open;
        IbQrKursPN.Locate('PNTYP_ID',TYP,[]);
        IbQrKursPN.EnableControls;;
     end;
     SET_KURS.Destroy;
end;

procedure TKurs_PN.BtnPropertisClick(Sender: TObject);
begin
     Application.createForm(THistory_Kurs_PN,History_Kurs_PN);
     History_Kurs_PN.PNTYP_FULL.text:=IbQrKursPN.fieldByname('PNTYP_FULL').asstring;
     History_Kurs_PN.tag:=IbQrKursPn.fieldByname('PNTYP_ID').asinteger;
     History_Kurs_PN.ShowModal;
     History_Kurs_PN.Destroy;
end;

procedure TKurs_PN.BtnPrintClick(Sender: TObject);
begin
     {}
end;

procedure TKurs_PN.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

end.
