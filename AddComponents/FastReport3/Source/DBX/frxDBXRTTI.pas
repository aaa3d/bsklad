
{******************************************}
{                                          }
{             FastReport v3.0              }
{          DBX components RTTI             }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxDBXRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, fs_iinterpreter, frxDBXComponents
{$IFDEF Delphi6}
, Variants
{$ENDIF};


type
  TFunctions = class(TObject)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; var Params: Variant): Variant;
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
    AddClass(TfrxDBXDatabase, 'TfrxComponent');
    AddClass(TfrxDBXTable, 'TfrxCustomDataset');
    with AddClass(TfrxDBXQuery, 'TfrxCustomQuery') do
      AddMethod('procedure ExecSQL', CallMethod);
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

  if ClassType = TfrxDBXQuery then
  begin
    if MethodName = 'EXECSQL' then
      TfrxDBXQuery(Instance).Query.ExecSQL
  end
end;


initialization
  Functions := TFunctions.Create;

finalization
  Functions.Free;

end.
