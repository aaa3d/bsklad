unit ReportSKID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, StdCtrls, Buttons, RxLookup, Mask, ToolEdit,Data1,DataPrint,
  B_utils,B_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase, Menus,VclUtils,
  ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppBands, ppDB, ppProd,
  ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppVar;

type
  TREPORT_SKID = class(TForm)
    Label1: TLabel;
    DT1: TDateEdit;
    Label2: TLabel;
    DT2: TDateEdit;
    GroupBox1: TGroupBox;
    RN1: TRadioButton;
    RN2: TRadioButton;
    RNTYP_ID: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    US1: TRadioButton;
    US2: TRadioButton;
    USER_FIO: TEdit;
    BtnKLN: TBitBtn;
    Label3: TLabel;
    Percent: TRxCalcEdit;
    BtnRun: TButton;
    BtnClose: TButton;
    WorkTransaction: TIBTransaction;
    SkidTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    QrRNTYP: TIBQuery;
    DsRNTYP: TDataSource;
    QrRNTYPRNTYP_ID: TIntegerField;
    QrRNTYPRNTYP_SHORT: TIBStringField;
    QrRNTYPRNTYP_FULL: TIBStringField;
    QrRNTYPNUM_TYP: TSmallintField;
    QrRNTYPRNTYP_SPEED: TIBStringField;
    PopupMenu1: TPopupMenu;
    MnRun: TMenuItem;
    N1: TMenuItem;
    MnKLN: TMenuItem;
    PipSkid: TppDBPipeline;
    PpSkid: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppLine1: TppLine;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppShape2: TppShape;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel49: TppLabel;
    ppImage1: TppImage;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpSkidUser: TppLabel;
    ppImage2: TppImage;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    PpSkidVers: TppLabel;
    ppLabel52: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel53: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    PpSkidUser2: TppLabel;
    ReportTitle1: TppMemo;
    ReportTitle2: TppMemo;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RN2Click(Sender: TObject);
    procedure US2Click(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
    procedure BtnKLNClick(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpSkidPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_SKID: TREPORT_SKID;

implementation

uses DicKlient;

{$R *.DFM}

procedure TREPORT_SKID.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TREPORT_SKID.FormShow(Sender: TObject);
begin
     SKIDTransaction.Active:=False;
     QrRNTYP.close;
     QrRNTYP.Open;
     RNTYP_ID.value:=QrRNTYP.fieldByname('RNTYP_ID').asstring;
     USER_FIO.tag:=USERID;
     DT1.date:=date();
     DT2.date:=date();
     RN1.checked:=True;
     US1.checked:=True;
     US2Click(Sender);
     RN2Click(Sender);
     WorkTransaction.Active:=False;
     ADD_SQL(IbQuery1,'select KLN_FULL from kln_data(:KLN_ID)');
     IbQuery1.ParamByname('KLN_ID').asinteger:=USER_FIO.tag;
     IbQuery1.Open;
     USER_FIO.text:=IbQuery1.FieldByname('KLN_FULL').asstring;

end;

procedure TREPORT_SKID.RN2Click(Sender: TObject);
begin
     rntyp_ID.Enabled:=RN2.checked;
end;

procedure TREPORT_SKID.US2Click(Sender: TObject);
begin
     USER_FIO.visible:=US2.checked;
     BtnKLN.visible:=US2.checked;
     MnKLN.enabled:=US2.checked;
end;

procedure TREPORT_SKID.BtnRunClick(Sender: TObject);
var
   tm1,tm2:Tdatetime;
   s:ansistring;
begin
     DataModule2.PrintTransaction.Active:=False;
     DataModule2.ReportSkid.close;
     DataModule2.ReportSkid.ParamByname('DT1').asdatetime:=DT1.date;
     DataModule2.ReportSkid.ParamByname('DT2').asdatetime:=DT2.date+1-Sekond1;
     DataModule2.ReportSkid.ParamByname('PERCENT').asfloat:=Percent.value;
     if US1.checked then DataModule2.ReportSkid.ParamByname('US_ID').asinteger:=0
                    else DataModule2.ReportSkid.ParamByname('US_ID').asinteger:=USER_FIO.tag;
     if RN1.checked then DataModule2.ReportSkid.ParamByname('RNTYP_ID').asinteger:=0
                    else DataModule2.ReportSkid.ParamByname('RNTYP_ID').asinteger:=strtoint(RNTYP_ID.value);
     Tm1:=time();
     DataModule2.ReportSkid.Open;
     tm2:=time();
     if DataModule2.ReportSkid.eof then Messbox('Отчёт пуст!',MessSystem,48)
     else begin
          s:='Отчёт о скидках, обоснованных ';
          if US1.checked then s:=s+'всеми пользователями'
                         else s:=s+'пользователем: '+USER_FIO.text;
          s:=s+' за период с '+date_sokr(Dt1.date)+' по '+date_sokr(dt2.date);
          if RN1.checked then s:=s+', все типы расходных накладных'
                         else s:=s+', тип: '+RNTYP_ID.text;
          s:=s+', время построения отчёта: '+timetostr(tm2-tm1);
          ReportTitle1.lines.clear;
          ReportTitle1.lines.add(s);
          ReportTitle2.lines.clear;
          ReportTitle2.lines.add(s);
          PpSkid.reset;
          PpSkid.print;
     end;
end;

procedure TREPORT_SKID.BtnKLNClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=USER_FIO.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>USER_FIO.tag then begin
        USER_FIO.tag:=DIC_KLIENT.tag;
        WorkTransaction.Active:=False;
        ADD_SQL(IbQuery1,'select KLN_FULL FROM KLN_DATA(:KLN_ID)');
        IbQuery1.ParamByname('KLN_ID').asinteger:=USER_FIO.tag;
        IbQuery1.Open;
        USER_FIO.text:=IbQuery1.fieldByname('KLN_FULL').asstring;
     end;
     DIC_KLIENT.Destroy;

end;

procedure TREPORT_SKID.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpSkidUser.Caption:=USERFIO_SHORT;
     PpSkidUser2.Caption:=USERFIO_SHORT;
     PpSkidVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_SKID.PpSkidPreviewFormCreate(Sender: TObject);
begin
     ppSkid.PreviewForm.WindowState:=WsMaximized;
end;

end.