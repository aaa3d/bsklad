unit EditMarket;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, Mask, CurrEdit, StdCtrls,Data1,B_Utils,B_DButils, Db,
  IBCustomDataSet, IBQuery, IBDatabase, ExtCtrls;

type
  TEDIT_MARKET = class(TForm)
    Label1: TLabel;
    TW_ART: TEdit;
    TW_NAM: TEdit;
    Label2: TLabel;
    TW_MONEY: TRxCalcEdit;
    TW_MONEYD: TRxCalcEdit;
    Label3: TLabel;
    KLN_FULL: TEdit;
    Label4: TLabel;
    MARKET_DATE: TDateEdit;
    Label5: TLabel;
    MARKET_PRIM: TEdit;
    BtnSAVE: TButton;
    BtnApply: TButton;
    BtnClose: TButton;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure TW_MONEYChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSAVEClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_MARKET: TEDIT_MARKET;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_MARKET.FormShow(Sender: TObject);
begin
     if TW_ART.tag=1 then Label3.caption:='Поставщик :';
     if TW_ART.tag=2 then Label3.caption:='Конкурент :';
     if EDIT_MARKET.tag>0 then begin
        IbTransaction1.Active:=False;
        IbQuery1.close;
        IbQuery1.SQL.Clear;
        IbQuery1.SQL.add('select * from MARKET where MARKET_ID= :MARKET_ID');
        IbQuery1.PAramByname('MARKET_ID').asinteger:=EDIT_MARKET.tag;
        IbQuery1.Open;
        TW_MONEY.value:=IbQuery1.FieldByname('TW_MONEY').asfloat;
        TW_MONEYD.value:=IbQuery1.FieldByname('TW_MONEYD').asfloat;
        MARKET_DATE.date:=IbQuery1.FieldByname('MARKET_DATE').asdatetime;
        KLN_FULL.text:=IbQuery1.FieldByname('KLN_FULL').asstring;
        MARKET_PRIM.text:=IbQuery1.FieldByname('MARKET_PRIM').asstring;
        IbQuery1.close;
        IbTransaction1.Active:=False;
     end else begin
         TW_MONEY.value:=0;
         TW_MONEYD.value:=0;
         MARKET_DATE.date:=date();
         KLN_FULL.text:='';
         MARKET_PRIM.text:='';
     end;
     TW_MONEY.setfocus;
     SAVE:=True;
end;

procedure TEDIT_MARKET.TW_MONEYChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TEDIT_MARKET.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#10 then begin
        key:=#0;
        TW_MONEY.setfocus;
        TW_MONEYD.setfocus;
        BtnSAVE.click;
     end;
end;

procedure TEDIT_MARKET.BtnSAVEClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.Click;
     if SAVE then Close;
end;

procedure TEDIT_MARKET.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEDIT_MARKET.BtnApplyClick(Sender: TObject);
var
   r:double;
begin
   if (KLN_FULL.text)='' then messbox('Имя поставщика или конкурента не может быть пустой строкой!',MessSystem,48) else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('TW_ID',TW_NAM.tag);
        IBSAVE_ADD('MARKET_TYP',TW_ART.tag);
        IBSAVE_ADD('TW_MONEY',TW_MONEY.value);
        IBSAVE_ADD('TW_MONEYD',TW_MONEYD.value);
        IBSAVE_ADD('KLN_FULL',KLN_FULL.text);
        IBSAVE_ADD('MARKET_DATE',MARKET_DATE.date);
        IBSAVE_ADD('MARKET_PRIM',MARKET_PRIM.text);
        IBSAVE_ADD('US_ID',USERID);
        EDIT_MARKET.tag:=IBSAVE_DOC('MARKET',EDIT_MARKET.tag);
        if EDIT_MARKET.tag<0 then r:=sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        SAVE:=TRUE;
     Except
        SAVE:=FALSE;
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
   end;
end;

procedure TEDIT_MARKET.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose:=TRUE;
     if not SAVE then begin
       CanClose:=FALSE;
       if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
       then CanClose:=TRUE;
     end;
end;

end.
