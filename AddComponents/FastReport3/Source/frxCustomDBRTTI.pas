{******************************************}
{ }
{ FastReport v3.0 }
{ DB components RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxCustomDBRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, DB, fs_iinterpreter, frxCustomDB,
  frxDBSet, fs_idbrtti
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TFunctions = class(TObject)
  private
    function CallMethod(Instance:TObject; ClassType:TClass;
      const MethodName:String; var Params:Variant):Variant;
    function GetProp(Instance:TObject; ClassType:TClass;
      const PropName:String):Variant;
    procedure SetProp(Instance:TObject; ClassType:TClass;
      const PropName:String; Value:Variant);
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
    with AddClass(TfrxDBDataset, 'TfrxCustomDBDataSet') do
    begin
      AddMethod('function Locate(const KeyFields:string; const KeyValues:Variant;'+
        'Options:TLocateOptions):Boolean', CallMethod);
      AddMethod('function IsEmpty:Boolean', CallMethod);
      AddMethod('function RecordCount:Integer', CallMethod);
    end;
    with AddClass(TfrxCustomDataset, 'TfrxDBDataSet') do
    begin
      AddMethod('procedure Last', CallMethod);
      AddMethod('function FieldByName(Name:String):TField', CallMethod);
      AddProperty('DataSet', 'TDataSet', GetProp, nil);
      AddProperty('Active', 'Boolean', GetProp, SetProp);
      AddProperty('Fields', 'TFields', GetProp, nil);
    end;
    with AddClass(TfrxParamItem, 'TCollectionItem') do
      AddProperty('Value', 'Variant', GetProp, SetProp);
    with AddClass(TfrxParams, 'TCollection') do
    begin
      AddMethod('function IndexOf(Name:String):Integer', CallMethod);
      AddDefaultProperty('Items', 'Integer', 'TfrxParamItem', CallMethod, True);
    end;
    with AddClass(TfrxCustomQuery, 'TfrxCustomDataset') do
      AddMethod('function ParamByName(Name:string):TfrxParamItem', CallMethod);
    with AddClass(TfrxDBLookupComboBox, 'TfrxDialogControl') do
    begin
      AddProperty('KeyValue', 'Variant', GetProp, SetProp);
      AddProperty('Text', 'String', GetProp, nil);
    end;

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

  function IntToLocateOptions(i:Integer):TLocateOptions;
  begin
    Result:= [];
    if (i and 1)<>0 then
      Result:= Result+[loCaseInsensitive];
    if (i and 2)<>0 then
      Result:= Result+[loPartialKey];
  end;

begin
  Result:= 0;

  if ClassType = TfrxParams then
  begin
    if MethodName = 'INDEXOF' then
      Result:= TfrxParams(Instance).IndexOf(Params[0])
    else if MethodName = 'ITEMS.GET' then
      Result:= Integer(TfrxParams(Instance).Items[Params[0]])
  end
  else if ClassType = TfrxDBDataSet then
  begin
    if MethodName = 'LOCATE' then
      Result:= TfrxDBDataSet(Instance).GetDataSet.Locate(Params[0], Params[1], IntToLocateOptions(Params[2]))
    else if MethodName = 'ISEMPTY' then
      Result:= TfrxDBDataSet(Instance).GetDataSet.IsEmpty
    else if MethodName = 'RECORDCOUNT' then
      Result:= TfrxDBDataSet(Instance).GetDataSet.RecordCount
  end
  else if ClassType = TfrxCustomDataSet then
  begin
    if MethodName = 'LAST' then
      TfrxCustomDataSet(Instance).DataSet.Last
    else if MethodName = 'FIELDBYNAME' then
      Result:= Integer(TfrxCustomDataset(Instance).DataSet.FieldByName(Params[0]))
  end
  else if ClassType = TfrxCustomQuery then
  begin
    if MethodName = 'PARAMBYNAME' then
      Result:= Integer(TfrxCustomQuery(Instance).ParamByName(Params[0]))
  end
end;

function TFunctions.GetProp(Instance:TObject; ClassType:TClass;
  const PropName:String):Variant;
begin
  Result:= 0;

  if ClassType = TfrxCustomDataset then
  begin
    if PropName = 'DATASET' then
      Result:= Integer(TfrxCustomDataset(Instance).DataSet)
    else if PropName = 'ACTIVE' then
      Result:= TfrxCustomDataset(Instance).Active
    else if PropName = 'FIELDS' then
      Result:= Integer(TfrxCustomDataset(Instance).Fields)
  end
  else if ClassType = TfrxParamItem then
  begin
    if PropName = 'VALUE' then
      Result:= TfrxParamItem(Instance).Value
  end
  else if ClassType = TfrxDBLookupComboBox then
  begin
    if PropName = 'KEYVALUE' then
      Result:= TfrxDBLookupComboBox(Instance).KeyValue
    else if PropName = 'TEXT' then
      Result:= TfrxDBLookupComboBox(Instance).Text
  end
end;

procedure TFunctions.SetProp(Instance:TObject; ClassType:TClass;
  const PropName:String; Value:Variant);
begin
  if ClassType = TfrxCustomDataset then
  begin
    if PropName = 'ACTIVE' then
      TfrxCustomDataset(Instance).Active:= Value;
  end
  else if ClassType = TfrxParamItem then
  begin
    if PropName = 'VALUE' then
      TfrxParamItem(Instance).Value:= Value
  end
  else if ClassType = TfrxDBLookupComboBox then
  begin
    if PropName = 'KEYVALUE' then
      TfrxDBLookupComboBox(Instance).KeyValue:= Value
  end
end;

initialization
  Functions:= TFunctions.Create;

finalization
  Functions.Free;

end.
