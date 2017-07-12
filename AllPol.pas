unit AllPol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery, IBDatabase, Mask,
  ToolEdit, RxLookup, ExtCtrls,VclUtils,Polpn,PolPer, Menus;

type
  TALL_POL = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
    ARC: TCheckBox;
    SkladTransaction: TIBTransaction;
    PnTransaction: TIBTransaction;
    PerTransaction: TIBTransaction;
    QrSKL: TIBQuery;
    QrPN: TIBQuery;
    QrPer: TIBQuery;
    DsSKL: TDataSource;
    DsPN: TDataSource;
    DsPer: TDataSource;
    QrSKLSKL_ID: TIntegerField;
    QrSKLSKL_SHORT: TIBStringField;
    QrSKLSKL_FULL: TIBStringField;
    QrSKLSKL_ADR: TIBStringField;
    QrSKLSKL_TEL: TIBStringField;
    QrSKLSKL_TIME: TIBStringField;
    QrSKLSKL_SPEED: TIntegerField;
    BtnOpen: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label2: TLabel;
    QrPerPER_ID: TIntegerField;
    QrPerPER_FULL_NUM: TIBStringField;
    QrPerPER_COLOR: TIntegerField;
    QrPerPER_DATE: TDateTimeField;
    QrPerPER_SUMM: TFloatField;
    QrPerPOL_SUMM: TFloatField;
    QrPerPOL_MET: TIntegerField;
    QrPerSKL_FROM: TIBStringField;
    QrPerUS_FULL: TIBStringField;
    QrPNPN_ID: TIntegerField;
    QrPNPN_FULL_NUM: TIBStringField;
    QrPNPN_COLOR: TIntegerField;
    QrPNPN_DATE: TDateTimeField;
    QrPNPN_SUMM: TFloatField;
    QrPNPOL_SUMM: TFloatField;
    QrPNPOL_MET: TIntegerField;
    QrPNPNVID_NAM: TIBStringField;
    QrPNKLN_FULL: TIBStringField;
    QrPNUS_FULL: TIBStringField;
    QrPNPNTYP_ID: TIntegerField;
    BtnInterval: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton1: TSpeedButton;
    BtnPrint: TSpeedButton;
    BtnFind: TSpeedButton;
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
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DT1,DT2:Tdatetime;
  ALL_POL: TALL_POL;
  SHOW_PN,SHOW_PER:boolean;
  SHOWS:boolean;
  G_KEY:ansistring;

implementation

uses SetJouDate, DateInterval, FindDocNum;

{$R *.DFM}

procedure TALL_POL.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='PN_FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN_COLOR').Asinteger;
     end;
     if Field.Fieldname='POL_SUMM' then begin
        CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_MET').Asinteger of
           0: if OTG_COLOR2>0 then Background:=OTG_COLOR2; {Отгружен полностью}
           1: if OTG_COLOR1>0 then Background:=OTG_COLOR1; {Совсем не отгружен}
           2: if OTG_COLOR3>0 then Background:=OTG_COLOR3; {Отгружен частично }
           3: if OTG_COLOR4>0 then Background:=OTG_COLOR4; {Что-то отгружено с излишком}
        end;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='PN_FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN_COLOR').Asinteger;
        end;
        if Field.Fieldname='POL_SUMM' then begin
           CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_MET').Asinteger of
              0: if OTG_COLOR2>0 then Afont.color:=OTG_COLOR2; {Отгружен полностью}
              1: if OTG_COLOR1>0 then Afont.color:=OTG_COLOR1; {Совсем не отгружен}
              2: if OTG_COLOR3>0 then Afont.color:=OTG_COLOR3; {Отгружен частично }
              3: if OTG_COLOR4>0 then Afont.color:=OTG_COLOR4; {Что-то отгружено с излишком}
           end;
        end;
     end;

end;

procedure TALL_POL.FormShow(Sender: TObject);
begin
     // Запрещаем просмотр информации о поставщике товара
     if Not check_dostup('$FIND.PN') then RxDbgrid1.columns[1].visible:=False;




     SHOWS:=False;
     SkladTransaction.Active:=False;
     QrSKL.close;
     QrSKL.Open;
     SKL.value:=inttostr(default_sklad);
     DT1:=date();
     DT2:=date();
     ARC.checked:=False;
     Label2.visible:=ARC.checked;
     SHOW_PN:=False;
     SHOW_PER:=False;
     SHOWS:=True;
     SHOW_PAGE;
end;

procedure TALL_POL.SKLChange(Sender: TObject);
begin
     SHOW_PN:=False;
     SHOW_PER:=False;
     SHOW_PAGE;



//    btnOpen.Enabled:=check_dostup('$POL.SKL_ID='+SKL.Value) or check_dostup('$POL.ALL_SKL');


end;

procedure TALL_POL.SHOW_PAGE;
var
   S:ansistring;
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
     S:=ALL_POL.caption;
     if SHOWs then begin
        if (Pagecontrol1.ActivePage=Tabsheet1) and (not Show_PN) then begin
           StartWait;
           ALL_POL.caption:=S+'. Чтение получения приходных накладных...';
           SHOW_PN:=True;
           QrPn.disablecontrols;
           QrPn.Close;
           PnTransaction.Active:=False;
           QrPn.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
           QrPn.Parambyname('DT1').asdatetime:=DT1;
           QrPn.Parambyname('DT2').asdatetime:=DT2+1-Sekond1;
           if ARC.checked then QrPn.Parambyname('F').asinteger:=1
                          else QrPn.Parambyname('F').asinteger:=0;
           QrPN.Open;
           QrPN.enableControls;
           RxDbGrid1.Setfocus;
           ALL_POL.caption:=S;
           StopWait;
        end;
        if (Pagecontrol1.ActivePage=Tabsheet2) and (Not Show_PER) then begin
           StartWait;
           ALL_POL.caption:=S+'. Чтение получения накладных перемещения...';
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
           ALL_POL.caption:=S;
           StopWait;
        end;
     end;
end;

procedure TALL_POL.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
end;

procedure TALL_POL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrSKL.close;
     QrPER.close;
     QrPN.close;
     PerTransaction.Active:=False;
     PNTransaction.Active:=False;
     SkladTransaction.Active:=False;
end;

procedure TALL_POL.PageControl1Change(Sender: TObject);
begin
     SHOW_PAGE;
end;

procedure TALL_POL.ARCClick(Sender: TObject);
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
     Show_PN:=False;
     Show_PER:=False;
     SHOW_PAGE;
end;

procedure TALL_POL.DT1Change(Sender: TObject);
begin
     Show_PN:=False;
     Show_PER:=False;
     SHOW_PAGE;
end;

procedure TALL_POL.DT2Change(Sender: TObject);
begin
     Show_PN:=False;
     Show_PER:=False;
     SHOW_PAGE;
end;

procedure TALL_POL.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='PER_FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
     end;
     if Field.Fieldname='POL_SUMM' then begin
        CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_MET').Asinteger of
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
        if Field.Fieldname='POL_SUMM' then begin
           CASE (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_MET').Asinteger of
              0: if OTG_COLOR2>0 then Afont.color:=OTG_COLOR2; {Отгружен полностью}
              1: if OTG_COLOR1>0 then Afont.color:=OTG_COLOR1; {Совсем не отгружен}
              2: if OTG_COLOR3>0 then Afont.color:=OTG_COLOR3; {Отгружен частично }
              3: if OTG_COLOR4>0 then Afont.color:=OTG_COLOR4; {Что-то отгружено с излишком}
           end;
        end;
     end;
end;

procedure TALL_POL.RxDBGrid1DblClick(Sender: TObject);
begin
     BtnOpen.Click;
end;

procedure TALL_POL.RxDBGrid2DblClick(Sender: TObject);
begin
     BtnOpen.Click;
end;

procedure TALL_POL.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TALL_POL.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TALL_POL.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key='+' then begin
        Show_PN:=False;
        Show_PER:=False;
        key:=#0;
        DT1:=DT1+1;
        DT2:=DT2+1;
        ARC.checked:=True;
     end;
     if key='-' then begin
        Show_PN:=False;
        Show_PER:=False;
        key:=#0;
        DT1:=DT1-1;
        DT2:=DT2-1;
        ARC.checked:=True;
     end;
     if key in ['c','C','с','С'] then begin
        Show_PN:=False;
        Show_PER:=False;
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
          Show_PN:=False;
          Show_PER:=False;
       end;
       SET_JOUDATE.Destroy;
     end;
     if key=' ' then begin
        key:=#0;
        ARC.Checked:=not ARC.checked;
        Show_PN:=False;
        Show_PER:=False;
     end;
     if key  in ['0'..'9'] then begin
        G_KEY:=Key;
        Key:=#0;
        BtnFind.click;
     end;
     SHOW_PAGE;
end;

procedure TALL_POL.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
//     if not btnOpen.Enabled then exit;

     
     if PageControl1.ActivePage=Tabsheet1 then begin
        {Приходная}
        Application.CreateForm(TPol_PN,Pol_PN);
        ID:=QrPn.fieldByname('PN_ID').asinteger;
        Pol_PN.tag:=QrPn.fieldByname('PN_ID').asinteger;
        Pol_PN.showModal;
        Pol_PN.destroy;
        SHOW_PN:=False;
        SHOW_PAGE;
        QrPn.locate('PN_ID',ID,[]);
     end;
     if PageControl1.ActivePage=Tabsheet2 then begin
        {Перемещение}
        Application.CreateForm(TPol_PER,Pol_PER);
        ID:=QrPer.fieldByname('PER_ID').asinteger;
        Pol_Per.tag:=QrPer.fieldByname('PER_ID').asinteger;
        Pol_Per.showModal;
        Pol_Per.destroy;
        SHOW_PER:=False;
        SHOW_PAGE;
        QrPer.locate('PER_ID',ID,[]);
     end;
end;

procedure TALL_POL.BtnIntervalClick(Sender: TObject);
begin
        Application.createForm(TDate_interval,Date_Interval);
        Date_interval.Dt1.date:=DT1;
        Date_interval.Dt2.date:=DT2;
        Date_interval.Showmodal;
        if Date_interval.tag=2 then begin
           ARC.checked:=True;
           DT1:=Date_interval.Dt1.date;
           DT2:=Date_interval.Dt2.date;
           Show_PN:=False;
           Show_PER:=False;
        end;
        Date_interval.destroy;
        SHOW_PAGE;
end;

procedure TALL_POL.SpeedButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TALL_POL.BtnPrintClick(Sender: TObject);
begin
     if PageControl1.ActivePage=Tabsheet1 then begin
        // Приходная
        PRINT_PN(QrPn.fieldByname('PN_ID').asinteger,ALL_POL.top+BtnPrint.top+4+BtnPrint.Height,ALL_POL.left+BtnPrint.left+4+BtnPrint.Width);
     end;
     if PageControl1.ActivePage=Tabsheet2 then begin
        // Перемещение
        PRINT_PER(QrPer.fieldByname('PER_ID').asinteger);
     end;
end;

procedure TALL_POL.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  if PageControl1.ActivePage=Tabsheet1 then   FIND_DOCNUM.Label1.tag:=16;
  if PageControl1.ActivePage=Tabsheet2 then   FIND_DOCNUM.Label1.tag:=17;
  FIND_DOCNUM.Edit1.tag:=strtoint(SKL.value); {Склад}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     if PageControl1.ActivePage=Tabsheet1 then begin
       ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT BG_STRIPTIME(PN$_DATE) AS PN$_DATE FROM PN$ WHERE PN$_ID=:PN_ID');
       FIND_DOCNUM.IbQuery1.ParamByname('PN_ID').asinteger:=FIND_DOCNUM.tag;
       FIND_DOCNUM.IbQuery1.Open;
       DT1:=FIND_DOCNUM.IbQuery1.fieldByname('PN$_DATE').asdatetIme;;
       FIND_DOCNUM.IbQuery1.close;
       DT2:=DT1;
       ARC.checked:=true;
       Show_PN:=False;
       SHOW_PAGE;
       QrPN.locate('PN_ID',FIND_DOCNUM.tag,[]);
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

end.
