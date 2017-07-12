unit DicShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DButils,B_utils, ComCtrls, Grids, DBGrids, RXDBCtrl, ToolWin,
  StdCtrls, ExtCtrls, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TDic_shop = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    RxDBGrid1: TRxDBGrid;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    QrShop: TIBQuery;
    DataSource1: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ShopTransaction: TIBTransaction;
    QrShopSHOP_ID: TIntegerField;
    QrShopSHOP_NAME: TIBStringField;
    QrShopSHOP_LAST: TDateTimeField;
    QrShopSHOP_OFFICE: TIBStringField;
    QrShopSHOP_PREFIX: TIBStringField;
    QrShopSHOP_POSTFIX: TIBStringField;
    QrShopSHOP_COLOR: TIntegerField;
    QrShopSHOP_TM: TDateTimeField;
    QrShopSHOP_VISIBLE: TIBStringField;
    QrShopSHOP_FRM: TIntegerField;
    QrShopFRM_NAME: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure QrShopAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dic_shop: TDic_shop;

implementation

uses EditShop;

{$R *.DFM}

procedure TDic_shop.FormShow(Sender: TObject);
begin
     ShopTransaction.Active:=False;
     QrShop.Close;
     QrShop.Open;
end;

procedure TDic_shop.QrShopAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not QrShop.Eof;
     BtnOpen.enabled:=EN;
     BtnDel.enabled:=EN;
end;

procedure TDic_shop.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger<0
           then RxDbgrid1.Canvas.Brush.color:=clWindow
           else RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger<0
           then RxDbgrid1.Canvas.Font.color:=clHighlighttext
           else RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger<0
        then RxDbgrid1.Canvas.Brush.color:=clWindow
        else RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_OFFICE').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         35,True);
      end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);

  end;

end;

procedure TDic_shop.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDic_shop.BtnNewClick(Sender: TObject);
begin
     application.createForm(TEdit_shop,edit_shop);
     Edit_shop.tag:=-1;
     Edit_shop.showmodal;
     if Edit_shop.tag>0 then begin
        ShopTransaction.Active:=False;
        QrShop.close;
        QrShop.Open;
        QrShop.locate('SHOP_ID',Edit_shop.tag,[]);
        RxDbGrid1.setfocus;
     end;
     Edit_shop.Destroy;
end;

procedure TDic_shop.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
     ID:=QrShop.fieldByname('SHOP_ID').asinteger;
     application.createForm(TEdit_shop,edit_shop);
     Edit_shop.tag:=ID;
     Edit_shop.showmodal;
     if Edit_shop.tag>0 then begin
        ShopTransaction.Active:=False;
        QrShop.close;
        QrShop.Open;
        QrShop.locate('SHOP_ID',ID,[]);
        RxDbGrid1.setfocus;
     end;
     Edit_shop.Destroy;
end;

procedure TDic_shop.BtnDelClick(Sender: TObject);
begin
        if Messbox('Удалить магазин "'+QrShop.fieldbyname('SHOP_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
                if IBDELETE_DOC('SHOP',QrShop.fieldbyname('SHOP_ID').asinteger) then begin
                        ShopTransaction.Active:=False;
                        QrShop.Close;
                        QrShop.Open;
                        RxDbGrid1.setfocus;
                end;
        end;

end;

procedure TDic_shop.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDic_shop.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TDic_shop.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if (Key=45) and (BtnNew.enabled) then BtnNew.click;
        if (Key=46) and (BtnDEL.enabled) then BtnDEL.click;
end;

procedure TDic_shop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrShop.close;
end;

procedure TDic_shop.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
