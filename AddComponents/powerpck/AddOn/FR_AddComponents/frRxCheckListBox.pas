{******************************************}
{                                          }
{             FastReport v2.4              }
{       frRxCheckListBox Dialog Control    }
{                                          }
{ Copyright (c) 2001 by Stalker SoftWare   }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit frRxCheckListBox;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  RXCtrls, FR_dctrl, IniFiles;

type
  TfrRxCheckListBox = class(TComponent) // fake component
  end;

  TfrRxCheckListBoxControl = class(TfrStdControl)
  private
    FRxCheckListBox :TRxCheckListBox;
    procedure ItemsEditor(Sender: TObject);
    procedure RestoreStates(cIniFile, Section: String);
    procedure SaveStates(cIniFile, Section: String);
    function frMin(A, B: LongInt): LongInt;
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
  end;


 procedure Register;

implementation

uses
  FR_Utils, FR_LEdit, FR_Class;

{$R FrStControls.res}

{ TfrRxCheckListBoxControl }

constructor TfrRxCheckListBoxControl.Create;
begin
 inherited Create;
 FRxCheckListBox := TRxCheckListBox.Create(nil);
 
 FRxCheckListBox.Parent := frDialogForm;
 AssignControl(FRxCheckListBox);
 BaseName := 'RxCheckListBox';
 dx := 185; dy := 89;

 frConsts['ckCheckBoxes'] := ckCheckBoxes;
 frConsts['ckCheckMarks'] := ckCheckMarks;
 frConsts['ckRadioButtons'] := ckRadioButtons;

 frConsts['cbUnchecked'] := cbUnchecked;
 frConsts['cbChecked'] := cbChecked;
 frConsts['cbGrayed'] := cbGrayed;

end; { Create }

destructor TfrRxCheckListBoxControl.Destroy;
begin
 FRxCheckListBox.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrRxCheckListBoxControl.DefineProperties;
begin
 inherited DefineProperties;
 AddProperty('Items', [frdtHasEditor, frdtOneObject], ItemsEditor);
 AddProperty('Checked',[],nil);
 AddProperty('Items.Count',[],nil);
 AddProperty('State',[],nil);
 AddProperty('EnabledItem',[],nil);
 AddEnumProperty('CheckKind','ckCheckBoxes;ckCheckMarks;ckRadioButtons',[ckCheckBoxes,ckCheckMarks,ckRadioButtons]);
 AddProperty('AllowGrayed',[frdtBoolean],nil);
 AddProperty('AutoScroll',[frdtBoolean],nil);
 AddProperty('CheckedIndex',[],nil);
end; { DefineProperties }

procedure TfrRxCheckListBoxControl.SetPropValue(Index: String; Value: Variant);
begin

 Index := AnsiUpperCase(Index);
 inherited SetPropValue(Index, Value);

 if Index = 'CHECKKIND' then
   FRxCheckListBox.CheckKind := Value
 else
 if Index = 'ALLOWGRAYED' then
   FRxCheckListBox.AllowGrayed := Value
 else
 if Index = 'AUTOSCROLL' then
   FRxCheckListBox.AutoScroll := Value
 else
 if Index = 'CHECKEDINDEX' then
   FRxCheckListBox.CheckedIndex := Value

end; { SetPropValue }

function TfrRxCheckListBoxControl.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'ITEMS.COUNT' then
   Result := FRxCheckListBox.Items.Count
 else
 if Index = 'CHECKKIND' then
   Result := FRxCheckListBox.CheckKind
 else
 if Index = 'ALLOWGRAYED' then
   Result := FRxCheckListBox.AllowGrayed
 else
 if Index = 'AUTOSCROLL' then
   Result := FRxCheckListBox.AutoScroll
 else
 if Index = 'CHECKEDINDEX' then
   Result := FRxCheckListBox.CheckedIndex

end; { GetPropValue }

function TfrRxCheckListBoxControl.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 if MethodName = 'SETINDEXPROPERTY' then begin
   if Par1 = 'ITEMS' then
     FRxCheckListBox.Items[Par2] := Par3
   else if Par1 = 'CHECKED' then
     FRxCheckListBox.Checked[Par2] := Par3
   else if Par1 = 'STATE' then
     FRxCheckListBox.State[Par2] := Par3
   else if Par1 = 'ENABLEDITEM' then
     FRxCheckListBox.EnabledItem[Par2] := Par3
 end { if }
 else
 if MethodName = 'GETINDEXPROPERTY' then begin
   if Par1 = 'ITEMS' then
     Result := FRxCheckListBox.Items[Par2]
   else if Par1 = 'CHECKED' then
     Result := FRxCheckListBox.Checked[Par2]
   else if Par1 = 'STATE' then
     Result := FRxCheckListBox.State[Par2]
   else if Par1 = 'ENABLEDITEM' then
     Result := FRxCheckListBox.EnabledItem[Par2];
 end { if }
 else
 if MethodName = 'ITEMS.ADD' then
   FRxCheckListBox.Items.Add(frParser.Calc(Par1))
 else
 if MethodName = 'CLEAR' then
   FRxCheckListBox.Clear
 else
 if MethodName = 'APPLYSTATE' then
    case Par1 of
      0 :FRxCheckListBox.ApplyState(cbUnchecked,frParser.Calc(Par2));
      1 :FRxCheckListBox.ApplyState(cbChecked,frParser.Calc(Par2)) ;
      2 :FRxCheckListBox.ApplyState(cbGrayed,frParser.Calc(Par2));
    end { case }
 else
 if MethodName = 'SAVESTATES' then
   SaveStates(frParser.Calc(Par1),frParser.Calc(Par2))
 else
 if MethodName = 'RESTORESTATES' then
   RestoreStates(frParser.Calc(Par1),frParser.Calc(Par2))

end; { DoMethod }

procedure TfrRxCheckListBoxControl.LoadFromStream(Stream: TStream);
begin
 inherited LoadFromStream(Stream);
 frReadMemo(Stream, FRxCheckListBox.Items);
 Prop['CheckKind'] := frReadByte(Stream);
 FRxCheckListBox.AllowGrayed := frReadBoolean(Stream);
 FRxCheckListBox.AutoScroll := frReadBoolean(Stream);
end; { LoadFromStream }

procedure TfrRxCheckListBoxControl.SaveToStream(Stream: TStream);
begin
 inherited SaveToStream(Stream);
 frWriteMemo(Stream, FRxCheckListBox.Items);
 frWriteByte(Stream, Prop['CheckKind']);
 frWriteBoolean(Stream, FRxCheckListBox.AllowGrayed);
 frWriteBoolean(Stream, FRxCheckListBox.AutoScroll);
end; { SaveToStream }

procedure TfrRxCheckListBoxControl.ItemsEditor(Sender: TObject);
begin

 with TfrLinesEditorForm.Create(nil) do begin
   M1.Text := FRxCheckListBox.Items.Text;
   if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then begin
     frDesigner.BeforeChange;
     FRxCheckListBox.Items.Text := M1.Text;
     frDesigner.AfterChange;
   end; { if }
   Free;
 end; { with }

end; { ItemsEditor }

const
  sCount = 'Count';
  sItem = 'Item';

procedure TfrRxCheckListBoxControl.SaveStates(cIniFile, Section: String);
var
  I       :Integer;
  IniFile :TIniFile;

begin

 IniFile := TIniFile.Create(cIniFile);
 try
   with FRxCheckListBox do begin
     IniFile.EraseSection(Section);
     IniFile.WriteInteger(Section, sCount, Items.Count);
     for I := 0 to Items.Count - 1 do
       IniFile.WriteInteger(Section, sItem + IntToStr(I), Integer(State[I]));
   end; { with }
 finally
   IniFile.Free;
 end; { try }

end; { SaveStates }

procedure TfrRxCheckListBoxControl.RestoreStates(cIniFile, Section: String);
var
  I       :Integer;
  ACount  :Integer;
  IniFile :TIniFile;

begin

 IniFile := TIniFile.Create(cIniFile);
 try
   with FRxCheckListBox do begin
     ACount := frMin(IniFile.ReadInteger(Section, sCount, 0), Items.Count);

     for I := 0 to ACount - 1 do begin
       State[I] := TCheckBoxState(IniFile.ReadInteger(Section, sItem + IntToStr(I),
                                                       Integer(clbDefaultState)));
       if (State[I] = cbChecked) and (CheckKind = ckRadioButtons) then Exit;
     end; { if }
   end; { with }
 finally
   IniFile.Free;
 end; { try }

end; { RestoreStates }

function TfrRxCheckListBoxControl.frMin(A, B: LongInt): LongInt;
begin
 if A < B then
   Result := A
 else
   Result := B;
end; { Min }

procedure Register;
begin
 RegisterComponents('FastReport',[TfrRxCheckListBox]);
end; { Register }

var
  Bmp: TBitmap;

initialization
 Bmp := TBitmap.Create;
 Bmp.LoadFromResourceName(hInstance, 'FR_RXCHECKLISTBOX2');
 frRegisterControl(TfrRxCheckListBoxControl, Bmp, 'Insert RxCheckListBox control');

finalization
 frUnRegisterObject(TfrRxCheckListBoxControl);
 Bmp.Free;

end.


