{******************************************}
{ }
{ FastReport v3.0 }
{ Registration unit }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxRegDB;

{$I frx.inc}
{$I frxReg.inc}

interface

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, Forms, Controls,
{$IFNDEF Delphi6}
  DsgnIntf,
{$ELSE}
  DesignIntf, DesignEditors,
{$ENDIF}
  frxDBSet,
  frxCustomDB,
  frxCustomDBEditor,
  frxCustomDBRTTI,
  frxEditMD,
  frxEditQueryParams;

{-----------------------------------------------------------------------}
procedure Register;
begin
  RegisterComponents('FastReport 3.0', [TfrxDBDataset]);
end;

end.
