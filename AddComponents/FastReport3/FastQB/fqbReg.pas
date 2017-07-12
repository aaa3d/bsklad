{*******************************************}
{                                           }
{           FastQueryBuilder v1.0           }
{             Registration unit             }
{                                           }
{          Copyright (c) 2004-2005          }
{              Fast Reports Inc.            }
{                                           }
{*******************************************}

{$I fqb.inc}

unit fqbReg;

interface

procedure Register;

implementation

uses
  Windows, Messages, Classes
{$IFNDEF Delphi6}
  ,DsgnIntf
{$ELSE}
  ,DesignIntf, DesignEditors
{$ENDIF}
  ,fqbClass, fqbSynMemo;


procedure Register;
begin
//  RegisterComponents('FastQueryBiulder', [TfqbDialog,
//                     TfqbTableArea, TfqbTableListBox, TfqbSyntaxMemo, TfqbGrid,
//                     TfqbGrid]);
end;

end.
