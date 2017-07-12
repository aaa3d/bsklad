{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit myEURpt;

interface

{ By removing the 'x' which begins each of these compiler directives,
  you can enable different functionality within the end-user reporting
  solution.

  DADE - the data tab where queries can be created by the end-user

  RAP -  the calc tab, where calculations can be coded at run-time
         (You must download and install a copy of the RAP beta in order
         to enable this feature)

  CrossTab - adds the CrossTab component to the component palette in the
             report designer.

  CheckBox - adds a checkbox component to the component palette in the
         report designer.

  TeeChart - adds a teechart component to the report designer component
         palette. This component works with the TeeChart delivered
         with Delphi 3 and 4.  It does NOT work with TeeChart 4.01,
         which must be purchased from TeeMach.

  TeeChart401 - adds a teechart component for use with TeeChart 4.01 from
         TeeMach.

  UseDesignPath - determines whether the path used by the Database
         object on this form is replaced in the OnCreate event handler of
         this form with the current path.}

{$DEFINE DADE}            {remove the 'x' to enable DADE}
{$DEFINE CrossTab}        {remove the 'x' to enable CrossTab}
{x$DEFINE RAP}            {remove the 'x' to enable RAP}
{x$DEFINE CheckBox}       {remove the 'x' to enable CheckBox}
{x$DEFINE TeeChart}       {remove the 'x' to enable standard TeeChart}
{x$DEFINE TeeChart401}    {remove the 'x' to enable TeeChart 4.01}
{x$DEFINE UseDesignPath}  {remove the 'x' to use the design-time settings of Database object on this form}

uses

{$IFDEF DADE}
  daDatMan, daDBBDE,
{$ENDIF}

{$IFDEF CrossTab}
  ppCTDsgn,
{$ENDIF}

{$IFDEF RAP}
  raIDE,
{$ENDIF}

{$IFDEF CheckBox}
  myChkBox,
{$ENDIF}

{$IFDEF TeeChart}
  ppChrt, ppChrtDB,
{$ENDIF}

{$IFDEF TeeChart401}
  ppChrt, ppChrtDP,
{$ENDIF}

  Windows, Classes, Controls, SysUtils, Forms, StdCtrls, ExtCtrls, Dialogs, Graphics,
  DB, DBTables,  ppComm, ppCache, ppClass, ppProd, ppReport, ppRptExp, ppBands,
  ppDBBDE, ppEndUsr, ppDBPipe, ppDB, ppPrnabl, ppStrtch, ppDsgnDB,
  ppRelatv, ppModule, Grids, DBGrids, ppCtrls;

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
    pnlStatusBar: TPanel;
    Shape7: TShape;
    Shape8: TShape;
    Shape17: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape27: TShape;
    Label4: TLabel;
    Shape28: TShape;
    tblJoin: TTable;
    dsJoin: TDataSource;
    plJoin: TppBDEPipeline;
    Shape29: TShape;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Memo1: TMemo;
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
{ TmyReportObjects.FormCreate }

procedure TmyEndUserSolution.FormCreate(Sender: TObject);
begin


  euDatabase.Connected := True;
  
  ClientHeight := btnLaunch.Top + btnLaunch.Height + pnlStatusBar.Height + 8;

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TmyReportObjects.FormActivate }

procedure TmyEndUserSolution.FormActivate(Sender: TObject);
begin
  ClientHeight := btnLaunch.Top + btnLaunch.Height + pnlStatusBar.Height + 8;
end; {procedure, FormActivate}

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
