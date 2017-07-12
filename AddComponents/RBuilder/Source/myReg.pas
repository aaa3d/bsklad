{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit myReg;

interface

uses
  Classes,  {contains RegisterNoIcon, which allows the design-time registration of the component}
  myChkBox; {contains TmyCheckBox and TmyDBCheckBox, the components being registered}

{declare Register procedure so component can be used at design-time}
procedure Register;

implementation

{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ Register }

procedure Register;
begin
  {register the component for use in the Delphi design-time report designer}
  RegisterNoIcon([TmyCheckBox]);
  RegisterNoIcon([TmyDBCheckBox]);
end; {procedure, Register}


end.
