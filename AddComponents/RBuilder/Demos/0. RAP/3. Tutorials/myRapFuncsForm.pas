{******************************************************************************}
{                                                                              }
{                             ReportBuilder Demos                              }
{                                                                              }
{             Copyright (c) 1996-2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}
unit myRapFuncsForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  raFunc, ppRTTI, myUserInputForm;

type
  { TmyUserInputFormFunction }
  TmyUserInputFormFunction = class (TraSystemFunction)
  public
    class function Category: string; override;
  end;

  { TmyShowStartupFormFunction }
  TmyShowStartupFormFunction = class (TmyUserInputFormFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: string; override;
  end;

  { TmyShowMasterRecordFormFunction }
  TmyShowMasterRecordFormFunction = class (TmyUserInputFormFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: string; override;
  end;

implementation

{------------------------------------------------------------------------------}
{ TmyUserInputFormFunction.Category}
class function TmyUserInputFormFunction.Category: string;
begin
  result := 'User Input Forms';
end;{ class function Category() }

{------------------------------------------------------------------------------}
{ TmyShowStartupFormFunction.ExecuteFunction}
procedure TmyShowStartupFormFunction.ExecuteFunction(aParams: TraParamList);
var
  lString: string;
  lInteger: Integer;
  lbResult: Boolean;
  lInputForm: TfrmMyUserInput;
begin
  GetParamValue(0, lString);
  GetParamValue(1, lInteger);
  
  lInputForm := TfrmMyUserInput.Create(Application);
  try
    lInputForm.InitDialog(True, lString, '');
  
    if lInputForm.ShowModal = mrOK then
      begin
        lString := lInputForm.ebHeading.Text;
  
        lInteger := lInputForm.rgDestination.ItemIndex;
        lbResult := True;
      end
    else
      lbResult := False;
  finally
    lInputForm.Free;
  end;
  
  SetParamValue(0, lString);
  SetParamValue(1, lInteger);
  SetParamValue(2, lbResult);
end;{ procedure ExecuteFunction() }

{------------------------------------------------------------------------------}
{ TmyShowStartupFormFunction.GetSignature}
class function TmyShowStartupFormFunction.GetSignature: string;
begin
  result := 'function ExecuteStartupForm(var aReportHeading: String; var aDestinationIndex: Integer): Boolean;';
end;{ class function GetSignature() }

{------------------------------------------------------------------------------}
{ TmyShowMasterRecordFormFunction.ExecuteFunction}
procedure TmyShowMasterRecordFormFunction.ExecuteFunction(aParams: TraParamList);
var
  lString: string;
  lBoolean: Boolean;
  lbResult: Boolean;
  lInputForm: TfrmMyUserInput;
begin
  GetParamValue(0, lString);
  GetParamValue(1, lBoolean);
  
  lInputForm := TfrmMyUserInput.Create(Application);
  try
    lInputForm.InitDialog(False, '', lString);
    lInputForm.cbIncludeAddress.Checked := lBoolean;
  
    if lInputForm.ShowModal = mrOK then
  
      begin
        lBoolean := lInputForm.cbIncludeAddress.Checked;
        lbResult := True;
      end
    else
      lbResult := False;
  finally
    lInputForm.Free;
  end;
  
  SetParamValue(1, lBoolean);
  SetParamValue(2, lbResult);
end;{ procedure ExecuteFunction() }

{------------------------------------------------------------------------------}
{ TmyShowMasterRecordFormFunction.GetSignature}
class function TmyShowMasterRecordFormFunction.GetSignature: string;
begin
  result := 'function ExecuteMasterRecordForm(const aCompanyName: String; var aDisplayAddress: Boolean): Boolean;';
end;{ class function GetSignature() }

initialization
  raRegisterFunction('ExecuteStartupForm', TmyShowStartupFormFunction);
  raRegisterFunction('ExecuteMasterRecordForm', TmyShowMasterRecordFormFunction);


end.