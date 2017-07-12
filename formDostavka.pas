unit formDostavka;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ToolEdit, Mask, CurrEdit, Grids, DBGrids, RXDBCtrl, Data1,
  IBDatabase, Db, IBCustomDataSet, IBQuery, RxMemDS, B_DButils;

type
  Tform_Dostavka = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    DOST_NUMBER: TRxCalcEdit;
    Label3: TLabel;
    DOST_DATE: TDateEdit;
    Label4: TLabel;
    dost_address: TMemo;
    Button1: TButton;
    Label5: TLabel;
    Label6: TLabel;
    labelPrice: TLabel;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1rn_id: TIntegerField;
    RxMemoryData1rn_num: TStringField;
    RxMemoryData1rn_summ: TFloatField;
    RxMemoryData1rn_date: TDateField;
    IBQuery2: TIBQuery;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }

    rn_summ_total: double;
  public
    { Public declarations }
    procedure add_rn(rn_id: integer; rn_num: string; rn_summ: double; rn_date: TDateTime);
  end;

var
  form_Dostavka: Tform_Dostavka;

implementation

uses JouRn;

{$R *.DFM}

procedure Tform_Dostavka.FormShow(Sender: TObject);
begin
        //генерация нового номера доставки.
        ibquery1.SQL.text:='select max(DOST_NUMBER)+1 as new_dost_number  from rn';
        ibquery1.Open;

        DOST_NUMBER.Text:=ibquery1.fieldByName('new_dost_number').asString;

        ibquery1.Close;

        ibTransaction1.Commit;

        rn_summ_total:=0;


end;


procedure Tform_Dostavka.add_rn(rn_id: integer; rn_num: string; rn_summ: double; rn_date: TDateTime);
begin
//

if (rxMemoryData1.IsEmpty) then
begin
        rn_summ_total:=0;
        ibquery1.SQL.Text:='select DOST_NUMBER,  rn_osn, dost_date from rn where rn_id = :rn_id';
        ibquery1.ParamByName('rn_id').asInteger:=rn_id;
        ibquery1.Open;

        if (ibquery1.fieldbyname('dost_number').asInteger>0) then       ///загрузить все накладные этой доставки
        begin
                dost_number.text:=ibquery1.fieldbyname('dost_number').asString;
                dost_address.text:=ibquery1.fieldbyname('rn_osn').asString;
                dost_date.Date:=ibquery1.fieldbyname('dost_date').asDateTime;

                ibquery2.sql.Text:='select rn_id, rn_num_full, rn_date, rn_summ from LIST_RN_DOST(:dost_number)';
                ibquery2.ParamByName('dost_number').asString:=dost_number.text;
                ibquery2.Open;

                while not ibquery2.eof do
                begin
                        if ( ibquery2.fieldbyname('rn_id').asinteger <> rn_id) then
                        begin
                        rxMemoryData1.Append;
                        rxMemoryData1.FieldByName('rn_id').asInteger:=ibquery2.fieldbyname('rn_id').asinteger;;
                        rxMemoryData1.FieldByName('rn_num').asString:=ibquery2.fieldbyname('rn_num_full').asString;
                        rxMemoryData1.FieldByName('rn_summ').asFloat:=ibquery2.fieldbyname('rn_summ').asfloat;;
                        rxMemoryData1.FieldByName('rn_date').asDateTime:=ibquery2.fieldbyname('rn_date').asdatetime;

                        rn_summ_total := rn_summ_total + ibquery2.fieldbyname('rn_summ').asfloat;;
                        rxMemoryData1.Post;
                        end;


                        ibquery2.next;
                end;
                ibquery2.Close;



        end;
        ibquery1.Close;

end;


rxMemoryData1.Append;
rxMemoryData1.FieldByName('rn_id').asInteger:=rn_id;
rxMemoryData1.FieldByName('rn_num').asString:=rn_num;
rxMemoryData1.FieldByName('rn_summ').asFloat:=rn_summ;
rxMemoryData1.FieldByName('rn_date').asDateTime:=rn_date;
rn_summ_total := rn_summ_total + rn_summ;

rxMemoryData1.Post;

labelPrice.Caption:=floattostr(rn_summ_total);

end;

procedure Tform_Dostavka.Button2Click(Sender: TObject);
begin


        ibquery1.SQL.Text:='update rn set RN_DOST = 0 where rn_id=:rn_id';
        ibquery1.ParamByName('rn_id').asInteger:=rxMemoryData1.FieldByName('rn_id').asInteger ;
        ibquery1.ExecSQL;
        ibTransaction1.Commit;
rxMemoryData1.Delete;

jou_rn.refresh_list;
end;

procedure Tform_Dostavka.FormHide(Sender: TObject);
begin
rxMemoryData1.EmptyTable;
dost_date.Date:=date;
dost_address.Text:='';
end;

procedure Tform_Dostavka.Button1Click(Sender: TObject);
begin
  rxMemoryData1.First;

  while (not rxMemoryData1.eof) do
  begin
        ibquery1.SQL.Text:='update rn set DOST_NUMBER=:DOST_NUMBER, DOST_DATE=:DOST_DATE, RN_OSN=:dost_address, RN_DOST = 1 where rn_id=:rn_id';

        ibquery1.ParamByName('rn_id').asInteger:=rxMemoryData1.FieldByName('rn_id').asInteger ;
        ibquery1.ParamByName('dost_number').asString:=dost_number.Text;
        ibquery1.ParamByName('DOST_DATE').asDatetime:=DOST_DATE.Date;


        ibquery1.ParamByName('dost_address').asString:=dost_address.Text;

        ibquery1.ExecSQL;
        ibTransaction1.Commit;

        rxMemoryData1.Next;
  end;


  //Close;

  jou_rn.refresh_list;
end;

procedure Tform_Dostavka.Button3Click(Sender: TObject);
begin

rxMemoryData1.First;

  while (not rxMemoryData1.eof) do
  begin
        PRINT_RN(rxMemoryData1.FieldByName('rn_id').asInteger, false, false, true) ;
        rxMemoryData1.Next;
  end;

end;

end.
