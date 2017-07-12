unit SetPeriod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit,Data1, Db, IBCustomDataSet, IBQuery, IBDatabase,
  mainform,b_utils,vclUtils, ComCtrls;
  
type
  TSet_Period = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    DateEdit1: TDateEdit;
    MaskEdit1: TMaskEdit;
    DateEdit2: TDateEdit;
    MaskEdit2: TMaskEdit;
    Button2: TButton;
    Button3: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    CheckCustom: TCheckBox;
    CheckSyncDate: TCheckBox;
    Edit2: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_Period: TSet_Period;

implementation

{$R *.DFM}

procedure TSet_Period.Button3Click(Sender: TObject);
begin
    close;
end;

procedure TSet_Period.Button2Click(Sender: TObject);
var
  yy,mm,dd,h,m,s,msek:word;
  tm1,tm2:tdatetime;
begin
    // ����������� ��������� ����� � ���� � ���������� �������� � DateEdit1 � 2
    mainform.CustomTable := checkCustom.Checked;
    mainform.CustomTableName := Edit2.Text;
    SaveSyncDate := CheckSyncDate.Checked;
    try
       decodedate(Dateedit1.date,yy,mm,dd);
       h:=strtoint(copy(Maskedit1.text,1,2));
       m:=strtoint(copy(Maskedit1.text,4,2));
       s:=strtoint(copy(Maskedit1.text,7,2));
       Msek:=strtoint(copy(Maskedit1.text,10,3));
       tm1:=encodedate(yy,mm,dd)+encodetime(h,m,s,msek);

       decodedate(Dateedit2.date,yy,mm,dd);
       h:=strtoint(copy(Maskedit2.text,1,2));
       m:=strtoint(copy(Maskedit2.text,4,2));
       s:=strtoint(copy(Maskedit2.text,7,2));
       Msek:=strtoint(copy(Maskedit2.text,10,3));
       tm2:=encodedate(yy,mm,dd)+encodetime(h,m,s,msek);

       MainPeriod1:=tm1;
       MainPeriod2:=tm2;
       tag:=2;
       close;
    except
       Messbox('��������� �������� ������� ��������!',MessError,16);
    end;
end;

procedure TSet_Period.FormShow(Sender: TObject);
var
  tm:tdatetime;
  tm_now:Tdatetime;
  ts:ttimestamp;
begin
   tag:=0;
   // ������ ������ ��������� �����
   try
      DataModule1.IBDatabase1.Connected:=False;
   except
   end;
   try
      IDCFG:=-1;
      DataModule1.IBDatabase1.DatabaseName:=DataBase_path;
      main_form.Memo1.lines.add('����������� � ����...');
      delay(10);
      DataModule1.IBDatabase1.Connected:=True;
      main_form.Memo1.lines.add('����������� � ���� ���������...');
      Worktransaction.Active:=False;
      Add_sql(QueryWork,'select * from cfg where cfg_name="RPLEMAIL_LAST_TIME_SEND" and CFG_SET1=:CFG_SET1');
      QueryWork.ParamByname('CFG_SET1').asinteger:=CODE_SHOP;
      QueryWork.Open;
      if QueryWork.eof then begin
         main_form.Memo1.lines.add('������ ������ ��������� ����������!');
         // ������ ������ - ��������� ����� �� 1 ��� �����
         tm:=my_now()-(1/24);
         ts:=DateTimeToTimeStamp(tm);
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         try
           ibsave_clear;
           ibsave_add('cfg_name','RPLEMAIL_LAST_TIME_SEND');
           ibsave_add('cfg_set1',CODE_SHOP);
           ibsave_add('cfg_value',inttostr(ts.date)+' '+inttostr(ts.time));
           IDCFG:=ibsave_doc('CFG',-1);
           Datamodule1.IBTransaction2.Commit;
           main_form.Memo1.lines.add('��������� ������������ ������ �������!. ��������� �����: '+datetimetostr(tm));
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         if IDCFG<0 then begin
            Messbox('�� ������� ������ ��������� ������������!',MessError,16);
         end;
      end else begin
         IDCFG:=QueryWork.fieldByname('CFG_ID').asinteger;
         ts.Date:=strtoint(trim(argc(QueryWork.fieldByname('CFG_value').asstring,1)));
         ts.time:=strtoint(trim(argc(QueryWork.fieldByname('CFG_value').asstring,2)));
         tm:=TimeStampToDateTime(ts);
         main_form.Memo1.lines.add('��������� ������ ��������� ����������. ��������� �����: '+datetimetostr(tm));
      end;
      QueryWork.Close;
      if IDCFG>0 then begin
         // ������ ������ ����������;
         tm_now:=my_now();
         DateEdit1.Date:=DateOfDatetime(tm);
         MaskEdit1.Text:=FormatTimeOfDateTime(tm);
         DateEdit2.Date:=DateOfDatetime(tm_now);
         MaskEdit2.Text:=FormatTimeOfDateTime(tm_now);
      end;

//      CheckCustom.Visible:= MainForm.PostRE;
      CheckCustom.Checked:= false;


   except
      Messbox('�� ������� ������������ � ���� ������!','������!',16);
   end;
end;

end.
