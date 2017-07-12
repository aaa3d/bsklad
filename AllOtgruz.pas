unit AllOtgruz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery, IBDatabase, Mask,
  ToolEdit, RxLookup, ExtCtrls,VclUtils,OtgrRn,OtgrSPis,OtgrPer, Menus;

type
  TALL_OTGRUZ = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
    ARC: TCheckBox;
    SkladTransaction: TIBTransaction;
    RnTransaction: TIBTransaction;
    PerTransaction: TIBTransaction;
    SpisTransaction: TIBTransaction;
    QrSKL: TIBQuery;
    QrRN: TIBQuery;
    QrPer: TIBQuery;
    QrSPIS: TIBQuery;
    DsSKL: TDataSource;
    DsRN: TDataSource;
    DsPer: TDataSource;
    DsSpis: TDataSource;
    QrSKLSKL_ID: TIntegerField;
    QrSKLSKL_SHORT: TIBStringField;
    QrSKLSKL_FULL: TIBStringField;
    QrSKLSKL_ADR: TIBStringField;
    QrSKLSKL_TEL: TIBStringField;
    QrSKLSKL_TIME: TIBStringField;
    QrSKLSKL_SPEED: TIntegerField;
    QrRNRN_ID: TIntegerField;
    QrRNRN_FULL_NUM: TIBStringField;
    QrRNRN_COLOR: TIntegerField;
    QrRNRN_DATE: TDateTimeField;
    QrRNRN_SUMM: TFloatField;
    QrRNOTG_SUMM: TFloatField;
    QrRNOTG_MET: TIntegerField;
    QrRNRNVID_NAM: TIBStringField;
    QrRNKLN_FULL: TIBStringField;
    QrRNUS_FULL: TIBStringField;
    QrPerPER_ID: TIntegerField;
    QrPerPER_FULL_NUM: TIBStringField;
    QrPerPER_COLOR: TIntegerField;
    QrPerPER_DATE: TDateTimeField;
    QrPerPER_SUMM: TFloatField;
    QrPerOTG_SUMM: TFloatField;
    QrPerOTG_MET: TIntegerField;
    QrPerSKL_TO: TIBStringField;
    QrPerUS_FULL: TIBStringField;
    QrSPISSPIS_ID: TIntegerField;
    QrSPISSPIS_FULL_NUM: TIBStringField;
    QrSPISSPIS_COLOR: TIntegerField;
    QrSPISSPIS_DATE: TDateTimeField;
    QrSPISSPIS_SUMM: TFloatField;
    QrSPISOTG_SUMM: TFloatField;
    QrSPISOTG_MET: TIntegerField;
    QrSPISSPISVID_NAM: TIBStringField;
    QrSPISUS_FULL: TIBStringField;
    BtnOpen: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    Label2: TLabel;
    QrRNRNTYP_ID: TIntegerField;
    BtnInterval: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtnFind: TSpeedButton;
    Timer1: TTimer;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure SHOW_PAGE;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure ARCClick(Sender: TObject);
    procedure DT1Change(Sender: TObject);
    procedure DT2Change(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

    procedure READY_COM_DATAMessage(var AMessage: TMessage); message
      gl_READY_COM_DATA;
  public
    { Public declarations }
  end;

var
  G_KEY:ansistring;
  DT1,DT2:Tdatetime;
  ALL_OTGRUZ: TALL_OTGRUZ;
  SHOW_RN,SHOW_PER,SHOW_SPIS:boolean;
  SHOWS:boolean;

implementation

uses SetJouDate, DateInterval, FindDocNum;

{$R *.DFM}

procedure TALL_OTGRUZ.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='RN_FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger;
     end;
     if Field.Fieldname='OTG_SUMM' then begin
        CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_MET').Asinteger of
           0: if OTG_COLOR2>0 then Background:=OTG_COLOR2; {Отгружен полностью}
           1: if OTG_COLOR1>0 then Background:=OTG_COLOR1; {Совсем не отгружен}
           2: if OTG_COLOR3>0 then Background:=OTG_COLOR3; {Отгружен частично }
           3: if OTG_COLOR4>0 then Background:=OTG_COLOR4; {Что-то отгружено с излишком}
        end;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='RN_FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger;
        end;
        if Field.Fieldname='OTG_SUMM' then begin
           CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_MET').Asinteger of
              0: if OTG_COLOR2>0 then Afont.color:=OTG_COLOR2; {Отгружен полностью}
              1: if OTG_COLOR1>0 then Afont.color:=OTG_COLOR1; {Совсем не отгружен}
              2: if OTG_COLOR3>0 then Afont.color:=OTG_COLOR3; {Отгружен частично }
              3: if OTG_COLOR4>0 then Afont.color:=OTG_COLOR4; {Что-то отгружено с излишком}
           end;
        end;
     end;

end;

procedure TALL_OTGRUZ.FormShow(Sender: TObject);
begin
//     if Not check_dostup('$OTGRUZ.ALL_SKL') then SKL.Enabled:=false;
     SHOW_RN:=False;
     SHOW_PER:=False;
     SHOW_SPIS:=False;
     SHOWS:=False;
     SkladTransaction.Active:=False;
     QrSKL.close;
     QrSKL.Open;
     SKL.value:=inttostr(default_sklad);
     DT1:=date();
     DT2:=date();
     ARC.checked:=False;
     Label2.visible:=ARC.checked;
     SHOWS:=True;
     SHOW_PAGE;
end;

procedure TALL_OTGRUZ.SKLChange(Sender: TObject);
begin
     SHOW_RN:=False;
     SHOW_PER:=False;
     SHOW_SPIS:=False;
     SHOW_PAGE;

//    btnOpen.Enabled:=check_dostup('$OTGRUZ.SKL_ID='+SKL.Value) or check_dostup('$OTGRUZ.ALL_SKL');
end;

procedure TALL_OTGRUZ.SHOW_PAGE;
var
   S:ansistring;
   ID: integer;
begin
     S:=ALL_OTGRUZ.caption;
     if SHOWs then begin
        if (Pagecontrol1.ActivePage=Tabsheet1) and (not Show_RN) then begin
           StartWait;
           ALL_OTGRUZ.caption:=S+'. Чтение отгрузки расходных накладных...';

           ID:=QrRn.fieldByname('RN_ID').asinteger;
           SHOW_RN:=True;
           QrRn.disablecontrols;
           QrRn.Close;
           QrRn.Transaction.Active:=false;
           RnTransaction.Active:=False;
           QrRn.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
           QrRn.Parambyname('DT1').asdatetime:=DT1;
           QrRn.Parambyname('DT2').asdatetime:=DT2+1-Sekond1;
           if ARC.checked then QrRn.Parambyname('F').asinteger:=1
                          else QrRn.Parambyname('F').asinteger:=0;
           QrRN.Open;
           QrRN.enableControls;
           RxDbGrid1.Setfocus;
           ALL_OTGRUZ.caption:=S;

           QrRn.Locate('rn_id', ID, []);
           StopWait;
        end;
        if (Pagecontrol1.ActivePage=Tabsheet2) and (Not Show_PER) then begin
           StartWait;
           ALL_OTGRUZ.caption:=S+'. Чтение отгрузки накладных перемещения...';
           SHOW_PER:=True;
           QrPer.disablecontrols;
           QrPer.Close;
           PerTransaction.Active:=False;
           QrPer.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
           QrPer.Parambyname('DT1').asdatetime:=DT1;
           QrPer.Parambyname('DT2').asdatetime:=DT2+1-Sekond1;
           if ARC.checked then QrPer.Parambyname('F').asinteger:=1
                          else QrPer.Parambyname('F').asinteger:=0;
           QrPer.Open;
           QrPer.enableControls;
           RxDbGrid2.Setfocus;
           ALL_OTGRUZ.caption:=S;
           StopWait;
        end;
        if (Pagecontrol1.ActivePage=Tabsheet3) and (Not Show_Spis) then begin
           StartWait;
           ALL_OTGRUZ.caption:=S+'. Чтение отгрузки актов списания...';
           SHOW_SPIS:=True;
           QrSpis.disablecontrols;
           QrSpis.Close;
           SpisTransaction.Active:=False;
           QrSpis.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
           QrSpis.Parambyname('DT1').asdatetime:=DT1;
           QrSpis.Parambyname('DT2').asdatetime:=DT2+1-Sekond1;
           if ARC.checked then QrSpis.Parambyname('F').asinteger:=1
                          else QrSpis.Parambyname('F').asinteger:=0;
           QrSpis.Open;
           QrSpis.enableControls;
           RxDbGrid3.Setfocus;
           ALL_OTGRUZ.caption:=S;
           StopWait;
        end;
     end;
end;

procedure TALL_OTGRUZ.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
end;

procedure TALL_OTGRUZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrSKL.close;
     QrPER.close;
     QrSpis.close;
     QrRN.close;
     PerTransaction.Active:=False;
     RNTransaction.Active:=False;
     SpisTransaction.Active:=False;
     SkladTransaction.Active:=False;
end;

procedure TALL_OTGRUZ.PageControl1Change(Sender: TObject);
begin
     SHOW_PAGE;
end;

procedure TALL_OTGRUZ.ARCClick(Sender: TObject);
begin
     if ARC.checked then begin
        LAbel2.visible:=True;
        if (dt1=date()) and (dt2=date()) then begin
          Label2.Font.Style:=[FsBold];
          Label2.caption:='За СЕГОДНЯ!'
       end else begin
          Label2.Font.Style:=[];
          Label2.caption:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
       end;
     end else LAbel2.visible:=False;
     Show_RN:=False;
     Show_PER:=False;
     Show_SPIS:=False;
     SHOW_PAGE;
end;

procedure TALL_OTGRUZ.DT1Change(Sender: TObject);
begin
     Show_RN:=False;
     Show_PER:=False;
     Show_SPIS:=False;
     SHOW_PAGE;
end;

procedure TALL_OTGRUZ.DT2Change(Sender: TObject);
begin
     Show_RN:=False;
     Show_PER:=False;
     Show_SPIS:=False;
     SHOW_PAGE;
end;

procedure TALL_OTGRUZ.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='PER_FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
     end;
     if Field.Fieldname='OTG_SUMM' then begin
        CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_MET').Asinteger of
           0: if OTG_COLOR2>0 then Background:=OTG_COLOR2; {Отгружен полностью}
           1: if OTG_COLOR1>0 then Background:=OTG_COLOR1; {Совсем не отгружен}
           2: if OTG_COLOR3>0 then Background:=OTG_COLOR3; {Отгружен частично }
           3: if OTG_COLOR4>0 then Background:=OTG_COLOR4; {Что-то отгружено с излишком}
        end;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='PER_FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
        end;
        if Field.Fieldname='OTG_SUMM' then begin
           CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_MET').Asinteger of
              0: if OTG_COLOR2>0 then Afont.color:=OTG_COLOR2; {Отгружен полностью}
              1: if OTG_COLOR1>0 then Afont.color:=OTG_COLOR1; {Совсем не отгружен}
              2: if OTG_COLOR3>0 then Afont.color:=OTG_COLOR3; {Отгружен частично }
              3: if OTG_COLOR4>0 then Afont.color:=OTG_COLOR4; {Что-то отгружено с излишком}
           end;
        end;
     end;
end;

procedure TALL_OTGRUZ.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='SPIS_FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger;
     end;
     if Field.Fieldname='OTG_SUMM' then begin
        CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_MET').Asinteger of
           0: if OTG_COLOR2>0 then Background:=OTG_COLOR2; {Отгружен полностью}
           1: if OTG_COLOR1>0 then Background:=OTG_COLOR1; {Совсем не отгружен}
           2: if OTG_COLOR3>0 then Background:=OTG_COLOR3; {Отгружен частично }
           3: if OTG_COLOR4>0 then Background:=OTG_COLOR4; {Что-то отгружено с излишком}
        end;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='SPIS_FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger;
        end;
        if Field.Fieldname='OTG_SUMM' then begin
           CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_MET').Asinteger of
              0: if OTG_COLOR2>0 then Afont.color:=OTG_COLOR2; {Отгружен полностью}
              1: if OTG_COLOR1>0 then Afont.color:=OTG_COLOR1; {Совсем не отгружен}
              2: if OTG_COLOR3>0 then Afont.color:=OTG_COLOR3; {Отгружен частично }
              3: if OTG_COLOR4>0 then Afont.color:=OTG_COLOR4; {Что-то отгружено с излишком}
           end;
        end;
     end;
end;

procedure TALL_OTGRUZ.RxDBGrid1DblClick(Sender: TObject);
begin
     BtnOpen.Click;
end;

procedure TALL_OTGRUZ.RxDBGrid2DblClick(Sender: TObject);
begin
     BtnOpen.Click;
end;

procedure TALL_OTGRUZ.RxDBGrid3DblClick(Sender: TObject);
begin
     BtnOpen.Click;
end;

procedure TALL_OTGRUZ.RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TALL_OTGRUZ.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TALL_OTGRUZ.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TALL_OTGRUZ.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key='+' then begin
        Show_RN:=False;
        Show_PER:=False;
        Show_SPIS:=False;
        key:=#0;
        DT1:=DT1+1;
        DT2:=DT2+1;
        ARC.checked:=True;
     end;
     if key='-' then begin
        Show_RN:=False;
        Show_PER:=False;
        Show_SPIS:=False;
        key:=#0;
        DT1:=DT1-1;
        DT2:=DT2-1;
        ARC.checked:=True;
     end;
     if key in ['c','C','с','С'] then begin
        Show_RN:=False;
        Show_PER:=False;
        Show_SPIS:=False;
        key:=#0;
        DT1:=Date();
        DT2:=Date();
        ARC.checked:=True;
     end;
     if key='/' then begin
       key:=#0;
       Application.createForm(TSET_JOUDATE,SET_JOUDATE);
       SET_JOUDATE.showModal;
       if SET_JOUDATE.tag>0 then begin
          DT1:=SET_JOUDATE.DateEdit1.date;
          DT2:=SET_JOUDATE.DateEdit1.date;
          ARC.checked:=True;
          Show_RN:=False;
          Show_PER:=False;
          Show_SPIS:=False;
       end;
       SET_JOUDATE.Destroy;
     end;
     if key=' ' then begin
        key:=#0;
        ARC.Checked:=not ARC.checked;
        Show_RN:=False;
        Show_PER:=False;
        Show_SPIS:=False;
     end;
     if ARC.checked then begin
        LAbel2.visible:=True;
        if (dt1=date()) and (dt2=date()) then begin
          Label2.Font.Style:=[FsBold];
          Label2.caption:='За СЕГОДНЯ!'
       end else begin
          Label2.Font.Style:=[];
          Label2.caption:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
       end;
     end else LAbel2.visible:=False;
     if key  in ['0'..'9'] then begin
        G_KEY:=Key;
        Key:=#0;
        BtnFind.click;
     end;

     SHOW_PAGE;
end;

procedure TALL_OTGRUZ.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
//
     if not btnOpen.Enabled then exit;
     
     if PageControl1.ActivePage=Tabsheet1 then begin
        {Расходная}
        Application.CreateForm(TOtgr_RN,Otgr_RN);
        ID:=QrRn.fieldByname('RN_ID').asinteger;
        Otgr_RN.tag:=QrRn.fieldByname('RN_ID').asinteger;
        Otgr_RN.showModal;
        Otgr_RN.destroy;
        SHOW_RN:=False;
        SHOW_PAGE;
        QrRn.locate('RN_ID',ID,[]);
     end;
     if PageControl1.ActivePage=Tabsheet2 then begin
        {Перемещение}
        Application.CreateForm(TOtgr_PER,Otgr_PER);
        ID:=QrPer.fieldByname('PER_ID').asinteger;
        Otgr_PER.tag:=QrPer.fieldByname('PER_ID').asinteger;
        Otgr_PER.showModal;
        Otgr_PER.destroy;
        SHOW_PER:=False;
        SHOW_PAGE;
        QrPer.locate('PER_ID',ID,[]);
     end;
     if PageControl1.ActivePage=Tabsheet3 then begin
        {Списания}
        Application.CreateForm(TOtgr_SPIS,Otgr_SPIS);
        ID:=QrSpis.fieldByname('SPIS_ID').asinteger;
        Otgr_Spis.tag:=QrSpis.fieldByname('SPIS_ID').asinteger;
        Otgr_Spis.showModal;
        Otgr_Spis.destroy;
        SHOW_SPIS:=False;
        SHOW_PAGE;
        QrSpis.locate('SPIS_ID',ID,[]);
     end;
end;

procedure TALL_OTGRUZ.BtnIntervalClick(Sender: TObject);
begin
        Application.createForm(TDate_interval,Date_Interval);
        Date_interval.Dt1.date:=DT1;
        Date_interval.Dt2.date:=DT2;
        Date_interval.Showmodal;
        if Date_interval.tag=2 then begin
           ARC.checked:=True;
           DT1:=Date_interval.Dt1.date;
           DT2:=Date_interval.Dt2.date;
           Show_RN:=False;
           Show_PER:=False;
           Show_SPIS:=False;
        end;
        Date_interval.destroy;
        SHOW_PAGE;

end;

procedure TALL_OTGRUZ.SpeedButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TALL_OTGRUZ.SpeedButton2Click(Sender: TObject);
begin
     if PageControl1.ActivePage=Tabsheet1 then begin
        // Расходная
        PRINT_RN(QrRn.fieldByname('RN_ID').asinteger);
     end;
     if PageControl1.ActivePage=Tabsheet2 then begin
        // Перемещение
        PRINT_PER(QrPer.fieldByname('PER_ID').asinteger);
     end;
     if PageControl1.ActivePage=Tabsheet3 then begin
        // Списание
        PRINT_SPIS(QrSpis.fieldByname('SPIS_ID').asinteger);
     end;

end;

procedure TALL_OTGRUZ.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  if PageControl1.ActivePage=Tabsheet1 then   FIND_DOCNUM.Label1.tag:=13;
  if PageControl1.ActivePage=Tabsheet2 then   FIND_DOCNUM.Label1.tag:=15;
  if PageControl1.ActivePage=Tabsheet3 then   FIND_DOCNUM.Label1.tag:=14;
  FIND_DOCNUM.Edit1.tag:=strtoint(SKL.value); {Склад}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     if PageControl1.ActivePage=Tabsheet1 then begin
       ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT BG_STRIPTIME(RN_DATE) AS RN_DATE FROM RN WHERE RN_ID=:RN_ID');
       FIND_DOCNUM.IbQuery1.ParamByname('RN_ID').asinteger:=FIND_DOCNUM.tag;
       FIND_DOCNUM.IbQuery1.Open;
       DT1:=FIND_DOCNUM.IbQuery1.fieldByname('RN_DATE').asdatetIme;;
       FIND_DOCNUM.IbQuery1.close;
       DT2:=DT1;
       ARC.checked:=true;
       Show_RN:=False;
       SHOW_PAGE;
       QrRN.locate('RN_ID',FIND_DOCNUM.tag,[]);
     end;
     if PageControl1.ActivePage=Tabsheet3 then begin
       ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT BG_STRIPTIME(SPIS_DATE) AS SPIS_DATE FROM SPIS WHERE SPIS_ID=:SPIS_ID');
       FIND_DOCNUM.IbQuery1.ParamByname('SPIS_ID').asinteger:=FIND_DOCNUM.tag;
       FIND_DOCNUM.IbQuery1.Open;
       DT1:=FIND_DOCNUM.IbQuery1.fieldByname('SPIS_DATE').asdatetIme;;
       FIND_DOCNUM.IbQuery1.close;
       DT2:=DT1;
       ARC.checked:=true;
       Show_SPIS:=False;
       SHOW_PAGE;
       QrSPIS.locate('SPIS_ID',FIND_DOCNUM.tag,[]);
     end;
     if PageControl1.ActivePage=Tabsheet2 then begin
       ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT BG_STRIPTIME(PER_DATE) AS PER_DATE FROM PER WHERE PER_ID=:PER_ID');
       FIND_DOCNUM.IbQuery1.ParamByname('PER_ID').asinteger:=FIND_DOCNUM.tag;
       FIND_DOCNUM.IbQuery1.Open;
       DT1:=FIND_DOCNUM.IbQuery1.fieldByname('PER_DATE').asdatetIme;;
       FIND_DOCNUM.IbQuery1.close;
       DT2:=DT1;
       ARC.checked:=true;
       Show_PER:=False;
       SHOW_PAGE;
       QrPER.locate('PER_ID',FIND_DOCNUM.tag,[]);
     end;
  end;
  FIND_DOCNUM.destroy;
end;

procedure TALL_OTGRUZ.Timer1Timer(Sender: TObject);
begin
Show_RN:=false;

  SHOW_PAGE;
end;

procedure TALL_OTGRUZ.READY_COM_DATAMessage(var AMessage: TMessage);
var rn_id: integer;
ID: integer;

begin
  try
       rn_id:=AMessage.WParam;

       ibquery1.Transaction.Active:=false;
        ibquery1.SQL.Text:='SELECT RN_PROW FROM RN WHERE RN_ID=:RN_ID and bg_abs(doc_deleted)=0';
        ibquery1.ParamByName('RN_ID').asInteger:=rn_id;

        ibquery1.open;
        if ibquery1.Eof then
        begin
          messbox('Накладная не найдена в системе. '+chr(13)+'Код '+inttostr(rn_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
        end
        else
        begin
          if ibquery1.fieldbyname('rn_prow').asinteger=0 then
          begin
                    messbox('Накладная не проведена. '+chr(13)+'Код '+inttostr(rn_id)+chr(13)+'Запишите и сообщите программисту', 'ОШИБКА', 0);
          end
          else
          begin
            Application.CreateForm(TOtgr_RN,Otgr_RN);
            ID:=QrRn.fieldByname('RN_ID').asinteger;
            Otgr_RN.tag:=rn_id;
            Otgr_RN.showModal;
            Otgr_RN.destroy;
            SHOW_RN:=False;
            SHOW_PAGE;
            QrRn.locate('RN_ID',ID,[]);
          end
        end;

        ibquery1.Close;

  except
   on e: Exception do
     messbox(e.message, e.message, 0);
  end;



  statusBar1.Panels[0].Text:='Ввод со сканера штрих кода';
  statusBar1.Panels[1].Text:=gl_LAST_BAR_CODE;
end;

end.
