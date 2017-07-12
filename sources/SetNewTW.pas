unit SetNewTW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1, Db, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, Grids,
  DBGrids, RXDBCtrl,B_Dbutils;

type
  TSet_NEW_TW = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Button1: TButton;
    WorkTransaction: TIBTransaction;
    QueryKTG: TIBQuery;
    QueryKTGTWKTG_ID: TIntegerField;
    QueryKTGTWKTG_NAM: TIBStringField;
    QueryKTGTWKTG_PRIM: TIBStringField;
    QueryKTGTWKTG_COLOR: TIntegerField;
    QueryVALUTA: TIBQuery;
    QueryVALUTAVALUTA_ID: TIntegerField;
    QueryVALUTAVALUTA_SHORT: TIBStringField;
    QueryVALUTAVALUTA_FULL: TIBStringField;
    QueryVALUTAVALUTA_AUTO1: TIBStringField;
    QueryVALUTAVALUTA_AUTO2: TIBStringField;
    QueryVALUTAVALUTA_AUTO3: TIBStringField;
    QueryVALUTAVALUTA_AUTO11: TIBStringField;
    QueryVALUTAVALUTA_AUTO12: TIBStringField;
    QueryVALUTAVALUTA_AUTO13: TIBStringField;
    DsKTG: TDataSource;
    DsVALUTA: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_NEW_TW: TSet_NEW_TW;

implementation

{$R *.DFM}

procedure TSet_NEW_TW.FormShow(Sender: TObject);
begin
     WorkTransaction.Active:=False;
     QueryKTG.close;
     QueryKTG.Open;
     QueryVALUTA.Close;
     QueryVALUTA.Open;
end;

procedure TSet_NEW_TW.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
        If ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
         If ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKtg_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger;
     end;
end;

procedure TSet_NEW_TW.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if CheckBox1.checked then ITMP1:=1 else ITMP1:=2;
     KTG_TMP1:=QueryKTG.fieldByname('TWKTG_ID').asinteger;
     KTG_TMP2:=QueryKTG.fieldByname('TWKTG_COLOR').asinteger;
     IVALUTA_TMP:=QueryVALUTA.fieldByname('VALUTA_ID').asinteger;
     QueryKTG.close;
     QueryVALUTA.Close;
     WorkTransaction.Active:=False;

end;

procedure TSet_NEW_TW.Button1Click(Sender: TObject);
begin
     close;
end;

end.
