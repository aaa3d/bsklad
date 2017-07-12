{******************************************}
{ }
{ FastReport v3.0 }
{ Dialog controls RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDCtrlRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, fs_iformsrtti,
  frxDCtrl, frxClassRTTI
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

    AddClass(TfrxLabelControl, 'TfrxDialogControl');
    AddClass(TfrxEditControl, 'TfrxDialogControl');
    AddClass(TfrxMemoControl, 'TfrxDialogControl');
    AddClass(TfrxButtonControl, 'TfrxDialogControl');
    AddClass(TfrxCheckBoxControl, 'TfrxDialogControl');
    AddClass(TfrxRadioButtonControl, 'TfrxDialogControl');
    with AddClass(TfrxListBoxControl, 'TfrxDialogControl') do
      AddProperty('ItemIndex', 'Integer', GetProp, SetProp);
    with AddClass(TfrxComboBoxControl, 'TfrxDialogControl') do
      AddProperty('ItemIndex', 'Integer', GetProp, SetProp);
    AddClass(TfrxDateEditControl, 'TfrxDialogControl');
    AddClass(TfrxImageControl, 'TfrxDialogControl');
    AddClass(TfrxBevelControl, 'TfrxDialogControl');
    AddClass(TfrxPanelControl, 'TfrxDialogControl');
    AddClass(TfrxGroupBoxControl, 'TfrxDialogControl');
    AddClass(TfrxBitBtnControl, 'TfrxDialogControl');
    AddClass(TfrxSpeedButtonControl, 'TfrxDialogControl');
    AddClass(TfrxMaskEditControl, 'TfrxDialogControl');
    with AddClass(TfrxCheckListBoxControl, 'TfrxDialogControl') do
    begin
      AddIndexProperty('Checked', 'Integer', 'Boolean', CallMethod);
      AddIndexProperty('State', 'Integer', 'TCheckBoxState', CallMethod);
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
begin
  Result:= 0;

  if ClassType = TfrxCheckListBoxControl then
  begin
    if MethodName = 'CHECKED.GET' then
      Result:= TfrxCheckListBoxControl(Instance).Checked[Params[0]]
    else if MethodName = 'CHECKED.SET' then
      TfrxCheckListBoxControl(Instance).Checked[Params[0]]:= Params[1]
    else if MethodName = 'STATE.GET' then
      Result:= TfrxCheckListBoxControl(Instance).State[Params[0]]
    else if MethodName = 'STATE.SET' then
      TfrxCheckListBoxControl(Instance).State[Params[0]]:= Params[1]
  end
end;

function TFunctions.GetProp(Instance:TObject; ClassType:TClass;
  const PropName:String):Variant;
begin
  Result:= 0;

  if ClassType = TfrxComboBoxControl then
  begin
    if PropName = 'ITEMINDEX' then
      Result:= TfrxComboBoxControl(Instance).ItemIndex
  end else
  if ClassType = TfrxListBoxControl then
  begin
    if PropName = 'ITEMINDEX' then
      Result:= TfrxListBoxControl(Instance).ItemIndex
  end
end;

procedure TFunctions.SetProp(Instance:TObject; ClassType:TClass;
  const PropName:String; Value:Variant);
begin
  if ClassType = TfrxComboBoxControl then
  begin
    if PropName = 'ITEMINDEX' then
      TfrxComboBoxControl(Instance).ItemIndex:= Value;
  end else
  if ClassType = TfrxListBoxControl then
  begin
    if PropName = 'ITEMINDEX' then
      TfrxListBoxControl(Instance).ItemIndex:= Value;
  end
end;

initialization
  Functions:= TFunctions.Create;

finalization
  Functions.Free;

end.
