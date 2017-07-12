{******************************************}
{ }
{ FastReport v3.0 }
{ Cross-tab RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxCrossRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxCross, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TFunctions = class(TObject)
  private
    function CallMethod(Instance:TObject; ClassType:TClass;
      const MethodName:String; var Params:Variant):Variant;
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

    with AddClass(TfrxCustomCrossView, 'TfrxView') do
    begin
      AddMethod('procedure AddValue(Rows, Columns, Cells:array)', CallMethod);
      AddMethod('function ColCount:Integer', CallMethod);
      AddMethod('function RowCount:Integer', CallMethod);
      AddMethod('function IsGrandTotalColumn(Index:Integer):Boolean', CallMethod);
      AddMethod('function IsGrandTotalRow(Index:Integer):Boolean', CallMethod);
      AddMethod('function IsTotalColumn(Index:Integer):Boolean', CallMethod);
      AddMethod('function IsTotalRow(Index:Integer):Boolean', CallMethod);
    end;

    AddClass(TfrxCrossView, 'TfrxCustomCrossView');
    AddClass(TfrxDBCrossView, 'TfrxCustomCrossView');

    AddedBy:= nil;
  end;
end;

destructor TFunctions.Destroy;
begin
  if fsGlobalUnit<>nil then
    fsGlobalUnit.RemoveItems(Self);
  inherited;
end;

function TFunctions.CallMethod(Instance:TObject; ClassType:TClass;
  const MethodName:String; var Params:Variant):Variant;
var
  ar:array[0..2] of array of Variant;

  procedure ConvertVariantToArray(v:Variant; Index:Integer);
  var
    i:Integer;
  begin
    SetLength(ar[Index], VarArrayHighBound(v, 1)+1);
    for i:= 0 to VarArrayHighBound(v, 1) do
      ar[Index][i]:= v[i];
  end;

begin
  Result:= 0;

  if MethodName = 'ADDVALUE' then
  begin
    ConvertVariantToArray(Params[0], 0);
    ConvertVariantToArray(Params[1], 1);
    ConvertVariantToArray(Params[2], 2);
    TfrxCustomCrossView(Instance).AddValue(ar[0], ar[1], ar[2]);
    ar[0]:= nil;
    ar[1]:= nil;
    ar[2]:= nil;
  end
  else if MethodName = 'COLCOUNT' then
    Result:= TfrxCustomCrossView(Instance).ColCount
  else if MethodName = 'ROWCOUNT' then
    Result:= TfrxCustomCrossView(Instance).RowCount
  else if MethodName = 'ISGRANDTOTALCOLUMN' then
    Result:= TfrxCustomCrossView(Instance).IsGrandTotalColumn(Params[0])
  else if MethodName = 'ISGRANDTOTALROW' then
    Result:= TfrxCustomCrossView(Instance).IsGrandTotalRow(Params[0])
  else if MethodName = 'ISTOTALCOLUMN' then
    Result:= TfrxCustomCrossView(Instance).IsTotalColumn(Params[0])
  else if MethodName = 'ISTOTALROW' then
    Result:= TfrxCustomCrossView(Instance).IsTotalRow(Params[0])
end;

initialization
  Functions:= TFunctions.Create;

finalization
  Functions.Free;

end.
