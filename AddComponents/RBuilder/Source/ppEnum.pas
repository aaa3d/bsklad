{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppEnum;

interface

{$I ppIfDef.pas}

uses
  Classes, TypInfo, SysUtils, ExtCtrls, Printers, ppUtils, ppTypes;

  function raIsEnumValue(aWord: String; var aTypeName: String; var aValue: Integer): Boolean;
  function raEnumNameForValue(const aTypeName: String; aValue: Integer): String;
  function raEnumTypes: TStringList;

  {use to register enumerated type info}
  procedure raRegisterEnum(const aTypeName: String; aTypeInfo: Pointer);
  procedure raUnRegisterEnum(const aTypeName: String);

implementation

var
  FEnumTypeList: TStringList = nil;
  FEnumValueList: TStringList = nil;

{------------------------------------------------------------------------------}
{ raEnumValues }

function raEnumValues: TStringList;
var
  liEnumTypeIndex: Integer;
  liIndex: Integer;
  lTypeInfo: PTypeInfo;
  lList: TStrings;
begin

  {create string list}
  if (FEnumValueList = nil) then
    begin
      FEnumValueList := TStringList.Create;

      {add literal values for each type to enum value list}
      liEnumTypeIndex := 0;
      lList := TStringList.Create;

      while (liEnumTypeIndex < raEnumTypes.Count) do
        begin
          lTypeInfo := PTypeInfo(raEnumTypes.Objects[liEnumTypeIndex]);
          lList.Clear;

          ppGetEnumNames(lTypeInfo, lList);

          for liIndex := 0 to lList.Count - 1 do
            lList.Objects[liIndex] := TObject(liEnumTypeIndex);

          FEnumValueList.AddStrings(lList);

          Inc(liEnumTypeIndex);
        end;

      lList.Free;
    end;
    
  Result := FEnumValueList;


end; {function, raEnumValues}

{------------------------------------------------------------------------------}
{ raEnumTypes }

function raEnumTypes: TStringList;
begin

  if (FEnumTypeList = nil) then
    FEnumTypeList := TStringList.Create;

  Result := FEnumTypeList;

end; {function, raEnumTypes}

{------------------------------------------------------------------------------}
{ raRegisterEnum }

procedure raRegisterEnum(const aTypeName: String; aTypeInfo: Pointer);
begin
  raEnumTypes.AddObject(aTypeName, aTypeInfo);
end; {procedure, raRegisterEnum}

{------------------------------------------------------------------------------}
{ raUnRegisterEnum }

procedure raUnRegisterEnum(const aTypeName: String);
var
  liIndex: Integer;
begin

  liIndex := raEnumTypes.IndexOf(aTypeName);

  if (liIndex <> 0) then
    raEnumTypes.Delete(liIndex);

end; {procedure, raUnRegisterEnum}

{------------------------------------------------------------------------------}
{ raEnumNameForValue }

function raEnumNameForValue(const aTypeName: String; aValue: Integer): String;
var
  liIndex: Integer;
  lTypeInfo: PTypeInfo;
begin

  liIndex := raEnumTypes.IndexOf(Lowercase(aTypeName));

  if (liIndex <> -1) then
    begin
      lTypeInfo := PTypeInfo(raEnumTypes.Objects[liIndex]);

      Result := GetEnumName(lTypeInfo, aValue);
    end;

end; {function, raEnumNameForValue}

{------------------------------------------------------------------------------}
{ raIsEnumValue }

function raIsEnumValue(aWord: String; var aTypeName: String; var aValue: Integer): Boolean;
var
  liIndex: Integer;
  liEnumTypeIndex: Integer;
  lTypeInfo: PTypeInfo;
begin

  Result := False;
  aTypeName := '';
  aValue := -1;

  liIndex := raEnumValues.IndexOf(aWord);

  if (liIndex <> -1) then
    begin
      liEnumTypeIndex := Integer(raEnumValues.Objects[liIndex]);

      lTypeInfo := PTypeInfo(raEnumTypes.Objects[liEnumTypeIndex]);

      aTypeName := raEnumTypes[liEnumTypeIndex];
      aValue := ppGetEnumStringAsInteger(lTypeInfo, aWord);

      Result := True;
    end;

end; {function, raIsEnumValue}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  {enumerated type info}
  raRegisterEnum('Boolean', TypeInfo(Boolean));
  raRegisterEnum('TAlignment', TypeInfo(TAlignment));
  raRegisterEnum('TppBarCodeType', TypeInfo(TppBarCodeType));
  raRegisterEnum('TppBarCodeOrientation', TypeInfo(TppBarCodeOrientation));
  raRegisterEnum('TppBreakType', TypeInfo(TppBreakType));
  raRegisterEnum('TppCalcType', TypeInfo(TppCalcType));
  raRegisterEnum('TppDataType', TypeInfo(TppDataType));
  raRegisterEnum('TppDBCalcType', TypeInfo(TppDBCalcType));
  raRegisterEnum('TppDuplexType', TypeInfo(TppDuplexType));
  raRegisterEnum('TppFileType', TypeInfo(TppFileType));
  raRegisterEnum('TppFormatType', TypeInfo(TppFormatType));
  raRegisterEnum('TppLanguageType', TypeInfo(TppLanguageType));
  raRegisterEnum('TppLinePositionType', TypeInfo(TppLinePositionType));
  raRegisterEnum('TppLineStyleType', TypeInfo(TppLineStyleType));
  raRegisterEnum('TppPassSettingType', TypeInfo(TppPassSettingType));
  raRegisterEnum('TppPrintBehaviorType', TypeInfo(TppPrintBehaviorType));
  raRegisterEnum('TppPrintHeightType', TypeInfo(TppPrintHeightType));
  raRegisterEnum('TppRangeBeginType', TypeInfo(TppRangeBeginType));
  raRegisterEnum('TppRangeEndType', TypeInfo(TppRangeEndType));
  raRegisterEnum('TppSaveToType', TypeInfo(TppSaveToType));
  raRegisterEnum('TppSearchOperatorType', TypeInfo(TppSearchOperatorType));
  raRegisterEnum('TShapeType', TypeInfo(TShapeType));
  raRegisterEnum('TppSortOrderType', TypeInfo(TppSortOrderType));
  raRegisterEnum('TppUnitType', TypeInfo(TppUnitType));
  raRegisterEnum('TppVarEventType', TypeInfo(TppVarEventType));
  raRegisterEnum('TppVarType', TypeInfo(TppVarType));
  raRegisterEnum('TPrinterOrientation', TypeInfo(TPrinterOrientation));

 { raRegisterEnum('TraDataType', TypeInfo(TraDataType));}

finalization

  FEnumTypeList.Free;
  FEnumTypeList := nil;

  FEnumValueList.Free;
  FEnumValueList := nil;

end.
