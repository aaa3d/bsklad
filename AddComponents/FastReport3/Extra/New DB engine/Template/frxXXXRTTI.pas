
{******************************************}
{                                          }
{             FastReport v3.0              }
{          XXX components RTTI             }
{                                          }

// Copyright
{                                          }
{******************************************}

unit frxXXXRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, fs_iinterpreter, frxXXXComponents
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
    AddClass(TfrxXXXDatabase, 'TfrxComponent');
    AddClass(TfrxXXXTable, 'TfrxCustomDataset');
    with AddClass(TfrxXXXQuery, 'TfrxCustomQuery') do
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

  if ClassType = TfrxXXXQuery then
  begin
    if MethodName = 'EXECSQL' then
      TfrxXXXQuery(Instance).Query.ExecSQL
  end
end;


initialization
  Functions := TFunctions.Create;

finalization
  Functions.Free;

end.
