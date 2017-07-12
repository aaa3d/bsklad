unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, OutLookTools, StdCtrls, Menus, Buttons;

type
  TForm1 = class(TForm)
    OutlookConnect1: TOutlookConnect;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    ShowContact: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure ShowContactClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure Fill;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Fill;
var
  Counter,Counter2:Word;
  MyContact:Variant;
begin
  StringGrid1.RowCount:=OutlookConnect1.ContactCount+1;
  for Counter:=1 to OutlookConnect1.ContactCount do
  begin
    MyContact:=OutLookConnect1.Contact(Counter);
    with StringGrid1 do
    begin
      Cells[0,Counter]:=IntToStr(Counter);
      Cells[1,Counter]:=MyContact.FirstName;
      Cells[2,Counter]:=MyContact.LastName;
      Cells[3,Counter]:=MyContact.FullName;
      Cells[4,Counter]:=MyContact.MobileTelephonenumber;
    end;
    Application.ProcessMessages;
  end;
  Label1.Caption:=IntToStr(OutlookConnect1.ContactCount)+' Kontakte gefunden';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with StringGrid1 do
  begin
    Cells[0,0]:='Index';
    Cells[1,0]:='FirstName';
    Cells[2,0]:='LastName';
    Cells[3,0]:='FullName';
    Cells[4,0]:='MobileTelephonenumber';
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Fill;
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
  ShowContactClick(Self);
end;

procedure TForm1.ShowContactClick(Sender: TObject);
begin
  OutlookConnect1.ShowContact(StringGrid1.Row);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  OutlookConnect1.ShowCalendar;
end;

end.
