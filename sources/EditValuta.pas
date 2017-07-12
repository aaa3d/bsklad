unit EditValuta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,B_utils,B_DButils,Data1, ComCtrls, Db,
  IBCustomDataSet, IBQuery;

type
  TEDIT_VALUTA = class(TForm)
    BtnSave: TButton;
    BtnClose: TButton;
    BtnApply: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Caption_auto2: TLabel;
    Caption_auto: TLabel;
    VALUTA_FULL: TEdit;
    VALUTA_SHORT: TEdit;
    VALUTA_AUTO1: TEdit;
    VALUTA_AUTO2: TEdit;
    VALUTA_AUTO3: TEdit;
    Panel1: TPanel;
    RichEdit1: TRichEdit;
    Image2: TImage;
    IBQuery1: TIBQuery;
    Image3: TImage;
    VALUTA_AUTO11: TEdit;
    VALUTA_AUTO12: TEdit;
    VALUTA_AUTO13: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Caption_auto3: TLabel;
    procedure VALUTA_AUTO3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function SAVE_VALUTA:integer;
    function CHECK_VALUTA:boolean;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure VALUTA_FULLChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_VALUTA: TEDIT_VALUTA;
  EditValutaChange:boolean;

implementation

{$R *.DFM}

procedure TEDIT_VALUTA.VALUTA_AUTO3Change(Sender: TObject);
begin
        EditValutaChange:=true;
        Caption_auto.Caption:='1 '+OKON_CHAR(VALUTA_AUTO1.text,VALUTA_AUTO2.text,VALUTA_AUTO3.text,1)+
        '.      2,3,4 '+OKON_CHAR(VALUTA_AUTO1.text,VALUTA_AUTO2.text,VALUTA_AUTO3.text,2)+
        '.      5,6,7 '+OKON_CHAR(VALUTA_AUTO1.text,VALUTA_AUTO2.text,VALUTA_AUTO3.text,5);
        Caption_auto3.Caption:='1 '+OKON_CHAR(VALUTA_AUTO11.text,VALUTA_AUTO12.text,VALUTA_AUTO13.text,1)+
        '.      2,3,4 '+OKON_CHAR(VALUTA_AUTO11.text,VALUTA_AUTO12.text,VALUTA_AUTO13.text,2)+
        '.      5,6,7 '+OKON_CHAR(VALUTA_AUTO11.text,VALUTA_AUTO12.text,VALUTA_AUTO13.text,5);
end;

procedure TEDIT_VALUTA.FormShow(Sender: TObject);
begin
        if EDIT_VALUTA.tag<0 then begin
                EDIT_VALUTA.caption:=EDIT_VALUTA.caption+'. Новая валюта';
                {Новая валюта}
                VALUTA_FULL.text:='';
                VALUTA_SHORT.text:='';
                VALUTA_AUTO1.text:='';
                VALUTA_AUTO2.text:='';
                VALUTA_AUTO3.text:='';
                VALUTA_AUTO11.text:='';
                VALUTA_AUTO12.text:='';
                VALUTA_AUTO13.text:='';
                VALUTA_FULL.setfocus;
        end else begin
                EDIT_VALUTA.caption:=EDIT_VALUTA.caption+'. Изменение валюты';
                {Читаем данные}
                IbQuery1.close;
                IbQuery1.SQL.clear;
                IbQuery1.SQL.add('select * from VALUTA WHERE VALUTA_ID=:VALUTA_ID');
                IbQuery1.Parambyname('VALUTA_ID').asinteger:=EDIT_VALUTA.tag;
                IbQuery1.open;
                VALUTA_FULL.text:=IbQuery1.fieldbyname('VALUTA_FULL').asstring;
                VALUTA_SHORT.text:=IbQuery1.fieldbyname('VALUTA_SHORT').asstring;
                VALUTA_AUTO1.text:=IbQuery1.fieldbyname('VALUTA_AUTO1').asstring;
                VALUTA_AUTO2.text:=IbQuery1.fieldbyname('VALUTA_AUTO2').asstring;
                VALUTA_AUTO3.text:=IbQuery1.fieldbyname('VALUTA_AUTO3').asstring;
                VALUTA_AUTO11.text:=IbQuery1.fieldbyname('VALUTA_AUTO11').asstring;
                VALUTA_AUTO12.text:=IbQuery1.fieldbyname('VALUTA_AUTO12').asstring;
                VALUTA_AUTO13.text:=IbQuery1.fieldbyname('VALUTA_AUTO13').asstring;
                VALUTA_FULL.setfocus;
                IbQuery1.close;
        end;
        EditValutaChange:=false;
end;

function TEDIT_VALUTA.CHECK_VALUTA:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(VALUTA_FULL.text))=0 then result:=false;
        if length(trim(VALUTA_SHORT.text))=0 then result:=false;
        if length(trim(VALUTA_AUTO1.text))=0 then result:=false;
        if length(trim(VALUTA_AUTO2.text))=0 then result:=false;
        if length(trim(VALUTA_AUTO3.text))=0 then result:=false;
        if length(trim(VALUTA_AUTO11.text))=0 then result:=false;
        if length(trim(VALUTA_AUTO12.text))=0 then result:=false;
        if length(trim(VALUTA_AUTO13.text))=0 then result:=false;
        if not result then messbox('В карточке валюты все поля должны быть заполненными!','Некорректный ввод!',48);
end;

function TEDIT_VALUTA.SAVE_VALUTA:integer;
begin
           result:=-1;
           {Сохраняем валюту}
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('VALUTA_FULL',VALUTA_FULL.text);
                IBSAVE_ADD('VALUTA_SHORT',VALUTA_SHORT.text);
                IBSAVE_ADD('VALUTA_AUTO1',VALUTA_AUTO1.text);
                IBSAVE_ADD('VALUTA_AUTO2',VALUTA_AUTO2.text);
                IBSAVE_ADD('VALUTA_AUTO3',VALUTA_AUTO3.text);
                IBSAVE_ADD('VALUTA_AUTO11',VALUTA_AUTO11.text);
                IBSAVE_ADD('VALUTA_AUTO12',VALUTA_AUTO12.text);
                IBSAVE_ADD('VALUTA_AUTO13',VALUTA_AUTO13.text);
                result:=IBSAVE_DOC('VALUTA',EDIT_VALUTA.tag);
                Datamodule1.IBTransaction2.Commit;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEDIT_VALUTA.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_VALUTA then begin
                Newtag:=SAVE_VALUTA;
                if Newtag>=0 then begin
                        EDIT_VALUTA.tag:=Newtag;
                        EditValutaChange:=false;
                end;
        end;
end;

procedure TEDIT_VALUTA.BtnCloseClick(Sender: TObject);
begin
        close;
end;

procedure TEDIT_VALUTA.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_VALUTA then begin
                Newtag:=SAVE_VALUTA;
                if Newtag>0 then begin
                        EditValutaChange:=false;
                        tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TEDIT_VALUTA.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#27 then BtnClose.click;
        if key=#10 then begin
           VALUTA_AUTO2.setfocus;
           VALUTA_AUTO1.setfocus;
           BtnSAVE.click;
        end;
end;

procedure TEDIT_VALUTA.VALUTA_FULLChange(Sender: TObject);
begin
        EditValutaChange:=true;
end;

procedure TEDIT_VALUTA.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if EditValutaChange then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;

end;

end.
