unit Editzone1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ExtCtrls;

type
  TEdit_zone1 = class(TForm)
    Label2: TLabel;
    RNVID_NAM: TEdit;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    RnVidTransaction: TIBTransaction;
    QueryRnVid: TIBQuery;
    Image3: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure RNVID_NAMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_zone1: TEdit_zone1;
  SAVE:boolean;

implementation

uses EditRnVid;

{$R *.DFM}

procedure TEdit_zone1.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TEdit_zone1.BtnSaveClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if Save then close;
end;

procedure TEdit_zone1.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_zone1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('ƒанные были изменены! ¬ы подтверждаете выход без сохранени€ изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

procedure TEdit_zone1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryRnVid.close;
     RnVidTransaction.Active:=False;
end;

procedure TEdit_zone1.FormShow(Sender: TObject);
begin
     if Edit_Rnvid.tag<0 then begin
        RnVid_NAM.text:='';
     end else begin
         RnVidTransaction.Active:=False;
         QueryRnVid.Close;
         QueryRnVid.SQL.clear;
         QueryRnVid.SQL.add('select * from RnVid where RnVid_id= :RnVid_id');
         QueryRnVid.ParamByname('RnVid_ID').asinteger:=Edit_RnVid.tag;
         QueryRnVid.Open;
         RnVid_NAM.text:=QueryRnvid.FieldByname('RnVid_NAM').asstring;
         QueryRnVid.Close;
         RnVidTransaction.Active:=False;
     end;
     Save:=True;
end;


procedure TEdit_zone1.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
  if (RnVid_NAM.text='') then Messbox('Ќазвание вида расходной накладной не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('RNVID_NAM',RNVID_NAM.text);
        Edit_rnVid.tag:=IBSAVE_DOC('RNVID',Edit_rnVid.tag);
        if Edit_rnVid.tag<0 then r:=Sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('ќшибка при сохранении вида расходной накладной!',MessError,16);
     End;
  end;

end;

procedure TEdit_zone1.RNVID_NAMChange(Sender: TObject);
begin
     Save:=False;
end;

end.
