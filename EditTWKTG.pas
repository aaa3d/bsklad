unit EditTWKTG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls,
  ToolWin, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEdit_TWKTG = class(TForm)
    ToolBar1: TToolBar;
    BtnSAVE: TToolButton;
    BtnAPPLY: TToolButton;
    PopupMenu1: TPopupMenu;
    MnSAVE: TMenuItem;
    N1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Color1: TRadioButton;
    Color2: TRadioButton;
    Shape1: TShape;
    TWKTG_NAM: TEdit;
    ColorDialog1: TColorDialog;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    BtnColor: TBitBtn;
    Label3: TLabel;
    TWKTG_PRIM: TEdit;
    procedure BtnSAVEClick(Sender: TObject);
    procedure BtnAPPLYClick(Sender: TObject);
    procedure BtnColorClick(Sender: TObject);
    procedure Color1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TWKTG_NAMChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_TWKTG: TEdit_TWKTG;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_TWKTG.BtnSAVEClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if SAVE then close;
end;

procedure TEdit_TWKTG.BtnAPPLYClick(Sender: TObject);
var
   r:double;
begin
  if (TWKTG_NAM.text='') then Messbox('Название категории товара не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('TWKTG_NAM',TWKTG_NAM.text);
        IBSAVE_ADD('TWKTG_PRIM',TWKTG_PRIM.text);
        if color1.checked then IBSAVE_ADD('TWKTG_COLOR',-1)
        else IBSAVE_ADD('TWKTG_COLOR',Shape1.Brush.color);
        Edit_TWKTG.tag:=IBSAVE_DOC('TWKTG',Edit_TWKTG.tag);
        if Edit_TWKTG.tag<0 then r:=Sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Rollback;
        Messbox('Ошибка при сохранении категории товара!',MessError,16);
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TEdit_TWKTG.BtnColorClick(Sender: TObject);
begin
     colorDialog1.color:=Shape1.Brush.color;
     if colorDialog1.Execute then begin
        Shape1.Brush.color:=colorDialog1.color;
        SAVE:=False;
     end;
end;

procedure TEdit_TWKTG.Color1Click(Sender: TObject);
begin
     SAVE:=false;
     Shape1.visible:=Color2.checked;
     BtnColor.visible:=Color2.checked;
end;

procedure TEdit_TWKTG.FormShow(Sender: TObject);
begin
     if Edit_TWKTG.tag<=0 then begin
        TWKTG_NAM.text:='';
        TWKTG_PRIM.text:='';
        Color1.checked:=true;
     end else begin
         WorkTransaction.Active:=False;
         IbQuery1.close;
         IbQuery1.SQL.clear;
         IbQuery1.SQL.add('select * from twktg where TWKTG_ID=:TWKTG_ID');
         IbQuery1.ParamByname('TWKTG_ID').asinteger:=Edit_TWKTG.tag;
         IbQuery1.Open;
         TWKTG_NAM.text:=IbQuery1.FieldByname('TWKTG_NAM').asstring;
         TWKTG_PRIM.text:=IbQuery1.FieldByname('TWKTG_PRIM').asstring;
         if IbQuery1.FieldByname('TWKTG_COLOR').asinteger<0 then begin
            Color1.checked:=true;
         end else begin
            Color2.checked:=true;
            Shape1.Brush.color:=IbQuery1.FieldByname('TWKTG_COLOR').asinteger;
         end;
         IbQuery1.close;
         WorkTransaction.Active:=False;
     end;
     Color1Click(Sender);
     SAVE:=True;
end;

procedure TEdit_TWKTG.TWKTG_NAMChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TEdit_TWKTG.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose:=False;
     if not SAVE then begin
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений!',MessSubmit,4+48+256)=6
        then CanClose:=True;
     end else CanClose:=True;
end;

end.
