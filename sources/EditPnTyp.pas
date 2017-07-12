unit EditPnTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ExtCtrls;

type
  TEdit_Pntyp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PNTYP_SHORT: TEdit;
    PNTYP_FULL: TEdit;
    NUM_TYP: TComboBox;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    PnTypTransaction: TIBTransaction;
    QueryPnTyp: TIBQuery;
    Image3: TImage;
    Label4: TLabel;
    PNTYP_CALC: TComboBox;
    PNTYP_POST_CALC: TCheckBox;
    Label5: TLabel;
    Image1: TImage;
    ComboBox1: TComboBox;
    Image2: TImage;
    Label6: TLabel;
    ComboBox2: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PNTYP_SHORTChange(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure PNTYP_CALCChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CHECK_OPLATAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Pntyp: TEdit_Pntyp;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_Pntyp.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#10 then begin
        BtnApply.setfocus;
        BtnSave.setfocus;
        BtnSave.click;
     end;
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TEdit_Pntyp.BtnSaveClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if Save then close;
end;

procedure TEdit_Pntyp.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_Pntyp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

procedure TEdit_Pntyp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryPntyp.close;
     PnTypTransaction.Active:=False;
end;

procedure TEdit_Pntyp.FormShow(Sender: TObject);
var
   a:integer;
begin
     {Заполняем список картинок}
     Combobox1.Items.clear;
     Combobox2.Items.clear;
     for a:=1 to Datamodule1.ImageList1.Count do begin
         Combobox1.Items.Add('Картинка № '+inttostr(a));
         Combobox2.Items.Add('Картинка № '+inttostr(a));
     end;
     if Edit_Pntyp.tag<0 then begin
        Combobox2.itemindex:=0;
        Combobox1.itemindex:=0;
        PNTYP_SHORT.text:='';
        PNTYP_FULL.text:='';
        NUM_TYP.itemindex:=0;
        PNTYP_CALC.itemindex:=0;
     end else begin
         PnTypTransaction.Active:=False;
         QueryPntyp.Close;
         QueryPntyp.SQL.clear;
         QueryPntyp.SQL.add('select * from pntyp where pntyp_id= :pntyp_id');
         QueryPntyp.ParamByname('PNTYP_ID').asinteger:=Edit_Pntyp.tag;
         QueryPntyp.Open;
         Combobox1.itemindex:=QueryPntyp.FieldByname('DOC_PICTURE').asinteger;
         Combobox2.itemindex:=QueryPntyp.FieldByname('JOU_PICTURE').asinteger;
         PNTYP_SHORT.text:=QueryPntyp.FieldByname('PNTYP_SHORT').asstring;
         PNTYP_FULL.text:=QueryPntyp.FieldByname('PNTYP_FULL').asstring;
         NUM_TYP.itemindex:=QueryPntyp.FieldByname('NUM_TYP').asinteger-1;
         PNTYP_CALC.itemindex:=QueryPntyp.FieldByname('PNTYP_CALC').asinteger-1;
         if QueryPntyp.FieldByname('PNTYP_POST_CALC').asstring='1'
         then PNTYP_POST_CALC.checked:=true
         else PNTYP_POST_CALC.checked:=False;
         QueryPntyp.Close;
         PnTypTransaction.Active:=False;
     end;
     Save:=True;
end;

procedure TEdit_Pntyp.PNTYP_SHORTChange(Sender: TObject);
begin
     Save:=False;
end;

procedure TEdit_Pntyp.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
  if ((PNTYP_SHORT.text='') or (PNTYP_FULL.text='')) then Messbox('Сокращение и полное название типа приходной накладной не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('PNTYP_SHORT',PNTYP_SHORT.text);
        IBSAVE_ADD('PNTYP_FULL',PNTYP_FULL.text);
        IBSAVE_ADD('NUM_TYP',NUM_TYP.itemindex+1);
        IBSAVE_ADD('PNTYP_CALC',PNTYP_CALC.itemindex+1);
        IBSAVE_ADD('PNTYP_POST_CALC',PNTYP_POST_CALC.Checked);
        IBSAVE_ADD('DOC_PICTURE',Combobox1.itemindex);
        IBSAVE_ADD('JOU_PICTURE',Combobox2.itemindex);
        Edit_pntyp.tag:=IBSAVE_DOC('PNTYP',Edit_Pntyp.tag);
        if Edit_pntyp.tag<0 then r:=Sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('Ошибка при сохранении типа приходной накладной!',MessError,16);
     End;
  end;

end;

procedure TEdit_Pntyp.PNTYP_CALCChange(Sender: TObject);
begin
     Save:=False;
end;

procedure TEdit_Pntyp.ComboBox1Change(Sender: TObject);
var
   Rect:Trect;
   P:Tpoint;
begin
    {Затираем картинку}
    P.X:=1;
    P.Y:=1;
    Rect.Left:=Image1.Left;
    Rect.Top:=Image1.Top;
    Rect.Right:=Image1.Left+20;
    Rect.Bottom:=Image1.Top+20;
    Edit_PNTYP.canvas.Brush.Color:=clBtnFace;
    Edit_PNTYP.canvas.Brush.Style:=bsSolid;
    Edit_PNTYP.canvas.FillRect(Rect);
    {Загружаем картинку}
    DataModule1.ImageList1.Draw(Edit_Pntyp.Canvas,Image1.Left,Image1.Top,Combobox1.itemindex,True);
end;

procedure TEdit_Pntyp.ComboBox2Change(Sender: TObject);
var
   Rect:Trect;
   P:Tpoint;
begin
    {Затираем картинку}
    P.X:=1;
    P.Y:=1;
    Rect.Left:=Image2.Left;
    Rect.Top:=Image2.Top;
    Rect.Right:=Image2.Left+20;
    Rect.Bottom:=Image2.Top+20;
    Edit_PNTYP.canvas.Brush.Color:=clBtnFace;
    Edit_PNTYP.canvas.Brush.Style:=bsSolid;
    Edit_PNTYP.canvas.FillRect(Rect);
    {Загружаем картинку}
    DataModule1.ImageList1.Draw(Edit_Pntyp.Canvas,Image2.Left,Image2.Top,Combobox2.itemindex,True);
end;

procedure TEdit_Pntyp.FormActivate(Sender: TObject);
begin
     ComboBox1Change(Sender);
     ComboBox2Change(Sender);
end;

procedure TEdit_Pntyp.CHECK_OPLATAClick(Sender: TObject);
begin
    Save:=False;
end;

end.
