{******************************************}
{ }
{ FastReport v3.0 }
{ About window }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxAbout;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfrxAboutForm = class(TForm)
    Button1:TButton;
    Label2:TLabel;
    Label3:TLabel;
    Image1:TImage;
    Bevel2:TBevel;
    Label5:TLabel;
    Shape1:TShape;
    Label1:TLabel;
    Label4:TLabel;
    Label6:TLabel;
    Label7:TLabel;
    Label8:TLabel;
    Label9:TLabel;
    Label10:TLabel;
    procedure FormCreate(Sender:TObject);
    procedure LabelClick(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses frxUtils, frxRes, ShellApi;

{$R *.DFM}

procedure TfrxAboutForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

procedure TfrxAboutForm.LabelClick(Sender:TObject);
begin
  case TLabel(Sender).Tag of
    1:ShellExecute(GetDesktopWindow, 'open',
      PChar(TLabel(Sender).Caption), nil, nil, sw_ShowNormal);
    2:ShellExecute(GetDesktopWindow, 'open',
      PChar('mailto:'+TLabel(Sender).Caption), nil, nil, sw_ShowNormal);
  end;
end;

end.
