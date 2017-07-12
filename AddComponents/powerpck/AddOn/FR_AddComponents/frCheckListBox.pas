{******************************************}
{                                          }
{             FastReport v2.4              }
{       frCheckListBox Dialog Control      }
{                                          }
{ Copyright (c) 2001 by Stalker SoftWare   }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{ Copyright (c) 1995, 1996 AO ROSNO        }
{ Copyright (c) 1997, 1998 Master-Bank     }
{                                          }
{******************************************}

unit frCheckListBox;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  CheckLst, FR_dctrl, IniFiles;

type
  TfrCheckListBox = class(TComponent) // fake component
  end;

  TfrCheckListBoxControl = class(TfrStdControl)
  private
    FCheckListBox :TCheckListBox;
    procedure ItemsEditor(Sender: TObject);
    procedure RestoreStates(cIniFile, Section: String);
    procedure SaveStates(cIniFile, Section: String);
    procedure ApplyState(AState: TCheckBoxState; EnabledOnly: Boolean);    
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

{ TfrCheckListBoxControl }

constructor TfrCheckListBoxControl.Create;
begin
 inherited Create;
 FCheckListBox := TCheckListBox.Create(nil);
 
 FCheckListBox.Parent := frDialogForm;
 AssignControl(FCheckListBox);
 BaseName := 'CheckListBox';
 dx := 185; dy := 89;

 frConsts['cbUnchecked'] := cbUnchecked;
 frConsts['cbChecked'] := cbChecked;
 frConsts['cbGrayed'] := cbGrayed;

end; { Create }

destructor TfrCheckListBoxControl.Destroy;
begin
 FCheckListBox.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrCheckListBoxControl.DefineProperties;
begin
 inherited DefineProperties;
 AddProperty('Items', [frdtHasEditor, frdtOneObject], ItemsEditor);
 AddProperty('Checked',[],nil);
 AddProperty('Items.Count',[],nil);
 AddProperty('State',[],nil);
 AddProperty('ItemEnabled',[],nil);
 AddProperty('AllowGrayed',[frdtBoolean],nil);
end; { DefineProperties }

procedure TfrCheckListBoxControl.SetPropValue(Index: String; Value: Variant);
begin

 Index := AnsiUpperCase(Index);
 inherited SetPropValue(Index, Value);

 if Index = 'ALLOWGRAYED' then
   FCheckListBox.AllowGrayed := Value

end; { SetPropValue }

function TfrCheckListBoxControl.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'ITEMS.COUNT' then
   Result := FCheckListBox.Items.Count
 else
 if Index = 'ALLOWGRAYED' then
   Result := FCheckListBox.AllowGrayed

end; { GetPropValue }

function TfrCheckListBoxControl.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 if MethodName = 'SETINDEXPROPERTY' then begin
   if Par1 = 'ITEMS' then
     FCheckListBox.Items[Par2] := Par3
   else if Par1 = 'CHECKED' then
     FCheckListBox.Checked[Par2] := Par3
   else if Par1 = 'STATE' then
     FCheckListBox.State[Par2] := Par3
   else if Par1 = 'ITEMENABLED' then
     FCheckListBox.ItemEnabled[Par2] := Par3
 end { if }
 else
 if MethodName = 'GETINDEXPROPERTY' then begin
   if Par1 = 'ITEMS' then
     Result := FCheckListBox.Items[Par2]
   else if Par1 = 'CHECKED' then
     Result := FCheckListBox.Checked[Par2]
   else if Par1 = 'STATE' then
     Result := FCheckListBox.State[Par2]
   else if Par1 = 'ITEMENABLED' then
     Result := FCheckListBox.ItemEnabled[Par2];
 end { if }
 else
 if MethodName = 'ITEMS.ADD' then
   FCheckListBox.Items.Add(frParser.Calc(Par1))
 else
 if MethodName = 'CLEAR' then
   FCheckListBox.Clear
 else
 if MethodName = 'APPLYSTATE' then
    case Par1 of
      0 :ApplyState(cbUnchecked,frParser.Calc(Par2));
      1 :ApplyState(cbChecked,frParser.Calc(Par2)) ;
      2 :ApplyState(cbGrayed,frParser.Calc(Par2));
    end { case }
 else
 if MethodName = 'SAVESTATES' then
   SaveStates(frParser.Calc(Par1),frParser.Calc(Par2))
 else
 if MethodName = 'RESTORESTATES' then
   RestoreStates(frParser.Calc(Par1),frParser.Calc(Par2))

end; { DoMethod }

procedure TfrCheckListBoxControl.LoadFromStream(Stream: TStream);
begin
 inherited LoadFromStream(Stream);
 frReadMemo(Stream, FCheckListBox.Items);
 FCheckListBox.AllowGrayed := frReadBoolean(Stream);
end; { LoadFromStream }

procedure TfrCheckListBoxControl.SaveToStream(Stream: TStream);
begin
 inherited SaveToStream(Stream);
 frWriteMemo(Stream, FCheckListBox.Items);
 frWriteBoolean(Stream, FCheckListBox.AllowGrayed);
end; { SaveToStream }

procedure TfrCheckListBoxControl.ItemsEditor(Sender: TObject);
begin

 with TfrLinesEditorForm.Create(nil) do begin
   M1.Text := FCheckListBox.Items.Text;
   if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then begin
     frDesigner.BeforeChange;
     FCheckListBox.Items.Text := M1.Text;
     frDesigner.AfterChange;
   end; { if }
   Free;
 end; { with }

end; { ItemsEditor }

const
  sCount = 'Count';
  sItem = 'Item';

procedure TfrCheckListBoxControl.SaveStates(cIniFile, Section: String);
var
  I       :Integer;
  IniFile :TIniFile;

begin

 IniFile := TIniFile.Create(cIniFile);
 try
   with FCheckListBox do begin
     IniFile.EraseSection(Section);
     IniFile.WriteInteger(Section, sCount, Items.Count);
     for I := 0 to Items.Count - 1 do
       IniFile.WriteInteger(Section, sItem + IntToStr(I), Integer(State[I]));
   end; { with }
 finally
   IniFile.Free;
 end; { try }

end; { SaveStates }

procedure TfrCheckListBoxControl.RestoreStates(cIniFile, Section: String);
var
  I       :Integer;
  ACount  :Integer;
  IniFile :TIniFile;

begin

 IniFile := TIniFile.Create(cIniFile);
 try
   with FCheckListBox do begin
     ACount := frMin(IniFile.ReadInteger(Section, sCount, 0), Items.Count);
     for I := 0 to ACount - 1 do
       State[I] := TCheckBoxState(IniFile.ReadInteger(Section, sItem + IntToStr(I),
                                                       Integer(cbUnchecked)));
   end; { with }
 finally
   IniFile.Free;
 end; { try }

end; { RestoreStates }

procedure TfrCheckListBoxControl.ApplyState(AState: TCheckBoxState; EnabledOnly: Boolean);
var
  I: Integer;

begin

 with FCheckListBox do
   for I := 0 to Items.Count - 1 do
     if not EnabledOnly or ItemEnabled[I] then
       State[I] := AState;

end; { ApplyState }

function TfrCheckListBoxControl.frMin(A, B: LongInt): LongInt;
begin
 if A < B then
   Result := A
 else
   Result := B;
end; { Min }

procedure Register;
begin
 RegisterComponents('FastReport',[TfrCheckListBox]);
end; { Register }

var
  Bmp: TBitmap;

initialization
 Bmp := TBitmap.Create;
 Bmp.LoadFromResourceName(hInstance, 'FR_CHECKLISTBOX2');
 frRegisterControl(TfrCheckListBoxControl, Bmp, 'Insert CheckListBox control');

finalization
 frUnRegisterObject(TfrCheckListBoxControl);
 Bmp.Free;

end.


