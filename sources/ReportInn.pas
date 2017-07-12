unit ReportInn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_dbutils, StdCtrls, IBDatabase, Db, IBCustomDataSet,
  IBQuery, ppCtrls, ppPrnabl, ppClass, ppStrtch, ppMemo, ppBands, ppDB,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppVar, Animate,
  GIFCtrl;

type
  TREPORT_INN = class(TForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    QrINN: TIBQuery;
    ReportTransaction: TIBTransaction;
    QrINNKLNTREE_ID: TIntegerField;
    QrINNKLNTREE_FULL: TIBStringField;
    QrINNKLN_FULL: TIBStringField;
    QrINNKLN_BNK: TIBStringField;
    QrINNKLN_RS: TIBStringField;
    QrINNKLN_INN: TIBStringField;
    DsInn: TDataSource;
    PipINN: TppDBPipeline;
    PpINN: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBMemo1: TppDBMemo;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppImage1: TppImage;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpInnUser: TppLabel;
    ppImage2: TppImage;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    PpInnVers: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    PpInnUser2: TppLabel;
    ppShape2: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    PpInnTitle1: TppLabel;
    PpInnTitle2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo3: TppDBMemo;
    ppLine3: TppLine;
    RxGIFAnimator1: TRxGIFAnimator;
    Label1: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure PpINNPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_INN: TREPORT_INN;

implementation

{$R *.DFM}

procedure TREPORT_INN.Button1Click(Sender: TObject);
begin
  ReportTransaction.Active:=False;
  QrInn.close;
  if Checkbox1.checked then begin
    PpInnTitle1.caption:='Отчет о контактах, имеющих устанвленный ИНН';
    PpInnTitle2.caption:=PpInnTitle1.caption;
    QrInn.Parambyname('I').asstring:='1';
  end else begin
    PpInnTitle1.caption:='Отчет о контактах, не имеющих устанвленный ИНН';
    PpInnTitle2.caption:=PpInnTitle1.caption;
    QrInn.Parambyname('I').asstring:='0';
  end;
  QrInn.Open;
  if QrInn.eof then Messbox('Отчет пуст!',MessSystem,48) else begin
    PpInn.reset;
    PpInn.print;
  end;
end;

procedure TREPORT_INN.PpINNPreviewFormCreate(Sender: TObject);
begin
     PpINN.PreviewForm.WindowState:=WsMaximized;
end;

procedure TREPORT_INN.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpINNUser.Caption:=USERFIO_SHORT;
     PpINNUser2.Caption:=USERFIO_SHORT;
     PpINNVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_INN.Button2Click(Sender: TObject);
begin
  close;
end;

end.
