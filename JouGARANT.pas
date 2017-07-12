unit JouGARANT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,
  Db, IBCustomDataSet, IBQuery,B_DButils,B_Utils,IBDatabase,
  Menus,DocST;

type
  TJou_GARANT = class(TDefault_Journal)
    QrGarantList: TIBQuery;
    DsGarantList: TDataSource;
    GarantListTranSaction: TIBTransaction;
    IBQuery1: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnNEW: TMenuItem;
    MnOPEN: TMenuItem;
    MnCopy: TMenuItem;
    MnDEL: TMenuItem;
    N8: TMenuItem;
    MnPRINT: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnInterval: TMenuItem;
    QrGarantListGARANT_ID: TIntegerField;
    QrGarantListGARANT_FULL_NUM: TIBStringField;
    QrGarantListGARANT_DT: TDateTimeField;
    QrGarantListGARANT_COLOR: TIntegerField;
    QrGarantListTW_NAM: TIBStringField;
    QrGarantListTW_NUM: TIBStringField;
    QrGarantListTW_MONEY: TFloatField;
    QrGarantListGARANT_MES: TIntegerField;
    QrGarantListUS_FULL: TIBStringField;
    QrGarantListNAKL: TIBStringField;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrGarantListAfterScroll(DataSet: TDataSet);
    procedure QrGarantListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jou_GARANT: TJou_GARANT;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;

implementation

uses DateInterval, FindDocNum, SetJouDate, EditGarant;

{$R *.DFM}

procedure TJou_GARANT.FormShow(Sender: TObject);
begin
  inherited;
  G_KEY:=#0;
  DT1:=Date();
  DT2:=Date();
  Refresh_list;
  btnNew.Enabled := CHECK_DOSTUP('$JOU.GARANT_TALON.NEW');
end;

Procedure TJou_GARANT.refresh_Btn;
begin
     BtnDel.Enabled:=EnEof;
     MnDel.Enabled:=EnEof;
end;

Procedure TJou_GARANT.refresh_list;
begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='ЗА СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     QrGarantList.close;
     QrGarantList.ParamByname('DT1').asdatetime:=DT1;
     QrGarantList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     GarantListTransaction.Active:=False;
     QrGarantList.Open;
end;

procedure TJou_GARANT.QrGarantListAfterScroll(DataSet: TDataSet);
begin
  Refresh_Btn;
end;

procedure TJou_GARANT.QrGarantListAfterOpen(DataSet: TDataSet);
begin
  if QrGarantList.eof then EnEof:=false else EnEof:=true;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnCopy.enabled:=EnEof;
  MnCopy.enabled:=EnEof;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  Refresh_Btn;
end;

procedure TJou_GARANT.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('GARANT_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='GARANT_FULL_NUM' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('GARANT_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('GARANT_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='GARANT_FULL_NUM' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('GARANT_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('GARANT_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='GARANT_FULL_NUM' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('GARANT_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
end;

procedure TJou_GARANT.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_GARANT.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY='-' then begin
     DT1:=DT1-1;
     DT2:=DT2-1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY='+' then begin
     DT1:=DT1+1;
     DT2:=DT2+1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY in ['c','C','с','С'] then begin
     DT1:=date();
     DT2:=date();
     Refresh_list;
  end;
  if (KEY in ['i','I','ш','Ш']) and (BtnInterval.enabled) then begin
     Key:=#0;
     BtnInterval.click;
  end;
  if key  in ['0'..'9'] then begin
     G_KEY:=Key;
     Key:=#0;
     BtnFind.click;
  end;
  if key=#27 then Close;
  if key='/' then begin
     key:=#0;
     Application.createForm(TSET_JOUDATE,SET_JOUDATE);
     SET_JOUDATE.showModal;
     if SET_JOUDATE.tag>0 then begin
        DT1:=SET_JOUDATE.DateEdit1.date;
        DT2:=SET_JOUDATE.DateEdit1.date;
        Refresh_list;
     end;
     SET_JOUDATE.Destroy;
  end;
end;

procedure TJou_GARANT.BtnIntervalClick(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    Refresh_list;
  end;
  Date_interval.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJou_GARANT.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrGarantList.fieldByname('GARANT_ID').asinteger;
  Application.CreateForm(TEdit_GARANT,Edit_GARANT);
  Edit_GARANT.tag:=ID;
  Edit_GARANT.showModal;
  if Edit_GARANT.tag>0 then begin
    DT1:=Edit_GARANT.GARANT_DT.date;
    DT2:=Edit_GARANT.GARANT_DT.date;
    refresh_list;
    QrGarantList.locate('GARANT_ID',ID,[]);
  end;
  Edit_GARANT.destroy;
end;

procedure TJou_GARANT.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TJou_GARANT.BtnNewClick(Sender: TObject);
begin
  Application.CreateForm(TEdit_GARANT,Edit_GARANT);
  Edit_GARANT.tag:=-1;
  Edit_GARANT.showModal;
  if Edit_GARANT.tag>0 then begin
    DT1:=Edit_GARANT.GARANT_DT.date;
    DT2:=Edit_GARANT.GARANT_DT.date;
    refresh_list;
    QrGarantList.locate('GARANT_ID',Edit_GARANT.tag,[]);
  end;
  Edit_GARANT.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJou_GARANT.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrGarantList.fieldByname('GARANT_ID').asinteger;
  if Messbox('Удалить гарантийный талон № '+QrGarantList.fieldByname('GARANT_FULL_NUM').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       QrGarantList.DisableControls;
       QrGarantList.Close;
       GarantListTransaction.Active:=False;
       GarantListTransaction.StartTransaction;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.add('DELETE FROM GARANT WHERE GARANT_ID=:GARANT_ID');
       IbQuery1.ParamByname('GARANT_ID').asinteger:=ID;
       Try
         IbQuery1.ExecSQL;
         GarantListTransaction.Commit;
       except
         GarantListTransaction.Rollback;
       end;
       GarantListTransaction.Active:=False;
       QrGarantList.Open;
       QrGarantList.locate('GARANT_ID',ID,[]);
       QrGarantList.EnableControls;
  end;

end;

procedure TJou_GARANT.BtnPrintClick(Sender: TObject);
begin
  PRINT_GARANT_TALON(QrGarantList.fieldbyname('GARANT_ID').asinteger);
end;

procedure TJou_GARANT.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=7; {Метка, что искать в гарантийных талонах}
  FIND_DOCNUM.Edit1.tag:=0;
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     FIND_DOCNUM.IbQuery1.close;
     FIND_DOCNUM.IbQuery1.SQL.clear;
     FIND_DOCNUM.IbQuery1.SQL.add('SELECT bg_STRIPTIME(GARANT_DT) AS GARANT_DT FROM GARANT WHERE GARANT_ID=:GARANT_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('GARANT_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('GARANT_DT').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrGarantList.locate('GARANT_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_GARANT.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;


end.

