unit DicTWKTG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, Db, IBCustomDataSet, IBDatabase, IBQuery, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_TWKTG = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnNEW: TToolButton;
    BtnOPEN: TToolButton;
    BtnDEL: TToolButton;
    RxDBGrid1: TRxDBGrid;
    Query_TWKTG: TIBQuery;
    TransactionTWKTG: TIBTransaction;
    DsTWKTG: TDataSource;
    Query_TWKTGTWKTG_ID: TIntegerField;
    Query_TWKTGTWKTG_NAM: TIBStringField;
    Query_TWKTGTWKTG_PRIM: TIBStringField;
    Query_TWKTGTWKTG_COLOR: TIntegerField;
    PopupMenu1: TPopupMenu;
    MnNEW: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnDELClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BtnNEWClick(Sender: TObject);
    procedure BtnOPENClick(Sender: TObject);
    procedure Query_TWKTGAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_TWKTG: TDIC_TWKTG;

implementation

uses EditTWKTG;

{$R *.DFM}

procedure TDIC_TWKTG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_TWKTG.close;
end;

procedure TDIC_TWKTG.FormShow(Sender: TObject);
begin
     Query_TWKTG.close;
     Query_TWKTG.Open;

end;

procedure TDIC_TWKTG.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить категорию товара "'+Query_TWKTG.FieldByname('TWKTG_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('TWKTG',Query_TWKTG.FieldByname('TWKTG_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionTWKTG.Active:=False;
        Query_TWKTG.close;
        Query_TWKTG.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_TWKTG.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
     if Field.Fieldname='TWKTG_NAM' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='TWKTG_NAM' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
end;

procedure TDIC_TWKTG.BtnNEWClick(Sender: TObject);
begin
     Application.CreateForm(TEDIT_TWKTG,EDIT_TWKTG);
     EDIT_TWKTG.tag:=-1;
     EDIT_TWKTG.ShowModal;
     if EDIT_TWKTG.tag>0 then begin
        TransactionTWKTG.Active:=False;
        Query_TWKTG.close;
        Query_TWKTG.Open;
        Query_TWKTG.Locate('TWKTG_ID',EDIT_TWKTG.tag,[]);
     end;
     RxDbgrid1.setfocus;
     EDIT_TWKTG.Destroy;
end;

procedure TDIC_TWKTG.BtnOPENClick(Sender: TObject);
begin
     Application.CreateForm(TEDIT_TWKTG,EDIT_TWKTG);
     EDIT_TWKTG.tag:=Query_TWKTG.FieldByname('TWKTG_ID').asinteger;
     EDIT_TWKTG.ShowModal;
     if EDIT_TWKTG.tag>0 then begin
        TransactionTWKTG.Active:=False;
        Query_TWKTG.close;
        Query_TWKTG.Open;
        Query_TWKTG.Locate('TWKTG_ID',EDIT_TWKTG.tag,[]);
     end;
     RxDbgrid1.setfocus;
     EDIT_TWKTG.Destroy;

end;

procedure TDIC_TWKTG.Query_TWKTGAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_TWKTG.eof;
     BtnOpen.enabled:=EN;
     MnOpen.enabled:=EN;
     BtnDel.enabled:=EN;
     MnDel.enabled:=EN;
end;

procedure TDIC_TWKTG.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_TWKTG.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
