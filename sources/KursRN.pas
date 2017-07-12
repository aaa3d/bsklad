unit KursRN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Db, IBCustomDataSet, IBDatabase, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, ComCtrls, ExtCtrls, ToolWin,SetKurs,B_Utils,B_DButils, Menus;

type
  TKurs_RN = class(TForm)
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
    IbQrKursRN: TIBQuery;
    IbTrKursRN: TIBTransaction;
    DsQrKursMoney: TDataSource;
    IbQrKursRNRNTYP_ID: TIntegerField;
    IbQrKursRNKURS_KURS: TFloatField;
    IbQrKursRNKURS_DATE: TDateTimeField;
    IbQrKursRNRNTYP_SHORT: TIBStringField;
    IbQrKursRNRNTYP_FULL: TIBStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IbQrKursRNAfterOpen(DataSet: TDataSet);
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
  Kurs_RN: TKurs_RN;

implementation

uses HistoryKursRN;

{$R *.DFM}

procedure TKurs_RN.FormShow(Sender: TObject);
begin
     IbTrKursRN.Active:=false;
     IbQrKursRN.close;
     IbQrKursRN.open;
end;

procedure TKurs_RN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IbQrKursRN.close;
end;

procedure TKurs_RN.IbQrKursRNAfterOpen(DataSet: TDataSet);
begin
     if IbQrKursRN.Eof then begin
        BtnOpen.Enabled:=False;
        BtnPrint.Enabled:=False;
     end else begin
       BtnOpen.Enabled:=True;
       BtnPrint.Enabled:=true;;
     end;
end;

procedure TKurs_RN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TKurs_RN.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TKurs_RN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.Enabled) then BtnOpen.click;
     if (key=#27) then close;
end;

procedure TKurs_RN.BtnOpenClick(Sender: TObject);
var
   TYP:integer;
begin
     application.createForm(TSET_KURS,SET_KURS);
     SET_KURS.OLD_KURS.value:=IbQrKURSRN.fieldByname('KURS_KURS').asfloat;
     SET_KURS.NEW_KURS.value:=IbQrKURSRN.fieldByname('KURS_KURS').asfloat;
     SET_KURS.Edit1.text:=IbQrKURSRN.fieldByname('RNTYP_FULL').asstring;
     SET_KURS.showModal;
     if SET_KURS.tag=2 then begin
        TYP:=IbQrKURSRN.fieldByname('RNTYP_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBSAVE_CLEAR;
        IBSAVE_ADD('KURS_KURS',SET_KURS.NEW_KURS.value);
        IBSAVE_ADD('KURS_TYP',-IbQrKURSRN.fieldByname('RNTYP_ID').asinteger);
        IBSAVE_ADD('VALUTA_ID',1);
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_DOC('KURS',-1);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        IbQrKursRN.DisableControls;
        IbQrKursRn.close;
        IbTrKursRn.Active:=false;
        IbQrKursRn.open;
        IbQrKursRn.Locate('RNTYP_ID',TYP,[]);
        IbQrKursRn.EnableControls;;
     end;
     SET_KURS.Destroy;
end;

procedure TKurs_RN.BtnPropertisClick(Sender: TObject);
begin
     Application.createForm(THistory_Kurs_RN,History_Kurs_RN);
     History_Kurs_RN.RNTYP_FULL.text:=IbQrKursRN.fieldByname('RNTYP_FULL').asstring;
     History_Kurs_RN.tag:=-IbQrKursRn.fieldByname('RNTYP_ID').asinteger;
     History_Kurs_RN.ShowModal;
     History_Kurs_RN.Destroy;
end;

procedure TKurs_RN.BtnPrintClick(Sender: TObject);
begin
     {}
end;

procedure TKurs_RN.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

end.
