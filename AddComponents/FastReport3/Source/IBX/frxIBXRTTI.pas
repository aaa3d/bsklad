
{******************************************}
{                                          }
{             FastReport v3.0              }
{          IBX components RTTI             }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxIBXRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, fs_iinterpreter, frxIBXComponents, fs_iibxrtti
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

    with AddClass(TfrxIBXDatabase, 'TfrxComponent') do
      AddProperty('Database', 'TIBDatabase', GetProp, nil);
    with AddClass(TfrxIBXTable, 'TfrxCustomDataset') do
      AddProperty('Table', 'TIBTable', GetProp, nil);
    with AddClass(TfrxIBXQuery, 'TfrxCustomQuery') do
    begin
      AddMethod('procedure ExecSQL', CallMethod);
      AddProperty('Query', 'TIBQuery', GetProp, nil);
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

  if ClassType = TfrxIBXQuery then
  begin
    if MethodName = 'EXECSQL' then
      TfrxIBXQuery(Instance).Query.ExecSQL
  end
end;

function TFunctions.GetProp(Instance: TObject; ClassType: TClass;
  const PropName: String): Variant;
begin
  Result := 0;

  if ClassType = TfrxIBXDatabase then
  begin
    if PropName = 'DATABASE' then
      Result := Integer(TfrxIBXDatabase(Instance).Database)
  end
  else if ClassType = TfrxIBXTable then
  begin
    if PropName = 'TABLE' then
      Result := Integer(TfrxIBXTable(Instance).Table)
  end
  else if ClassType = TfrxIBXQuery then
  begin
    if PropName = 'QUERY' then
      Result := Integer(TfrxIBXQuery(Instance).Query)
  end
end;


initialization
  Functions := TFunctions.Create;

finalization
  Functions.Free;

end.
