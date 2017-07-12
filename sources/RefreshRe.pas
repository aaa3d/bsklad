unit RefreshRe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,b_utils,
  b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, Mask,
  ToolEdit,VclUtils;

type
  TREFRESH_RE = class(TForm)
    dt1: TDateEdit;
    Button1: TButton;
    Label1: TLabel;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REFRESH_RE: TREFRESH_RE;

implementation

uses Mainform, DataQr;

{$R *.DFM}

procedure TREFRESH_RE.Button1Click(Sender: TObject);
var
  Rdt1,Rdt2:tdatetime;
begin
   Rdt1:=dt1.date;

      if CheckBox2.Checked then
      begin

      QueryWork.SQL.Text:='SELECT COUNT(*) FROM A2_POPOLN_OST_PERIOD';
      QueryWork.Open;
      QueryWork.Transaction.Commit;
      Querywork.Close;
      end;


   repeat

      // перечситываем цену продажи товара допю фирмам
//      WorkTransaction.Active:=False;
//      try
//         ADD_SQL(QueryWork,'select * from CALC_RN_PN_MONEY');
//         QueryWork.Open;
//         WorkTransaction.Commit;
//      except
//            WorkTransaction.Rollback;
//      end;
//      WorkTransaction.Active:=False;

      if CheckBox1.Checked then
      begin

        QueryWork.SQL.Text:='DELETE FROM RE WHERE DT > :dt';
        if Edit1.Text<>'' then
          Querywork.SQL.Text:=Querywork.SQL.Text+' AND TW_ID='+Edit1.Text;
        Querywork.ParamByName('DT').asdatetime := rdt1;
        QueryWork.Open;
        QueryWork.Transaction.Commit;
        Querywork.Close;

      end;



      if Edit1.Text<>'' then
        ADD_SQL(QueryWork,'select * from A0_REFRESH_LIST_PREP1(:dt1,:dt2) WHERE TW_ID='+Edit1.Text+' order by dt,typ,ids')
      else
        ADD_SQL(QueryWork,'select * from A0_REFRESH_LIST_PREP1(:dt1,:dt2) order by dt,typ,ids');


      QueryWork.ParamByname('dt1').asdatetime:=Rdt1;
      QueryWork.ParamByname('dt2').asdatetime:=Rdt1+1-sekond1;
      main_form.caption:='Расчет '+date_sokr(rdt1);
      Application.Title:=main_form.caption;
      QueryWork.Open;

      try
        DataModule3.ReTransaction.Active:=False;
        while not QueryWork.eof do begin

           main_form.caption:='Расчет '+date_sokr(rdt1)+' '+timetostr(QueryWork.fieldByname('DT').asdatetime)+' TYP='+QueryWork.fieldByname('typ').asstring+
           ' IDS='+QueryWork.fieldByname('ids').asstring;
           Application.Title:=main_form.caption;
           Application.ProcessMessages;


           ADD_SQL(DataModule3.QueryRe1,'select * from a0_analiz_rashod(:typ,:ids)');
           DataModule3.QueryRe1.ParamByname('typ').asinteger:=QueryWork.fieldByname('typ').asinteger;
           DataModule3.QueryRe1.ParamByname('ids').asinteger:=QueryWork.fieldByname('ids').asinteger;
           DataModule3.QueryRe1.Open;



           QueryWork.next;
        end;

        if datamodule3.ReTransaction.InTransaction then
          DataModule3.ReTransaction.Commit;
      except
        on e: exception do
        begin
          messbox('Ошибка закрытия дня!!! Date/TYP/IDS= '+date_sokr(rdt1)+' '+timetostr(QueryWork.fieldByname('DT').asdatetime)+' TYP='+QueryWork.fieldByname('typ').asstring+
           ' IDS='+QueryWork.fieldByname('ids').asstring+ chr(10) + e.message, 'FATAL ERROR', 0);
          DataModule3.ReTransaction.Rollback;
        end;
      end;

      // Фиксируем дату
      DataModule3.ReTransaction.Active:=False;
      try
         ADD_SQL(DataModule3.QueryRe1,'select * from a0_set_close_period_min(:dt)');
         DataModule3.QueryRe1.ParamByname('dt').asdatetime:=Rdt1+1-sekond1;
         DataModule3.QueryRe1.Open;
         DataModule3.ReTransaction.Commit;
      except
            DataModule3.ReTransaction.Rollback;
      end;
      DataModule3.ReTransaction.Active:=False;
      Rdt1:=Rdt1+1;
   until Rdt1>date();
   messbox('Закрытие периода завершено!',MessSystem,48);

end;

procedure TREFRESH_RE.FormShow(Sender: TObject);
begin
    dt1.Date := date();
end;

end.
