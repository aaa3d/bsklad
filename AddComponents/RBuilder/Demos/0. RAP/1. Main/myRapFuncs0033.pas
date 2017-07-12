{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Application Pascal                    }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit myRapFuncs0033;

interface

  {See myRapFuncs0032.pas for more information.}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, raFunc, ppRTTI, myRapFuncs0032;

type

  TmyExtractFileNameFunction = class (TmyFilenameFunction)
  public
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;

  TmyExtractFileExtFunction = class (TmyFilenameFunction)
  public
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;

  TmyExtractFilePathFunction = class (TmyFilenameFunction)
  public
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;

implementation

{------------------------------------------------------------------------------}
{ TmyExtractFileNameFunction.ExecuteFunction }
{As noted in myRapFuncs0032.pas, the TraParamList contains all the parameters
for the method and the result value. The result value is the last item in aParams.}
procedure TmyExtractFileNameFunction.ExecuteFunction(aParams: TraParamList);
var
  lsResult: String;
  lsString: String;
begin

  GetParamValue(0, lsString);

  lsResult := ExtractFileName(lsString);

  SetParamValue(1, lsResult);
end; {Procedure ExecuteFunction}


{------------------------------------------------------------------------------}
{ TmyExtractFileNameFunction.GetSignature }
class function TmyExtractFileNameFunction.GetSignature: String;
begin
  result := 'function ExtractFileName(const FileName: string): string;';
end; {class function GetSignature}


{------------------------------------------------------------------------------}
{ TmyExtractFileExtFunction.ExecuteFunction }
procedure TmyExtractFileExtFunction.ExecuteFunction(aParams: TraParamList);
var
  lsResult: String;
  lsString: String;
begin

  GetParamValue(0, lsString);

  lsResult := ExtractFileExt(lsString);

  SetParamValue(1, lsResult);
end; {Procedure ExecuteFunction}


{------------------------------------------------------------------------------}
{ TmyExtractFileExtFunction.GetSignature }
class function TmyExtractFileExtFunction.GetSignature: String;
begin
  result := 'function ExtractFileExt(const FileName: string): string;';
end; {class function GetSignature}


{------------------------------------------------------------------------------}
{ TmyExtractFilePathFunction.ExecuteFunction }
procedure TmyExtractFilePathFunction.ExecuteFunction(aParams: TraParamList);
var
  lsResult: String;
  lsString: String;
begin

  GetParamValue(0, lsString);

  lsResult := ExtractFilePath(lsString);

  SetParamValue(1, lsResult);
end; {Procedure ExecuteFunction}


{------------------------------------------------------------------------------}
{ TmyExtractFilePathFunction.GetSignature }
class function TmyExtractFilePathFunction.GetSignature: String;
begin
  result := 'function ExtractFilePath(const FileName: string): string;';
end; {class function GetSignature}



initialization

  raRegisterFunction('ExtractFileName', TmyExtractFileNameFunction);
  raRegisterFunction('ExtractFilePath', TmyExtractFilePathFunction);
  raRegisterFunction('ExtractFileExt', TmyExtractFileExtFunction);

end.
