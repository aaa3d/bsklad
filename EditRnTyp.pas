unit EditRnTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ExtCtrls, ImgList, Mask, ToolEdit, CurrEdit, Buttons,DicNP;

type
  TEdit_Rntyp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RNTYP_SHORT: TEdit;
    RNTYP_FULL: TEdit;
    NUM_TYP: TComboBox;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    RnTypTransaction: TIBTransaction;
    QueryRnTyp: TIBQuery;
    Image3: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Cl: TCheckBox;
    Label6: TLabel;
    RNTYP_NDS: TComboBox;
    Label7: TLabel;
    NP: TEdit;
    BtnNP: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    checkTemp: TCheckBox;
    Label8: TLabel;
    cmbRealTyp: TComboBox;
    RNTYP_SPEED: TComboBox;
    Label9: TLabel;
    chkIn_USE: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RNTYP_SPEED1Click(Sender: TObject);
    procedure RNTYP_SHORTChange(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RNTYP_NDSChange(Sender: TObject);
    procedure ClClick(Sender: TObject);
    procedure BtnNPClick(Sender: TObject);
    procedure Refresh_np;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Rntyp: TEdit_Rntyp;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_Rntyp.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TEdit_Rntyp.BtnSaveClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if Save then close;
end;

procedure TEdit_Rntyp.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_Rntyp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

procedure TEdit_Rntyp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryRntyp.close;
     RnTypTransaction.Active:=False;
end;

procedure TEdit_Rntyp.FormShow(Sender: TObject);
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
     if Edit_Rntyp.tag<0 then begin
        Combobox2.itemindex:=0;
        Combobox1.itemindex:=0;
        RNTYP_SHORT.text:='';
        RNTYP_FULL.text:='';
        RNTYP_NDS.itemindex:=0;
        NUM_TYP.itemindex:=0;
     end else begin
         RnTypTransaction.Active:=False;
         QueryRntyp.Close;
         QueryRntyp.SQL.clear;
         QueryRntyp.SQL.add('select rntyp.*,(select  count(*) from cfg where '+
         'cfg_name="NO CLOSE PERIOD ON RNTYP" '+
         'and cfg_set1=rntyp.rntyp_id) as NOCLOSE from rntyp where rntyp_id= :rntyp_id');
         QueryRntyp.ParamByname('RNTYP_ID').asinteger:=Edit_Rntyp.tag;
         QueryRntyp.Open;
         if QueryRntyp.FieldByname('NOCLOSE').asinteger>0 then CL.checked:=true else CL.checked:=False;
         Combobox1.itemindex:=QueryRntyp.FieldByname('DOC_PICTURE').asinteger;
         Combobox2.itemindex:=QueryRntyp.FieldByname('JOU_PICTURE').asinteger;
         RNTYP_SHORT.text:=QueryRntyp.FieldByname('RNTYP_SHORT').asstring;
         RNTYP_FULL.text:=QueryRntyp.FieldByname('RNTYP_FULL').asstring;
         NUM_TYP.itemindex:=QueryRntyp.FieldByname('NUM_TYP').asinteger-1;
         RNTYP_SPEED.ItemIndex:=QueryRntyp.FieldByname('RNTYP_SPEED').AsInteger;

         RNTYP_NDS.itemindex:=QueryRntyp.FieldByname('RNTYP_NDS').asinteger;
         cmbRealTyp.ItemIndex:=QueryRntyp.FieldByname('REAL_TYP').asinteger-1;
         if ( QueryRntyp.FieldByname('TEMP').asstring='1') then
         	checkTemp.Checked:=true
            else checkTemp.Checked:=false;

         chkIn_Use.Checked := (QueryRntyp.FieldByname('IN_USE').asInteger = 1);
         QueryRntyp.Close;
         RnTypTransaction.Active:=False;
     end;
     ComboBox1Change(Sender);
     ComboBox2Change(Sender);
     refresh_np;
     Save:=True;
end;

procedure TEdit_Rntyp.RNTYP_SPEED1Click(Sender: TObject);
begin
     Save:=False;
end;

procedure TEdit_Rntyp.RNTYP_SHORTChange(Sender: TObject);
begin
     Save:=False;
end;

procedure TEdit_Rntyp.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
  if ((RNTYP_SHORT.text='') or (RNTYP_FULL.text='')) then Messbox('Сокращение и полное название типа расходной накладной не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('RNTYP_SHORT',RNTYP_SHORT.text);
        IBSAVE_ADD('RNTYP_NDS',RNTYP_NDS.itemindex);
        IBSAVE_ADD('RNTYP_FULL',RNTYP_FULL.text);
        IBSAVE_ADD('NUM_TYP',NUM_TYP.itemindex+1);
        IBSAVE_ADD('RNTYP_SPEED',RNTYP_SPEED.itemIndex);
        IBSAVE_ADD('DOC_PICTURE',Combobox1.itemindex);
        IBSAVE_ADD('JOU_PICTURE',Combobox2.itemindex);
		    IBSAVE_ADD('REAL_TYP',cmbRealTyp.itemindex+1);

        if chkIn_use.Checked then
          IBSAVE_ADD('IN_USE',1)
        else
          IBSAVE_ADD('IN_USE',0);




        IBSAVE_ADD('TEMP',checkTemp.checked);

        Edit_rntyp.tag:=IBSAVE_DOC('RNTYP',Edit_rntyp.tag);
        if Edit_rntyp.tag<0 then r:=Sqrt(-1);
        DataModule1.IbSaveSQL.close;
        if CL.checked then begin
          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_NAME','NO CLOSE PERIOD ON RNTYP');
          IBSAVE_ADD('CFG_SET1',Edit_rntyp.tag);
          if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
        end else begin
          ADD_SQL(DataModule1.IbSaveSQL,'delete from cfg where cfg_name="NO CLOSE PERIOD ON RNTYP" and cfg_set1=:RNTYP_ID');
          DataModule1.IbSaveSQL.Parambyname('RNTYP_ID').asinteger:=Edit_rntyp.tag;
          DataModule1.IbSaveSQL.ExecSQL;
        end;
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Save:=True;
        refresh_np;
     Except
        Datamodule1.IBTransaction2.Rollback;
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('Ошибка при сохранении типа расходной накладной!',MessError,16);
     End;
  end;

end;

procedure TEdit_Rntyp.ComboBox1Change(Sender: TObject);
var
   Rect:Trect;
   P:Tpoint;
begin
     Save:=False;
    {Затираем картинку}
    P.X:=1;
    P.Y:=1;
    Rect.Left:=Image1.Left;
    Rect.Top:=Image1.Top;
    Rect.Right:=Image1.Left+20;
    Rect.Bottom:=Image1.Top+20;
    Edit_RNTYP.canvas.Brush.Color:=clBtnFace;
    Edit_RNTYP.canvas.Brush.Style:=bsSolid;
    Edit_RNTYP.canvas.FillRect(Rect);
    {Загружаем картинку}
    DataModule1.ImageList1.Draw(Edit_Rntyp.Canvas,Image1.Left,Image1.Top,Combobox1.itemindex,True);
end;

procedure TEdit_Rntyp.ComboBox2Change(Sender: TObject);
var
   Rect:Trect;
   P:Tpoint;
begin
     Save:=False;
    {Затираем картинку}
    P.X:=1;
    P.Y:=1;
    Rect.Left:=Image2.Left;
    Rect.Top:=Image2.Top;
    Rect.Right:=Image2.Left+20;
    Rect.Bottom:=Image2.Top+20;
    Edit_RNTYP.canvas.Brush.Color:=clBtnFace;
    Edit_RNTYP.canvas.Brush.Style:=bsSolid;
    Edit_RNTYP.canvas.FillRect(Rect);
    {Загружаем картинку}
    DataModule1.ImageList1.Draw(Edit_Rntyp.Canvas,Image2.Left,Image2.Top,Combobox2.itemindex,True);
end;

procedure TEdit_Rntyp.FormActivate(Sender: TObject);
begin
     ComboBox1Change(Sender);
     ComboBox2Change(Sender);
end;

procedure TEdit_Rntyp.RNTYP_NDSChange(Sender: TObject);
begin
   if RNTYP_NDS.itemindex<0 then RNTYP_NDS.itemindex:=0;
     Save:=False;
end;

procedure TEdit_Rntyp.ClClick(Sender: TObject);
begin
     Save:=False;

end;

procedure TEdit_Rntyp.refresh_np;
begin
  // Запрашиваем ставку налога с продаж
  if Edit_rntyp.tag>0 then begin
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select np from np_current(:rntyp_id,:dt)');
   QueryWork.ParamByname('rntyp_id').asinteger:=edit_rntyp.Tag;
   QueryWork.ParamByname('dt').asdatetime:=date();
   QueryWork.open;
   NP.text:=floattostrf(QueryWork.fieldByname('NP').asfloat,fffixed,19,2)+'%';
   BtnNP.enabled:=true;
  end else begin
    NP.text:='неизвестно';
    BtnNP.enabled:=False;
  end;
end;

procedure TEdit_Rntyp.BtnNPClick(Sender: TObject);
begin
   application.createForm(TDIC_NP,DIC_NP);
   DIC_NP.caption:='Ставка налога с продаж для "'+RNTYP_FULL.text+'"';
   DIC_NP.tag:=Edit_rntyp.tag;
   DIC_NP.ShowModal;
   DIC_NP.destroy;
   Refresh_np;
end;

end.
