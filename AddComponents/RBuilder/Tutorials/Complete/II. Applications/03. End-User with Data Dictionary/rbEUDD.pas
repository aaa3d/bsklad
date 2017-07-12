unit rbEUDD;

interface

uses
{$IFDEF RAP}
  raIDE,
{$ENDIF}

  Classes, Controls, SysUtils, Forms, StdCtrls, ExtCtrls, Dialogs, Graphics,
  DB, DBTables,
  ppComm, ppCache, ppClass, ppProd, ppBands, ppReport, ppDB, ppDBBDE, ppDBPipe,
  ppEndUsr, ppRptExp, ppDsgnDB, daDatMan, daDBBDE, ppRelatv;

type
  TmyEndUserSolution = class(TForm)
    plFolder: TppBDEPipeline;
    plItem: TppBDEPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppReportExplorer1: TppReportExplorer;
    dsFolder: TDataSource;
    tblFolder: TTable;
    dsItem: TDataSource;
    tblItem: TTable;
    btnLaunch: TButton;
    pnlStatusBar: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Label3: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Label4: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Label5: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    dsTable: TDataSource;
    tblTable: TTable;
    dsField: TDataSource;
    tblField: TTable;
    ppDataDictionary1: TppDataDictionary;
    plField: TppBDEPipeline;
    plTable: TppBDEPipeline;
    Shape15: TShape;
    Label6: TLabel;
    Shape16: TShape;
    Shape17: TShape;
    Label7: TLabel;
    Shape18: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Label8: TLabel;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    procedure btnLaunchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  myEndUserSolution: TmyEndUserSolution;

implementation

{$R *.DFM}

procedure TmyEndUserSolution.btnLaunchClick(Sender: TObject);
begin
  if not(ppReportExplorer1.Execute) then
    pnlStatusBar.Caption := ppReportExplorer1.ErrorMessage;
end;

end.
