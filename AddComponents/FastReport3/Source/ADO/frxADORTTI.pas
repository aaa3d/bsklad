
{******************************************}
{                                          }
{             FastReport v3.0              }
{          ADO components RTTI             }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxADORTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, fs_iinterpreter, frxADOComponents, fs_iadortti
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TFunctions = class(TObject)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; var Params: Variant): Variant;
    function GetProp(Instance: TObject; ClassType: TClass;
      const PropName: String): Variant;
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Functions: TFunctions;


{ TFunctions }

constructor TFunctions.Create;
begin
  with fsGlobalUnit do
  begin
    AddedBy := Self;

    with AddClass(TfrxADODatabase, 'TfrxComponent') do
      AddProperty('Database', 'TADOConnection', GetProp, nil);
    with AddClass(TfrxADOTable, 'TfrxCustomDataset') do
      AddProperty('Table', 'TADOTable', GetProp, nil);
    with AddClass(TfrxADOQuery, 'TfrxCustomQuery') do
    begin
      AddMethod('procedure ExecSQL', CallMethod);
      AddProperty('Query', 'TADOQuery', GetProp, nil);
    end;
    AddedBy := nil;
  end;
end;

destructor TFunctions.Destroy;
begin
  if fsGlobalUnit <> nil then
    fsGlobalUnit.RemoveItems(Self);
  inherited;
end;

function TFunctions.CallMethod(Instance: TObject; ClassType: TClass;
  const MethodName: String; var Params: Variant): Variant;
begin
  Result := 0;

  if ClassType = TfrxADOQuery then
  begin
    if MethodName = 'EXECSQL' then
      TfrxADOQuery(Instance).Query.ExecSQL
  end
end;

function TFunctions.GetProp(Instance: TObject; ClassType: TClass;
  const PropName: String): Variant;
begin
  Result := 0;

  if ClassType = TfrxADODatabase then
  begin
    if PropName = 'DATABASE' then
      Result := Integer(TfrxADODatabase(Instance).Database)
  end
  else if ClassType = TfrxADOTable then
  begin
    if PropName = 'TABLE' then
      Result := Integer(TfrxADOTable(Instance).Table)
  end
  else if ClassType = TfrxADOQuery then
  begin
    if PropName = 'QUERY' then
      Result := Integer(TfrxADOQuery(Instance).Query)
  end
end;


initialization
  Functions := TFunctions.Create;

finalization
  Functions.Free;

end.
