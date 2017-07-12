unit JouRemon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Data1,B_Utils,B_DButils, Menus, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TJou_REMON = class(TDefault_Journal)
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    N1: TMenuItem;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    N2: TMenuItem;
    MnPrint: TMenuItem;
    MnFIND: TMenuItem;
    N3: TMenuItem;
    MnInterval: TMenuItem;
    N4: TMenuItem;
    MnAdm: TMenuItem;
    REMONTransaction: TIBTransaction;
    ListREMON: TIBQuery;
    DsREMON: TDataSource;
    ListREMONREMON_ID: TIntegerField;
    ListREMONREMON_PROW: TIBStringField;
    ListREMONREMON_DATE: TDateTimeField;
    ListREMONREMON_FULL_NUM: TIBStringField;
    ListREMONREMON_COLOR: TIntegerField;
    ListREMONUS_FULL: TIBStringField;
    ListREMONREMON_OSN: TIBStringField;
    ListREMONOWNER_FULL: TIBStringField;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    MnCopy: TMenuItem;
    N6: TMenuItem;
    ListREMONREMON_SHOP: TIBStringField;
    ListREMONREMON_SHOP_MET: TIBStringField;
    procedure BtnProwClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure ListREMONAfterOpen(DataSet: TDataSet);
    procedure ListREMONAfterScroll(DataSet: TDataSet);
    procedure RefreshButton;
    procedure RefreshList;
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnAdmClick(Sender: TObject);
    procedure BtnSubDocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAN_NEW,CAN_ADM:boolean;
  Jou_REMON: TJou_REMON;
  EN1,EN2:boolean;
  DT1,DT2:tDatetime;
  G_KEY:ansistring;

implementation

uses FindDocNum, DateInterval, SetJouDate,
  DocRemon, AdminRemon;

{$R *.DFM}

procedure TJou_REMON.BtnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=ListREMON.fieldByname('REMON_ID').asinteger;
  if PROV_REMON(ID,ListREMON.fieldbyname('REMON_FULL_NUM').asstring+
  ' от '+date_sokr(ListREMON.fieldbyname('REMON_DATE').asdatetime)+' ') then begin
     RefreshList;
     ListRemon.Locate('REMON_ID',ID,[]);
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_REMON.BtnNewClick(Sender: TObject);
begin
  Application.CreateForm(TDoc_REMON,Doc_REMON);
  Doc_REMON.tag:=-1;
  Doc_REMON.showModal;
  if Doc_REMON.tag>0 then begin
    DT1:=Doc_REMON.REMON_DATE.date;
    DT2:=Doc_REMON.REMON_DATE.date;
    refreshlist;
    ListREMON.locate('REMON_ID',Doc_REMON.tag,[]);
  end;
  Doc_REMON.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJou_REMON.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  Application.CreateForm(TDoc_REMON,Doc_REMON);
  ID:=ListREMON.fieldbyname('REMON_ID').asinteger;
  Doc_REMON.tag:=ID;
  Doc_REMON.showModal;
  Doc_REMON.destroy;
  RefreshList;
  ListREMON.locate('REMON_ID',ID,[]);
end;

procedure TJou_REMON.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin
  if Messbox('Создать копию Акта переоценки № '+ListREMON.fieldbyname('REMON_FULL_NUM').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           ADD_SQL(
           DataModule1.IbSaveSQL,'select * from copy_REMON( :REMON_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('REMON_ID').asinteger:=ListREMON.fieldbyname('REMON_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_REMON_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              DT1:=date();
              DT2:=date();
              RefreshList;
              ListREMON.locate('REMON_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TJou_REMON.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=ListREMON.fieldByname('REMON_ID').asinteger;
  if Messbox('Удалить Акт переоценки № '+ListREMON.fieldByname('REMON_FULL_NUM').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IF IBDELETE_DOC('REMON',ID) THEN Datamodule1.IBTransaction2.Commit
     else Datamodule1.IBTransaction2.RollBAck;
     Datamodule1.IBTransaction2.Active:=False;
     RefreshList;
     ListRemon.locate('REMON_ID',ID,[]);
  end;
  RxDbGrid1.Setfocus;
end;

procedure TJou_REMON.BtnPrintClick(Sender: TObject);
begin
     PRINT_REMON(ListREMON.fieldbyname('REMON_ID').asinteger,Default_sklad);
end;

procedure TJou_REMON.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=12; {Метка, что искать в актах смены качества}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT BG_STRIPTIME(REMON_DATE) AS REMON_DATE FROM REMON WHERE REMON_ID=:REMON_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('REMON_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('REMON_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refreshlist;
     ListREMON.locate('REMON_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_REMON.BtnIntervalClick(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    Refreshlist;
  end;
  Date_interval.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJou_REMON.RefreshList;
begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     ListRemon.Disablecontrols;
     REMONTransaction.Active:=False;
     ListREMON.close;
     ListREMON.PAramByname('DT1').asdatetime:=DT1;
     ListREMON.PAramByname('DT2').asdatetime:=DT2+1-Sekond1;
     ListREMON.Open;
     ListREMON.Enablecontrols;
end;

procedure TJou_REMON.RefreshButton;
begin
     BtnProw.enabled:=EN2 and EN1;
     MnProw.enabled:=EN2 and EN1;
     BtnNEW.enabled:=CAN_NEW;
     MnNEW.enabled:=CAN_NEW;
     BtnCopy.enabled:=CAN_NEW and EN1;
     MnCopy.enabled:=CAN_NEW and EN1;
     BtnOPEN.enabled:=EN1;
     MnOPEN.enabled:=EN1;
     BtnDel.enabled:=EN2 and (EN1);
     MnDel.enabled:=EN2 and (EN1);
     BtnPrint.enabled:=(EN1);
     MnPrint.enabled:=(EN1);
     BtnFIND.enabled:=True;
     MnFIND.enabled:=True;
     BtnInterval.enabled:=True;
     MnInterval.enabled:=True;
     BtnAdm.enabled:=EN1 and CAN_ADM;
     MnAdm.enabled:=EN1 and CAN_ADM;
end;

procedure TJou_REMON.ListREMONAfterOpen(DataSet: TDataSet);
begin
  EN1:=not ListREMON.eof;
  if EN1 then En2:=ListREMON.fieldByname('REMON_PROW').asstring='0'
  else EN2:=False;
  RefreshButton;
end;

procedure TJou_REMON.ListREMONAfterScroll(DataSet: TDataSet);
begin
  if EN1 then En2:=ListREMON.fieldByname('REMON_PROW').asstring='0'
  else EN2:=False;
  RefreshButton;
end;

procedure TJou_REMON.FormShow(Sender: TObject);
begin
  inherited;
  CAN_NEW:=Check_Dostup('$JOU.REMON.NEW');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  DT1:=date();
  DT2:=date();
  RefreshList;
end;

procedure TJou_REMON.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_REMON.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='REMON_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.Style:=[];
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_SHOP_MET').Asstring='1') and
     (Column.Field.FullName='REMON_SHOP') then begin
        RxDbgrid1.Canvas.Brush.color:=$009FFF9F;
        RxDbgrid1.Canvas.Font.Style:=[FsBold];
        RxDbgrid1.Canvas.Font.color:=ClGreen;
     end;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='REMON_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_COLOR').Asinteger;
     end;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
     if Column.Index=0 then begin {Колонка проводки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_PROW').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           22,True);
        end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           -1,True);
     end;
    end;
    if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='REMON_NUM_FULL' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Font.Style:=[];
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REMON_SHOP_MET').Asstring='1') and
           (Column.Field.FullName='REMON_SHOP') then begin
                RxDbgrid1.Canvas.Brush.Color:=ClGreen;
                RxDbgrid1.Canvas.Font.Style:=[FsBold];
                RxDbgrid1.Canvas.Font.color:=$009FFF9F;
           end;
    end;
end;

procedure TJou_REMON.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1-1;
     DT2:=DT2-1;
     Refreshlist;
     Key:=#0;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1+1;
     DT2:=DT2+1;
     Refreshlist;
     Key:=#0;
  end;
  if KEY in ['c','C','С','c'] then begin
     {Дата сегодня}
     DT1:=date();
     DT2:=date();
     Refreshlist;
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
        Refreshlist;
     end;
     SET_JOUDATE.Destroy;
  end;
end;

procedure TJou_REMON.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TJou_REMON.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TJou_REMON.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(IbQuery1,'select REMON_NUM from remon where remon_id=:remon_id');
  IbQuery1.paramByname('REMON_ID').asinteger:=ListRemon.fieldbyname('REMON_ID').asinteger;
  IbQuery1.Open;
  Application.createForm(TADMIN_REMON,ADMIN_REMON);
  ADMIN_REMON.NUM.value:=IbQuery1.fieldbyname('REMON_NUM').asinteger;
  ADMIN_REMON.showModal;
  if ADMIN_REMON.tag>0 then begin
     {Изменяем данные накладной}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('REMON_NUM',int(ADMIN_REMON.NUM.value));
     ID:=ListRemon.fieldbyname('REMON_ID').asinteger;
     IF IBSAVE_DOC('REMON',ID)>0 then begin
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        RefreshList;
        ListRemon.locate('REMON_ID',ID,[]);
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_REMON.destroy;
end;

procedure TJou_REMON.BtnSubDocClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=ListRemon.fieldbyname('REMON_ID').asinteger;
  SUBDOC(7,ID);
  RefreshList;
  ListRemon.Locate('REMON_ID',ID,[]);
  RxDbgrid1.setfocus;
end;

end.