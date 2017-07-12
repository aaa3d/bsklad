unit KursMoney;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Db, IBCustomDataSet, IBDatabase, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, ComCtrls, ExtCtrls, ToolWin, Menus,SetKurs,B_utils,B_DButils;

type
  TKurs_Money = class(TForm)
    ToolBar1: TToolBar;
    BtnOpen: TToolButton;
    ToolButton2: TToolButton;
    BtnHistory: TToolButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    RxDBGrid1: TRxDBGrid;
    IbQrKursMoney: TIBQuery;
    IbTrKursMoney: TIBTransaction;
    IbQrKursMoneyVALUTA_ID: TIntegerField;
    IbQrKursMoneyKURS_KURS: TFloatField;
    IbQrKursMoneyKURS_DATE: TDateTimeField;
    IbQrKursMoneyVALUTA_FULL: TIBStringField;
    DsQrKursMoney: TDataSource;
    PopupMenu1: TPopupMenu;
    MnOpen: TMenuItem;
    MnHistory: TMenuItem;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Button1: TButton;
    ToolButton5: TToolButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IbQrKursMoneyAfterOpen(DataSet: TDataSet);
    procedure IbQrKursMoneyAfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kurs_Money: TKurs_Money;

implementation

uses HistoryKursMoney, MakeRemon, MakeRemonTwMon;

{$R *.DFM}

procedure TKurs_Money.FormShow(Sender: TObject);
begin
     IbTrKursMoney.Active:=false;
     IbQrKursMoney.close;
     IbQrKursMoney.open;
end;

procedure TKurs_Money.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IbQrKursMoney.close;
end;

procedure TKurs_Money.IbQrKursMoneyAfterOpen(DataSet: TDataSet);
begin
     if IbQrKursMoney.Eof then begin
        BtnOpen.Enabled:=False;
     end else begin
       if IbQrKursMoney.fieldbyname('valuta_id').asinteger=0
       then BtnOpen.enabled:=false else BtnOpen.enabled:=true;
     end;
     BtnHistory.enabled:=BtnOpen.Enabled;
end;

procedure TKurs_Money.IbQrKursMoneyAfterScroll(DataSet: TDataSet);
begin
       if IbQrKursMoney.fieldbyname('valuta_id').asinteger=0
       then BtnOpen.enabled:=false else BtnOpen.enabled:=true;
       BtnHistory.enabled:=BtnOpen.Enabled;
end;

procedure TKurs_Money.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TKurs_Money.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TKurs_Money.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.Enabled) then BtnOpen.click;
end;

procedure TKurs_Money.BtnOpenClick(Sender: TObject);
var
   ID:integer;
   r:double;
begin
     application.createForm(TSET_KURS,SET_KURS);
     SET_KURS.OLD_KURS.value:=IbQrKursMoney.fieldByname('KURS_KURS').asfloat;
     SET_KURS.NEW_KURS.value:=IbQrKursMoney.fieldByname('KURS_KURS').asfloat;
     SET_KURS.Edit1.text:='Курс ценообразования валюты "'+IbQrKursMoney.fieldByname('VALUTA_FULL').asstring+'"';
     SET_KURS.showModal;
     if SET_KURS.tag=2 then begin
        ID:=IbQrKursMoney.fieldByname('VALUTA_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        try
          IBSAVE_CLEAR;
          IBSAVE_ADD('KURS_KURS',SET_KURS.NEW_KURS.value);
          IBSAVE_ADD('KURS_TYP',0);
          IBSAVE_ADD('VALUTA_ID',IbQrKursMoney.fieldByname('VALUTA_ID').asinteger);
          IBSAVE_ADD('US_ID',USERID);
          if IBSAVE_DOC('KURS',-1)<0 then r:=Sqrt(-1);
          if Messbox('Установить курсы приходных накладных на новый курс ценообразования?',MessSubmit,4+48)=6 then begin
           Datamodule1.IbSaveUSWORK.Close;
           Datamodule1.IbSaveUSWORK.SQL.clear;
           Datamodule1.IbSaveUSWORK.SQL.add('INsert into kurs (kurs_kurs,kurs_typ,valuta_id,us_id) '+
           ' select :kurs_kurs,pntyp.pntyp_id,:valuta_id,:us_id from pntyp ');
           Datamodule1.IbSaveUSWORK.ParamByname('KURS_KURS').asfloat:=SET_KURS.NEW_KURS.value;
           Datamodule1.IbSaveUSWORK.ParamByname('VALUTA_ID').asinteger:=IbQrKursMoney.fieldByname('VALUTA_ID').asinteger;
           Datamodule1.IbSaveUSWORK.ParamByname('US_ID').asinteger:=USERID;
           Datamodule1.IbSaveUSWORK.ExecSql;
          end;
          Datamodule1.IBTransaction2.Commit;
        except
          Datamodule1.IBTransaction2.Rollback;
          Messbox('Ошибка при сохранении данных курс ценообразования!',MessError,16);
        end;
        Datamodule1.IBTransaction2.Active:=False;
        IbQrKursMoney.DisableControls;
        IbQrKursMoney.close;
        IbTrKursMoney.Active:=false;
        IbQrKursMoney.open;
        IbQrKursMoney.Locate('VALUTA_ID',ID,[]);
        IbQrKursMoney.EnableControls;;
     end;
     SET_KURS.Destroy;
     RxDbgrid1.setfocus;
end;

procedure TKurs_Money.BtnHistoryClick(Sender: TObject);
begin
     Application.createForm(THistory_KursMoney,History_KursMoney);
     History_KursMoney.VALUTA_FULL.text:=IbQrKursMoney.fieldByname('VALUTA_FULL').asstring;
     History_KursMoney.tag:=IbQrKursMoney.fieldByname('VALUTA_ID').asinteger;
     History_KursMoney.ShowModal;
     History_KursMoney.Destroy;
end;

procedure TKurs_Money.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TKurs_Money.Button1Click(Sender: TObject);
begin
   Application.createForm(TMAKE_REMON,MAKE_REMON);
   MAKE_REMON.showModal;
   MAKE_REMON.Destroy;
end;

procedure TKurs_Money.Button2Click(Sender: TObject);
begin
   Application.createForm(TMAKE_REMON_TWMON,MAKE_REMON_TWMON);
   MAKE_REMON_TWMON.showModal;
   MAKE_REMON_TWMON.Destroy;
end;

end.
