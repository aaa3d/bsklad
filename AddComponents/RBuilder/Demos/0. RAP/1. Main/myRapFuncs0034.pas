unit myRapFuncs0034;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ppUtils,
  Forms, Dialogs, raFunc, ppRTTI, dbTables;

Type
  TmyTDataBaseRTTI = class(TraTComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  RefClass: TClass; override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end;

  TmyDevelopersFunction = class (TraSystemFunction)
  public
    class function Category: String; override;
  end;

  TmyGetDelphiComponentFunction = class (TmyDevelopersFunction)
  public
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;

implementation

{ TmyDevelopersFunction }

{------------------------------------------------------------------------------}
{ TmyDevelopersFunction.Category }

class function TmyDevelopersFunction.Category: String;
begin
  Result := 'Developer';
end; {TmyDevelopersFunction.Category}

{ TmyGetDelphiComponentFunction }

{------------------------------------------------------------------------------}
{ TmyGetDelphiComponentFunction.ExecuteFunction }

procedure TmyGetDelphiComponentFunction.ExecuteFunction(aParams: TraParamList);
var
  lsString: String;
  lResult: TComponent;
begin

  GetParamValue(0, lsString);

  lResult := Application.MainForm.FindComponent(lsString);

  SetParamValue(1, lResult);

end; {TmyGetDelphiComponentFunction.ExecuteFunction}

{------------------------------------------------------------------------------}
{ TmpGetDelphiComponentFunction.GetSignature }

class function TmyGetDelphiComponentFunction.GetSignature: String;
begin
  Result := 'function GetDelphiComponent(const aComponentName: String): TComponent;';
end; {TmpGetDelphiComponentFunction.GetSignature}








{ TmyTDataBaseRTTI }

{------------------------------------------------------------------------------}
{ TmyTDataBaseRTTI.GetPropList }

class procedure TmyTDataBaseRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add Public Properties}
  aPropList.AddProp('Directory');

  {add Public Methods}
  aPropList.AddMethod('ValidateName');

end; {TmyTDataBaseRTTI.GetPropList}

{------------------------------------------------------------------------------}
{ TmyTDataBaseRTTI.RefClass }

class function TmyTDataBaseRTTI.RefClass: TClass;
begin
  Result := TDataBase;
end; {TmyTDataBaseRTTI.RefClass}

{------------------------------------------------------------------------------}
{ TmyTDataBaseRTTI.GetPropRec }

class function TmyTDataBaseRTTI.GetPropRec(aClass: TClass;
  const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Directory') then
    PropToRec(aPropName, daString, False, aPropRec)

  else if ppEqual(aPropName, 'ValidateName') then
    MethodToRec(aPropName, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {TmyTDataBaseRTTI.GetPropRec}

{------------------------------------------------------------------------------}
{ TmpTDataBaseRTTI.CallMethod }

class function TmyTDataBaseRTTI.CallMethod(aObject: TObject; const aMethodName: String;
  aParams: TraParamList; aGet: Boolean): Boolean;
var
  lsName: String;
  lDataBase: TDataBase;
begin
  Result := True;

  lDataBase := TDataBase(aObject);

  {The following is included for demonstration purposes - ValidateName is hardly
   ever called from within an application. }
  if ppEqual(aMethodName, 'ValidateName') then
    begin
      aParams.GetParamValue(0, lsName);

      lDataBase.ValidateName(lsName);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {TmpTDataBaseRTTI.CallMethod}

{------------------------------------------------------------------------------}
{ TmyTDataBaseRTTI.GetParams }

class function TmyTDataBaseRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'ValidateName') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', True, False);
    end
  else
    Result := inherited GetParams(aMethodName);

end; {TmyTDataBaseRTTI.GetParams}

{------------------------------------------------------------------------------}
{ TmyTDataBaseRTTI.GetPropValue }

class function TmyTDataBaseRTTI.GetPropValue(aObject: TObject;
  const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Directory') then
    String(aValue) := TDataBase(aObject).Directory

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {TmyTDataBaseRTTI.GetPropValue}

{------------------------------------------------------------------------------}
{ TmyTDataBaseRTTI.SetPropValue }

class function TmyTDataBaseRTTI.SetPropValue(aObject: TObject;
  const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Directory') then
    TDataBase(aObject).Directory := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {TmyTDataBaseRTTI.SetPropValue}

Initialization
  raRegisterFunction('GetDelphiComponent', TmyGetDelphiComponentFunction);
  raRegisterRTTI(TmyTDataBaseRTTI);
finalization
  raUnregisterRTTI(TmyTDataBaseRTTI);

end.
