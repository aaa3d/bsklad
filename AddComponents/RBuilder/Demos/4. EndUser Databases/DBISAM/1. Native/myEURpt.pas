{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit myEURpt;

interface

uses
  Windows, Classes, Controls, SysUtils, Forms, StdCtrls, ExtCtrls, Dialogs, Graphics,
  DB, DBTables,  ppComm, ppCache, ppClass, ppProd, ppReport, ppRptExp, ppBands,
  ppDBBDE, ppEndUsr, ppDBPipe, ppDB, ppPrnabl, ppStrtch, ppDsgnDB,
  ppRelatv, ppModule, Grids, DBGrids, ppCtrls, daDatMan,
  daDBISAM, DBISAMTb;

type

  TmyEndUserSolution = class(TForm)
    Shape11: TShape;
    Label6: TLabel;
    Shape12: TShape;
    Shape9: TShape;
    Label5: TLabel;
    Shape10: TShape;
    dsTable: TDataSource;
    plTable: TppBDEPipeline;
    dsField: TDataSource;
    plField: TppBDEPipeline;
    ppDataDictionary1: TppDataDictionary;
    Shape6: TShape;
    Label7: TLabel;
    Shape5: TShape;
    ppDesigner1: TppDesigner;
    Shape4: TShape;
    Label8: TLabel;
    Shape3: TShape;
    Shape13: TShape;
    Label3: TLabel;
    Shape14: TShape;
    Shape18: TShape;
    Label9: TLabel;
    Shape19: TShape;
    ppReport1: TppReport;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape15: TShape;
    Label2: TLabel;
    Shape16: TShape;
    dsFolder: TDataSource;
    plFolder: TppBDEPipeline;
    btnLaunch: TButton;
    ppReportExplorer1: TppReportExplorer;
    Shape22: TShape;
    Label10: TLabel;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Memo1: TMemo;
    pnlStatusBar: TPanel;
    Shape7: TShape;
    Shape8: TShape;
    Shape17: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape27: TShape;
    Label4: TLabel;
    Shape28: TShape;
    dsJoin: TDataSource;
    plJoin: TppBDEPipeline;
    Shape29: TShape;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    dbSupportingTables: TDBISAMDatabase;
    tblFolder: TDBISAMTable;
    tblTable: TDBISAMTable;
    tblField: TDBISAMTable;
    tblJoin: TDBISAMTable;
    tblItem: TDBISAMTable;
    dsItem: TDataSource;
    plItem: TppBDEPipeline;
    dbData: TDBISAMDatabase;
    procedure FormCreate(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  public
  end;

var
  myEndUserSolution: TmyEndUserSolution;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.FormCreate }

procedure TmyEndUserSolution.FormCreate(Sender: TObject);
begin
  dbData.Connected := True;
  dbSupportingTables.Connected := True;
end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.FormActivate }

procedure TmyEndUserSolution.FormActivate(Sender: TObject);
begin
  ClientHeight := btnLaunch.Top + btnLaunch.Height + pnlStatusBar.Height + 8;
end; {procedure, FormActivate}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.btnLaunchClick }

procedure TmyEndUserSolution.btnLaunchClick(Sender: TObject);
begin

  if not(ppReportExplorer1.Execute) then
    begin
      pnlStatusBar.Caption := 'Error: ' + ppReportExplorer1.ErrorMessage;
      
      MessageBeep(0);
    end
  else
    pnlStatusBar.Caption := 'Explorer Launch Successful.'

end; {procedure, btnLaunchClick}



end.
