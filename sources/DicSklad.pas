unit DicSklad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,
  Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls,
  IBDatabase
  ;

type
  TDIC_SKLAD = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    ToolButton4: TToolButton;
    BtnPropertis: TToolButton;
    RxDBGrid1: TRxDBGrid;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    ToolButton6: TToolButton;
    BtnUp: TToolButton;
    BtnDown: TToolButton;
    QrSklad: TIBQuery;
    DataSource1: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    SkladTransaction: TIBTransaction;
    QrSkladSKL_ID: TIntegerField;
    QrSkladSKL_SHORT: TIBStringField;
    QrSkladSKL_FULL: TIBStringField;
    QrSkladSKL_ADR: TIBStringField;
    QrSkladSKL_TEL: TIBStringField;
    QrSkladSKL_TIME: TIBStringField;
    QrSkladSKL_SPEED: TIntegerField;
    QrSkladTM: TDateTimeField;
    QrSkladSKL_FRM: TIntegerField;
    QrSkladSKL_NAME: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure QrSkladAfterOpen(DataSet: TDataSet);
    procedure QrSkladAfterScroll(DataSet: TDataSet);
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
    procedure BtnDownClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_SKLAD: TDIC_SKLAD;

implementation

uses EditSklad;

{$R *.DFM}

procedure TDIC_SKLAD.FormShow(Sender: TObject);
begin
     SkladTransaction.Active:=False;
     QrSklad.Close;
     QrSklad.Open;
end;

procedure TDIC_SKLAD.QrSkladAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not QrSklad.Eof;
     BtnOpen.enabled:=EN;
     BtnDel.enabled:=EN;
     BtnPropertis.enabled:=EN;
     if EN and (QrSklad.fieldbyname('SKL_SPEED').asinteger>0) then begin
        BtnUp.enabled:=true;
        BtnDown.enabled:=true;
     end else begin
        BtnUp.enabled:=False;
        BtnDown.enabled:=False;
     end;

end;

procedure TDIC_SKLAD.QrSkladAfterScroll(DataSet: TDataSet);
begin
     if QrSklad.fieldbyname('SKL_SPEED').asinteger>0 then begin
        BtnUp.enabled:=true;
        BtnDown.enabled:=true;
     end else begin
        BtnUp.enabled:=False;
        BtnDown.enabled:=False;
     end;

end;

procedure TDIC_SKLAD.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
      if (((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SKL_SPEED').Asinteger>0) and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SKL_SPEED').Asinteger< 10000))
      then begin
         RxDbgrid1.Canvas.FillRect(Rect);
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         32,True);
      end;
  end;

end;

procedure TDIC_SKLAD.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDIC_SKLAD.BtnNewClick(Sender: TObject);
begin
     application.createForm(TEdit_sklad,edit_sklad);
     Edit_sklad.tag:=-1;
     Edit_sklad.showmodal;
     if Edit_sklad.tag>0 then begin
        SkladTransaction.Active:=False;
        QrSklad.close;
        QrSklad.Open;
        QrSklad.locate('SKL_ID',Edit_sklad.tag,[]);
        RxDbGrid1.setfocus;
     end;
     Edit_sklad.Destroy;
end;

procedure TDIC_SKLAD.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
     ID:=QrSklad.fieldByname('SKL_ID').asinteger;
     application.createForm(TEdit_sklad,edit_sklad);
     Edit_sklad.tag:=ID;
     Edit_sklad.showmodal;
     if Edit_sklad.tag>0 then begin
        SkladTransaction.Active:=False;
        QrSklad.close;
        QrSklad.Open;
        QrSklad.locate('SKL_ID',ID,[]);
        RxDbGrid1.setfocus;
     end;
     Edit_sklad.Destroy;
end;

procedure TDIC_SKLAD.BtnDelClick(Sender: TObject);
begin
        if Messbox('”далить склад "'+QrSklad.fieldbyname('SKL_FULL').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
                if IBDELETE_DOC('SKL',QrSklad.fieldbyname('SKL_ID').asinteger) then begin
                        SkladTransaction.Active:=False;
                        QrSklad.Close;
                        QrSklad.Open;
                        RxDbGrid1.setfocus;
                end;
        end;
end;

procedure TDIC_SKLAD.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_SKLAD.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TDIC_SKLAD.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if (Key=45) and (BtnNew.enabled) then BtnNew.click;
        if (Key=46) and (BtnDEL.enabled) then BtnDEL.click;
        if (Key=40) and (BtnDown.enabled) and (ssShift in Shift) then begin
           BtnDown.click;
           Key:=0;
        end else
        if (Key=38) and (BtnUp.enabled) and (ssShift in Shift) then begin
           BtnUp.click;
           Key:=0;
        end else if (ssShift in Shift) then  Key:=0;
end;

procedure TDIC_SKLAD.BtnDownClick(Sender: TObject);
VAR
   ID1,ID2:integer;
   Speed1,Speed2:integer;
begin
     {ѕеремещ€ем вниз}
     {1. ќпредел€ем, есть ли внизу ещЄ кто-нибудь}
     ID1:=QrSklad.fieldbyname('SKL_ID').asinteger;
     Speed1:=QrSklad.fieldbyname('SKL_SPEED').asinteger;
     QrSklad.DisableControls;
     QrSklad.next;
     if not QrSklad.eof then begin
       ID2:=QrSklad.fieldbyname('SKL_ID').asinteger;
       Speed2:=QrSklad.fieldbyname('SKL_SPEED').asinteger;
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
                IBSAVE_CLEAR;
                IBSAVE_ADD('SKL_SPEED',Speed2);
                IBSAVE_DOC('SKL',ID1);
                IBSAVE_CLEAR;
                IBSAVE_ADD('SKL_SPEED',Speed1);
                IBSAVE_DOC('SKL',ID2);
                Datamodule1.IBTransaction2.Commit;
       except
            Datamodule1.IBTransaction2.Rollback;
       end;
       SkladTransaction.Active:=False;
       QrSklad.Close;
       QrSklad.Open;
     end;
     QrSklad.Locate('SKL_ID',ID1,[]);
     QrSklad.EnableControls;
end;

procedure TDIC_SKLAD.BtnUpClick(Sender: TObject);
VAR
   ID1,ID2:integer;
   Speed1,Speed2:integer;
begin
     {ѕеремещ€ем ¬верх}
     {1. ќпредел€ем, есть ли внизу ещЄ кто-нибудь}
     ID1:=QrSklad.fieldbyname('SKL_ID').asinteger;
     Speed1:=QrSklad.fieldbyname('SKL_SPEED').asinteger;
     QrSklad.DisableControls;
     QrSklad.Prior;
     if not QrSklad.bof then begin
       if QrSklad.fieldbyname('SKL_SPEED').asinteger>0 then begin
         ID2:=QrSklad.fieldbyname('SKL_ID').asinteger;
         Speed2:=QrSklad.fieldbyname('SKL_SPEED').asinteger;
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         try
                  IBSAVE_CLEAR;
                  IBSAVE_ADD('SKL_SPEED',Speed2);
                  IBSAVE_DOC('SKL',ID1);
                  IBSAVE_CLEAR;
                  IBSAVE_ADD('SKL_SPEED',Speed1);
                  IBSAVE_DOC('SKL',ID2);
                  Datamodule1.IBTransaction2.Commit;
         except
              Datamodule1.IBTransaction2.Rollback;
         end;
         SkladTransaction.Active:=False;
         QrSklad.Close;
         QrSklad.Open;
       end;
     end;
     QrSklad.Locate('SKL_ID',ID1,[]);
     QrSklad.EnableControls;
end;

procedure TDIC_SKLAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrSklad.close;
end;

procedure TDIC_SKLAD.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
