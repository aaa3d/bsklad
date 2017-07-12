{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbMailM;

interface

uses

{$IFDEF WIN32}
  Windows, ComCtrls,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}

  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, ppBands, ppCache, ppCtrls, ppComm, ppReport, ppPrnabl,
  ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ppRichTx, ppProd, ppDBPipe,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmMailMerge = class(TrbReportForm)
    tblClient: TTable;
    dsClient: TDataSource;
    plClient: TppBDEPipeline;
    rbMailMerge: TppReport;
    rbMailMergeDetailBand1: TppDetailBand;
    ppRichText1: TppRichText;
    btnPreview: TButton;
    procedure btnPreviewClick(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMailMerge: TfrmMailMerge;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmMailMerge.GetReport }

function TfrmMailMerge.GetReport: TppReport;
begin
  Result := rbMailMerge;
end; {function, GetReport}


{------------------------------------------------------------------------------}
{ TfrmMailMerge.btnPreviewClick }

procedure TfrmMailMerge.btnPreviewClick(Sender: TObject);
begin
  rbMailMerge.Print;

end; {procedure, btnPreviewClick}

end.
