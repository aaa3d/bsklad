unit mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBDatabase, ExtCtrls, RXClock, Grids,
  IBCustomDataSet, IBQuery, DBGrids, OleCtrls, WMPLib_TLB, MPlayer, SHDocVw;

type
  TMAIN_FORM = class(TForm)
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    db_connect_timer: TTimer;
    timer_refresh: TTimer;
    Button2: TButton;
    Label1: TLabel;
    label_clock: TLabel;
    timer_1_sec: TTimer;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    WebBrowser1: TWebBrowser;
    IBQuery2: TIBQuery;
    IBQuery2INFORMER_DATA_ID: TIntegerField;
    IBQuery2DOC_TEXT: TIBStringField;
    IBQuery2TM0: TDateTimeField;
    IBQuery2TM1: TDateTimeField;
    IBQuery2TM2: TDateTimeField;
    IBQuery2US_FIO0: TIBStringField;
    IBQuery2US_FIO1: TIBStringField;
    IBQuery2US_FIO2: TIBStringField;
    IBQuery2DOC_STATUS: TIntegerField;
    IBQuery2DOC_STATUS_DESC: TIBStringField;
    IBQuery2SKL_SHORT: TIBStringField;
    IBQuery2DOC_ID: TIntegerField;
    IBQuery2SHOP_COLOR: TIntegerField;
    IBQuery2STATUS_COLOR: TIntegerField;
    IBQuery2STATUS_TM: TDateTimeField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure db_connect_timerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure timer_1_secTimer(Sender: TObject);
    procedure timer_refreshTimer(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIN_FORM: TMAIN_FORM;

implementation

{$R *.dfm}

procedure TMAIN_FORM.Button1Click(Sender: TObject);
begin
close;
end;

procedure TMAIN_FORM.FormCreate(Sender: TObject);
begin
  self.Color:=clWhite;

//  label3.Font.Color:=16744512;
  label4.Font.Color:=123456;

  stringGrid1.Color:=clblack;
  StringGrid1.Font.Color:=clWhite;

  StringGrid1.Top:=20;
  StringGrid1.Height:=Screen.Height;


  WebBrowser1.Top:=40;

  WebBrowser1.Height:=Screen.Height;


  label_clock.caption:=formatdatetime('dd/mm/yyyy hh:nn', now);



  label_clock.Left:=Screen.Width  - label_clock.Width - 10;


  StringGrid1.Cells[0, 0]:='Накладная';
  StringGrid1.Cells[1, 0]:='Время';
  StringGrid1.Cells[2, 0]:='Статус';

  StringGrid1.ColWidths[0]:=300;
  StringGrid1.ColWidths[1]:=100;
  StringGrid1.ColWidths[2]:=200;


  panel1.Left:=StringGrid1.Left + StringGrid1.Width + 10;
  panel1.width:=Screen.Width - StringGrid1.Left - StringGrid1.Width - 10;
  panel1.Top:=50;
  panel1.Height:=Screen.Height - 100;

  StringGrid1.Visible:=false;


  WindowsMediaPlayer1.uiMode:='none';
//  panel1.Height:=900;

//  panel1.ClientHeight:=800;

//  WindowsMediaPlayer1.width:=Screen.Width - StringGrid1.Width -20;



  


end;

procedure TMAIN_FORM.db_connect_timerTimer(Sender: TObject);
begin
  try
    ibdatabase1.Connected:=true;

  except
    label1.Caption:='ОШИБКА СОЕДИНЕНИЯ С БАЗОЙ ДАННЫХ';
    label1.font.Color:=clRed;
  end;
end;

procedure TMAIN_FORM.Button2Click(Sender: TObject);
begin
  db_connect_timer.OnTimer(nil);
  timer_refresh.OnTimer(nil);

  WindowsMediaPlayer1.URL:='c:\mpg-01.mpg';
  WindowsMediaPlayer1.stretchToFit:=true;
end;

procedure TMAIN_FORM.timer_1_secTimer(Sender: TObject);

begin


  label_clock.caption:=formatdatetime('dd/mm/yyyy hh:nn', now);
end;

procedure TMAIN_FORM.timer_refreshTimer(Sender: TObject);
var row: integer;
shop_id: integer;
font_name: string;
font_size: integer;
web_browser_width: integer;
font_color: String;
BG_color: String;


html_body: string;
html_file: textfile;
status_color: integer;





begin
  ibquery1.SQL.Text:='SELECT SHOP_ID FROM MAIN';
  ibquery1.Open;
  shop_id:=ibquery1.fieldByName('SHOP_ID').asInteger;
  ibquery1.Close;




   ibquery1.SQL.Text:='SELECT first 1 * FROM CFG where CFG_NAME = ''INFORMER_SETTINGS'' and CFG_SET1=:shop_id';
   ibquery1.ParamByName('SHOP_ID').asInteger:=shop_id;
   ibquery1.Open;

   font_size:=ibquery1.FieldByName('CFG_SET2').AsInteger;
   web_browser_width:=ibquery1.FieldByName('CFG_SET3').AsInteger;
   font_name:=ibquery1.FieldByName('CFG_VALUE').AsString;
   ibquery1.Close;


//  ibquery1.SQL.Text:='';



    ibquery2.Close;

  ibquery2.ParamByName('dt1').asDateTime:= now-8/24 ;
  ibquery2.ParamByName('dt2').asDateTime:=now+1/24;
  ibquery2.ParamByName('SHOP_ID').asInteger:=SHOP_ID;
  ibquery2.Open;
  row:=1;

  assignfile(html_file, 'c:\informer_page.html');
  rewrite(html_file);
  writeln(html_file, '<head>');
  writeln(html_file, '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
  writeln(html_file, '<STYLE TYPE="text/css">');
  writeln(html_file, 'TD{font-family: '+font_name+'; font-size: '+inttostr(font_size)+'pt;}');
  writeln(html_file, '</STYLE>');
  writeln(html_file, '</head>');

  writeln(html_file, '<TABLE BORDER=1> ');
//  writeln(html_file, '<TR><TD>Накладная</TD><TD>Время</TD></TR>');



  while not ibquery2.Eof do
  begin

  StringGrid1.Cells[0,row]:=ibquery2.fieldByName('DOC_TEXT').asString;
  StringGrid1.Cells[1,row]:= formatdatetime('hh:mm', ibquery2.fieldByName('STATUS_TM').asDateTime);

  StringGrid1.Cells[2,row]:=ibquery2.fieldByName('DOC_STATUS_DESC').asString;

  status_color:=ibquery2.fieldByName('STATUS_COLOR').asInteger;


  inc(row);


  writeln(html_file, '<TR><TD>');
  writeln(html_file, '<font color="#'+inttohex(status_color, 6)+'">');
  writeln(html_file,ibquery2.fieldByName('DOC_TEXT').asString);
  writeln(html_file, '</TD><TD>');
  writeln(html_file,formatdatetime('hh:mm', ibquery2.fieldByName('TM0').asDateTime));
  //writeln(html_file, '</TD><TD>');


//  writeln(html_file,ibquery2.fieldByName('DOC_STATUS_DESC').asString);
    writeln(html_file, '</font');
  writeln(html_file, '</TD></TR>');



  ibquery2.Next;
  end;

  ibquery2.Close;

  writeln(html_file, '</TABLE>');
  closefile(html_file);


  WebBrowser1.Width:=web_browser_width;

//  WebBrowser1.Navigate('c:\informer_page.html');
WebBrowser1.Navigate('c:\bsklad\bsklad2009\informer\html\index.html');










end;

procedure TMAIN_FORM.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
{
  if StringGrid1. then


  with Sender as TStringGrid, Canvas do

  begin
  if State in[ gdFixed] then
    Exit;
      FillRect(Rect);
      Brush.Color := clblue;
//   SetBkMode(Handle, TRANSPARENT);

   TextOut(Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);


  end;
  }


  with (sender as TStringGrid) do
  begin
//    if not (gdSelected in state) then
    begin

//    SetBkMode(Handle, TRANSPARENT);

        Canvas.Font:=Font;




        if arow=0 then  //отрисовка заголовка
        begin
          canvas.Brush.Color := $202020;
          canvas.Font.Color:=clBlue;
//          Canvas.Font.Size:=12;
        end
        else
        begin
          canvas.Brush.Color := clblack;
          canvas.Font.Color:=clWhite;
        end;

        Canvas.FillRect(Rect);

        canvas.Rectangle(rect);



//      Canvas.Brush.Color:=clwhite;



      DrawText(canvas.Handle, PChar(Cells[ACol, ARow]), -1, Rect,
      DT_NOPREFIX or DT_CENTER	);
    end;
//          canvas.Font.Color:=clWhite;

  end;

  
end;

end.
