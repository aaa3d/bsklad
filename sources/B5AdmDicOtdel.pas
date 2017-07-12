unit B5AdmDicOtdel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DefaultForm, SpeedBar, RxGIF, ExtCtrls,
  B5AdmData1, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, Db,
  IBCustomDataSet, IBQuery, IBDatabase,b_utils
  ;

type
  TB5Adm_DIC_Otdel = class(TDEFAULT_FORM)
    OtdelTransaction: TIBTransaction;
    QueryOtdel: TIBQuery;
    DsOtdel: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    QueryOtdelOTDEL_ID: TIntegerField;
    QueryOtdelOTDEL_FULL: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QueryOtdelAfterOpen(DataSet: TDataSet);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  B5Adm_DIC_Otdel: TB5Adm_DIC_Otdel;

implementation

uses B5AdmEditOtdel;

{$R *.DFM}

procedure TB5Adm_DIC_Otdel.FormShow(Sender: TObject);
begin
  inherited;
  SHow_read;
  OtdelTransaction.Active:=False;
  QueryOtdel.close;
  QueryOtdel.Open;
  B5Adm_Dic_Otdel.SetFocus;
  Hide_wait;
end;

procedure TB5Adm_DIC_Otdel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QueryOtdel.close;
  OtdelTransaction.Active:=False;
end;

procedure TB5Adm_DIC_Otdel.QueryOtdelAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BtnDel.enabled:=not QueryOtdel.Eof;
  BtnOpen.Enabled:=not QueryOtdel.eof;
end;

procedure TB5Adm_DIC_Otdel.BtnNewClick(Sender: TObject);
var
  ID:integer;
begin
  inherited;
  ID:=QueryOtdel.fieldByname('OTDEL_ID').asinteger;
  Application.createForm(TB5Adm_Edit_Otdel,B5Adm_Edit_Otdel);
  B5Adm_Edit_Otdel.tag:=-1;
  B5Adm_Edit_Otdel.showModal;
  ID:=B5Adm_Edit_Otdel.tag;
  B5Adm_Edit_Otdel.destroy;
  if ID>0 then begin
    SHow_read;
    OtdelTransaction.Active:=False;
    QueryOtdel.close;
    QueryOtdel.Open;
    QueryOtdel.Locate('Otdel_ID',ID,[]);
    Hide_wait;
  end;
end;

procedure TB5Adm_DIC_Otdel.BtnOpenClick(Sender: TObject);
var
  ID:integer;
begin
  inherited;
  ID:=QueryOtdel.fieldByname('Otdel_ID').asinteger;
  Application.createForm(TB5Adm_Edit_Otdel,B5Adm_Edit_Otdel);
  B5Adm_Edit_Otdel.tag:=ID;
  B5Adm_Edit_Otdel.showModal;
  B5Adm_Edit_Otdel.destroy;
  SHow_read;
  OtdelTransaction.Active:=False;
  QueryOtdel.close;
  QueryOtdel.Open;
  QueryOtdel.Locate('Otdel_ID',ID,[]);
  Hide_wait;
end;

procedure TB5Adm_DIC_Otdel.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if BtnOpen.enabled then BtnOpen.click;
end;

procedure TB5Adm_DIC_Otdel.RxDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;

end;

procedure TB5Adm_DIC_Otdel.BtnDelClick(Sender: TObject);
begin
  inherited;
  if Messbox('Удалить отдел "'+QueryOtdel.fieldbyname('Otdel_FULL').asstring+'" без возможности восстановления?',MessSubmitDelete,4+48+256)=6 then begin
    DataModule1.IBTransaction2.Active:=False;
    DataModule1.IBTransaction2.StartTransaction;
    if IBDELETE_DOC('Otdel',QueryOtdel.fieldbyname('Otdel_ID').asinteger) then begin
      DataModule1.IBTransaction2.Commit;
      DataModule1.IBTransaction2.Active:=False;
      SHow_read;
      OtdelTransaction.Active:=False;
      QueryOtdel.close;
      QueryOtdel.Open;
      Hide_wait;
    end else
    DataModule1.IBTransaction2.Rollback;
    DataModule1.IBTransaction2.Active:=False;

  end;
end;

end.
