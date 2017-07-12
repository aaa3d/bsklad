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

{x$DEFINE RAP}
{$DEFINE Checkbox}
{x$DEFINE TeeChart}   {remove the 'x' to enable TeeChart}
{x$DEFINE UseDesignTimeSettings} {remove the 'x' to use the Database objects design-time settings}


{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinProcs, WinTypes,
{$ENDIF}

{$IFDEF RAP}
  raIDE,
{$ENDIF}

{$IFDEF Checkbox}
  myChkBox,
{$ENDIF}

{$IFDEF TeeChart}
  ppChrt, ppChrtDB,
{$ENDIF}

{$IFDEF ODBC98}
  daODBC98,
{$ENDIF}

  Classes, Controls, SysUtils, Forms, StdCtrls, ExtCtrls, Dialogs, Graphics,
  DB, DBTables,  ppComm, ppCache, ppClass, ppProd, ppReport, ppRptExp, ppBands,
  ppDBBDE, ppEndUsr, ppDBPipe, ppDB, ppPrnabl, ppStrtch, ppDsgnDB,
  ppRelatv, ppModule, daDatMan, daDBBDE,

  myDataVw;

type

  TmyEndUserSolution = class(TForm)
    Shape11: TShape;
    Label6: TLabel;
    Shape12: TShape;
    euDatabase: TDatabase;
    Shape9: TShape;
    Label5: TLabel;
    Shape10: TShape;
    tblTable: TTable;
    dsTable: TDataSource;
    plTable: TppBDEPipeline;
    tblField: TTable;
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
    tblItem: TTable;
    dsItem: TDataSource;
    plItem: TppBDEPipeline;
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
    tblFolder: TTable;
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
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    procedure FormCreate(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
  private
  public
  end;

var
  myEndUserSolution: TmyEndUserSolution;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TmyReportObjects.FormCreate }

procedure TmyEndUserSolution.FormCreate(Sender: TObject);
{$IFNDEF UseDesignTimeSettings}
var
  lsPathName: String;
{$ENDIF}
begin

{$IFNDEF UseDesignTimeSettings}
  {initialize database }
  with euDatabase do
    begin
      euDatabase.Connected := False;
      lsPathName := ExtractFilePath(ParamStr(0));
      lsPathName := AnsiUpperCase(lsPathName);
      lsPathName := Copy(lsPathName,1, Pos('\3. ENDUSER',lsPathName));
      Params.Values['PATH'] := lsPathName + 'DATA\';
    end;
{$ENDIF}

  euDatabase.Connected := True;

  ClientHeight := btnLaunch.Top + btnLaunch.Height + pnlStatusBar.Height + 8;

end; {procedure, FormCreate}


{------------------------------------------------------------------------------}
{ TmyReportObjects.btnLaunchClick }

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
 