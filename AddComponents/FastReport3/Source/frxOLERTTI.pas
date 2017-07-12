{******************************************}
{ }
{ FastReport v3.0 }
{ OLE RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxOLERTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxOLE, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TFunctions = class(TObject)
  private
    function GetProp(Instance:TObject; ClassType:TClass;
      const PropName:String):Variant;
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Functions:TFunctions;

{ TFunctions }

constructor TFunctions.Create;
begin
  with fsGlobalUnit do
  begin
    AddedBy:= Self;
    AddEnum('TfrxSizeMode', 'fsmClip, fsmScale');
    with AddClass(TfrxOLEView, 'TfrxView') do
      AddProperty('OleContainer', 'TOleContainer', GetProp, nil);
    AddedBy:= nil;
  end;
end;

destructor TFunctions.Destroy;
begin
  if fsGlobalUnit<>nil then
    fsGlobalUnit.RemoveItems(Self);
  inherited;
end;

function TFunctions.GetProp(Instance:TObject; ClassType:TClass;
  const PropName:String):Variant;
begin
  Result:= 0;

  if ClassType = TfrxOLEView then
  begin
    if PropName = 'OLECONTAINER' then
      Result:= Integer(TfrxOLEView(Instance).OleContainer)
  end
end;

initialization
  Functions:= TFunctions.Create;

finalization
  Functions.Free;

end.
