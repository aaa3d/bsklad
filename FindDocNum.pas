unit FindDocNum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, ComCtrls,Data1,B_Utils,B_DButils,
  Db, IBCustomDataSet, IBDatabase, IBQuery;

type
  TFIND_DOCNUM = class(TForm)
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BtnGo: TButton;
    FindNumQuery: TIBQuery;
    FindNumTransaction: TIBTransaction;
    DsFindNum: TDataSource;
    FindNumQueryID: TIntegerField;
    FindNumQueryFULL_NUM: TIBStringField;
    FindNumQueryDOC_DATE: TDateTimeField;
    FindNumQueryDOC_OPIS: TIBStringField;
    FindNumQueryPROW: TIntegerField;
    Timer1: TTimer;
    Edit1: TEdit;
    FindNumQueryDOC_COLOR: TIntegerField;
    IBQuery1: TIBQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGoClick(Sender: TObject);
    procedure FindNumQueryAfterOpen(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIND_DOCNUM: TFIND_DOCNUM;

implementation

{$R *.DFM}

procedure TFIND_DOCNUM.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        Close;
        key:=#0;
     end;
     if key in ['0'..'9'] then begin
        Edit1.text:=Edit1.text+Key;
        key:=#0;
     end;
     if key=#8 then begin
             if length(Edit1.text)>0 then begin
                if length(Edit1.text)=1 then Edit1.text:=''
                else begin
                  Edit1.text:=B_utils.left(Edit1.text,length(Edit1.text)-1);
                end;
             end;
             key:=#0;
         end;
end;

procedure TFIND_DOCNUM.BtnGoClick(Sender: TObject);
begin
     tag:=FindNumQuery.fieldByname('ID').asinteger;
     GlDocNum:=FindNumQuery.fieldByname('FULL_NUM').asstring;
     GlDocDate:=FindNumQuery.fieldByname('DOC_DATE').asdatetime;
     GlDocOpis:=FindNumQuery.fieldByname('DOC_OPIS').asstring;
     close;
end;

procedure TFIND_DOCNUM.FindNumQueryAfterOpen(DataSet: TDataSet);
begin
     BtnGo.enabled:=Not FindNumQuery.eof;
     if BtnGo.enabled then RxDbGrid1.SetFocus;
end;

procedure TFIND_DOCNUM.Timer1Timer(Sender: TObject);
var
   N:integer;
begin
   Try
     Timer1.enabled:=False;
     Edit1.text:=trim(Edit1.text);
     N:=strtoint('0'+Edit1.text);
     FindNumTransaction.Active:=False;
     FindNumQuery.close;
     FindNumQuery.SQL.clear;
     case Label1.Tag of

        -1: begin{Приходные накладные все}
              FindNumQuery.SQL.add('select * from FIND_NUM_PN(:NUM,0)');
           end;
        1: begin{Приходные накладные}
              FindNumQuery.SQL.add('select * from FIND_NUM_PN(:NUM,:TYP)');
              FindNumQuery.ParamByname('TYP').asinteger:=Edit1.tag;
           end;
        2: {Счета}
           FindNumQuery.SQL.add('select * from FIND_NUM_ST(:NUM)');
        3: begin{Расходные накладные}
              FindNumQuery.SQL.add('select * from FIND_NUM_RN(:NUM,:TYP)');
              FindNumQuery.ParamByname('TYP').asinteger:=Edit1.tag;
           end;
        4: {Акты списания}
           FindNumQuery.SQL.add('select * from FIND_NUM_SPIS(:NUM)');
        5: {Накладная перемещения}
           FindNumQuery.SQL.add('select * from FIND_NUM_PER(:NUM)');
        6: {Счета-фактуры}
           FindNumQuery.SQL.add('select * from FIND_NUM_STFAKT(:NUM)');
        7: {Гарнтийные талоны}
           FindNumQuery.SQL.add('select * from FIND_NUM_GARANT(:NUM)');
        8: {Платёжные поручения}
           FindNumQuery.SQL.add('select * from FIND_NUM_PL(:NUM)');
        12: {Акты переоценки}
           FindNumQuery.SQL.add('select * from FIND_NUM_REMON(:NUM)');
        13: begin{Расходные в отгрузке}
             FindNumQuery.SQL.add('select * from FIND_NUM_RN_OTG(:NUM,:SKL_ID)');
             FindNumQuery.ParamByname('SKL_ID').asinteger:=Edit1.tag;
           end;
        14: begin{Списания в отгрузке}
           FindNumQuery.SQL.add('select * from FIND_NUM_SPIS_OTG(:NUM,:SKL_ID)');
             FindNumQuery.ParamByname('SKL_ID').asinteger:=Edit1.tag;
           end;
        15: begin{Перемещения в отгрузке}
           FindNumQuery.SQL.add('select * from FIND_NUM_PER_OTG(:NUM,:SKL_ID)');
             FindNumQuery.ParamByname('SKL_ID').asinteger:=Edit1.tag;
           end;
        16: begin{Приходные в получении}
           FindNumQuery.SQL.add('select * from FIND_NUM_PN_OTG(:NUM,:SKL_ID,:US_ID)');
             FindNumQuery.ParamByname('SKL_ID').asinteger:=Edit1.tag;
             FindNumQuery.ParamByname('US_ID').asinteger:=USERID;
           end;
        17: begin{Перемещения в получении}
           FindNumQuery.SQL.add('select * from FIND_NUM_PER_POL(:NUM,:SKL_ID)');
             FindNumQuery.ParamByname('SKL_ID').asinteger:=Edit1.tag;
           end;
        18: begin{Почта}
           FindNumQuery.SQL.add('select * from FIND_NUM_MAIL(:NUM)');
           end;
        19: begin{Платежи}
           FindNumQuery.SQL.add('select * from FIND_NUM_OPLATA(:NUM)');
           end;
        20: begin{Акты пересортицы}
           FindNumQuery.SQL.add('select * from FIND_NUM_PSORT(:NUM)');
           end;
        21: begin{Предоплаты}
           FindNumQuery.SQL.add('select * from FIND_NUM_PO(:NUM)');
           end;
        22: begin{Заявки на переоценку}
           FindNumQuery.SQL.add('select * from FIND_NUM_ZREMON(:NUM)');
           end;
		23: begin{продажи}
           FindNumQuery.SQL.add('select * from FIND_NUM_SALE(:NUM)');
           end;
        24: begin{Заявки на перевод товаров в брак}
           FindNumQuery.SQL.add('select * from FIND_NUM_TRINDEF(:NUM)');
           end;
     end;
     FindNumQuery.ParamByname('NUM').asinteger:=N;
     FindNumQuery.Open;
   Except
   ENd;
end;

procedure TFIND_DOCNUM.Edit1Change(Sender: TObject);
begin
     Timer1.Enabled:=False;
     Timer1.Enabled:=True;
end;

procedure TFIND_DOCNUM.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='FULL_NUM' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='FULL_NUM' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='FULL_NUM' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PROW').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
      end else begin
         if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PROW').Asstring='0' then DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
      end
    end;

end;

procedure TFIND_DOCNUM.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TFIND_DOCNUM.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnGo.enabled then BtnGo.click;
end;

procedure TFIND_DOCNUM.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnGo.enabled) then BtnGo.click;
end;

end.
