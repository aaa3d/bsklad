unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AdvPicture, FR_Class, StdCtrls, frAdvPicture, FR_Desgn, NdbBase, NdbAsa,
  FR_DCtrl, FR_ASADB;

type
  Ttest1Form1 = class(TForm)
    frReport1: TfrReport;
    frDesigner1: TfrDesigner;
    frAdvPictureObject1: TfrAdvPictureObject;
    Button1: TButton;
    Button2: TButton;
    MainAsaSession: TAsaSession;
    frASAComponents1: TfrASAComponents;
    frDialogControls1: TfrDialogControls;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  test1Form1: Ttest1Form1;

implementation

{$R *.DFM}

procedure Ttest1Form1.Button1Click(Sender: TObject);
begin
 frReport1.DesignReport;
end;

procedure Ttest1Form1.Button2Click(Sender: TObject);
begin
 frReport1.LoadFromFile('D:\WORK.PAS\FastReport\ADVPICT\DEMO\FullForm.frf');
 frReport1.ShowReport;
end;

procedure Ttest1Form1.frReport1BeforePrint(Memo: TStringList; View: TfrView);
begin

 if View.Name = 'AdvPicture1' then
    TfrAdvPictureView(View).FIPicture.LoadFromFile('d:\work.pas\DneproMain\bmp\foto.jpg');

end;

end.
