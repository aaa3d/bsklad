unit B5AdmEditOtdel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DefaultForm, ComCtrls, ToolWin, StdCtrls,B_utils;

type
  TB5Adm_Edit_Otdel = class(TDEFAULT_FORM)
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    Label1: TLabel;
    OTDEL_FULL: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OTDEL_FULLChange(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  B5Adm_Edit_Otdel: TB5Adm_Edit_Otdel;
  Save:boolean;

implementation

uses B5AdmData1;

{$R *.DFM}

procedure TB5Adm_Edit_Otdel.FormShow(Sender: TObject);
begin
  inherited;
  if tag<0 then begin
     // Новый фонд
     caption:='Новый отдел';
     Otdel_full.text:='';
  end else begin
     // Правка фонда
     if WorkOpen('select Otdel_full from Otdel '+
        ' where Otdel_id=:Otdel_id','Otdel_ID',tag) then begin
        Otdel_full.text:=Datamodule1.QueryWork.fieldByname('Otdel_FULL').asstring;
        caption:='Изменение отдела. "'+Otdel_Full.text+'"';
     end else err_open;
  end;
  Save:=True;
  BtnApply.Enabled:=False;
  BtnSave.Enabled:=False;
end;

procedure TB5Adm_Edit_Otdel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not Save then begin
    if Messbox(MessChange,
    MessSubmit,4+48+256)=6 then CanClose:=true
    else CanClose:=False;
  end else CanClose:=True;
end;

procedure TB5Adm_Edit_Otdel.OTDEL_FULLChange(Sender: TObject);
begin
  inherited;
  SAVE:=False;
  BtnApply.Enabled:=True;
  BtnSave.Enabled:=True;
end;

procedure TB5Adm_Edit_Otdel.BtnApplyClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
  inherited;
  if (trim(Otdel_FULL.text)='')
  then Messbox('Полное название не может быть пустой строкой!',MessSystem,48)
  else begin
    Show_wait;
    DataModule1.IBTransaction2.Active:=False;
    DataModule1.IBTransaction2.StartTransaction;
    Try
      IBSAVE_CLEAR;
      IBSAVE_ADD('Otdel_FULL',trim(Otdel_FULL.text));
      ID:=IBSAVE_DOC('Otdel',B5Adm_Edit_Otdel.tag);
      if ID<0 then r:=sqrt(-1);
      DataModule1.IBTransaction2.Commit;
      B5Adm_Edit_Otdel.tag:=ID;
      SAVE:=True;
      BtnApply.Enabled:=False;
      BtnSave.Enabled:=False;
    Except
      DataModule1.IBTransaction2.Rollback;
    End;
    DataModule1.IBTransaction2.Active:=False;
    Hide_wait;
  end;
end;

procedure TB5Adm_Edit_Otdel.BtnSaveClick(Sender: TObject);
begin
  inherited;
  if (not SAVE) and (BtnApply.enabled) then BtnApply.click;
  if SAVE then close;
end;

end.
