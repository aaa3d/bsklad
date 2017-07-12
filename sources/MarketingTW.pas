unit MarketingTW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Animate, GIFCtrl, ToolWin, ComCtrls, Db, IBCustomDataSet,
  IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl,VclUtils, ppMemo, ppCtrls,
  ppStrtch, ppVar, ppPrnabl, ppClass, ppBands, ppDB, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDBPipe;

type
  TMarketing_TW = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    MarketingTransaction: TIBTransaction;
    QueryPost: TIBQuery;
    DsPost: TDataSource;
    QueryPostMARKET_ID: TIntegerField;
    QueryPostTW_MONEY: TFloatField;
    QueryPostTW_MONEYD: TFloatField;
    QueryPostKLN_FULL: TIBStringField;
    QueryPostMARKET_DATE: TDateTimeField;
    QueryPostMARKET_PRIM: TIBStringField;
    ToolBar1: TToolBar;
    Arc: TCheckBox;
    BtnNEw: TToolButton;
    BtnOPEN: TToolButton;
    BtnDEL: TToolButton;
    ToolButton4: TToolButton;
    QueryKonk: TIBQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IBStringField1: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField2: TIBStringField;
    DsKonk: TDataSource;
    RxDBGrid2: TRxDBGrid;
    IBQuery1: TIBQuery;
    Edit1: TEdit;
    ToolButton5: TToolButton;
    BtnPrint: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PipKonk: TppDBPipeline;
    PipPost: TppDBPipeline;
    PpKonk: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppImage1: TppImage;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpKonkUser: TppLabel;
    ppImage2: TppImage;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    PpKonkVers: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel8: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    PpKonkUser2: TppLabel;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    PpKonk_Title1: TppMemo;
    PpKonk_Title2: TppMemo;
    PpPost: TppReport;
    ppTitleBand2: TppTitleBand;
    ppImage3: TppImage;
    ppLabel11: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel19: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    PpPostUser: TppLabel;
    ppShape3: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    PpPost_Title1: TppMemo;
    ppHeaderBand2: TppHeaderBand;
    ppLabel30: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel31: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    PpPostUser2: TppLabel;
    ppShape4: TppShape;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    PpPost_Title2: TppMemo;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppDBText6: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppSummaryBand2: TppSummaryBand;
    ppImage4: TppImage;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    PpPostVers: TppLabel;
    ppLine2: TppLine;
    QueryKonkUS_FULL: TIBStringField;
    QueryPostUS_FULL: TIBStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ArcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNEwClick(Sender: TObject);
    procedure BtnOPENClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnDELClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnPrintClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpKonkPreviewFormCreate(Sender: TObject);
    procedure PpPostPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Marketing_TW: TMarketing_TW;
  TW_ART:integer;
  TW_NAM:ansistring;

implementation

uses B_utils,B_DButils,Data1, EditMarket;

{$R *.DFM}

procedure TMarketing_TW.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#32 then begin
        key:=#0;
        ARC.checked:=Not ARC.checked;
        ARCClick(Sender);
     end;
     if key='1' then PageControl1.ActivePage:=Tabsheet1;
     if key='2' then PageControl1.ActivePage:=Tabsheet2;
end;

procedure TMarketing_TW.FormShow(Sender: TObject);
begin
     MarketingTransaction.Active:=False;
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select TW_ART,TW_NAM FROM TW WHERE TW_ID= :TW_ID');
     IbQuery1.ParamByname('TW_ID').asinteger:=Marketing_TW.tag;
     IbQuery1.Open;
     TW_ART:=IbQuery1.fieldByname('TW_ART').asinteger;
     TW_NAM:=IbQuery1.fieldByname('TW_NAM').asstring;
     EDIT1.text:=inttostr(TW_ART)+'  '+TW_NAM;
     QueryPost.close;
     QueryKonk.close;
     QueryPost.ParamByname('TW_ID').asinteger:=Marketing_TW.tag;
     QueryKonk.ParamByname('TW_ID').asinteger:=Marketing_TW.tag;
     if Arc.checked then begin
        QueryPost.ParamByname('MARKET_DATE').asdatetime:=date()-36500;
        QueryKonk.ParamByname('MARKET_DATE').asdatetime:=date()-36500;
     end else begin
         QueryPost.ParamByname('MARKET_DATE').asdatetime:=date()-MARKET_PERIOD;
         QueryKonk.ParamByname('MARKET_DATE').asdatetime:=date()-MARKET_PERIOD;
     end;
     QueryPost.Open;
     QueryKonk.Open;
end;

procedure TMarketing_TW.ArcClick(Sender: TObject);
begin
     QueryPost.close;
     QueryKonk.close;
     if Arc.checked then begin
        QueryPost.ParamByname('MARKET_DATE').asdatetime:=date()-36500;
        QueryKonk.ParamByname('MARKET_DATE').asdatetime:=date()-36500;
     end else begin
         QueryPost.ParamByname('MARKET_DATE').asdatetime:=date()-MARKET_PERIOD;
         QueryKonk.ParamByname('MARKET_DATE').asdatetime:=date()-MARKET_PERIOD;
     end;
     QueryPost.Open;
     QueryKonk.Open;
end;

procedure TMarketing_TW.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QueryPost.close;
     QueryKonk.close;
     MarketingTransaction.Active:=False;
end;

procedure TMarketing_TW.BtnNEwClick(Sender: TObject);
begin
     Application.createForm(TEDIT_MARKET,EDIT_MARKET);
     EDIT_MARKET.TW_ART.text:=inttostr(TW_ART);
     EDIT_MARKET.TW_NAM.text:=TW_NAM;
     if PageControl1.ActivePage=Tabsheet1 then EDIT_MARKET.TW_ART.tag:=1
                                          else EDIT_MARKET.TW_ART.tag:=2;
     EDIT_MARKET.TW_NAM.tag:=Marketing_TW.tag;
     EDIT_MARKET.Tag:=-1;
     EDIT_MARKET.ShowModal;
     if EDIT_MARKET.tag>0 then begin
        QueryPost.Disablecontrols;
        QueryKonk.Disablecontrols;
        MarketingTransaction.Active:=False;
        QueryPost.close;
        QueryKonk.close;
        QueryPost.Open;
        QueryKonk.Open;
        if PageControl1.ActivePage=Tabsheet1 then QueryPost.locate('MARKET_ID',EDIT_MARKET.Tag,[]);
        if PageControl1.ActivePage=Tabsheet2 then QueryKonk.locate('MARKET_ID',EDIT_MARKET.Tag,[]);
        QueryPost.Enablecontrols;
        QueryKonk.Enablecontrols;
     end;
     EDIT_MARKET.destroy;
end;

procedure TMarketing_TW.BtnOPENClick(Sender: TObject);
var
   ID:integer;
begin
   if PageControl1.ActivePage=Tabsheet1 then ID:=QueryPost.fieldByname('MARKET_ID').asinteger;
   if PageControl1.ActivePage=Tabsheet2 then ID:=QueryKonk.fieldByname('MARKET_ID').asinteger;
   if ID>0 then begin
     Application.createForm(TEDIT_MARKET,EDIT_MARKET);
     EDIT_MARKET.TW_ART.text:=inttostr(TW_ART);
     EDIT_MARKET.TW_NAM.text:=TW_NAM;
     if PageControl1.ActivePage=Tabsheet1 then EDIT_MARKET.TW_ART.tag:=1
                                          else EDIT_MARKET.TW_ART.tag:=2;
     EDIT_MARKET.TW_NAM.tag:=Marketing_TW.tag;
     EDIT_MARKET.Tag:=ID;
     EDIT_MARKET.ShowModal;
     if EDIT_MARKET.tag>0 then begin
        QueryPost.Disablecontrols;
        QueryKonk.Disablecontrols;
        MarketingTransaction.Active:=False;
        QueryPost.close;
        QueryKonk.close;
        QueryPost.Open;
        QueryKonk.Open;
        if PageControl1.ActivePage=Tabsheet1 then QueryPost.locate('MARKET_ID',EDIT_MARKET.Tag,[]);
        if PageControl1.ActivePage=Tabsheet2 then QueryKonk.locate('MARKET_ID',EDIT_MARKET.Tag,[]);
        QueryPost.Enablecontrols;
        QueryKonk.Enablecontrols;
     end;
     EDIT_MARKET.destroy;
   end;
end;

procedure TMarketing_TW.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=120 then BtnPrint.click;
     if key=45 then begin
        BtnNew.click;
     end;
     if key=46 then begin
        BtnDel.click;
     end;
end;

procedure TMarketing_TW.BtnDELClick(Sender: TObject);
var
   ID:integer;
begin
   if PageControl1.ActivePage=Tabsheet1 then ID:=QueryPost.fieldByname('MARKET_ID').asinteger;
   if PageControl1.ActivePage=Tabsheet2 then ID:=QueryKonk.fieldByname('MARKET_ID').asinteger;
   if ID>0 then begin
     if Messbox('Удалить выделенные маркетинговые данные?',MessSubmitDelete,4+48+256)=6 then begin
        QueryPost.Disablecontrols;
        QueryKonk.Disablecontrols;
        MarketingTransaction.Active:=False;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('MARKET',ID);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        QueryPost.Open;
        QueryKonk.Open;
        QueryPost.Enablecontrols;
        QueryKonk.Enablecontrols;
     end;
   end;
end;

procedure TMarketing_TW.RxDBGrid1DblClick(Sender: TObject);
begin
     BtnOpen.click;
end;

procedure TMarketing_TW.RxDBGrid2DblClick(Sender: TObject);
begin
     BtnOpen.click;
end;

procedure TMarketing_TW.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TMarketing_TW.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then BtnOpen.click;
end;

procedure TMarketing_TW.BtnPrintClick(Sender: TObject);
var
   ID:integer;
   s:ansistring;
begin
   if PageControl1.ActivePage=Tabsheet1 then ID:=QueryPost.fieldByname('MARKET_ID').asinteger;
   if PageControl1.ActivePage=Tabsheet2 then ID:=QueryKonk.fieldByname('MARKET_ID').asinteger;
   if ID>0 then begin
      if PageControl1.ActivePage=Tabsheet2 then begin
         s:=Edit1.text;
         if Arc.checked then begin
            s:=s+', цены конкурентов, показаны все данные, в том числе и архивные.'
         end else begin
            s:=s+', цены конкурентов, показаны только актуальные данные!'
         end;
         PpKonk_Title1.lines.clear;
         PpKonk_Title1.lines.add(s);
         PpKonk_Title2.lines.clear;
         PpKonk_Title2.lines.add(s);
         PpKonk.reset;
         PpKonk.Print;
      end;
      if PageControl1.ActivePage=Tabsheet1 then begin
         s:=Edit1.text;
         if Arc.checked then begin
            s:=s+', цены поставщиков, показаны все данные, в том числе и архивные.'
         end else begin
            s:=s+', цены поставщиков, показаны только актуальные данные!'
         end;
         PpPost_Title1.lines.clear;
         PpPost_Title1.lines.add(s);
         PpPost_Title2.lines.clear;
         PpPost_Title2.lines.add(s);
         PpPost.reset;
         PpPost.Print;
      end;
   end;
end;

procedure TMarketing_TW.ToolButton1Click(Sender: TObject);
begin
     My_lock;

end;

procedure TMarketing_TW.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpKonkUser.Caption:=USERFIO_SHORT;
     PpKonkUser2.Caption:=USERFIO_SHORT;
     PpKonkVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TMarketing_TW.PpKonkPreviewFormCreate(Sender: TObject);
begin
     PpKonk.PreviewForm.WindowState:=WsMaximized;
end;

procedure TMarketing_TW.PpPostPreviewFormCreate(Sender: TObject);
begin
     PpPost.PreviewForm.WindowState:=WsMaximized;
end;

procedure TMarketing_TW.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
     PpPostUser.Caption:=USERFIO_SHORT;
     PpPostUser2.Caption:=USERFIO_SHORT;
     PpPostVers.caption:=PROG_VERSION;
     try
       Ppimage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

end.