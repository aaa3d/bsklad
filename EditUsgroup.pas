unit EditUsgroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, StdCtrls, ComCtrls, ToolWin, Db,
  IBCustomDataSet, IBQuery, IBDatabase, Menus, ExtCtrls, DualList, RXSpin;

type
  TEdit_USGROUP = class(TForm)
    ToolBar1: TToolBar;
    BtnSAVE: TToolButton;
    BtnApply: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    USGROUP_NAME: TEdit;
    USGROUP_PRIM: TEdit;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    Image3: TImage;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    DualList: TDualListDialog;
    Label3: TLabel;
    CLOSE_PER: TRxSpinEdit;
    procedure BtnSAVEClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure USGROUP_NAMEChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_USGROUP: TEdit_USGROUP;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_USGROUP.BtnSAVEClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if SAVE then close;
end;

procedure TEdit_USGROUP.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
  if (USGROUP_NAME.text='') then Messbox('Название вида доступа не может быть пустой строкой!',MessSystem,48)
  else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('USGROUP_NAME',USGROUP_NAME.text);
        IBSAVE_ADD('USGROUP_PRIM',USGROUP_PRIM.text);
        IBSAVE_ADD('CLOSE_PER',CLOSE_PER.Value);
        Edit_USGROUP.tag:=IBSAVE_DOC('USGROUP',Edit_USGROUP.tag);
        if Edit_USGROUP.tag<0 then r:=Sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('Ошибка при сохранении вида доступа!',MessError,16);
     End;
  end;
end;

procedure TEdit_USGROUP.FormShow(Sender: TObject);
begin
     if Edit_USGROUP.tag<=0 then begin
        USGROUP_NAME.text:='';
        USGROUP_PRIM.text:='';
     end else begin
         WorkTransaction.Active:=False;
         IbQuery1.close;
         ADD_SQL(IbQuery1,'select * from USGROUP WHERE USGROUP_ID=:USGROUP_ID');
         IbQuery1.ParamByname('USGROUP_ID').asinteger:=Edit_USGROUP.tag;
         IbQuery1.Open;
         USGROUP_NAME.text:=IbQuery1.fieldByname('USGROUP_NAME').asstring;
         USGROUP_PRIM.text:=IbQuery1.fieldByname('USGROUP_PRIM').asstring;
         CLOSE_PER.Value:=IbQuery1.fieldByname('CLOSE_PER').asinteger;
         IbQuery1.close;
         WorkTransaction.Active:=False;
     end;
     SAVE:=True;
end;

procedure TEdit_USGROUP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     Canclose:=False;
     if SAVE then Canclose:=True else begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6 then CanClose:=True;
     end;
end;

procedure TEdit_USGROUP.USGROUP_NAMEChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TEdit_USGROUP.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TEdit_USGROUP.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
