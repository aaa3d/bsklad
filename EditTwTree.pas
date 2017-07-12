unit EditTwTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1, Db, IBCustomDataSet, IBQuery,DicTowar,B_DButils,
  B_utils, IBDatabase, RxLookup;

type
  TEdit_TWTREE = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Edit1: TEdit;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    IBQuery1: TIBQuery;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    WorkTransaction: TIBTransaction;
    checkPrintInPrice: TCheckBox;
    Label34: TLabel;
    TW_SALER: TRxDBLookupCombo;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function SAVE_TWTREE:integer;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function CHECK_TWTREE:boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_TWTREE: TEdit_TWTREE;
  EditTWTreeChange:boolean;

implementation

{$R *.DFM}

procedure TEdit_TWTREE.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_TWTREE.FormShow(Sender: TObject);
begin
     TW_SALER.Enabled:= CHECK_DOSTUP('$DICTW.SALER_CHANGE');
     if tag<0 then begin
        Edit1.text:='';
        Caption:='Создание новой группы товаров!';
     end else begin
                {Читаем данные}
                WorkTransaction.Active:=False;
                IbQuery1.close;
                IbQuery1.SQL.clear;
                IbQuery1.SQL.add('select * from TWTREE WHERE TWTREE_ID=:TWTREE_ID');
                IbQuery1.Parambyname('TWTREE_ID').asinteger:=EDIT_TWTREE.tag;
                IbQuery1.open;
                Edit1.text:=IbQuery1.fieldbyname('TWTREE_FULL').asstring;
                if ibquery1.FieldByName('print_in_price').asinteger=1 then
                  checkPrintInPrice.Checked:=true
                  else checkPrintInPrice.Checked:=false;


                TW_SALER.Enabled:= (ibquery1.FieldByName('parent_id').asinteger=0);
                TW_SALER.Value:='0'+ibquery1.FieldByName('TW_SALER_ID').asString;
                IbQuery1.close;
    end;
    EditTwTreeChange:=false;
    Edit1.Setfocus;
end;

function TEdit_TWTREE.SAVE_TWTREE:integer;
var
        rr:integer;
begin
           result:=-1;
           {Сохраняем Категорию}
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('TWTREE_FULL',Edit1.text);
                IBSAVE_ADD('TWKAT_ID',1);
                IBSAVE_ADD('TW_SALER_ID',strtoint('0'+TW_SALER.Value));

                IBSAVE_ADD('PARENT_ID',BtnApply.tag);
                if checkPrintInPrice.Checked then
                  IBSAVE_ADD('print_in_price',1)
                else
                  IBSAVE_ADD('print_in_price',0);


                rr:=IBSAVE_DOC('TWTREE',EDIT_TWTREE.tag);
                Datamodule1.IBTransaction2.Commit;
                SAVE_TWTREE:=rr;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEdit_TWTREE.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_TWTREE then begin
                Newtag:=SAVE_TWTREE;
                if Newtag>=0 then begin
                        EDIT_TWTree.tag:=Newtag;
                        EditTWTreeChange:=false;
                end;
        end;
end;

procedure TEdit_TWTREE.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_TWTREE then begin
                Newtag:=SAVE_TWTREE;
                if Newtag>0 then begin
                        EditTwTreeChange:=false;
                        Edit_TWTREE.tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TEdit_TWTREE.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#27 then BtnClose.click;
end;

procedure TEdit_TWTREE.Edit1Change(Sender: TObject);
begin
        EditTWTreeChange:=true;
end;

procedure TEdit_TWTREE.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if EditTWTreeChange then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

function TEdit_TWTREE.CHECK_TWTREE:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(Edit1.text))=0 then result:=false;
        if not result then messbox('Название раздела не может быть пустой строкой!','Некорректный ввод!',48);
end;

end.
