unit EditKlnTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1, Db, IBCustomDataSet, IBQuery,DicKlient,B_DButils,
  B_utils;

type
  TEdit_KLNTREE = class(TForm)
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
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function SAVE_KLNTREE:integer;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function CHECK_KLNTREE:boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_KLNTREE: TEdit_KLNTREE;
  EditKlnTreeChange:boolean;

implementation

{$R *.DFM}

procedure TEdit_KLNTREE.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_KLNTREE.FormShow(Sender: TObject);
begin
     if tag<0 then begin
        Edit1.text:='';
        Caption:='Создание новой группы контактов!';
     end else begin
                {Читаем данные}
                IbQuery1.close;
                IbQuery1.SQL.clear;
                IbQuery1.SQL.add('select * from KLNTREE WHERE KLNTREE_ID=:KLNTREE_ID');
                IbQuery1.Parambyname('KLNTREE_ID').asinteger:=EDIT_KLNTREE.tag;
                IbQuery1.open;
                Edit1.text:=IbQuery1.fieldbyname('KLNTREE_FULL').asstring;
                IbQuery1.close;
    end;
    EditKlnTreeChange:=false;
    Edit1.Setfocus;
end;

function TEdit_KLNTREE.SAVE_KLNTREE:integer;
begin
           result:=-1;
           {Сохраняем Категорию}
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('KLNTREE_FULL',Edit1.text);
                if Dic_Klient.TreeView1.Selected.StateIndex=0 then IBSAVE_ADD('PARENT_ID',0) else
                IBSAVE_ADD('PARENT_ID',Dic_Klient.TreeView1.Selected.StateIndex);
                result:=IBSAVE_DOC('KLNTREE',EDIT_KLNTREE.tag);
                Datamodule1.IBTransaction2.CommitRetaining;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEdit_KLNTREE.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_KLNTREE then begin
                Newtag:=SAVE_KlnTREE;
                if Newtag>=0 then begin
                        EDIT_KlnTree.tag:=Newtag;
                        EditKlnTreeChange:=false;
                end;
        end;
end;

procedure TEdit_KLNTREE.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_KLNTREE then begin
                Newtag:=SAVE_KLNTREE;
                if Newtag>0 then begin
                        EditKlnTreeChange:=false;
                        tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TEdit_KLNTREE.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#27 then BtnClose.click;
end;

procedure TEdit_KLNTREE.Edit1Change(Sender: TObject);
begin
        EditKlnTreeChange:=true;
end;

procedure TEdit_KLNTREE.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if EditKlnTreeChange then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

function TEDIT_KLNTREE.CHECK_KLNTREE:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(Edit1.text))=0 then result:=false;
        if not result then messbox('Название раздела не может быть пустой строкой!','Некорректный ввод!',48);
end;

end.
