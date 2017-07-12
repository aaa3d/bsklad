unit EditPnVid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ExtCtrls;

type
  TEdit_PnVid = class(TForm)
    Label2: TLabel;
    PNVID_NAM: TEdit;
    BtnSave: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    PnVidTransaction: TIBTransaction;
    QueryPnVid: TIBQuery;
    Image3: TImage;
    Label1: TLabel;
    PNVID_ACTIV: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure PNVID_NAMChange(Sender: TObject);
    procedure PNVID_ACTIVChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_PnVid: TEdit_PnVid;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_PnVid.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TEdit_PnVid.BtnSaveClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if Save then close;
end;

procedure TEdit_PnVid.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_PnVid.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('ƒанные были изменены! ¬ы подтверждаете выход без сохранени€ изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

procedure TEdit_PnVid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryPnVid.close;
     PnVidTransaction.Active:=False;
end;

procedure TEdit_PnVid.FormShow(Sender: TObject);
begin
     if Edit_Pnvid.tag<0 then begin
        PnVid_NAM.text:='';
        PnVid_ACTIV.itemIndex:=0;
     end else begin
         PnVidTransaction.Active:=False;
         QueryPnVid.Close;
         QueryPnVid.SQL.clear;
         QueryPnVid.SQL.add('select * from PnVid where PnVid_id= :PnVid_id');
         QueryPnVid.ParamByname('PnVid_ID').asinteger:=Edit_PnVid.tag;
         QueryPnVid.Open;
         PnVid_NAM.text:=QueryPnvid.FieldByname('PnVid_NAM').asstring;
         case QueryPnvid.FieldByname('PnVid_ACTIV').asinteger of
              0: PNVID_ACTIV.itemindex:=0;
              -1: PNVID_ACTIV.itemindex:=1;
              1: PNVID_ACTIV.itemindex:=2;
         end;
         QueryPnVid.Close;
         PnVidTransaction.Active:=False;
     end;
     Save:=True;
end;


procedure TEdit_PnVid.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
  if (PNVid_NAM.text='') then Messbox('Ќазвание вида приходной накладной не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('PNVID_NAM',PNVID_NAM.text);
        case PNVID_ACTIV.itemindex of
             0: IBSAVE_ADD('PNVID_ACTIV',0);
             1: IBSAVE_ADD('PNVID_ACTIV',-1);
             2: IBSAVE_ADD('PNVID_ACTIV',1);
        end;
        Edit_PnVid.tag:=IBSAVE_DOC('PNVID',Edit_PnVid.tag);
        if Edit_PnVid.tag<0 then r:=Sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('ќшибка при сохранении вида приходной накладной!',MessError,16);
     End;
  end;

end;

procedure TEdit_PnVid.PNVID_NAMChange(Sender: TObject);
begin
     Save:=False;
end;

procedure TEdit_PnVid.PNVID_ACTIVChange(Sender: TObject);
begin
     SAVE:=False;
end;

end.
