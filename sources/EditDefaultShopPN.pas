unit EditDefaultShopPN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, StdCtrls, ToolWin, ComCtrls, Menus, Buttons, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_DEFAULT_SHOPPN = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TYP: TEdit;
    FRM: TEdit;
    KLN: TEdit;
    Btn_FRM: TSpeedButton;
    BTN_KLN: TSpeedButton;
    BTN_SAVE: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure Btn_FRMClick(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
    procedure BTN_SAVEClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure Change_FRMKln(ID,N:integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  EDIT_DEFAULT_SHOPPN: TEDIT_DEFAULT_SHOPPN;
  SAVE:boolean;

implementation

uses DicKlient;

{$R *.DFM}

procedure TEDIT_DEFAULT_SHOPPN.Btn_FRMClick(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=FRM.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>FRM.tag then begin
        FRM.tag:=DIC_KLIENT.tag;
        Change_FrmKln(FRM.tag,2);
        SAVE:=False;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TEDIT_DEFAULT_SHOPPN.BTN_KLNClick(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN.tag then begin
        KLN.tag:=DIC_KLIENT.tag;
        Change_FrmKln(KLN.tag,1);
        SAVE:=False;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TEDIT_DEFAULT_SHOPPN.BTN_SAVEClick(Sender: TObject);
begin
     tag:=2;
     SAVE:=true;
     close;
end;

procedure TEDIT_DEFAULT_SHOPPN.FormShow(Sender: TObject);
begin
     tag:=0;
     Change_FrmKln(KLN.tag,1);
     Change_FrmKln(FRM.tag,2);
     SAVE:=true;
end;


procedure TEDIT_DEFAULT_SHOPPN.Change_FrmKln(ID,N:integer);
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     WorkTransaction.Active:=False;
     QueryWork.Close;
     QueryWork.SQL.clear;
     QueryWork.SQL.add('select KLN_FULL FROM KLN_DATA(:KLN_ID)');
     QueryWork.Parambyname('KLN_ID').asinteger:=ID;
     QueryWork.Open;
     if N=1 then begin
        KLN.text:=QueryWork.fieldByname('KLN_FULL').asstring;
     end else begin
        FRM.text:=QueryWork.fieldByname('KLN_FULL').asstring;
     end;
     QueryWork.Close;
     WorkTransaction.Active:=False;
end;

procedure TEDIT_DEFAULT_SHOPPN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TEDIT_DEFAULT_SHOPPN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) then begin
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TEDIT_DEFAULT_SHOPPN.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

end.