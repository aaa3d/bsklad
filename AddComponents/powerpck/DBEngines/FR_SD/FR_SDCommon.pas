{*********************************************}
{                                             }
{ FastReport v2.4 - SQLDirect components      }
{             Common component                }
{                                             }
{ Copyright (c) 1998-2000 by Tzyganenko A.    }
{ Copyright (c) 1997-2001 by Yuri Sheino.     }
{ Copyright (c) 2001 by Stalker SoftWare      }
{                                             }
{*********************************************}

unit FR_SDCommon;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, FR_DBSet, Db, SDEngine;

type
  TfrSDDataSet = class(TfrNonVisualControl)
  private
    function GetField(vPar :Variant) :TField;
  protected
    FDataSet: TSDDataSet;
    FDataSource: TDataSource;
    FDBDataSet: TfrDBDataset;
    procedure FieldsEditor(Sender: TObject);
    procedure ReadFields(Stream: TStream);
    procedure WriteFields(Stream: TStream);
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    procedure ShowEditor; override;
  end;


implementation

uses
  FR_DBUtils, FR_Utils, FR_Const, FR_LEdit, FR_DBFldEditor
{$IFDEF Delphi6}
, Variants
{$ENDIF};


{ TfrSDDataSet }

constructor TfrSDDataSet.Create;
begin

 inherited Create;

 FDataSource := TDataSource.Create(frDialogForm);
 FDataSource.DataSet := nil;

 FDBDataSet := TfrDBDataSet.Create(frDialogForm);
 FDBDataSet.DataSource := FDataSource;

 Flags := Flags or flDontUndo;

end; { Create }

destructor TfrSDDataSet.Destroy;
begin
 FDBDataset.Free;
 FDataSource.Free;
 FDataSet.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrSDDataSet.DefineProperties;

  function GetDatabaseNames: String;
  var
    i: Integer;
    sl: TStringList;

  begin

   Result := '';
   sl := TStringList.Create;
   try
     FDataSet.DBSession.GetDatabaseNames(sl);
     sl.Sort;
     for i := 0 to sl.Count - 1 do
       Result := Result + sl[i] + ';';
   finally
     sl.Free;
   end; { try }

  end; { GetDatabaseNames }

  function GetSessionsNames: String;
  var
    i: Integer;
    sl: TStringList;

  begin

   Result := '';
   sl := TStringList.Create;
   try
     Sessions.GetSessionNames(sl);
     sl.Sort;
     for i := 0 to sl.Count - 1 do
       Result := Result + sl[i] + ';';
   finally
     sl.Free;
   end; { try }

  end; { GetSessionsNames }

begin

 inherited DefineProperties;

 AddProperty('Active', [frdtBoolean], nil);
 AddProperty('AutoCalcField', [frdtBoolean], nil);
 AddProperty('DetachOnFetchAll', [frdtBoolean], nil);
 AddProperty('Preservation', [frdtBoolean], nil);
 AddEnumProperty('DatabaseName', GetDatabaseNames, [Null]);
 AddEnumProperty('SessionName', GetSessionsNames, [Null]);
 AddProperty('Fields', [frdtHasEditor, frdtOneObject], FieldsEditor);
 AddProperty('Fields.DisplayLabel', [], nil);
 AddProperty('Fields.DisplayWidth', [], nil);
 AddProperty('Fields.Visible', [], nil);
 AddProperty('Fields.FieldName', [], nil);
 AddProperty('Fields.IsNull', [], nil);
 AddProperty('FieldCount', [], nil);
 AddProperty('EOF', [], nil);
 AddProperty('RecordCount', [], nil);
{$IFNDEF Delphi2}
 AddProperty('IsEmpty', [], nil);
{$ENDIF}
 AddProperty('Locate',[],nil);

end; { DefineProperties }

procedure TfrSDDataSet.SetPropValue(Index: String; Value: Variant);
begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'NAME' then begin
   FDataSource.Name := 'S' + FDataSet.Name;
   FDBDataSet.Name := '_' + FDataSet.Name;
 end
 else
 if Index = 'ACTIVE' then
   FDataSet.Active := Value
 else
 if Index = 'AUTOCALCFIELD' then
   FDataSet.AutoCalcFields := Value
 else
 if Index = 'DETACHONFETCHALL' then
   FDataSet.DetachOnFetchAll := Value
 else
  if Index = 'PRESERVATION' then
   FDataSet.Preservation := Value
 else
 if Index = 'DATABASENAME' then begin
   FDataSet.Close;
   FDataSet.DatabaseName := Value;
 end else
 if Index = 'SESSIONNAME' then begin
   FDataSet.Close;
   FDataSet.SessionName := Value;
 end; { if }

end; { SetPropValue }

function TfrSDDataSet.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);

 if Result <> Null then Exit;

 if Index = 'ACTIVE' then
   Result := FDataSet.Active
 else
 if Index = 'AUTOCALCFIELD' then
   Result := FDataSet.AutoCalcFields
 else
 if Index = 'DETACHONFETCHALL' then
   Result := FDataSet.DetachOnFetchAll
 else
 if Index = 'PRESERVATION' then
   Result := FDataSet.Preservation
 else
 if Index = 'DATABASENAME' then
   Result := FDataSet.DatabaseName
 else
 if Index = 'SESSIONNAME' then
   Result := FDataSet.SessionName
 else
 if Index = 'EOF' then
   Result := FDataSet.Eof
 else
 if Index = 'RECORDCOUNT' then
   Result := FDataSet.RecordCount
 else
 if Index = 'FIELDCOUNT' then
   Result := FDataSet.FieldCount
{$IFNDEF Delphi2}
 else
 if Index = 'ISEMPTY' then
   Result := FDataSet.IsEmpty
{$ENDIF}

end; { GetPropValue }

function TfrSDDataSet.GetField(vPar: Variant): TField;
begin

 Result := FDataSet.FindField(vPar);
 if not Assigned(Result) then
   Result := FDataSet.Fields[vPar]

end; { GetField }

function TfrSDDataSet.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
var
  LocateOptions :TLocateOptions;

begin

 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);

 if MethodName = 'GETINDEXPROPERTY' then begin
   if Par1 = 'FIELDS' then begin
     if GetField(Par2).IsNull then
       Result := GetField(Par2).AsString
     else
       Result := GetField(Par2).AsVariant;
   end else
   if Par1 = 'FIELDS.DISPLAYLABEL' then
     Result := GetField(Par2).DisplayLabel
   else
   if Par1 = 'FIELDS.DISPLAYWIDTH' then
     Result := GetField(Par2).DisplayWidth
   else
   if Par1 = 'FIELDS.VISIBLE' then
     Result := GetField(Par2).Visible
   else
   if Par1 = 'FIELDS.FIELDNAME' then
     Result := GetField(Par2).FieldName
   else
   if Par1 = 'FIELDS.ISNULL' then
     Result := GetField(Par2).IsNull
 end
 else
 if MethodName = 'SETINDEXPROPERTY' then begin
   if Par1 = 'FIELDS.DISPLAYLABEL' then
     GetField(Par2).DisplayLabel := Par3
   else
   if Par1 = 'FIELDS.DISPLAYWIDTH' then
     GetField(Par2).DisplayWidth := Par3
   else
   if Par1 = 'FIELDS.VISIBLE' then
     GetField(Par2).Visible := Par3
 end
 else
 if MethodName = 'OPEN' then
   FDataSet.Open
 else
 if MethodName = 'CLOSE' then
   FDataSet.Close
 else
 if MethodName = 'NEXT' then
   FDataSet.Next
 else
 if MethodName = 'PRIOR' then
   FDataSet.Prior
 else
 if MethodName = 'FIRST' then
   FDataSet.First
 else
 if MethodName = 'LAST' then
   FDataSet.Last
 else
 if MethodName = 'LOCATE' then begin
   LocateOptions := [];
   if Pos(AnsiUpperCase('loPartialKey'),AnsiUpperCase(Par3)) > 0 then
     LocateOptions := LocateOptions+[loPartialKey];
   if Pos(AnsiUpperCase('loCaseInsensitive'),AnsiUpperCase(Par3)) > 0 then
     LocateOptions := LocateOptions+[loCaseInsensitive];
   Result := FDataSet.Locate(frParser.Calc(Par1),frParser.Calc(Par2),LocateOptions)
 end;

end; { DoMethod }

procedure TfrSDDataSet.ReadFields(Stream: TStream);
var
  i: Integer;
  n: Word;
  s: String;
  Field: TField;
  ds1: TDataset;
  fName: String;
  fType: TFieldType;
  fLookup: Boolean;
  fSize: Word;
  fDefs: TFieldDefs;

begin

 fDefs := FDataSet.FieldDefs;
 Stream.Read(n, 2);             // FieldCount
 for i := 0 to n - 1 do begin

   fType := TFieldType(frReadByte(Stream));                    // DataType
   fName := frReadString(Stream);                              // FieldName
   fLookup := frReadBoolean(Stream);                           // Lookup
   fSize := frReadWord(Stream);                                // Size

   fDefs.Add(fName, fType, fSize, False);
   Field := fDefs[fDefs.Count - 1].CreateField(FDataSet);

   if fLookup then
     with Field do begin
       Lookup := True;
       KeyFields := frReadString(Stream);                      // KeyFields
       s := frReadString(Stream);                              // LookupDataset
       ds1 := frFindComponent(FDataSet.Owner, s) as TDataSet;
       FFixupList['.' + FieldName] := s;
       LookupDataset := ds1;
       LookupKeyFields := frReadString(Stream);                // LookupKeyFields
       LookupResultField := frReadString(Stream);              // LookupResultField
     end; { with }

 end; { for }

end; { ReadFields }

procedure TfrSDDataSet.WriteFields(Stream: TStream);
var
  i: Integer;
  s: String;
  SaveActive: Boolean;

begin

 SaveActive := FDataSet.Active;
 FDataSet.Close;
 frWriteWord(Stream, FDataSet.FieldCount);  // FieldCount

 for i := 0 to FDataSet.FieldCount - 1 do
   with FDataSet.Fields[i] do begin

     frWriteByte(Stream, Byte(DataType));          // DataType
     frWriteString(Stream, FieldName);             // FieldName
     frWriteBoolean(Stream, Lookup);               // Lookup
     frWriteWord(Stream, Size);                    // Size

     if Lookup then begin
       frWriteString(Stream, KeyFields);           // KeyFields
       if LookupDataset <> nil then begin
         s := LookupDataset.Name;
         if LookupDataset.Owner <> FDataSet.Owner then
           s := LookupDataset.Owner.Name + '.' + s;
       end else
         s := '';
       frWriteString(Stream, s);                   // LookupDataset
       frWriteString(Stream, LookupKeyFields);     // LookupKeyFields
       frWriteString(Stream, LookupResultField);   // LookupResultField
     end; { if }

   end; { with }

 FDataSet.Active := SaveActive;

end; { WriteFields }

procedure TfrSDDataSet.Loaded;
var
  i: Integer;
  s: String;
  ds: TDataSet;
  f: TField;

begin

 // fixup component references
 try
   for i := 0 to FFixupList.Count - 1 do begin
     s := FFixupList.Name[i];
     if s[1] = '.' then begin // lookup field
       f := FDataSet.FindField(Copy(s, 2, 255));
       ds := frFindComponent(FDataSet.Owner, FFixupList.Value[i]) as TDataSet;
       f.LookupDataset := ds;
     end; { end }
   end; { for }
   Prop['Active'] := FFixupList['Active'];
 except
 end; { try }

end; { Loaded }

procedure TfrSDDataSet.ShowEditor;
begin
 FieldsEditor(nil);
end; { ShowEditor }

procedure TfrSDDataSet.FieldsEditor(Sender: TObject);
var
  SaveActive: Boolean;

begin

 SaveActive := FDataSet.Active;
 FDataSet.Close;

 with TfrDBFieldsEditorForm.Create(nil) do begin
   DataSet := FDataSet;
   ShowModal;
   Free;
 end; { with }

 frDesigner.BeforeChange;
 FDataSet.Active := SaveActive;

end; { FieldsEditor }

end.

