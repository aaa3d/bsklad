unit EditSpisVid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ExtCtrls;

type
  TEdit_SpisVid = class(TForm)
    Label2: TLabel;
    SPISVID_NAM: TEdit;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    SpisVidTransaction: TIBTransaction;
    QuerySpisVid: TIBQuery;
    Image3: TImage;
    Label1: TLabel;
    SPISVID_ACTIV: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure SPISVID_NAMChange(Sender: TObject);
    procedure SPISVID_ACTIVChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_SpisVid: TEdit_SpisVid;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_SpisVid.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TEdit_SpisVid.BtnSaveClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if Save then close;
end;

procedure TEdit_SpisVid.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_SpisVid.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('ƒанные были изменены! ¬ы подтверждаете выход без сохранени€ изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

procedure TEdit_SpisVid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QuerySpisVid.close;
     SpisVidTransaction.Active:=False;
end;

procedure TEdit_SpisVid.FormShow(Sender: TObject);
begin
     if Edit_SpisVid.tag<0 then begin
        SpisVid_NAM.text:='';
        SpisVid_ACTIV.itemIndex:=0;
     end else begin
         SpisVidTransaction.Active:=False;
         QuerySpisVid.Close;
         QuerySpisVid.SQL.clear;
         QuerySpisVid.SQL.add('select * from SpisVid where SpisVid_id= :SpisVid_id');
         QuerySpisVid.ParamByname('SpisVid_ID').asinteger:=Edit_SpisVid.tag;
         QuerySpisVid.Open;
         SpisVid_NAM.text:=QuerySpisvid.FieldByname('SpisVid_NAM').asstring;
         case QuerySpisvid.FieldByname('SpisVid_ACTIV').asinteger of
              0: SpisVid_ACTIV.itemindex:=0;
              -1: SpisVid_ACTIV.itemindex:=1;
              1: SpisVid_ACTIV.itemindex:=2;
         end;
         QuerySpisVid.Close;
         SpisVidTransaction.Active:=False;
     end;
     Save:=True;
end;


procedure TEdit_SpisVid.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
  if (SpisVid_NAM.text='') then Messbox('Ќазвание вида приходной накладной не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('SpisVid_NAM',SpisVid_NAM.text);
        case SpisVid_ACTIV.itemindex of
             0: IBSAVE_ADD('SpisVid_ACTIV',0);
             1: IBSAVE_ADD('SpisVid_ACTIV',-1);
             2: IBSAVE_ADD('SpisVid_ACTIV',1);
        end;
        Edit_SpisVid.tag:=IBSAVE_DOC('SpisVid',Edit_SpisVid.tag);
        if Edit_SpisVid.tag<0 then r:=Sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('ќшибка при сохранении вида приходной накладной!',MessError,16);
     End;
  end;

end;

procedure TEdit_SpisVid.SPISVID_NAMChange(Sender: TObject);
begin
     Save:=False;
end;

procedure TEdit_SpisVid.SPISVID_ACTIVChange(Sender: TObject);
begin
     SAVE:=False;
end;

end.
