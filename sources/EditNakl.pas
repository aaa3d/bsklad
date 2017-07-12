unit EditNakl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin,Data1,b_utils,b_Dbutils, ActnList, StdCtrls, Buttons,
  Db, IBCustomDataSet, IBQuery, IBDatabase,DicUsl;

type
  TEdit_Nakl = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    BtnSave: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MET: TComboBox;
    KLN: TEdit;
    USL: TEdit;
    BtnDicKln: TAction;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    BtnDicUsl: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtnSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure METChange(Sender: TObject);
    procedure BtnDicKlnExecute(Sender: TObject);
    procedure BtnDicUslExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Nakl: TEdit_Nakl;

implementation

uses DicKlient;

{$R *.DFM}

procedure TEdit_Nakl.BtnSaveExecute(Sender: TObject);
begin
  // Сохраняем
  close;
end;

procedure TEdit_Nakl.FormShow(Sender: TObject);
begin
  tag:=2;
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select USL_name from USL where usl_id=:usl_id');
   QueryWork.ParamByname('USL_ID').asinteger:=USL.tag;
   QueryWork.Open;
   USL.text:=QueryWork.fieldByname('USL_NAME').asstring;
   QueryWork.Close;
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
   QueryWork.ParamByname('KLN_ID').asinteger:=KLN.tag;
   QueryWork.Open;
   KLN.text:=QueryWork.fieldByname('KLN_FULL').asstring;
   QueryWork.Close;
end;

procedure TEdit_Nakl.METChange(Sender: TObject);
begin
   if MET.itemindex<0 then MET.itemIndex:=1;
end;

procedure TEdit_Nakl.BtnDicKlnExecute(Sender: TObject);
begin
   // Справочник контактов
    // Выбрать фирму
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN.tag then begin
        KLN.tag:=DIC_KLIENT.tag;
        // Отображаем
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
        QueryWork.ParamByname('KLN_ID').asinteger:=KLN.tag;
        QueryWork.Open;
        KLN.text:=QueryWork.fieldByname('KLN_FULL').asstring;
        QueryWork.Close;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TEdit_Nakl.BtnDicUslExecute(Sender: TObject);
begin
   // Справочник Услуг
    // Выбрать фирму
     Application.createForm(TDIC_USL,DIC_USL);
     DicUslSet:=2; {Выбор услуги}
     DIC_USL.tag:=USL.tag;
     DIC_USL.ShowModal;
     if DIC_USL.tag<>USL.tag then begin
        USL.tag:=DIC_USL.tag;
        // Отображаем
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select USL_name from USL where usl_id=:usl_id');
        QueryWork.ParamByname('USL_ID').asinteger:=USL.tag;
        QueryWork.Open;
        USL.text:=QueryWork.fieldByname('USL_NAME').asstring;
        QueryWork.Close;
     end;
     DIC_USL.Destroy;
end;

procedure TEdit_Nakl.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then begin
     key:=#0;
     close;
   end;
end;

end.
