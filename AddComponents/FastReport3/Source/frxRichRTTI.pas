{******************************************}
{ }
{ FastReport v3.0 }
{ Rich RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxRichRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, fs_iformsrtti, frxRich,
  frxRichEdit, frxClassRTTI
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
    AddClass(TrxRichEdit, 'TWinControl');
    with AddClass(TfrxRichView, 'TfrxView') do
      AddProperty('RichEdit', 'TrxRichEdit', GetProp, nil);
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

  if ClassType = TfrxRichView then
  begin
    if PropName = 'RICHEDIT' then
      Result:= Integer(TfrxRichView(Instance).RichEdit)
  end
end;

initialization
  Functions:= TFunctions.Create;

finalization
  Functions.Free;

end.
