unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase, ExtCtrls;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    IBQuery2: TIBQuery;
    btn4: TButton;
    tmr1: TTimer;
    IBTransaction2: TIBTransaction;
    edt1: TEdit;
    btn3: TButton;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n: longint;
  prev_cnt: longint;
  full_cnt: longint;
  stop: Boolean;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  IBDatabase1.Connected:=true;
end;

procedure TForm1.btn2Click(Sender: TObject);

begin
     IBQuery1.SQL.Text:='select rns_id from slim_base_list_rns_for_delete';

     ibquery1.Open;

     n:=0;

     stop:=false;
     while not ibquery1.Eof  and not stop do
     begin

        inc(n);

        edt1.Text:=inttostr(IBQuery1.fieldbyname('rns_id').AsInteger);

        ibquery2.SQL.Text:='execute procedure SLIM_BASE_REMOVE_RNS(:rns_id)';
        ibquery2.ParamByName('rns_id').AsInteger:=IBQuery1.fieldbyname('rns_id').AsInteger;
        IBQuery2.ExecSQL;
        IBQuery2.Transaction.Commit;

        Application.ProcessMessages;
       ibquery1.Next;
     end;

     ibquery1.Close;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin

   if (n <> prev_cnt) then
   begin
     lbl1.Caption:=    IntToStr( round(  (n / full_cnt)*100))+'%, ' + inttostr(n - prev_cnt)+' в секунду, '+ IntToStr( round(((full_cnt-n) / (n-prev_cnt))/60 ) )+' минут';
   end;

   prev_cnt:=n;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
full_cnt:= 3744000;

full_cnt:= 928600;
full_cnt:= 816304;

full_cnt:= 478198;
full_cnt:= 1978073;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  stop:=true;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
     IBQuery1.SQL.Text:='select rns_id from slim_base_list_rns_for_delete_p';

     ibquery1.Open;

     n:=0;

     stop:=false;
     while not ibquery1.Eof  and not stop do
     begin

        inc(n);

        edt1.Text:=inttostr(IBQuery1.fieldbyname('rns_id').AsInteger);

        ibquery2.SQL.Text:='execute procedure SLIM_BASE_REMOVE_RNS_PART_RE(:rns_id)';
        ibquery2.ParamByName('rns_id').AsInteger:=IBQuery1.fieldbyname('rns_id').AsInteger;
        IBQuery2.ExecSQL;
        IBQuery2.Transaction.Commit;

        Application.ProcessMessages;
       ibquery1.Next;
     end;

     ibquery1.Close;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  IBDatabase1.DatabaseName:='192.168.0.9:bsklad2009-test';
  IBDatabase1.Connected:=true;
end;

end.
