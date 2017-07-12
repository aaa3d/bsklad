unit ReportTwChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,b_utils,b_Dbutils,
  ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl, Db, IBCustomDataSet,
  IBQuery, IBDatabase, StdCtrls, Mask, ToolEdit;

type
  TREPORT_TW_CHANGE = class(TForm)
    ToolBar1: TToolBar;
    RxDBGrid1: TRxDBGrid;
    HTransaction: TIBTransaction;
    QueryH: TIBQuery;
    DsH: TDataSource;
    QueryHTW_ID: TIntegerField;
    QueryHTW_ART: TIntegerField;
    QueryHTW_NAM: TIBStringField;
    QueryHTW_MROZ: TFloatField;
    QueryHOST: TFloatField;
    QueryHED_SHORT: TIBStringField;
    QueryHTM: TDateTimeField;
    Label1: TLabel;
    DT1: TDateEdit;
    Label2: TLabel;
    DT2: TDateEdit;
    ToolButton1: TToolButton;
    BtnRefresh: TToolButton;
    ToolButton3: TToolButton;
    BtnCenn: TToolButton;
    BtnCennAll: TToolButton;
    ToolButton2: TToolButton;
    BtnHistory: TToolButton;
    procedure BtnRefreshClick(Sender: TObject);
    procedure DT2Change(Sender: TObject);
    procedure QueryHAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure BtnCennClick(Sender: TObject);
    procedure BtnCennAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_TW_CHANGE: TREPORT_TW_CHANGE;

implementation

{$R *.DFM}

procedure TREPORT_TW_CHANGE.BtnRefreshClick(Sender: TObject);
begin
    HTransaction.Active:=false;
    QueryH.close;
    QueryH.parambyname('DT1').asdatetime:=DT1.date;
    QueryH.parambyname('DT2').asdatetime:=DT2.date+1-Sekond1;
    QueryH.Open;
    BtnRefresh.Enabled:=False;
end;

procedure TREPORT_TW_CHANGE.DT2Change(Sender: TObject);
begin
   BtnRefresh.Enabled:=true;
end;

procedure TREPORT_TW_CHANGE.QueryHAfterOpen(DataSet: TDataSet);
var
  EN:boolean;
begin
   EN:=not QueryH.eof;
   BtnCenn.enabled:=EN;
   BtnCennAll.enabled:=EN;
   BtnHistory.enabled:=EN;
end;

procedure TREPORT_TW_CHANGE.FormShow(Sender: TObject);
begin
   DT1.date:=date();
   DT2.date:=date();
end;

procedure TREPORT_TW_CHANGE.BtnHistoryClick(Sender: TObject);
begin
     SHOW_HISTORY_DOC('Товар '+QueryH.fieldByname('TW_ART').asstring+' '+QueryH.fieldByname('TW_NAM').ASSTRING,'TW',QueryH.fieldByname('TW_ID').asinteger);
end;

procedure TREPORT_TW_CHANGE.BtnCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(QueryH.fieldbyname('TW_ID').asinteger,DEFAULT_SKLAD);
     PRINT_CENNIK;
end;

procedure TREPORT_TW_CHANGE.BtnCennAllClick(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
         ID:=QueryH.fieldbyname('TW_ID').asinteger;;
         QueryH.DisableControls;
         QueryH.First;
         while not QueryH.eof do begin
               ADD_CENNIK(QueryH.fieldbyname('TW_ID').asinteger,default_sklad);
               QueryH.next;
         end;
         QueryH.First;
         QueryH.locate('TW_ID',ID,[]);
         QueryH.EnableControls;
         PRINT_CENNIK;
end;

end.
