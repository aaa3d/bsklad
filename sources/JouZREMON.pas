unit JouZREMON;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Data1,b_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  StdCtrls, RxLookup, ImgList, ActnList;

type
  TJOU_ZREMON = class(TDefault_Journal)
    JouTransaction: TIBTransaction;
    QueryJou: TIBQuery;
    DsJou: TDataSource;
    QueryJouZREMON_ID: TIntegerField;
    QueryJouZREMON_STAT: TIntegerField;
    QueryJouZREMON_NUM: TIntegerField;
    QueryJouZREMON_DATE: TDateTimeField;
    QueryJouZREMON_OSN: TIBStringField;
    QueryJouUS_FULL: TIBStringField;
    ToolBar2: TToolBar;
    Label1: TLabel;
    US: TRxDBLookupCombo;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    Label2: TLabel;
    SOST: TComboBox;
    UsTransaction: TIBTransaction;
    DicUs: TIBQuery;
    DsUs: TDataSource;
    DicUsUS_ID: TIntegerField;
    DicUsUS_FULL: TIBStringField;
    QueryJouZREMON_FULLNUM: TIBStringField;
    QueryJouSHOP_COLOR: TIntegerField;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActNew: TAction;
    ActOpen: TAction;
    ActDel: TAction;
    ActPrint: TAction;
    ActSubDoc: TAction;
    QueryJouZREMON_SHOP_FULL: TIBStringField;
    QueryJouZREMON_SHOP: TIntegerField;
    QueryJouZREMON_STAT_NAME: TIBStringField;
    procedure BtnIntervalClick(Sender: TObject);
    Procedure refresh_Btn;
    Procedure refresh_list;
    procedure QueryJouAfterScroll(DataSet: TDataSet);
    procedure QueryJouAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure USChange(Sender: TObject);
    procedure SOSTChange(Sender: TObject);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ActNewExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ActSubDocExecute(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JOU_ZREMON: TJOU_ZREMON;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  Can_Refresh:boolean;
  CanSubdoc:boolean;

implementation

uses DateInterval, SetJouDate, FindDocNum, DocZRemon;

{$R *.DFM}



procedure TJOU_ZREMON.BtnIntervalClick(Sender: TObject);
begin
  inherited;
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

Procedure TJOU_ZREMON.refresh_Btn;
begin
     ActNew.enabled:=True;
     ActOpen.enabled:=EnEof;
     ActDel.enabled:=(EnEof) and (QueryJou.fieldByname('ZREMON_STAT').asstring='1');
     ActPrint.enabled:=EnEof;
     ActSubDoc.enabled:=(EnEof) and (QueryJou.fieldByname('ZREMON_STAT').asinteger in [3,4]) and CanSubDoc;
end;

Procedure TJOU_ZREMON.refresh_list;
var id: integer;
begin
   if Can_Refresh then begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;

     id:= strtoint( copy( SOST.Items[sost.itemindex], length(Sost.Items[sost.ItemIndex])-1, 2));

     JouTransaction.Active:=False;
     QueryJou.close;
     QueryJou.ParamByname('STAT').asinteger:=id;
     QueryJou.ParamByname('MEN_ID').asstring:=US.value;
     QueryJou.ParamByname('DT1').asdatetime:=DT1;
     QueryJou.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QueryJou.Open;
   end;
end;


procedure TJOU_ZREMON.QueryJouAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Refresh_Btn;
end;

procedure TJOU_ZREMON.QueryJouAfterOpen(DataSet: TDataSet);
begin
  inherited;
  EnEof:=not QueryJou.Eof;
  Refresh_Btn;
end;

procedure TJOU_ZREMON.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1-1;
     DT2:=DT2-1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1+1;
     DT2:=DT2+1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY in ['c','C','С','c'] then begin
     {Дата сегодня}
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

procedure TJOU_ZREMON.BtnFindClick(Sender: TObject);
begin
  inherited;
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=22; {Метка, что искать в заявках на переоценку}
  FIND_DOCNUM.Edit1.tag:=0; {Не анализируется}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     FIND_DOCNUM.IbQuery1.close;
     FIND_DOCNUM.IbQuery1.SQL.clear;
     FIND_DOCNUM.IbQuery1.SQL.add('SELECT BG_STRIPTIME(ZREMON_DATE) AS ZREMON_DATE FROM ZREMON WHERE ZREMON_ID=:ZREMON_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('ZREMON_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('ZREMON_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QueryJou.locate('ZREMON_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJOU_ZREMON.FormShow(Sender: TObject);
begin
  inherited;
  Can_Refresh:=False;
  CanSubDoc:=Check_Dostup('$JOU.ZREMON.SUBDOC');
  UsTransaction.Active:=False;
  DicUs.close;
  DicUs.Open;
  US.value:=DicUs.fieldByname('US_ID').asstring;
  SOST.itemindex:=0;
  G_KEY:=#0;
  DT1:=Date();
  DT2:=Date();
  Can_Refresh:=true;
  Refresh_list;
end;

procedure TJOU_ZREMON.BtnNewClick(Sender: TObject);
begin
  inherited;
  Application.createForm(TDOC_ZREMON,DOC_ZREMON);
  DOC_ZREMON.tag:=-1;
  DOC_ZREMON.showModal;
  if DOC_ZREMON.tag>0 then begin
     DT1:=DOC_ZREMON.ZREMON_DATE.date;
     DT2:=DOC_ZREMON.ZREMON_DATE.date;
     Refresh_list;
     QueryJou.locate('ZREMON_ID',DOC_ZREMON.tag,[]);
  end;
  DOC_ZREMON.destroy;

end;

procedure TJOU_ZREMON.USChange(Sender: TObject);
begin
  inherited;
  Refresh_list;
end;

procedure TJOU_ZREMON.SOSTChange(Sender: TObject);
begin
  inherited;
  if SOST.itemindex<0 then SOST.itemindex:=0;
  Refresh_list;
end;

procedure TJOU_ZREMON.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJOU_ZREMON.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
     RxDbgrid1.Canvas.Font.Style:=[];
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='ZREMON_FULLNUM' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
     end;
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZREMON_SHOP').asinteger>0)
            and (Column.Field.FullName='ZREMON_SHOP_FULL') then begin
                RxDbgrid1.Canvas.Brush.color:=$009FFF9F;
                RxDbgrid1.Canvas.Font.color:=ClGreen;
                RxDbgrid1.Canvas.Font.Style:=[FsBold];
     end;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='ZREMON_FULLNUM' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZREMON_SHOP').asinteger>0)
            and (Column.Field.FullName='ZREMON_SHOP_FULL') then begin
                RxDbgrid1.Canvas.Brush.color:=ClGreen;
                RxDbgrid1.Canvas.Font.color:=$009FFF9F;
           end;
     end;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
         ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - ImageList1.Height) div 2),
         (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZREMON_STAT').Asinteger-1,True);
    end;
end;

procedure TJOU_ZREMON.ActNewExecute(Sender: TObject);
begin
  inherited;
  // Новый
  Application.CreateForm(TDoc_ZREMON,Doc_ZREMON);
  Doc_ZREMON.tag:=-1;
  Doc_ZREMON.showModal;
  if Doc_ZREMON.tag>0 then begin
    DT1:=Doc_ZREMON.ZREMON_DATE.date;
    DT2:=Doc_ZREMON.ZREMON_DATE.date;
    refresh_list;
    QueryJou.locate('ZREMON_ID',Doc_ZREMON.tag,[]);
  end;
  Doc_ZREMON.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJOU_ZREMON.ActOpenExecute(Sender: TObject);
begin
  inherited;
  // Изменить
  Application.CreateForm(TDoc_ZREMON,Doc_ZREMON);
  Doc_ZREMON.tag:=QueryJou.fieldByname('ZREMON_ID').asinteger;
  Doc_ZREMON.showModal;
  if Doc_ZREMON.tag>0 then begin
    DT1:=Doc_ZREMON.ZREMON_DATE.date;
    DT2:=Doc_ZREMON.ZREMON_DATE.date;
    refresh_list;
    QueryJou.locate('ZREMON_ID',Doc_ZREMON.tag,[]);
  end;
  Doc_ZREMON.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJOU_ZREMON.ActDelExecute(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QueryJou.fieldByname('ZREMON_ID').asinteger;
  if Messbox('Удалить заявку '+QueryJou.fieldByname('ZREMON_FULLNUM').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       QueryJou.DisableControls;
       QueryJou.Close;
       JouTransaction.Active:=False;
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_ZREMON(:ZREMON_ID,:US_ID)');
       DataModule1.IbSaveSQL.Parambyname('ZREMON_ID').asinteger:=ID;
       DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
       try
          DataModule1.IbSaveSQL.ExecSQL;
          Datamodule1.IBTransaction2.Commit;
       Except
         Datamodule1.IBTransaction2.RollBAck;
       End;
       Datamodule1.IBTransaction2.Active:=False;
       Refresh_list;
       QueryJou.locate('ZREMON_ID',ID,[]);
       QueryJou.EnableControls;
  end;

end;

procedure TJOU_ZREMON.ActPrintExecute(Sender: TObject);
begin
  inherited;
  // Печать
end;

procedure TJOU_ZREMON.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if ActOpen.enabled then ActOpen.execute;
end;

procedure TJOU_ZREMON.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) and (ActOpen.enabled) then begin
     key:=#0;
     ActOpen.execute;
  end;
end;

procedure TJOU_ZREMON.ActSubDocExecute(Sender: TObject);
var
  ID:integer;
begin
  inherited;
  // Создаем на основании
  if Messbox('Акт переоценки на основании данной заявки будет создан и сразу проведен! Вы уверены?',MessSubmit,4+48+256)=6 then begin
     ID:=QueryJou.fieldByname('ZREMON_ID').asinteger;
     WYP_ZREMON(ID);
     refresh_list;
     QueryJou.locate('ZREMON_ID',ID,[]);
  end;
end;

procedure TJOU_ZREMON.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin

  if Messbox('Создать копию заявки на переоценку '+QueryJou.fieldbyname('ZREMON_NUM').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_ZREMON( :ZREMON_ID, :SHOP_ID, :US_ID, :FRM_ID )');
           DataModule1.IbSaveSQL.ParamByname('ZREMON_ID').asinteger:=QueryJou.fieldbyname('ZREMON_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           DataModule1.IbSaveSQL.ParamByname('FRM_ID').asinteger:=gl_FRM_WORK_MODE;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_ZREMON_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Refresh_List;
              QueryJou.locate('ZREMON_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;


end;

end.
