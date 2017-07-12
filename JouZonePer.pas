unit JouZonePer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Db, IBCustomDataSet, IBQuery,B_Utils,B_DBUtils, IBDatabase,DocPer, Menus,
  ppDB, ppCtrls, ppBands, ppVar, ppMemo, ppStrtch, ppRegion, ppPrnabl,
  ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, StdCtrls,
  RxLookup, RxMemDS;

type
  TJou_ZONE_PER = class(TDefault_Journal)
    IBQuery1: TIBQuery;
    QrZonePerList: TIBQuery;
    DsZonePerList: TDataSource;
    ZonePerListTranSaction: TIBTransaction;
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    N3: TMenuItem;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnCopy: TMenuItem;
    MnDel: TMenuItem;
    N8: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnSubDoc: TMenuItem;
    N13: TMenuItem;
    MnInterval: TMenuItem;
    N14: TMenuItem;
    MnAdm: TMenuItem;
    ToolBar2: TToolBar;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label2: TLabel;
    ZONE_FROM: TComboBox;
    Label1: TLabel;
    ZONE_TO: TComboBox;
    QrZonePerListZONE_PER_ID: TIntegerField;
    QrZonePerListZONE_PER_NUM_FULL: TIBStringField;
    QrZonePerListZONE_PER_DATE: TDateTimeField;
    QrZonePerListZONE_FROM_NAME: TIBStringField;
    QrZonePerListZONE_PER_COLOR: TIntegerField;
    QrZonePerListUS_FULL: TIBStringField;
    QrZonePerListZONE_PER_PROW: TIBStringField;
    QrZonePerListZONE_PER_OSN: TIBStringField;
    QrZonePerListZONE_PER_NUM: TIntegerField;
    QrZonePerListZONE_FROM_ID1: TIntegerField;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrZonePerListAfterScroll(DataSet: TDataSet);
    procedure QrZonePerListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ZONE_FROMChange(Sender: TObject);
    procedure ZONE_TOChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAN_NEW,CAN_ANALIZ,CAN_ADM:boolean;
  Jou_ZONE_PER: TJou_ZONE_PER;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  zone_ids: array[0..5000] of integer;
  Can_Refresh: boolean;

implementation

uses Data1, DateInterval, SetJouDate, FindDocNum, AdminPer, SelectPrint,
  DocZonePer, Mainform;

{$R *.DFM}

procedure TJou_ZONE_PER.FormShow(Sender: TObject);
begin
  inherited;
  CAN_NEW:=Check_Dostup('$JOU.ZONE_PER.NEW');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  GET_DEFAULT;
  DT1:=Date();
  DT2:=Date();


  ZONE_FROM.Items.Clear;
  ZONE_TO.Items.Clear;
  ZONE_FROM.Items.Add('Все');
  ZONE_TO.Items.Add('Все');
  ZONE_IDS[0]:=0;

  datamodule1.MainDicZone.First;
  while not datamodule1.MainDicZone.Eof do
  begin
        ZONE_IDS[ZONE_FROM.Items.Count]:=datamodule1.MainDicZone.fieldbyname('ZONE_ID').asInteger;
  	ZONE_FROM.Items.Add(datamodule1.MainDicZone.fieldbyname('ZONE_NAME').asString);
        ZONE_TO.Items.Add(datamodule1.MainDicZone.fieldbyname('ZONE_NAME').asString);
  	datamodule1.MainDicZone.Next;
  end;

  Can_Refresh:=false;
  ZONE_FROM.ItemIndex:=0;
  ZONE_TO.ItemIndex:=0;




  Can_Refresh:=true;

  Refresh_list;


end;

Procedure TJou_ZONE_PER.refresh_Btn;
var
   EN:boolean;
begin
     if QrZonePerList.fieldbyname('ZONE_PER_PROW').asstring='1' then EN:=false else EN:=true;
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     BtnCopy.enabled:=CAN_NEW and EnEof;
     MnCopy.enabled:=CAN_NEW and EnEof;
     BtnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnProw.Enabled:=EN and EnEof;
     MnDel.Enabled:=EN and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
end;

Procedure TJou_ZONE_PER.refresh_list;
begin
	 if not Can_Refresh then
     	exit;

     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     QrZonePerList.close;
     QrZonePerList.ParamByname('DT1').asdatetime:=DT1;
     QrZonePerList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrZonePerList.ParamByname('ZONE_FROM_ID').asInteger:=ZONE_IDS[ZONE_FROM.ItemIndex];
//     QrZonePerList.ParamByname('ZONE_TO_ID').asInteger:=ZONE_IDS[ZONE_TO.ItemIndex];
     ZonePerListTransaction.Active:=False;
     QrZonePerList.Open;
end;


procedure TJou_ZONE_PER.QrZonePerListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrZonePerList.fieldbyname('US_FULL').asstring;
  Refresh_Btn;
end;

procedure TJou_ZONE_PER.QrZonePerListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrZonePerList.fieldbyname('US_FULL').asstring;
  if QrZonePerList.eof then EnEof:=false else EnEof:=true;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnCopy.enabled:=EnEof;
  MnCopy.enabled:=EnEof;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  BtnAdm.Enabled:=EnEof and CAN_ADM;
  MnAdm.Enabled:=EnEof and CAN_ADM;
  BtnSubDoc.Enabled:=EnEof;
  MnSubDoc.Enabled:=EnEof;
  Refresh_Btn;

end;

procedure TJou_ZONE_PER.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_COLOR').Asinteger>=0 then begin
           if Column.index=1 then Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_COLOR').Asinteger>=0 then begin
              if Column.index=1 then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_COLOR').Asinteger>=0 then begin
        if Column.index=1 then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ZONE_PER_PROW').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
      end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
    end;
end;

procedure TJou_ZONE_PER.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_ZONE_PER.FormKeyPress(Sender: TObject; var Key: Char);
begin
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

procedure TJou_ZONE_PER.BtnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrZonePerList.fieldByname('ZONE_PER_ID').asinteger;
  if PROV_ZONE_PER(ID,QrZonePerList.fieldbyname('ZONE_PER_NUM_FULL').asstring+
  ' от '+date_sokr(QrZonePerList.fieldbyname('ZONE_PER_DATE').asdatetime)+' ') then begin
     QrZonePerList.DisableControls;
     QrZonePerList.close;
     ZonePerListTransaction.Active:=False;
     QrZonePerList.Open;
     QrZonePerList.Locate('ZONE_PER_ID',ID,[]);
     QrZonePerList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_ZONE_PER.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrZonePerList.fieldByname('ZONE_PER_ID').asinteger;
  if UNPROV_ZONE_PER(ID,QrZonePerList.fieldbyname('ZONE_PER_NUM_FULL').asstring+
  ' от '+date_sokr(QrZonePerList.fieldbyname('ZONE_PER_DATE').asdatetime)+' ') then begin
     QrZonePerList.DisableControls;
     QrZonePerList.close;
     ZonePerListTransaction.Active:=False;
     QrZonePerList.Open;
     QrZonePerList.Locate('ZONE_PER_ID',ID,[]);
     QrZonePerList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_ZONE_PER.BtnIntervalClick(Sender: TObject);
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

procedure TJou_ZONE_PER.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC('Накладная перемещения между зонами № '+QrZonePerList.fieldbyname('ZONE_PER_NUM_FULL').asstring,'ZONE_PER',QrZonePerList.fieldbyname('ZONE_PER_ID').asinteger);
end;

procedure TJou_ZONE_PER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrZonePerList.Close;
     ZonePerListTransaction.Active:=False;
end;

procedure TJou_ZONE_PER.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  if IS_EDIT_PER then Messbox('Вы уже просматриваете или редактируете накладную перемещения между зонами!',MessSYstem,48) else begin
    Application.CreateForm(TDoc_ZONE_PER,Doc_ZONE_PER);
    ID:=QrZonePerList.fieldbyname('ZONE_PER_ID').asinteger;
    Doc_ZONE_PER.tag:=ID;
    Doc_ZONE_PER.ToolBar1.Tag:=Jou_ZONE_PER.tag;
    Doc_ZONE_PER.showModal;
    Doc_ZONE_PER.destroy;
    QrZonePerList.Close;
    ZonePerListTransaction.Active:=False;
    QrZonePerList.Open;
    QrZonePerList.locate('ZONE_PER_ID',ID,[]);
  end;
end;

procedure TJou_ZONE_PER.BtnNewClick(Sender: TObject);
begin
//  if IS_EDIT_PER then Messbox('Вы уже просматриваете или редактируете накладную перемещения между зонами!',MessSYstem,48) else
  begin
    Application.CreateForm(TDoc_ZONE_PER,Doc_ZONE_PER);
    Doc_ZONE_PER.tag:=-1;
    Doc_ZONE_PER.ToolBar1.Tag:=Jou_ZONE_PER.tag;
    Doc_ZONE_PER.showModal;
    if Doc_ZONE_PER.tag>0 then begin
//igor      DT1:=Doc_ZONE_PER.ZONE_PER_DATE.date;
//igor      DT2:=Doc_ZONE_PER.ZONE_PER_DATE.date;
      refresh_list;
      QrZonePerList.locate('ZONE_PER_ID',Doc_ZONE_PER.tag,[]);
    end;
    Doc_ZONE_PER.destroy;
    RxDbgrid1.setfocus;
  end;
end;

procedure TJou_ZONE_PER.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

procedure TJou_ZONE_PER.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrZonePerList.fieldByname('ZONE_PER_ID').asinteger;
  if Messbox('Удалить Накладную перемещения между зонами'+QrZonePerList.fieldByname('ZONE_PER_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_ZONE_PER(:ZONE_PER_ID,:US_ID)');
     DataModule1.IbSaveSQL.Parambyname('ZONE_PER_ID').asinteger:=ID;
     DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
     try
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.Commit;
     Except
       Datamodule1.IBTransaction2.RollBAck;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrZonePerList.locate('ZONE_PER_ID',ID,[]);
  end;
  RxDbGrid1.setfocus;
end;

procedure TJou_ZONE_PER.BtnPrintClick(Sender: TObject);
begin
  {Печатаем}

end;

procedure TJou_ZONE_PER.ZONE_FROMChange(Sender: TObject);
begin
  inherited;
  Refresh_list;
end;

procedure TJou_ZONE_PER.ZONE_TOChange(Sender: TObject);
begin
  inherited;
   Refresh_list;
end;

procedure TJou_ZONE_PER.FormCreate(Sender: TObject);
begin
  inherited;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
end;

end.
