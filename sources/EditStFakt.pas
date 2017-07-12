unit EditStFakt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ComCtrls, ToolWin, ActnList, StdCtrls, Buttons,
  Db, IBCustomDataSet, IBQuery, IBDatabase,waitForm;

type
  TEdit_STFAKT = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ActSave: TAction;
    ToolButton1: TToolButton;
    Label1: TLabel;
    STFAKT_DOW: TEdit;
    GroupBox1: TGroupBox;
    GP1: TRadioButton;
    GP2: TRadioButton;
    STFAKT_GP: TEdit;
    SpeedButton1: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork1: TIBQuery;
    procedure ActSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GP2Click(Sender: TObject);
    procedure SHOW_KLN;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_STFAKT: TEdit_STFAKT;

implementation

uses DicKlient;

{$R *.DFM}

procedure TEdit_STFAKT.ActSaveExecute(Sender: TObject);
begin
    // Сохранить
    tag:=2;
    close;
end;

procedure TEdit_STFAKT.FormShow(Sender: TObject);
begin
   tag:=0;
   GP2.OnClick(Sender);
   if GP2.Checked then SHOW_KLN;
end;

procedure TEdit_STFAKT.SpeedButton1Click(Sender: TObject);
begin
   // Выбор поставщика
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=STFAKT_GP.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>STFAKT_GP.tag then begin
        STFAKT_GP.tag:=DIC_KLIENT.tag;
        SHOW_KLN;
     end;
     DIC_KLIENT.Destroy;

end;

procedure TEdit_STFAKT.SHOW_KLN;
begin
  // Отображаем поставщика и его банк
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork1,'select KLN_FULL,KLN_REKW from KLN_DATA(:KLN_ID)');
  QueryWork1.ParamByname('KLN_ID').asinteger:=STFAKT_GP.tag;
  QueryWork1.Open;
  STFAKT_GP.text:=QueryWork1.fieldByname('KLN_FULL').asstring;
//  PN_POST_REKW.text:=QueryWork1.fieldByname('KLN_REKW').asstring;
  QueryWork1.Close;
end;

procedure TEdit_STFAKT.GP2Click(Sender: TObject);
begin
   SpeedButton1.Enabled:=GP2.checked;
end;

end.
