unit ZpTitle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,b_utils,Data1,b_Dbutils;

type
  TZP_TITLE = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_TITLE: TZP_TITLE;

implementation

{$R *.DFM}

procedure TZP_TITLE.FormShow(Sender: TObject);
begin
   tag:=0;
   Edit1.text:='';
end;

procedure TZP_TITLE.Button1Click(Sender: TObject);
begin
   if trim(Edit1.text)='' then Messbox('Ќазвание не может быть пустой строкой!',MessSystem,48)
   else begin
      tag:=2;
      close;
   end;
end;

end.
