unit ReportPOST;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons,Data1,B_utils,B_DButils, Db,
  IBCustomDataSet, IBQuery, IBDatabase,DataPrint,VclUtils, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppStrtch, ppMemo, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppBands, ppProd, ppReport;

type
  TReport_POST = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    Label3: TLabel;
    Edit1: TEdit;
    BtnKln: TBitBtn;
    BtnClose: TButton;
    BtnRUN: TButton;
    BtnLIST: TButton;
    Image3: TImage;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    Reestr: TComboBox;
    PipPostList: TppDBPipeline;
    PpPostList: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    TITLE1: TppLabel;
    ppLabel623: TppLabel;
    ppSystemVariable55: TppSystemVariable;
    ppSystemVariable56: TppSystemVariable;
    ppLabel624: TppLabel;
    ppSystemVariable57: TppSystemVariable;
    ppLabel625: TppLabel;
    ppLabel626: TppLabel;
    PpPostListUser: TppLabel;
    ppImage17: TppImage;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape2: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBMemo1: TppDBMemo;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel11: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel13: TppLabel;
    PpPostListUser2: TppLabel;
    ppImage18: TppImage;
    ppLabel353: TppLabel;
    ppLabel355: TppLabel;
    PpPostListVers: TppLabel;
    Title2: TppLabel;
    Footer1: TppLabel;
    PipPostMove: TppDBPipeline;
    PpPostMove: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand2: TppTitleBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    PpMoveShortUser: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel17: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppImage1: TppImage;
    MoveShortTitle1: TppMemo;
    ppShape3: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBText7: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape4: TppShape;
    ppDBText8: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel25: TppLabel;
    ppLine3: TppLine;
    ppLabel26: TppLabel;
    ppLine4: TppLine;
    ppDBCalc6: TppDBCalc;
    MoveShortSumm: TppMemo;
    ppShape5: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    MoveShortTitle2: TppMemo;
    ppLabel34: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel35: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLabel36: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    PpMoveShortUser2: TppLabel;
    ppLabel38: TppLabel;
    MoveShortFooter: TppLabel;
    ppImage2: TppImage;
    ppLabel16: TppLabel;
    PpMoveShortVers: TppLabel;
    ppLabel39: TppLabel;
    PpPostMoveDetal: TppReport;
    ppTitleBand3: TppTitleBand;
    ppLabel37: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    PpMoveFullUser: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel43: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppImage3: TppImage;
    MoveFullTitle1: TppMemo;
    ppShape6: TppShape;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppShape7: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    MoveFullTitle2: TppMemo;
    ppLabel58: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel59: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel60: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    PpMoveFullUser2: TppLabel;
    ppLabel62: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBText15: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel63: TppLabel;
    ppLine5: TppLine;
    ppDBCalc8: TppDBCalc;
    MoveFullSumm: TppMemo;
    MoveFullFooter: TppLabel;
    ppImage4: TppImage;
    ppLabel65: TppLabel;
    PpMoveFullVers: TppLabel;
    ppLabel67: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppDBText16: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLabel68: TppLabel;
    ppLine6: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    PipPostOst: TppDBPipeline;
    PpPostOst: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppTitleBand4: TppTitleBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel42: TppLabel;
    ppLabel61: TppLabel;
    ppLabel64: TppLabel;
    PpOstUser: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppLabel75: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppSystemVariable18: TppSystemVariable;
    ppImage5: TppImage;
    ppLabel66: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppLabel76: TppLabel;
    ppSystemVariable20: TppSystemVariable;
    ppLabel77: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    PpOstUser2: TppLabel;
    ppLabel79: TppLabel;
    ppImage6: TppImage;
    ppLabel78: TppLabel;
    PpOstVers: TppLabel;
    ppLabel81: TppLabel;
    PpOstTitle1: TppMemo;
    PpOstTitle2: TppMemo;
    ppLine7: TppLine;
    ppDBMemo5: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine8: TppLine;
    ppLabel82: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine9: TppLine;
    ppShape9: TppShape;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppShape10: TppShape;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    PpOstFooter: TppLabel;
    ppDBMemo7: TppDBMemo;
    procedure FormShow(Sender: TObject);
    procedure BtnKlnClick(Sender: TObject);
    procedure BtnLISTClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BtnRUNClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpPostListPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure ppDBCalc6Print(Sender: TObject);
    procedure PpPostMovePreviewFormCreate(Sender: TObject);
    procedure PpPostMoveDetalPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand3BeforeGenerate(Sender: TObject);
    procedure ppDBCalc8Print(Sender: TObject);
    procedure PpPostOstPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand4BeforeGenerate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_POST: TReport_POST;
  KLN_ID:integer;

implementation

uses DicKlient;

{$R *.DFM}

procedure TReport_POST.FormShow(Sender: TObject);
begin
     Reestr.itemindex:=0;
     DT1.date:=date()-1;
     DT2.date:=date();
     Edit1.text:='';
     KLN_ID:=0;
     if KLN_ID=0 then begin
        Edit1.text:='';
        BtnRun.enabled:=False;
     end;
     BtnKln.SetFocus;
end;

procedure TReport_POST.BtnKlnClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_ID then begin
        KLN_ID:=DIC_KLIENT.tag;
        {Отображаем название фирмы и банка}
        WorkTransaction.Active:=False;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
        IbQuery1.Parambyname('KLN_ID').asinteger:=KLN_ID;
        IbQuery1.Open;
        Edit1.text:=IbQuery1.fieldByname('KLN_FULL').asstring;
        BtnRun.enabled:=True;
        IbQuery1.Close;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TReport_POST.BtnLISTClick(Sender: TObject);
var
   Tm1,tm2:Tdatetime;
begin
     Tm1:=time();
     BtnRun.enabled:=False;
     BtnList.enabled:=False;
     BtnClose.enabled:=False;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.ReportPostList.close;
     Datamodule2.ReportPostList.ParamByname('DT1').asdatetime:=Dt1.date;
     Datamodule2.ReportPostList.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     Datamodule2.ReportPostList.Open;
     tm2:=time();
     if Datamodule2.ReportPostList.eof then messbox('За указанный период не было движения товара у поставщиков!',MessSystem,48)
     else begin
       Title1.caption:=' с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+'. Состояние на '+Date_Sokr(date())+' '+timetostr(time());
       Title2.caption:=' с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+'. Состояние на '+Date_Sokr(date())+' '+timetostr(time());
       Footer1.caption:='Время построения отчёта: '+timetostr(tm2-tm1);
       PpPostList.reset;
       PpPostList.Print;
     end;
     if KLN_ID>0 then BtnRun.enabled:=True;
     BtnList.enabled:=True;
     BtnClose.enabled:=True;
end;

procedure TReport_POST.FormDestroy(Sender: TObject);
begin
     DataModule2.ReportPostOst.close;
     Datamodule2.ReportPostList.close;
     Datamodule2.PrintTransaction.Active:=False;
end;

procedure TReport_POST.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TReport_POST.CheckBox1Click(Sender: TObject);
begin
     if (not CheckBox1.checked) and (not CheckBox2.checked) then CheckBox2.checked:=true;
     Reestr.enabled:=CheckBox1.checked;
end;

procedure TReport_POST.CheckBox2Click(Sender: TObject);
begin
     if (not CheckBox1.checked) and (not CheckBox2.checked) then CheckBox1.checked:=true;
end;

procedure TReport_POST.BtnRUNClick(Sender: TObject);
var
   Tm1,Tm2:Tdatetime;
begin
     if Checkbox1.checked then begin
        Tm1:=time();
        DataModule2.PrintTransaction.Active:=False;
        DataModule2.QrPostMove.close;
        DataModule2.QrPostMove.ParamByname('KLN_ID').asinteger:=KLN_ID;
        DataModule2.QrPostMove.ParamByname('DT1').asdatetime:=DT1.date;
        DataModule2.QrPostMove.ParamByname('DT2').asdatetime:=DT2.date+1-Sekond1;
        DataModule2.QrPostMove.Open;
        Tm2:=time();
        if DataModule2.QrPostMove.eof then Messbox('У выбранного поставщика за период с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+' нет движения товара!',MessSystem,48)
        else begin
             if Reestr.itemindex=0 then begin
                 MoveFullTitle1.lines.clear;
                 MoveFullTitle1.lines.add('Движение товара поставщика "'+Edit1.text+'" за период с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+', Cостояние на '+Date_Sokr(date())+' '+timetostr(time()));
                 MoveFullTitle2.lines.clear;
                 MoveFullTitle2.lines.add('Движение товара поставщика "'+Edit1.text+'" за период с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+', Cостояние на '+Date_Sokr(date())+' '+timetostr(time()));
                 MoveFullFooter.caption:='Время построения отчёта: '+timetostr(tm2-tm1);
                 PpPostMoveDetal.reset;
                 PpPostMoveDetal.Print;
             end else begin
                 MoveShortTitle1.lines.clear;
                 MoveShortTitle1.lines.add('Движение товара поставщика "'+Edit1.text+'" за период с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+', Cостояние на '+Date_Sokr(date())+' '+timetostr(time()));
                 MoveShortTitle2.lines.clear;
                 MoveShortTitle2.lines.add('Движение товара поставщика "'+Edit1.text+'" за период с '+date_sokr(Dt1.date)+' по '+date_sokr(Dt2.date)+', Cостояние на '+Date_Sokr(date())+' '+timetostr(time()));
                 MoveShortFooter.caption:='Время построения отчёта: '+timetostr(tm2-tm1);
                 PpPostMove.reset;
                 PpPostMove.Print;
             end;
        end;
     end;
     if Checkbox2.checked then begin
        Tm1:=time();
        DataModule2.PrintTransaction.Active:=False;
        DataModule2.ReportPostOst.close;
        DataModule2.ReportPostOst.ParamByname('KLN_ID').asinteger:=KLN_ID;
        DataModule2.ReportPostOst.ParamByname('DT').asdatetime:=DT2.date+1-Sekond1;
        DataModule2.ReportPostOst.Open;
        Tm2:=time();
        if DataModule2.ReportPostOst.eof then Messbox('У выбранного поставщика на '+date_sokr(Dt2.date)+' нет остатков товара!',MessSystem,48)
        else begin
             PpOstTitle1.lines.clear;
             PpOstTitle1.lines.add('Остатки товара у поставщика '+Edit1.text+' на '+date_sokr(Dt2.date)+', Cостояние на '+Date_Sokr(date())+' '+timetostr(time()));
             PpOstTitle2.lines.clear;
             PpOstTitle2.lines.add('Остатки товара у поставщика '+Edit1.text+' на '+date_sokr(Dt2.date)+', Cостояние на '+Date_Sokr(date())+' '+timetostr(time()));
             PpOstFooter.caption:='Время построения отчёта: '+timetostr(tm2-tm1);
             PpPostOst.reset;
             PpPostOst.Print;
        end;
     end;
end;

procedure TReport_POST.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=121 then begin
        key:=0;
        BtnKln.Click;
     end;
end;

procedure TReport_POST.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if (key=#10) and (KLN_ID<>0) then begin
        key:=#0;
        DT1.setfocus;
        DT2.setfocus;
        BtnRun.click;
     end;
end;

procedure TReport_POST.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
        PpPostListUser.caption:=USERFIO_SHORT;
        PpPostListUser2.caption:=USERFIO_SHORT;
        PpPostListVers.caption:=PROG_VERSION;
     try
       Ppimage17.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TReport_POST.PpPostListPreviewFormCreate(Sender: TObject);
begin
     PpPostList.PreviewForm.WindowState:=WsMaximized;
end;

procedure TReport_POST.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
        PpMoveShortUser.caption:=USERFIO_SHORT;
        PpMoveShortUser2.caption:=USERFIO_SHORT;
        PpMoveShortVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TReport_POST.ppDBCalc6Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC6.Value;
   MoveShortSumm.lines.clear;
   MoveShortSumm.lines.add('('+RUB_CHAR(SUMM1)+')');
end;

procedure TReport_POST.PpPostMovePreviewFormCreate(Sender: TObject);
begin
     PpPostMove.PreviewForm.WindowState:=WsMaximized;
end;

procedure TReport_POST.PpPostMoveDetalPreviewFormCreate(Sender: TObject);
begin
     PpPostMoveDetal.PreviewForm.WindowState:=WsMaximized;
end;

procedure TReport_POST.ppTitleBand3BeforeGenerate(Sender: TObject);
begin
        PpMoveFullUser.caption:=USERFIO_SHORT;
        PpMoveFullUser2.caption:=USERFIO_SHORT;
        PpMoveFullVers.caption:=PROG_VERSION;
     try
       Ppimage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TReport_POST.ppDBCalc8Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC8.Value;
   MoveFullSumm.lines.clear;
   MoveFullSumm.lines.add('('+RUB_CHAR(SUMM1)+')');
end;

procedure TReport_POST.PpPostOstPreviewFormCreate(Sender: TObject);
begin
     PpPostOst.PreviewForm.WindowState:=WsMaximized;
end;

procedure TReport_POST.ppTitleBand4BeforeGenerate(Sender: TObject);
begin
        PpOstUser.caption:=USERFIO_SHORT;
        PpOstUser2.caption:=USERFIO_SHORT;
        PpOstVers.caption:=PROG_VERSION;
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

end.


