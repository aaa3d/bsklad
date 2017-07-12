unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, JvMemoryDataset, Grids, DBGrids, StdCtrls,
  IBDatabase, IBCustomDataSet, IBQuery, DBTables, DBClient, SimpleDS,
  kbmMemTable, Provider;

type
  TForm5 = class(TForm)
    DBGrid1: TDBGrid;
    JvDataSource1: TJvDataSource;
    IBQuery1: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    kbmMemTable1111: TkbmMemTable;
    kbmMemTable1111tw_name: TStringField;
    kbmMemTable1111tw_id: TIntegerField;
    kbmMemTable1111skl_id: TIntegerField;
    kbmMemTable1111frm_id: TIntegerField;
    kbmMemTable1111crater: TFloatField;
    kbmMemTable1111andromeda: TFloatField;
    kbmMemTable1111hercules: TFloatField;
    kbmMemTable1111ol4: TFloatField;
    kbmMemTable1111ol3: TFloatField;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1tw_id: TIntegerField;
    ClientDataSet1tw_name: TStringField;
    ClientDataSet1skl_id: TIntegerField;
    ClientDataSet1frm_id: TIntegerField;
    ClientDataSet1crater: TFloatField;
    ClientDataSet1andromeda: TFloatField;
    ClientDataSet1hercules: TFloatField;
    ClientDataSet1ol4: TFloatField;
    ClientDataSet1ol3: TFloatField;
    ClientDataSet1full_key: TLargeintField;
    kbmMemTable1111full_key: TStringField;
    Table1: TTable;
    IBDatabase2: TIBDatabase;
    IBTransaction2: TIBTransaction;
    IBQuery2: TIBQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var i: integer;
var met: integer;
begin
kbmMemTable1111.First;


    while not kbmMemTable1111.Eof do
    begin
      met:=0;
      for I:= 1 to  memo1.Lines.Count-1 do
      begin

      if (kbmMemTable1111.Fields[4].AsFloat=kbmMemTable1111.Fields[4+I].AsFloat)
       then met:=met+1;
      end;

      if met = memo1.Lines.Count-1 then
        kbmMemTable1111.Delete
      else
        kbmMemTable1111.Next;

    end;



end;

procedure TForm5.Button2Click(Sender: TObject);
var
  I: Integer;

  InsCount: integer;

begin

  ibdatabase2.Connected:=true;
  ibquery2.SQL.Text:='DELETE FROM SYNC_CHECK';
  ibquery2.ExecSQL;
  ibtransaction2.Commit;

  kbmMemTable1111.EmptyTable;

  for  I:= 0 to memo1.Lines.Count - 1 do
  begin
    kbmMemTable1111.Fields[4+I].DisplayLabel:=memo1.Lines.Strings[I];
    self.Caption:=memo1.Lines.Strings[I];
  end;

  ibdatabase1.DatabaseName:=memo1.Lines.Strings[0];
  ibdatabase1.Open;


  ibquery1.SQL.Text:=memo2.Text;
  ibquery1.Open;

  for I := 0 to memo1.Lines.Count -1 do
  begin
      ibdatabase1.DatabaseName:=memo1.Lines.Strings[i];
      ibdatabase1.Open;
      ibquery1.Open;
      insCount:=0;
      while not ibquery1.Eof do
      begin
    {
        kbmMemTable1111.Append;
        kbmMemTable1111.FieldByName('tw_name').asString:=ibquery1.FieldByName('tw_name').asString;
        kbmMemTable1111.FieldByName('full_key').asString:=
            ibquery1.FieldByName('tw_id').asString+' '+
            ibquery1.FieldByName('frm_id').asString+' '+
            ibquery1.FieldByName('skl_id').asString;

        kbmMemTable1111.FieldByName('tw_id').asinteger:=ibquery1.FieldByName('tw_id').asinteger;
        kbmMemTable1111.FieldByName('skl_id').asinteger:=ibquery1.FieldByName('skl_id').asinteger;
        kbmMemTable1111.FieldByName('frm_id').asinteger:=ibquery1.FieldByName('frm_id').asinteger;
        kbmMemTable1111.Fields[4].AsFloat:=ibquery1.FieldByName('tw_kol').asfloat;
        kbmMemTable1111.Post;
       }


        ibquery2.SQL.Text:='INSERT INTO SYNC_CHECK(tw_id, skl_id, frm_id, ost, db_name)'+
              'values (:tw_id, :skl_id, :frm_id, :ost, :db_name)' ;
        ibquery2.ParamByName('tw_id').asInteger:=ibquery1.FieldByName('tw_id').asInteger;
        ibquery2.ParamByName('frm_id').asInteger:=ibquery1.FieldByName('frm_id').asInteger;
        ibquery2.ParamByName('skl_id').asInteger:=ibquery1.FieldByName('skl_id').asInteger;
        ibquery2.ParamByName('ost').asFloat:=ibquery1.FieldByName('tw_kol').asFloat;
        ibquery2.ParamByName('db_name').asString:=memo1.Lines.Strings[i];

        ibquery2.ExecSQL;

        if  insCount > 100 then
        begin
          ibtransaction2.Commit;
          insCount:=0;
        end;


//        ibquery2.Close;


        ibquery1.Next;
        insCount := insCount+1;
      end;

      if ibtransaction2.InTransaction then
        ibtransaction2.Commit;

      ibquery1.Close;
      ibdatabase1.Close;
end;
{

      for I := 1 to memo1.Lines.Count -1 do
      begin
            ibdatabase1.DatabaseName:=memo1.Lines.Strings[i];
            ibdatabase1.Open;

            ibquery1.Open;

            while not ibquery1.Eof do
            begin
          //    if kbmMemTable1.FindKey('tw_id;frm_id;skl_id', VarArrayOf([ibquery1.FieldByName('tw_id').asinteger,
          //    kbmMemTable1.FieldByName('frm_id').asinteger ,
          //    kbmMemTable1.FieldByName('skl_id').asinteger ])) then
              //


              ibquery2.SQL.Text:='select count(*) from SYNC_CHECK where '

                kbmMemTable1111.First;
//                 if kbmMemTable1111.Locate('full_key', ibquery1.FieldByName('tw_id').asString+' '+ibquery1.FieldByName('frm_id').asString+' '+ibquery1.FieldByName('skl_id').asString, []) then
                  if kbmMemTable1111.Locate('tw_id', ibquery1.FieldByName('tw_id').AsInteger, []) then
                  begin
                      while kbmMemTable1111.FieldByName('tw_id').AsInteger=ibquery1.FieldByName('tw_id').AsInteger do
                      begin
                        if ((kbmMemTable1111.FieldByName('frm_id').asinteger=ibquery1.FieldByName('frm_id').AsInteger)
                        and (kbmMemTable1111.FieldByName('skl_id').asinteger=ibquery1.FieldByName('skl_id').AsInteger))
                        then
                          begin
                            kbmMemTable1111.Edit;
                            kbmMemTable1111.Fields[4+i].AsFloat:=ibquery1.FieldByName('tw_kol').asfloat;
                            kbmMemTable1111.Post;
                            break;
                          end;

                        kbmMemTable1111.Next;
                      end;
                  end



                  else
                  begin
                    kbmMemTable1111.Append;
                    kbmMemTable1111.FieldByName('tw_name').asString:=ibquery1.FieldByName('tw_name').asString;
                    kbmMemTable1111.FieldByName('full_key').asString:=
                        ibquery1.FieldByName('tw_id').asString+' '+
                        ibquery1.FieldByName('frm_id').asString+' '+
                        ibquery1.FieldByName('skl_id').asString;

                    kbmMemTable1111.FieldByName('tw_id').asinteger:=ibquery1.FieldByName('tw_id').asinteger;
                    kbmMemTable1111.FieldByName('skl_id').asinteger:=ibquery1.FieldByName('skl_id').asinteger;
                    kbmMemTable1111.FieldByName('frm_id').asinteger:=ibquery1.FieldByName('frm_id').asinteger;
                    kbmMemTable1111.Fields[4+I].AsFloat:=ibquery1.FieldByName('tw_kol').asfloat;
                    kbmMemTable1111.Post;
                  end;
              ibquery1.Next;
            end;
            ibquery1.Close;
            ibdatabase1.Close;
      end;

      }

end;

procedure TForm5.Memo1Change(Sender: TObject);
var I: integer;
begin
  for  I:= 0 to memo1.Lines.Count - 1 do
  begin
    kbmMemTable1111.Fields[4+I].DisplayLabel:=memo1.Lines.Strings[I];
  end;
end;

end.
