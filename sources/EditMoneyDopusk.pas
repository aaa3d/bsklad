unit EditMoneyDopusk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  RxMemDS, StdCtrls, ExtCtrls, RXCtrls;

type
  TEDIT_MONEY_DOPUSK = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Q_USERS: TIBQuery;
    read_transaction: TIBTransaction;
    DS_USERS: TDataSource;
    USERS: TRxMemoryData;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Label1: TLabel;
    MIN_USER_MONEY_KTG: TComboBox;
    trindeF_dostup: TRxCheckListBox;
    Label6: TLabel;
    Label2: TLabel;
    ZAY_EMAIL: TRxCheckListBox;
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure USERSAfterScroll(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure MIN_USER_MONEY_KTGChange(Sender: TObject);
    procedure trindeF_dostupClickCheck(Sender: TObject);
    procedure ZAY_EMAILClickCheck(Sender: TObject);
  private
    { Private declarations }
    SortField: TField;
    SortOrder: boolean;

    USER_CFG_ID: integer;
    USER_MIN_MONEY_KTG_CFG_ID: integer;
    USER_PRICE1_CFG_ID, USER_PRICE2_CFG_ID, USER_PRICE3_CFG_ID, USER_PRICE4_CFG_ID, USER_PRICE5_CFG_ID:   integer;
    CAN_REFRESH: boolean;
  public
    { Public declarations }
  end;

var
  EDIT_MONEY_DOPUSK: TEDIT_MONEY_DOPUSK;



implementation

uses data1, b_dbutils;


{$R *.DFM}

procedure TEDIT_MONEY_DOPUSK.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = SortField then
   if SortOrder then SortMarker := smDown else SortMarker := smUp;
end;

procedure TEDIT_MONEY_DOPUSK.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin

//  if (Field <> nil) then
  begin
   SortField:=Field;
   if Field=SortField then
    SortOrder := not SortOrder //Изменяем статус сортировки
   else
    SortOrder:=false;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   TRxMemoryData(RxDBGrid1.DataSource.DataSet).SortOnFields(Field.FieldName, True, SortOrder);
  end;
end;

procedure TEDIT_MONEY_DOPUSK.FormCreate(Sender: TObject);
begin
  CAN_REFRESH:=false;
  Q_USERS.Open;
  users.LoadFromDataSet(Q_USERS, 0, lmCopy);
  Q_USERS.Close;
  DS_USERS.DataSet:=USERS;



  CAN_REFRESH:=true;
  USERS.First;

  q_users.next;


//  ZAY_EMAIL.Items.Add('Сотрудник склада');   //есть ли место на складе
//  ZAY_EMAIL.Items.Add('Сотрудник опта');     //продастся ли оптом
//  ZAY_EMAIL.Items.Add('Сотрудник розницы');  //продастся ли в розницу




end;

procedure TEDIT_MONEY_DOPUSK.RadioGroup1Click(Sender: TObject);
var mode: integer;
begin
  if users.eof then exit;
  if not CAN_REFRESH then exit;

  IBSAVE_CLEAR;
  IBSAVE_ADD('CFG_NAME', 'USER_EDIT_MONEY_MODE');
  IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
  if RadioGroup1.ItemIndex in [0,1] then
    mode:=RadioGroup1.ItemIndex;
  if RadioGroup1.ItemIndex in [2,3] then
    mode:=RadioGroup1.ItemIndex+2;
  if RadioGroup1.ItemIndex in [4,5] then
    mode:=RadioGroup1.ItemIndex-2;
  if RadioGroup1.ItemIndex in [1,2,3] then
  begin
    MIN_USER_MONEY_KTG.Visible:=true;
    Label1.Visible:=true;
  end
  else
  begin
    MIN_USER_MONEY_KTG.Visible:=false;
    Label1.Visible:=false;
  end;
  IBSAVE_ADD('CFG_SET2', mode);
  IBSAVE_DOC('CFG', USER_CFG_ID);
  DATAMODULE1.IBTransaction2.Commit;
end;

procedure TEDIT_MONEY_DOPUSK.USERSAfterScroll(DataSet: TDataSet);
begin
    if not CAN_REFRESH then exit;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='USER_EDIT_MONEY_MODE';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
       USER_CFG_ID:=Q_USERS.fieldbyname('CFG_ID').asinteger;
       if Q_USERS.fieldbyname('CFG_SET2').asinteger in [2,3] then
         RadioGroup1.ItemIndex:=Q_USERS.fieldbyname('CFG_SET2').asinteger+2;
       if Q_USERS.fieldbyname('CFG_SET2').asinteger in [4,5] then
         RadioGroup1.ItemIndex:=Q_USERS.fieldbyname('CFG_SET2').asinteger-2;
       if Q_USERS.fieldbyname('CFG_SET2').asinteger in [0,1] then
         RadioGroup1.ItemIndex:=Q_USERS.fieldbyname('CFG_SET2').asinteger;
    end
    else
    begin
      USER_CFG_ID:=-1;
      RadioGroup1.ItemIndex:=0;
    end;



    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY1';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox1.Checked:=true;
    end
    else
    begin
      CheckBox1.Checked:=false;
    end;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY2';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox2.Checked:=true;
    end
    else
    begin
      CheckBox2.Checked:=false;
    end;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY3';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox3.Checked:=true;
    end
    else
    begin
      CheckBox3.Checked:=false;
    end;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY4';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox4.Checked:=true;
    end
    else
    begin
      CheckBox4.Checked:=false;
    end;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY5';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox5.Checked:=true;
    end
    else
    begin
      CheckBox5.Checked:=false;
    end;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='PRICE_PRINT';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox6.Checked:=true;
    end
    else
    begin
      CheckBox6.Checked:=false;
    end;

    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='$DICKLN.EDIT_KLN_KTG';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      CheckBox7.Checked:=true;
    end
    else
    begin
      CheckBox7.Checked:=false;
    end;


    Q_USERS.SQL.Text:='SELECT CFG_ID , CFG_SET2 FROM CFG WHERE CFG_NAME=:CFG_NAME AND CFG_SET1=:USER_ID';
    Q_USERS.ParamByName('CFG_NAME').asstring:='USER_MIN_MONEY_KTG';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    if not q_users.eof then
    begin
      MIN_USER_MONEY_KTG.ItemIndex:=Q_USERS.FieldByName('CFG_SET2').asinteger-1;
      USER_MIN_MONEY_KTG_CFG_ID:=Q_USERS.FieldByName('CFG_ID').asinteger;
    end
    else
    begin
      MIN_USER_MONEY_KTG.itemindex:=0;
      USER_MIN_MONEY_KTG_CFG_ID:=-1;
    end;

    Q_USERS.SQL.Text:='SELECT cfg_id,  cfg_set2, cfg_value, '+
'case when exists (select * from cfg c2 where c2.cfg_name=''$JOU.ZTRINDEF.USER_DOSTUP'' and c2.cfg_set2 = c0.cfg_set2 and c2.cfg_set1=:user_id) '+
'then 1 else 0 end dostup FROM CFG c0 where CFG_NAME=:cfg_name order by cfg_set2';
    Q_USERS.ParamByName('CFG_NAME').asstring:='TRINDEF_STAT';
    Q_USERS.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    Q_USERS.Open;
    trindef_dostup.Items.Clear;
    while not q_users.Eof do
    begin
      trindef_dostup.Items.Add(q_users.fieldbyname('cfg_value').asString);
      trindef_dostup.Checked[trindef_dostup.Items.Count-1]:=(q_users.fieldbyname('dostup').asInteger=1);


      q_users.next;
    end;





    ZAY_EMAIL.Items.Clear;
    ZAY_EMAIL.Items.Add('Сотрудник склада');   //есть ли место на складе
    ZAY_EMAIL.Items.Add('Закупщик опта');     //продастся ли оптом
    ZAY_EMAIL.Items.Add('Закупщик розницы');  //продастся ли в розницу
    ZAY_EMAIL.Items.Add('Продавец магазина');  //продастся ли в розницу
    ZAY_EMAIL.Items.Add('Продавец опта');  //продастся ли в розницу
    ZAY_EMAIL.Items.Add('ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК РОЗНИЦЫ');  //если никого нет - к директору не попадает
    ZAY_EMAIL.Items.Add('ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК ОПТА');  //если никого нет - к директору не попадает



    ZAY_EMAIL.Checked[0]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL1', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[1]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL2', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[2]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL3', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[3]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL4', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[4]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL5', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[5]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL6', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[6]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL7', USERS.fieldbyname('KLN_ID').asinteger) =1);







end;

procedure TEDIT_MONEY_DOPUSK.CheckBox1Click(Sender: TObject);
begin
  if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox1.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'PRICE_LIST_MONEY1');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY1';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.CheckBox2Click(Sender: TObject);
begin
 if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox2.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'PRICE_LIST_MONEY2');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY2';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.CheckBox3Click(Sender: TObject);
begin
 if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox3.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'PRICE_LIST_MONEY3');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY3';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.CheckBox4Click(Sender: TObject);
begin
 if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox4.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'PRICE_LIST_MONEY4');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY4';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.CheckBox5Click(Sender: TObject);
begin
 if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox5.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'PRICE_LIST_MONEY5');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='PRICE_LIST_MONEY5';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.CheckBox6Click(Sender: TObject);
begin
  if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox6.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'PRICE_PRINT');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='PRICE_PRINT';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.CheckBox7Click(Sender: TObject);
begin
  if users.eof then exit;
  if not CAN_REFRESH then exit;
  if checkbox7.Checked then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', '$DICKLN.EDIT_KLN_KTG');
    IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
    IBSAVE_DOC('CFG', -1);
    DATAMODULE1.IBTransaction2.Commit;
  end
  else
  begin
    IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID';
    IBQUERY1.ParamByName('CFG_NAME').asstring:='$DICKLN.EDIT_KLN_KTG';
    IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
    IBQUERY1.ExecSQL;
    IBTransaction1.Commit;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.MIN_USER_MONEY_KTGChange(Sender: TObject);
begin
  if users.eof then exit;
  if not CAN_REFRESH then exit;

  IBSAVE_CLEAR;
  IBSAVE_ADD('CFG_NAME', 'USER_MIN_MONEY_KTG');
  IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
  IBSAVE_ADD('CFG_SET2', MIN_USER_MONEY_KTG.itemindex+1 );
  IBSAVE_DOC('CFG', USER_MIN_MONEY_KTG_CFG_ID);
  DATAMODULE1.IBTransaction2.Commit;
end;

procedure TEDIT_MONEY_DOPUSK.trindeF_dostupClickCheck(Sender: TObject);
begin
  if (trindef_dostup.ItemIndex<> -1) then
  begin


    if trindef_dostup.Checked[trindef_dostup.ItemIndex] then
    begin
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME', '$JOU.ZTRINDEF.USER_DOSTUP');
      IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
      IBSAVE_ADD('CFG_SET2', trindef_dostup.ItemIndex+1);
      IBSAVE_DOC('CFG', -1);
      DATAMODULE1.IBTransaction2.Commit;

    end
    else
    begin
      IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID and CFG_SET2=:cfg_set2';
      IBQUERY1.ParamByName('CFG_NAME').asstring:='$JOU.ZTRINDEF.USER_DOSTUP';
      IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
      IBQUERY1.ParamByName('CFG_SET2').asinteger:=trindef_dostup.ItemIndex+1;
      IBQUERY1.ExecSQL;
      IBTransaction1.Commit;


    end;
  end;
end;

procedure TEDIT_MONEY_DOPUSK.ZAY_EMAILClickCheck(Sender: TObject);
var dostup_name: string;
begin
  if (ZAY_EMAIL.ItemIndex<> -1) then
  begin

    dostup_name:='$MAIL.ZAY_UTV_LEVEL'+inttostr(ZAY_EMAIL.ItemIndex+1);

    if ZAY_EMAIL.Checked[ZAY_EMAIL.ItemIndex] then
    begin
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME', dostup_name);
      IBSAVE_ADD('CFG_SET1', USERS.fieldbyname('KLN_ID').asinteger);
      IBSAVE_ADD('CFG_SET2', 1);
      IBSAVE_DOC('CFG', -1);
      DATAMODULE1.IBTransaction2.Commit;

    end
    else
    begin
      IBQUERY1.SQL.Text:='DELETE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:USER_ID and CFG_SET2=:cfg_set2';
      IBQUERY1.ParamByName('CFG_NAME').asstring:=dostup_name;
      IBQUERY1.ParamByName('USER_ID').asinteger:=USERS.fieldbyname('KLN_ID').asinteger;;
      IBQUERY1.ParamByName('CFG_SET2').asinteger:=1;
      IBQUERY1.ExecSQL;
      IBTransaction1.Commit;


    end;
  end;
end;

end.
