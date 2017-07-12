unit PnNaklDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, Db, Grids, DBGrids, RXDBCtrl, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TPN_NAKL_DOC = class(TForm)
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWorkPN_ID: TIntegerField;
    QueryWorkPN_PROW: TIBStringField;
    QueryWorkPN_NUM_FULL: TIBStringField;
    QueryWorkPN_DATE: TDateTimeField;
    QueryWorkPN_DATE_OPL: TDateTimeField;
    QueryWorkSKL_SHORT: TIBStringField;
    QueryWorkPN_SUMM: TFloatField;
    QueryWorkPN_SUMM2: TFloatField;
    QueryWorkPN_COLOR: TIntegerField;
    QueryWorkUS_FULL: TIBStringField;
    QueryWorkPNVID_NAM: TIBStringField;
    QueryWorkOWNER_FULL: TIBStringField;
    QueryWorkKLN_ORG: TIBStringField;
    QueryWorkPN_KURS: TFloatField;
    QueryWorkKLN_PREFIX: TIBStringField;
    QueryWorkPN_NUM: TIBStringField;
    QueryWorkPN_OST: TFloatField;
    QueryWorkPN_OSN: TIBStringField;
    QueryWorkPN_NAKL_MET: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    DsWork: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PN_NAKL_DOC: TPN_NAKL_DOC;

implementation

{$R *.DFM}

procedure TPN_NAKL_DOC.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then begin
      key:=#0;
      close;
   end;
end;

procedure TPN_NAKL_DOC.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   ImgIndex:integer;
   PN_OST:double;
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='PN$_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='PN$_NUM_FULL' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='PN$_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if (Column.Field.FullName<>'PN$_PROW') and (Column.Field.FullName<>'PN$_OST')
       and (Column.Field.FullName<>'PN$_NAKL_MET') then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
     RxDbgrid1.Canvas.FillRect(Rect);
     if Column.Field.FullName='PN$_PROW' then begin // Стобец проводки//
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_PROW').Asstring='1'
       then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
       end else DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
     end;
     if Column.Field.FullName='PN$_NAKL_MET' then begin // Стобец подчиненных сумм в накладных//
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_NAKL_MET').Asstring='2'
       then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         143,True);
       end else
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_NAKL_MET').Asstring='3'
       then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         144,True);
       end else DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
     end;




     if (Column.Field.FullName='PN$_OST') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_ID').asinteger>0) then begin
         {Колонка картинки}
         {если PN_OST>=0, значит сумма расчитана}
         ImgIndex:=0;
         if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_OST').asfloat>=0 then begin
           PN_OST:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_OST').asfloat;
           if (PN_OST>0) and (PN_OST<(100/7)) then ImgIndex:=54;
           if (PN_OST>=(100/7)*1) and (PN_OST<(100/7)*2) then ImgIndex:=54;
           if (PN_OST>=(100/7)*2) and (PN_OST<(100/7)*3) then ImgIndex:=55;
           if (PN_OST>=(100/7)*3) and (PN_OST<(100/7)*4) then ImgIndex:=56;
           if (PN_OST>=(100/7)*4) and (PN_OST<(100/7)*5) then ImgIndex:=57;
           if (PN_OST>=(100/7)*5) and (PN_OST<(100/7)*6) then ImgIndex:=58;
           if (PN_OST>=(100/7)*6) and (PN_OST<(100/7)*7) then ImgIndex:=59;
           if PN_OST>99.999 then ImgIndex:=60; //100%
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_PROW').asinteger=0 then ImgIndex:=0;
           if ImgIndex>0 then begin
             DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
             ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
             ImgIndex,True);
           end;
         end;
     end;
    end;
end;

procedure TPN_NAKL_DOC.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TPN_NAKL_DOC.FormShow(Sender: TObject);
begin
   WorkTransaction.Active:=False;
   QueryWork.close;
   QueryWork.ParamByname('PN_ID').asinteger:=PN_NAKL_DOC.tag;
   QueryWork.Open;
end;

end.
