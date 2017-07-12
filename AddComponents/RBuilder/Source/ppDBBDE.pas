{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDBBDE;

interface

{$I ppIfDef.pas}

uses Classes, SysUtils, ppDBPipe, ppDB, DB, DBTables;


type

  TppBDEPipeline = class(TppDBPipeline);


 { TppChildBDEPipeline }
  TppChildBDEPipeline = class(TppBDEPipeline)
    public
      function HasParent: Boolean; override;

    published
      property DataSource stored False;

    end; {class, TppChildBDEPipeline}


implementation

{******************************************************************************
 *
 ** C H I L D   B D E  P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppChildBDEPipeline.HasParent }

function TppChildBDEPipeline.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppBDEPipeline, TppChildBDEPipeline]);

finalization

  UnRegisterClasses([TppBDEPipeline, TppChildBDEPipeline]);

end.
