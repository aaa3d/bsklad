unit DateInterval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls;

type
  TDate_Interval = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    DT1: TDateEdit;
    DT2: TDateEdit;
    Label2: TLabel;
    BtnSet: TButton;
    BtnClose: TButton;
    Image3: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure BtnSetClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DT2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Date_Interval: TDate_Interval;

implementation

{$R *.DFM}

procedure TDate_Interval.BtnSetClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TDate_Interval.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TDate_Interval.FormShow(Sender: TObject);
begin
     Tag:=0;
end;

procedure TDate_Interval.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then BtnClose.click;
end;

procedure TDate_Interval.Button1Click(Sender: TObject);
begin
  DT2.date:=date()+(7-dayofWeek(date()))+1;
  DT1.date:=DT2.date-6;
  BtnSet.click;
end;

procedure TDate_Interval.Button2Click(Sender: TObject);
begin
  DT2.date:=date()+(7-dayofWeek(date()))-6;
  DT1.date:=DT2.date-6;
  BtnSet.click;
end;

procedure TDate_Interval.Button5Click(Sender: TObject);
begin
  DT2.date:=date()+(7-dayofWeek(date()))+1;
  DT1.date:=DT2.date-6-7;
  BtnSet.click;
end;

procedure TDate_Interval.Button3Click(Sender: TObject);
var
  dd,mm,yy:word;
begin
  decodedate(date(),yy,mm,dd);
  dt1.date:=encodedate(yy,mm,1);
  dt2.date:=incmonth(dt1.date,1)-1;
  BtnSet.click;
end;

procedure TDate_Interval.Button4Click(Sender: TObject);
var
  dd,mm,yy:word;
begin
  decodedate(date(),yy,mm,dd);
  dt1.date:=incmonth(encodedate(yy,mm,1),-1);
  dt2.date:=incmonth(dt1.date,1)-1;
  BtnSet.click;
end;

procedure TDate_Interval.Button6Click(Sender: TObject);
var
  dd,mm,yy:word;
begin
  decodedate(date(),yy,mm,dd);
  dt1.date:=incmonth(encodedate(yy,mm,1),-1);
  dt2.date:=incmonth(dt1.date,2)-1;
  BtnSet.click;
end;

procedure TDate_Interval.DT2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     BtnSet.SetFocus;
     BtnSet.click;
  end;
end;

end.
