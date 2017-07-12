unit EditSklad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1,B_DButils,B_Utils, Db,
  IBCustomDataSet, IBQuery, Buttons;

type
  TEdit_sklad = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    Label3: TLabel;
    SKL_FULL: TEdit;
    SKL_SHORT: TEdit;
    SKL_ADR: TEdit;
    SKL_TEL: TEdit;
    SKL_TIME: TEdit;
    SKL_SPEED: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    IBQuery1: TIBQuery;
    Image3: TImage;
    Label6: TLabel;
    FRM_NAME: TEdit;
    BTN_FRM: TBitBtn;
    DOP_FIRM_DELETE: TSpeedButton;
    procedure SKL_FULLChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function CHECK_SKLAD:boolean;
    function SAVE_SKLAD:integer;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BTN_FRMClick(Sender: TObject);
    procedure DOP_FIRM_DELETEClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_sklad: TEdit_sklad;
  EditSkladChange:boolean;
  SKL_SPEED_VALUE:integer;

implementation

uses DicKlient;

{$R *.DFM}

procedure TEdit_sklad.SKL_FULLChange(Sender: TObject);
begin
   EditSkladChange:=true;
end;

procedure TEdit_sklad.FormShow(Sender: TObject);
begin
        if EDIT_SKLAD.tag<0 then begin
                EDIT_SKLAD.caption:=EDIT_SKLAD.caption+'. Новый';
                {Новый склад - определяем максимальный индекс для порядка}
                IbQuery1.close;
                IbQuery1.SQL.clear;
                IbQuery1.SQL.add('select max(skl_speed) as mm from skl');
                IbQuery1.open;
                if IbQuery1.eof then SKL_SPEED_VALUE:=1
                else SKL_SPEED_VALUE:=IbQuery1.fieldbyname('mm').asinteger+1;
                IbQuery1.close;
        end else begin
                EDIT_SKLAD.caption:=EDIT_SKLAD.caption+'. Изменение данных';
                {Читаем данные}
                IbQuery1.close;
                IbQuery1.SQL.clear;
                IbQuery1.SQL.add('select skl.*, (SELECT KLN_FULL FROM KLN_DATA(skl.skl_frm)) KLN_FULL from SKL WHERE SKL_ID=:SKL_ID');
                IbQuery1.Parambyname('SKL_ID').asinteger:=EDIT_SKLAD.tag;
                IbQuery1.open;
                SKL_FULL.text:=IbQuery1.fieldbyname('SKL_FULL').asstring;
                SKL_SHORT.text:=IbQuery1.fieldbyname('SKL_SHORT').asstring;
                SKL_ADR.text:=IbQuery1.fieldbyname('SKL_ADR').asstring;
                SKL_TEL.text:=IbQuery1.fieldbyname('SKL_TEL').asstring;
                SKL_TIME.text:=IbQuery1.fieldbyname('SKL_TIME').asstring;
                SKL_SPEED_VALUE:=IbQuery1.fieldbyname('SKL_SPEED').asinteger;
                frm_name.Text := ibquery1.fieldbyname('KLN_FULL').asstring;
                btn_frm.Tag := ibquery1.fieldbyname('SKL_FRM').asinteger;
                if IbQuery1.fieldbyname('SKL_SPEED').asinteger>0 then
                SKL_SPEED.checked:=true;
                IbQuery1.close;
                if not SKL_SPEED.checked then begin
                  IbQuery1.close;
                  IbQuery1.SQL.clear;
                  IbQuery1.SQL.add('select max(skl_speed) as mm from skl');
                  IbQuery1.open;
                  if IbQuery1.eof then SKL_SPEED_VALUE:=1
                  else SKL_SPEED_VALUE:=IbQuery1.fieldbyname('mm').asinteger+1;
                  IbQuery1.close;
                end;
        end;
        SKL_FULL.setfocus;
        EditSkladChange:=false;
end;

function TEDIT_SKLAD.CHECK_SKLAD:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(SKL_FULL.text))=0 then result:=false;
        if length(trim(SKL_SHORT.text))=0 then result:=false;
        if not result then messbox('Полное и сокращённое название не могут быть пустой строкой','Некорректный ввод!',48);
end;

function TEDIT_SKLAD.SAVE_SKLAD:integer;
begin
           result:=-1;
           {Сохраняем склад}
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('SKL_FULL',SKL_FULL.text);
                IBSAVE_ADD('SKL_SHORT',SKL_SHORT.text);
                IBSAVE_ADD('SKL_ADR',SKL_ADR.text);
                IBSAVE_ADD('SKL_TEL',SKL_TEL.text);
                IBSAVE_ADD('SKL_TIME',SKL_TIME.text);


                IBSAVE_ADD('SKL_FRM', btn_frm.tag);
                if SKL_SPEED.Checked then begin
                   IBSAVE_ADD('SKL_SPEED',SKL_SPEED_VALUE);
                end else IBSAVE_ADD('SKL_SPEED',0);
                result:=IBSAVE_DOC('SKL',EDIT_SKLAD.tag);
                Datamodule1.IBTransaction2.Commit;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEdit_sklad.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_SKLAD then begin
                Newtag:=SAVE_SKLAD;
                if Newtag>=0 then begin
                        EDIT_SKLAD.tag:=Newtag;
                        EditSkladChange:=false;
                end;
        end;
end;

procedure TEdit_sklad.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_sklad.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_SKLAD then begin
                Newtag:=SAVE_SKLAD;
                if Newtag>0 then begin
                        EditSkladChange:=false;
                        tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TEdit_sklad.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#27 then BtnClose.click;
end;

procedure TEdit_sklad.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if EditSkladChange then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

procedure TEdit_sklad.BTN_FRMClick(Sender: TObject);
var fq: FastQuery;
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=btn_frm.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>btn_frm.tag then
     begin
        btn_frm.tag:=DIC_KLIENT.tag;
        try
          fq := FastQuery.Create('select KLN_FULL  FROM KLN_DATA(:KLN_ID)');
          fq.ParamByName('KLN_ID').asinteger:= btn_frm.Tag;
          fq.Open;
          frm_name.Text := fq.fieldByName('KLN_FULL').asstring;
          fq.Close;
          freeandnil(fq);
          EditSkladChange:=False;
        except
          on e: Exception
            do application.MessageBox( pchar(e.message) , 'ERROR', MB_ICONERROR);

        end;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TEdit_sklad.DOP_FIRM_DELETEClick(Sender: TObject);
begin
 btn_frm.Tag:=0;
 frm_name.Text := '';
 EditSkladChange:=false;
end;

end.
