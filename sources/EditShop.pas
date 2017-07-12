unit EditShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Db, IBCustomDataSet, IBQuery,
  B_utils,B_DButils, ToolWin, Grids, DBGrids, RXDBCtrl, IBDatabase, Buttons;

type
  TEdit_Shop = class(TForm)
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    Label1: TLabel;
    SHOP_NAME: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Shop_office: TCheckBox;
    Label2: TLabel;
    SHOP_PREFIX: TEdit;
    SHOP_POSTFIX: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BtnColor: TButton;
    Shape1: TShape;
    Bevel1: TBevel;
    ColorDialog1: TColorDialog;
    IBQuery1: TIBQuery;
    Image3: TImage;
    IBTransaction2: TIBTransaction;
    Label6: TLabel;
    FRM_NAME: TEdit;
    BTN_FRM: TBitBtn;
    DOP_FIRM_DELETE: TSpeedButton;
    procedure SHOP_NAMEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function CHECK_SHOP:boolean;
    function SAVE_SHOP:integer;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure BtnColorClick(Sender: TObject);
    procedure BTN_FRMClick(Sender: TObject);
    procedure DOP_FIRM_DELETEClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Shop: TEdit_Shop;
  EditShopChange:boolean;

implementation

uses Data1, EditZone, DicKlient;

{$R *.DFM}

procedure TEdit_Shop.SHOP_NAMEChange(Sender: TObject);
begin
   EditShopChange:=true;
end;

procedure TEdit_Shop.FormShow(Sender: TObject);
begin
        if EDIT_SHOP.tag<0 then begin
                EDIT_SHOP.caption:=EDIT_SHOP.caption+'. Новый';
        end
        else
        begin
                EDIT_SHOP.caption:=EDIT_SHOP.caption+'. Изменение даных';
                {Читаем данные}
                IbQuery1.close;
                IbQuery1.SQL.clear;
                IbQuery1.SQL.add('select shop.*, (select kln_full from kln_data(shop.shop_frm)) KLN_FULL from SHOP WHERE SHOP_ID=:SHOP_ID');
                IbQuery1.Parambyname('SHOP_ID').asinteger:=EDIT_SHOP.tag;
                IbQuery1.open;
                SHOP_NAME.text:=IbQuery1.fieldbyname('SHOP_NAME').asstring;
                SHOP_PREFIX.text:=IbQuery1.fieldbyname('SHOP_PREFIX').asstring;
                SHOP_POSTFIX.text:=IbQuery1.fieldbyname('SHOP_POSTFIX').asstring;
                frm_name.Text := ibquery1.fieldbyname('KLN_FULL').asstring;
                btn_frm.Tag := ibquery1.fieldbyname('SHOP_FRM').asinteger;

                if IbQuery1.fieldbyname('SHOP_OFFICE').asinteger>0 then
                SHOP_OFFICE.checked:=true;
                if IbQuery1.fieldbyname('SHOP_COLOR').asinteger>=0 then
                begin
                   RadioButton2.checked:=true;
                   BtnColor.enabled:=true;
                   Shape1.Brush.Color:=IbQuery1.fieldbyname('SHOP_COLOR').asinteger;
                end;
                IbQuery1.close;

        end;
        SHOP_NAME.setfocus;
        EditShopChange:=false;
end;

function TEDIT_SHOP.CHECK_SHOP:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(SHOP_NAME.text))=0 then result:=false;
        if not result then messbox('Полное наименование не может быть пустой строкой','Некорректный ввод!',48);
end;

function TEDIT_SHOP.SAVE_SHOP:integer;
begin
           result:=-1;
           {Сохраняем склад}
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                if SHOP_OFFICE.checked then begin
                   {Удаляем в других складах отметку о главной базе}
                   DataModule1.IbSaveSQL.Close;
                   DataModule1.IbSaveSQL.SQL.clear;
                   DataModule1.IbSaveSQL.SQL.add('UPDATE SHOP SET SHOP_OFFICE="0" WHERE SHOP_OFFICE="1"');
                   DataModule1.IbSaveSQL.ExecSql;
                end;
                IBSAVE_CLEAR;
                IBSAVE_ADD('SHOP_NAME',SHOP_NAME.text);
                IBSAVE_ADD('SHOP_PREFIX',SHOP_PREFIX.text);
                IBSAVE_ADD('SHOP_POSTFIX',SHOP_POSTFIX.text);

                if RAdioButton1.checked then IBSAVE_ADD('SHOP_COLOR',-1)
                else IBSAVE_ADD('SHOP_COLOR',Shape1.Brush.color);

                IBSAVE_ADD('SHOP_FRM',btn_frm.Tag);



                IBSAVE_ADD('SHOP_OFFICE',SHOP_OFFICE.checked);
                result:=IBSAVE_DOC('SHOP',EDIT_SHOP.tag);
                Datamodule1.IBTransaction2.Commit;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEdit_Shop.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_SHOP then begin
                Newtag:=SAVE_SHOP;
                if Newtag>=0 then begin
                        EDIT_SHOP.tag:=Newtag;
                        EditShopChange:=false;
                end;
        end;
end;

procedure TEdit_Shop.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_Shop.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_SHOP then begin
                Newtag:=SAVE_SHOP;
                if Newtag>0 then begin
                        EditShopChange:=false;
                        tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TEdit_Shop.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#27 then BtnClose.click;
end;

procedure TEdit_Shop.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if EditShopChange then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

procedure TEdit_Shop.RadioButton1Click(Sender: TObject);
begin
     EditShopChange:=true;
     BtnColor.enabled:=RadioButton2.Checked;
end;

procedure TEdit_Shop.BtnColorClick(Sender: TObject);
begin
     ColorDialog1.Color:=SHape1.Brush.Color;
     if ColorDialog1.Execute then begin
        EditShopChange:=true;
        SHape1.Brush.Color:=ColorDialog1.Color;
     end;
end;

procedure TEdit_Shop.BTN_FRMClick(Sender: TObject);
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
          EditShopChange:=False;
        except
          on e: Exception
            do application.MessageBox( pchar(e.message) , 'ERROR', MB_ICONERROR);

        end;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TEdit_Shop.DOP_FIRM_DELETEClick(Sender: TObject);
begin
  btn_frm.Tag:=0;
  frm_name.Text := '';
  save:=false;
end;

end.
