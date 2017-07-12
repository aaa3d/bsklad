{******************************************}
{ }
{ FastReport v3.0 }
{ Password form }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxPassw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxPasswordForm = class(TForm)
    OkB:TButton;
    CancelB:TButton;
    PasswordE:TEdit;
    PasswordL:TLabel;
    procedure FormCreate(Sender:TObject);
  private
  public
  end;

implementation
                      
{$R *.dfm}

uses frxRes;

procedure TfrxPasswordForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
