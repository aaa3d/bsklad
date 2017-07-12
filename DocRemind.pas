unit DocRemind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, IBDatabase, Db, IBCustomDataSet, IBQuery;

type
  TDOC_REMIND = class(TForm)
    REMIND_DATE: TMonthCalendar;
    REMIND_TEXT: TMemo;
    REMIND_TM: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    REMIND_US_FIO: TLabel;
    REMIND_END: TCheckBox;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    rn_id: integer;
    remind_id: integer;
    rntyp_id: integer;


    remind_user_id: integer;
  public
    { Public declarations }

    procedure Load(_RN_ID: integer; _remind_id: integer=0);
  end;


implementation

uses Data1, b_dbUtils, docrn, DetalKLN, EditKontakt;

{$R *.DFM}


procedure TDOC_REMIND.Load(_RN_ID: integer; _remind_id: integer);
begin

  if (_remind_id=0) then
  begin
    remind_id := -1;
    remind_user_id := USERID;

    rn_id := _RN_ID;
    ibquery1.SQL.Text:=' SELECT * FROM PROV_RN_ANALIZ_KREDIT (:RN_ID, :US_ID)';
    ibquery1.ParamByName('RN_ID').asInteger:=_RN_ID;
    ibquery1.ParamByName('US_ID').asInteger:=USERID;

    ibquery1.Open;

    if not ibquery1.Eof then
    begin

      rntyp_id := ibquery1.fieldbyname('RNTYP_ID').asInteger;
      remind_tm.Caption := ibquery1.fieldbyname('RN_DATE').asString;
      REMIND_US_FIO.Caption := ibquery1.fieldbyname('US_FIO').asString;
      REMIND_US_FIO.Caption := ibquery1.fieldbyname('US_FIO').asString;




      REMIND_TEXT.Lines.Clear();
      if rn_id>0 then
      begin
        REMIND_TEXT.Lines.add (ibquery1.fieldbyname('KLN_NAME').asString);
        REMIND_TEXT.Lines.add (ibquery1.fieldbyname('RN_NUM_FULL').asString + ', ' +ibquery1.fieldbyname('RN_SUMM').asString + ' руб.');
        REMIND_TEXT.Lines.add ('Баланс до накладной: '+ibquery1.fieldbyname('KLIENT_BALANCE').asString+' руб.');
        REMIND_TEXT.Lines.add ('Выдано в кредит на: ' +ibquery1.fieldbyname('KLIENT_ADD_SUMM').asString+' руб.');
      end;



    end;


    ibquery1.Close;
  end;

 if (_remind_id>0) then
  begin
    remind_id := _remind_id;

    rn_id := _RN_ID;
    ibquery1.SQL.Text:=' SELECT * FROM REMIND WHERE REMIND_ID=:REMIND_ID';
    ibquery1.ParamByName('REMIND_ID').asInteger:=REMIND_ID;


    ibquery1.Open;

    if not ibquery1.Eof then
    begin

      RN_ID := ibquery1.fieldbyname('RN_ID').asInteger;

            
      remind_tm.Caption := ibquery1.fieldbyname('TM').asString;
      REMIND_US_FIO.Caption := ibquery1.fieldbyname('REMIND_USER_FIO').asString;
      remind_user_id := ibquery1.fieldbyname('REMIND_US_ID').asInteger;
      REMIND_DATE.Date := ibquery1.fieldbyname('REMIND_DATE').asDatetime;

      REMIND_TEXT.Lines.Clear();
      REMIND_TEXT.Text := ibquery1.fieldbyname('REMIND_TEXT').asString;

      REMIND_END.CHECKED:= (ibquery1.fieldbyname('REMIND_END').asString = '1');
    end;


    ibquery1.Close;
  end;


end;

procedure TDOC_REMIND.Button2Click(Sender: TObject);
var DOC_RN1: TDOC_RN;
begin
      if (rn_id <=0) then
        exit;

      ibquery1.sql.text:='select rntyp_id from rn where rn_id=:rn_id';
      ibquery1.ParamByName('RN_ID').asInteger:=RN_ID;
      ibquery1.Open;


      rntyp_id := ibquery1.fieldbyname('RNTYP_ID').asInteger;
      ibquery1.Close;

      Application.CreateForm(TDoc_RN,Doc_RN1);

      Doc_RN1.tag:=RN_ID;
      Doc_RN1.ToolBar1.Tag:=rntyp_id;  //rntyp_id
      Doc_RN1.StatusBar1.Tag:=rntyp_id;  //kurs
      Doc_RN1.showModal;

end;

procedure TDOC_REMIND.Button1Click(Sender: TObject);
var idr: double;
begin

  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('REMIND_DATE', TDateTime(REMIND_DATE.Date));
    IBSAVE_ADD('REMIND_USER_FIO', REMIND_US_FIO.Caption);
    IBSAVE_ADD('REMIND_US_ID', remind_user_id);
    IBSAVE_ADD('RN_ID', RN_ID);        
    IBSAVE_ADD('REMIND_TEXT', REMIND_TEXT.text);


    if (REMIND_END.Checked) then
    IBSAVE_ADD('REMIND_END', 1)
    else
    IBSAVE_ADD('REMIND_END', 0);




    if ( IBSAVE_DOC('REMIND', remind_id) < 0) then
      idr:=SQRT(-1);

    Datamodule1.IBTransaction2.Commit;
  Except
    Datamodule1.IBTransaction2.Rollback;
  end;


  Close;
end;

procedure TDOC_REMIND.Button3Click(Sender: TObject);
var KLN_ID: integer;
begin

      ibquery1.sql.text:='select kln_id from rn where rn_id=:rn_id';
      ibquery1.ParamByName('RN_ID').asInteger:=RN_ID;
      ibquery1.Open;


      kln_id := ibquery1.fieldbyname('kln_ID').asInteger;
      ibquery1.Close;

{Редактирование контакта}
           Application.CreateForm(TEdit_Kontakt,Edit_Kontakt);

           Edit_kontakt.Tag:=kln_ID;
           Edit_kontakt.showmodal;
           Edit_kontakt.Destroy;
end;

end.
