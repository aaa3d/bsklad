
{******************************************}
{                                          }
{             FastReport v3.0              }
{          BDE components RTTI             }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxBDERTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxBDEComponents,
  fs_ibdertti
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

    with AddClass(TfrxBDEDatabase, 'TfrxComponent') do
      AddProperty('Database', 'TDatabase', GetProp, nil);
    with AddClass(TfrxBDETable, 'TfrxCustomDataset') do
      AddProperty('Table', 'TTable', GetProp, nil);
    with AddClass(TfrxBDEQuery, 'TfrxCustomQuery') do
    begin
      AddMethod('procedure ExecSQL', CallMethod);
      AddProperty('Query', 'TQuery', GetProp, nil);
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

  if ClassType = TfrxBDEQuery then
  begin
    if MethodName = 'EXECSQL' then
      TfrxBDEQuery(Instance).Query.ExecSQL
  end
end;

function TFunctions.GetProp(Instance: TObject; ClassType: TClass;
  const PropName: String): Variant;
begin
  Result := 0;

  if ClassType = TfrxBDEDatabase then
  begin
    if PropName = 'DATABASE' then
      Result := Integer(TfrxBDEDatabase(Instance).Database)
  end
  else if ClassType = TfrxBDETable then
  begin
    if PropName = 'TABLE' then
      Result := Integer(TfrxBDETable(Instance).Table)
  end
  else if ClassType = TfrxBDEQuery then
  begin
    if PropName = 'QUERY' then
      Result := Integer(TfrxBDEQuery(Instance).Query)
  end
end;


initialization
  Functions := TFunctions.Create;

finalization
  Functions.Free;

end.
