{******************************************************************************}
{                                                                              }
{                      ReportBuilder CrossTab Demos                            }
{                                                                              }
{            Copyright (c) 1996, 2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ctRptFrm;

interface

uses
  Windows, ComCtrls, ppRichTx, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, DBTables,
  ppReport;

type

  { TctReportForm }
  TctReportForm = class(TForm)
    protected
      function GetReport: TppReport; virtual;

    public
      property Report: TppReport read GetReport;

  end; {class, TctReportForm}

implementation


{------------------------------------------------------------------------------}
{ TctReportForm.GetReport }

function TctReportForm.GetReport: TppReport;
begin
  Result := TppReport(FindComponent('ppReport1'));
end; {function, GetReport}


end.
