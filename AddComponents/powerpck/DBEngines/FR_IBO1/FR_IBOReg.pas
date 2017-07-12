{******************************************}
{                                          }
{     FastReport v2.4 - IBO components     }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_IBOreg;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Forms, FR_IB_Connection, FR_IB_Query;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('FastReport', [TfrIB_Components]);
end;

end.
