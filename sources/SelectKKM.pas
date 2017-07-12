unit SelectKKM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup, data1, b_dbutils, b_utils, RxDBComb;

type
  TSELECT_KKM = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    SHOP_NAME: TEdit;
    Button1: TButton;
    cmbKKM: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    kkm_ids: array [0..10] of integer;
  public
    { Public declarations }
  end;

var
  SELECT_KKM: TSELECT_KKM;

implementation

{$R *.DFM}

procedure TSELECT_KKM.FormShow(Sender: TObject);
 var kkm_id1: integer;
 		i: integer;
begin
  datamodule1.IBTransaction1.Active:=false;
  datamodule1.ibsavesql.SQL.Text:='SELECT * FROM LIST_KKM where LIST_KKM.shop_id=:shop_id';
  datamodule1.ibsavesql.ParamByName('shop_id').asinteger := SHOPID;
  datamodule1.ibsavesql.Open;

  while (not datamodule1.IbSaveSQL.Eof) do
  begin
    shop_name.text:=datamodule1.ibsavesql.FieldByName('SHOP_NAME').asstring;
    kkm_ids[cmbKKM.Items.Count] := datamodule1.ibsavesql.FieldByName('CFG_ID').asinteger;
    cmbKKM.Items.Add(datamodule1.ibsavesql.FieldByName('KKM_NAME').asstring);


    datamodule1.IbSaveSQL.Next;
  end;
  datamodule1.IbSaveSQL.Close;
  datamodule1.IBTransaction1.Active:=false;


  datamodule1.IBTransaction1.Active:=false;
  datamodule1.ibsavesql.SQL.Text:='select cfg_set1 from cfg where cfg_name="LAST_KKM_COMP" and CFG_VALUE=:COMPUTER_NAME and tm=(select max(cfg2.tm) from cfg cfg2 where cfg2.cfg_name="LAST_KKM_COMP" and cfg2.CFG_VALUE=:COMPUTER_NAME)';
  datamodule1.ibsavesql.ParamByName('computer_name').asstring := ComputerName;
  datamodule1.ibsavesql.Open;
  if not datamodule1.IbSaveSQL.Eof then
    kkm_id1 := datamodule1.IbSaveSQL.fieldbyname('cfg_set1').asinteger;
  datamodule1.IbSaveSQL.Close;
  datamodule1.IBTransaction1.Active:=false;

  cmbKKM.ItemIndex:=0;
  if (kkm_id1 <> 0) then
    for i := 0 to cmbKKM.items.Count-1 do
      if kkm_ids[i] = kkm_id1 then
        begin
        	cmbKKM.ItemIndex:=i;
            break;
        end;
  cmbKKM.SetFocus;

end;

procedure TSELECT_KKM.Button1Click(Sender: TObject);
var r: double;
begin
	if cmbKKM.ItemIndex > -1 then
		KKM_ID := kkm_ids[cmbKKM.ItemIndex]
        else KKM_ID := 0;




    Datamodule1.IBTransaction2.Active:=False;
    Datamodule1.IBTransaction2.StartTransaction;
    DataModule1.IbSaveSQL.close;
    DataModule1.IbSaveSQL.SQL.clear;
    DataModule1.IbSaveSQL.SQL.add('delete from cfg where cfg_name="LAST_KKM_COMP" and '+
    ' CFG_VALUE="'+Computername+'"');
    Try
       DataModule1.IbSaveSQL.ExecSQL;
      IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME','LAST_KKM_COMP');
       IBSAVE_ADD('CFG_SET1',KKM_ID);
       IBSAVE_ADD('CFG_VALUE',COMPUTERNAME);
       if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
    Except
        Messbox('Ошибка при фиксации кассы!',MessSystem,48);
        Datamodule1.IBTransaction2.Rollback;
    End;
        Datamodule1.IBTransaction2.Active:=False;
end;

end.
