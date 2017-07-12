unit UDbfFieldDef;

interface

uses classes,UDbfCommon,db,SysUtils;

{$i _dbfCommon.inc}

type

  PDbfFieldDef = ^TDbfFieldDef;

  TDbfFieldDef = class(TCollectionItem)
  private
    _FieldName:string;
    _FieldType:tFieldType;
    _NativeFieldType:tDbfFieldType;
    _Size:integer;
    _Prec:Integer;
    _Offset:Integer;
    procedure _SetFieldName(lFieldName:string);
    procedure _SetNativeFieldType(lFieldType:tDbfFieldType);
    procedure _SetFieldType(lFieldType:tFieldType);
    procedure _SetSize(lSize:integer);
    procedure _SetPrec(lPrec:integer);
    procedure _BDEToNative;
    procedure _NativeToBDE;

  public
    Offset:integer;
    AutoInc:integer;
    Required:boolean;
    constructor Create(Collection: TCollection); override;
    destructor destroy; override;
    procedure _CheckSizePrec;
    function GetDisplayName: string; override;
  published
    property Name:string              read _FieldName write _SetFieldName;
    property FieldType:tFieldType     read _FieldType write _SetFieldType;
    property NativeFieldType:tDbfFieldType  read _NativeFieldType write _SetNativeFieldType;
    property Size:integer             read _Size      write _SetSize;
    property Prec:integer             read _Prec      write _SetPrec;
  end;

  TDbfFieldDefs = class(TCollection)
  private
    _Owner:TPersistent;
    function _GetItem(idx:integer):TDbfFieldDef;
  protected
		function getowner : TPersistent; override;
  public
		constructor Create(Owner:TPersistent);
    property Items[idx:integer]:TDbfFieldDef read _GetItem;
{$ifdef DELPHI_3}
    procedure Add(const Name: string; DataType: TFieldType; Size: Integer;   Required: Boolean);
{$else}
    procedure Add(const Name: string; DataType: TFieldType; Size: Integer = 0;   Required: Boolean = False);
{$endif}
    function AddFieldDef: TDbfFieldDef;
  end;

implementation
// I keep changing that fields...
// Last time has been asked by Venelin Georgiev
// Is he going to be the last ?
const
  DIGITS_SMALLINT = 4; //6;
  DIGITS_INTEGER = 9; //11;
  DIGITS_LARGEINT = 20;

//====================================================================
// DbfFieldDefs
//====================================================================
function TDbfFieldDefs._GetItem(idx:integer):TDbfFieldDef;
begin
  result:=TDbfFieldDef(inherited GetItem(idx));
end;

constructor TDbfFieldDefs.Create(Owner:TPersistent);
begin
  inherited Create(TDbfFieldDef);
  _Owner:=Owner;
end;

function TDbfFieldDefs.AddFieldDef: TDbfFieldDef;
begin
  Result:= TDbfFieldDef(inherited Add);
end;

function TDbfFieldDefs.getowner : TPersistent; {override;}
begin
  result:=_Owner;
end;

procedure TDbfFieldDefs.Add(const Name: string; DataType: TFieldType; Size: Integer; Required: Boolean);
var
  fieldDef:TDbfFieldDef;
begin
  fieldDef:=AddfieldDef;
  fieldDef.Name:=Name;
  fieldDef.FieldType:=DataType;
  fieldDef.Size:=size;
  fieldDef.Required:=Required;
end;
//====================================================================
// DbfFieldDef
//====================================================================
constructor TDbfFieldDef.Create(Collection: TCollection); {virtual}
begin
  inherited;
end;

destructor TDbfFieldDef.destroy; {override}
begin
  inherited;
end;


procedure TDbfFieldDef._SetFieldName(lFieldName:string);
begin
  _FieldName:=lFieldName;
end;

procedure TDbfFieldDef._SetFieldType(lFieldType:tFieldType);
begin
  _FieldType:=lFieldType;
  _BDEToNative;
  _CheckSizePrec;
end;

procedure TDbfFieldDef._SetNativeFieldType(lFieldType:tDbfFieldType);
begin
  if (lFieldType>='a') and (lFieldType<='z') then lFieldType:=chr(ord(lFieldType)-32);
  _NativeFieldType:=lFieldType;
  _NativeToBDE;
  _CheckSizePrec;
end;

procedure TDbfFieldDef._SetSize(lSize:integer);
begin
  _Size:=lSize;
  _CheckSizePrec;
end;

procedure TDbfFieldDef._SetPrec(lPrec:integer);
begin
  _Prec:=lPrec;
  _CheckSizePrec;
end;

procedure TDbfFieldDef._NativeToBDE;
begin
  case _NativeFieldType of
// OH 2000-11-15 dBase7 support.
// Add the new fieldtypes
  '+' : _FieldType := ftAutoInc;
  'I' : _FieldType := ftInteger;
  'O'  : _FieldType := ftFloat;
  '@': _FieldType := ftDateTime;
  'C'    : _FieldType:=ftString;
  'L' : _FieldType:=ftBoolean;
  'F'   : _FieldType:=ftFloat;
  'N' :
    begin
      if _Prec=0 then begin
        if _Size <= DIGITS_SMALLINT then begin
          _FieldType:=ftSmallInt;
        end else begin
{$ifdef DELPHI_3}
          _FieldType:=ftInteger;
{$else}
          if _Size <= DIGITS_INTEGER then _FieldType:=ftInteger
          else _FieldType:=ftLargeInt;
{$endif}
        end;
      end else begin
        _FieldType:=ftFloat;
      end;
    end;
  'D'    : _FieldType:=ftDate;
  'M'    : _FieldType:=ftMemo;
  'B'    : _FieldType:=ftBlob;
  'G' : _FieldType:=ftGraphic;
  else
    _NativeFieldType:=#0;
    _FieldType:=ftUnknown;
  end; //case
end;

procedure TDbfFieldDef._BDEToNative;
begin
  case _FieldType of
  ftAutoInc  : _NativeFieldType :='+';
  ftDateTime : _NativeFieldType :='@';
  ftString   : _NativeFieldType :='C';
  ftBoolean  : _NativeFieldType :='L';
  ftFloat    : _NativeFieldType :='F';
  //ftFloat    : Result := 'O';
  //ftInteger  : Result := 'I';
  ftInteger,ftSmallInt{$ifndef DELPHI_3},ftLargeInt{$endif}:
               _NativeFieldType := 'N';
  ftDate     : _NativeFieldType := 'D';
  ftMemo     : _NativeFieldType := 'M';
  ftBlob     : _NativeFieldType := 'B';
  ftGraphic  : _NativeFieldType := 'G';
  else
    _FieldType:=ftUnknown;
    _NativeFieldType := #0;
  end; // Case
end;

procedure TDbfFieldDef._CheckSizePrec;
begin
  case _NativeFieldType of
    'C':
      begin
        if _Size<1 then _Size:=1;
        if _Size>=254 then _Size:=254;
        _Prec := 0;
      end;
    'L':
      begin
        _Size := 1;
        _Prec := 0;
      end;
    'N':
      begin
        if _Size<1 then _Size:=1;
        if _Size>=20 then _Size:=20;
        if _Prec>_Size-2 then _prec:=_Size-2;
        if _Prec<0 then _prec:=0;
      end;
    'D':
      begin
        _Size := 8;
        _Prec := 0;
      end;
    'M','G','B':
      begin
        _Size := 10;
        _Prec := 0;
      end;
    '+','I':
      begin
        _Size := 4;
        _Prec := 0;
      end;
    'O','@','F':
      begin
        _Size := 8;
        _Prec := 0;
      end;
    else begin
      // Nothing
    end;
  end; // case
end;

function TDbfFieldDef.GetDisplayName: string; {override;}
begin
  result:=name;
end;

end.





