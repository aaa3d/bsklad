unit ChangePassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,B_Utils,B_DButils,Data1;

type
  TCHANGE_PASSWORD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BtnSave: TButton;
    BtnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CHANGE_PASSWORD: TCHANGE_PASSWORD;

implementation

{$R *.DFM}

procedure TCHANGE_PASSWORD.FormShow(Sender: TObject);
begin
        Edit1.text:='1234567890';
        Edit2.text:='4645734456';
        Label2.caption:=USERFIO;
end;

procedure TCHANGE_PASSWORD.BtnSaveClick(Sender: TObject);
var
        r:double;
begin
     If Edit1.text<>Edit2.text then Messbox('¬веденные пароли не совпадают!',MessSystem,48)
     else if Edit1.text='' then Messbox('ѕароль не может быть пустой строкой!',MessSystem,48) else begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       IBSAVE_CLEAR;
       IBSAVE_ADD('KLN_PASSWORD',trim(ansiuppercase(Edit1.text)));
       try
          IF IBSAVE_DOC('KLN',USERID)<0 then r:=Sqrt(-1);
          Datamodule1.IBTransaction2.Commit;
          Datamodule1.IBTransaction2.Active:=False;
          close;
       Except
          Datamodule1.IBTransaction2.Rollback;
       End;
       Datamodule1.IBTransaction2.Active:=False;
     end;
end;

procedure TCHANGE_PASSWORD.BtnCloseClick(Sender: TObject);
begin
        close;
end;

procedure TCHANGE_PASSWORD.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if key=#27 then begin
                key:=#0;
                close;
        end;
end;

end.
