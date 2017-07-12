
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
  Windows, Messages, SysUtils, Classes, DsgnIntf,
  Forms, FR_IB_Connection;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('FastReport', [TfrIB_Components]);
//  RegisterComponentEditor( TfrIB_Connection, TfrIB_ConnectionEditor );
end;

end.
