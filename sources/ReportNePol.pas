unit ReportNePol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  StdCtrls, RxLookup, ExtCtrls,VclUtils, ppCtrls, ppStrtch, ppMemo,
  ppPrnabl, ppClass, ppBands, ppDB, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppVar;

type
  TREPORT_NEPOL = class(TForm)
    TrNePol: TIBTransaction;
    QrSKL: TIBQuery;
    QrNePol: TIBQuery;
    DsSKL: TDataSource;
    QrSKLSKL_ID: TIntegerField;
    QrSKLSKL_FULL: TIBStringField;
    SKL: TRxDBLookupCombo;
    SKL1: TRadioButton;
    SKL2: TRadioButton;
    BtnRUN: TButton;
    BtnClose: TButton;
    Image3: TImage;
    QrNePolDOC_FULL_NUM: TIBStringField;
    QrNePolDOC_DATE: TDateTimeField;
    QrNePolTW_ART: TIntegerField;
    QrNePolTW_NAM: TIBStringField;
    QrNePolED_SHORT: TIBStringField;
    QrNePolTW_KOL: TFloatField;
    QrNePolPOL_KOL: TFloatField;
    QrNePolNEPOL_KOL: TFloatField;
    QrNePolSKL_FULL: TIBStringField;
    DsNepol: TDataSource;
    PipNepol: TppDBPipeline;
    PpNepol: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    SKL_TITLE: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppImage1: TppImage;
    PpNepolUser: TppLabel;
    ppLabel622: TppLabel;
    ppLabel621: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable53: TppSystemVariable;
    ppSystemVariable52: TppSystemVariable;
    ppLabel119: TppLabel;
    ppImage2: TppImage;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    PpNepolVers: TppLabel;
    ppShape1: TppShape;
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
    ppShape2: TppShape;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel23: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel25: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel27: TppLabel;
    SKL_TITLE2: TppLabel;
    ppLabel28: TppLabel;
    PpNepolUser2: TppLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRUNClick(Sender: TObject);
    procedure SKL2Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpNepolPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_NEPOL: TREPORT_NEPOL;

implementation

{$R *.DFM}

procedure TREPORT_Nepol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrSKL.close;
     QrNepol.Close;
     TrNepol.Active:=False;
end;

procedure TREPORT_Nepol.FormShow(Sender: TObject);
begin
     TrNepol.Active:=False;
     QrSKL.close;
     QrSKL.Open;
     SKL.value:=inttostr(DEFAULT_SKLAD);
     SKL2.checked:=TRUE;
     SKL.enabled:=TRUE;
     SKL.setfocus;
end;

procedure TREPORT_Nepol.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#10 then begin
        KEY:=#0;
        Try
           SKL.setfocus;
           SKL1.setfocus;
           SKL2.setfocus;
        Except
        End;
        BtnRun.click;
     end;
end;

procedure TREPORT_Nepol.BtnRUNClick(Sender: TObject);
begin
          Btnrun.enabled:=False;
     BtnClose.enabled:=False;
     QrNepol.close;
     if SKL1.checked then QrNepol.ParamByname('SKL_ID').asinteger:=0
     else QrNepol.ParamByname('SKL_ID').asinteger:=strtoint(SKL.value);
     QrNepol.open;
     if QrNepol.eof then MEssbox('Îò÷¸ò ïóñò!',MessSystem,48)
     else begin
          if SKL1.checked then SKL_TITLE.caption:='ÂÑÅ!'
                          else SKL_TITLE.caption:=SKL.text;
          if SKL1.checked then SKL_TITLE2.caption:='ÂÑÅ!'
                          else SKL_TITLE2.caption:=SKL.text;
          PpNepol.reset;
          PpNepol.print;
     end;
     Btnrun.enabled:=True;
     BtnClose.enabled:=True;
end;

procedure TREPORT_Nepol.SKL2Click(Sender: TObject);
begin
     SKL.Enabled:=SKL2.checked;
end;

procedure TREPORT_Nepol.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TREPORT_NEPOL.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpNepolUser.Caption:=USERFIO_SHORT;
     PpNepolUser2.Caption:=USERFIO_SHORT;
     PpNepolVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_NEPOL.PpNepolPreviewFormCreate(Sender: TObject);
begin
     PpNepol.PreviewForm.WindowState:=WsMaximized;
end;

end.
