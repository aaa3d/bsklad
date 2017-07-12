{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Application Pascal                    }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit myRapFuncs0031;

interface

{An example of how to create your own Pass-through functions for RAP.

Properly coded descendants of TraSystemFunction (declared in raFunc) that are
registered by calling raRegisterFunction (also declared in raFunc) will appear
in the RAP Code Toolbox. Following this method you can surface new methods for
you and your users to use in RAP.}

{see myRapFuncs0032 for more information}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, raFunc, ppRTTI;

type
  TmyTrimFunction = class (TraStringFunction)
  public
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;

implementation

{ TmyTrimFunction }

procedure TmyTrimFunction.ExecuteFunction(aParams: TraParamList);
var
  lsResult: String;
  lsString: String;
begin

  GetParamValue(0, lsString);

  lsResult := Trim(lsString);

  SetParamValue(1, lsResult);

end;

class function TmyTrimFunction.GetSignature: String;
begin
  result := 'function Trim(const S: string): string;';
end;

Initialization
  raRegisterFunction('Trim', TmyTrimFunction);



end.
