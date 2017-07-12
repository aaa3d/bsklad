unit FormLock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, StdCtrls, Animate, GIFCtrl, ExtCtrls,
  VclUtils, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TFORM_LOCK = class(TForm)
    Bevel1: TBevel;
    RxGIFAnimator1: TRxGIFAnimator;
    Label1: TLabel;
    USER: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    PASSWORD: TEdit;
    Button1: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PASSWORDKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    password_valid: boolean;
  public
    { Public declarations }
  end;

var
  FORM_LOCK: TFORM_LOCK;

implementation

{$R *.DFM}

procedure TFORM_LOCK.Button1Click(Sender: TObject);
begin
     worktransaction.Active:=False;
     ADD_SQL(QueryWork,'select kln_password from kln where kln_id=:US_ID');
     QueryWork.Parambyname('US_ID').asinteger:=USERID;
     QueryWork.Open;
     if trim(ansiupperCase(Password.text))=trim(ansiupperCase(QueryWork.fieldByname('KLN_PASSWORD').asstring)) then begin
        QueryWork.Close;
        worktransaction.Active:=False;
        password_valid:=true;
        Close;
     end else begin
         Messbox('Пароль не верный!',MessSystem,16);
     end;

end;

procedure TFORM_LOCK.FormShow(Sender: TObject);
begin
     RxGifAnimator1.Animate:=True;
     USER.caption:=USERFIO_SHORT;
     Password.text:='fdgfdg5ferreh';
     password_valid:=false;
end;

procedure TFORM_LOCK.PASSWORDKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       key:=#0;
       Button1.click;
     end;
end;

procedure TFORM_LOCK.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caNone;
 if password_valid then Action:=caFree;
end;

end.
