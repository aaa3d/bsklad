{******************************************}
{ }
{ FastReport v3.0 }
{ XML serializer }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxXMLSerializer;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypInfo, frxXML, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type

{ TfrxXMLSerializer is the XML analogue of the Delphi component streaming-
  TReader and TWriter }

  TfrxXMLSerializer = class(TObject)
  private
    FErrors:TStringList;
    FFixups:TList;
    FOwner:TfrxComponent;
    FReader:TReader;
    FReaderStream:TMemoryStream;
    FSerializeDefaultValues:Boolean;
    FStream:TStream;
    procedure AddFixup(Obj:TPersistent; p:PPropInfo; Value:String);
    procedure ClearFixups;
    procedure FixupReferences;
    procedure OneProp(Name, Value:String; Obj:TPersistent);
  public
    constructor Create(Stream:TStream);
    destructor Destroy; override;
    function ObjToXML(Obj:TPersistent; const Add:String = ''):String;
    function ReadComponent(Root:TfrxComponent):TfrxComponent;
    function ReadComponentStr(Root:TfrxComponent; s:String):TfrxComponent;
    function WriteComponentStr(c:TfrxComponent):String;
    procedure ReadRootComponent(Root:TfrxComponent; XMLItem:TfrxXMLItem = nil;
      DontCreateComponents:Boolean = False);
    procedure ReadPersistentStr(Root:TComponent; Obj:TPersistent; const s:String);
    procedure WriteComponent(c:TfrxComponent);
    procedure WriteRootComponent(Root:TfrxComponent; SaveChildren:Boolean = True;
      XMLItem:TfrxXMLItem = nil);
    procedure XMLToObj(s:String; Obj:TPersistent);
    property Errors:TStringList read FErrors;
    property Owner:TfrxComponent read FOwner write FOwner;
    property Stream:TStream read FStream;
    property SerializeDefaultValues:Boolean read FSerializeDefaultValues
      write FSerializeDefaultValues;
  end;

implementation

uses frxUtils, frxRes;

type
  TfrxFixupItem = class(TObject)
  public
    Obj:TPersistent;
    PropInfo:PPropInfo;
    Value:String;
  end;

  THackComponent = class(TComponent);
  THackPersistent = class(TPersistent);
  THackReader = class(TReader);

{ TfrxXMLSerializer }

constructor TfrxXMLSerializer.Create(Stream:TStream);
begin
  FErrors:= TStringList.Create;
  FErrors.Sorted:= True;
  FErrors.Duplicates:= dupIgnore;
  FFixups:= TList.Create;
  FStream:= Stream;
  FReaderStream:= TMemoryStream.Create;
  FReader:= TReader.Create(FReaderStream, 4096);
end;

destructor TfrxXMLSerializer.Destroy;
begin
  FErrors.Free;
  FReader.Free;
  FReaderStream.Free;
  ClearFixups;
  FFixups.Free;
  inherited;
end;

procedure TfrxXMLSerializer.ClearFixups;
begin
  while FFixups.Count > 0 do
  begin
    TfrxFixupItem(FFixups[0]).Free;
    FFixups.Delete(0);
  end;
end;

procedure TfrxXMLSerializer.AddFixup(Obj:TPersistent; p:PPropInfo;
  Value:String);
var
  Item:TfrxFixupItem;
begin
  Item:= TfrxFixupItem.Create;
  Item.Obj:= Obj;
  Item.PropInfo:= p;
  Item.Value:= Value;
  FFixups.Add(Item);
end;

procedure TfrxXMLSerializer.FixupReferences;
var
  i:Integer;
  Item:TfrxFixupItem;
  Ref:TObject;
begin
  for i:= 0 to FFixups.Count-1 do
  begin
    Item:= FFixups[i];
    Ref:= nil;
    if FOwner<>nil then
      Ref:= FOwner.FindObject(Item.Value);
    if Ref = nil then
      Ref:= frxFindComponent(FOwner, Item.Value);
    if Ref<>nil then
      SetOrdProp(Item.Obj, Item.PropInfo, Integer(Ref));
  end;

  FReader.FixupReferences;
  FReader.EndReferences;
  ClearFixups;
end;

procedure TfrxXMLSerializer.OneProp(Name, Value:String; Obj:TPersistent);
var
  i, code:Integer;
  p:PPropInfo;

  procedure DoNonPublishedProps;
  begin
    FReaderStream.Clear;
    frxStringToStream(Value, FReaderStream);
    FReaderStream.Position:= 0;
    FReader.Position:= 0;

    try
      while FReader.Position < FReaderStream.Size do
        THackReader(FReader).ReadProperty(Obj);
    except
    end;
  end;

begin
  if Length(Name) = 1 then
  begin
// special properties
    case Name[1] of
      'x':
        begin
          TfrxMemoView(Obj).Text:= frxXMLToStr(Value);
          Exit;
        end;
      'l':Name:= 'Left';
      't':Name:= 'Top';
      'w':Name:= 'Width';
      'h':Name:= 'Height';
    end;
  end
  else
  begin
// multiple properties
    i:= Pos('.', Name);
    while i<>0 do
    begin
      p:= GetPropInfo(Obj.ClassInfo, Copy(Name, 1, i-1));
      if p = nil then
        Exit;
      Obj:= TPersistent(GetOrdProp(Obj, p));
      Delete(Name, 1, i);
      i:= Pos('.', Name);
    end;

    if (Obj is TStrings) and (Name = 'text') then
    begin
      TStrings(Obj).Text:= frxXMLToStr(Value);
      Exit;
    end
    else if Name = 'propdata' then
    begin
      DoNonPublishedProps;
      Exit;
    end;
  end;

  p:= GetPropInfo(Obj.ClassInfo, Name);
  if p<>nil then
    case p.PropType^.Kind of
      tkInteger, tkSet, tkChar, tkWChar:
        SetOrdProp(Obj, p, StrToInt(Value));

      tkEnumeration:
        begin
          Val(Value, i, code);
          if code = 0 then
            SetOrdProp(Obj, p, i) else
            SetOrdProp(Obj, p, GetEnumValue(p.PropType^, Value));
        end;

      tkFloat:
        SetFloatProp(Obj, p, frxStrToFloat(Value));

      tkString, tkLString, tkWString:
        SetStrProp(Obj, p, frxXMLToStr(Value));

      tkClass:
        AddFixup(Obj, p, Value);

      tkVariant:
        SetVariantProp(Obj, p, frxXMLToStr(Value));
    end;
end;

procedure TfrxXMLSerializer.XMLToObj(s:String; Obj:TPersistent);
var
  i, j:Integer;
  Name, Value:String;
begin
  while s<>'' do
  begin
    i:= Pos('"', s);
    Name:= Trim(LowerCase(Copy(s, 1, i-2)));
    if Name = '' then break;
    s[i]:= ' ';
    j:= Pos('"', s);
    Value:= Copy(s, i+1, j-i-1);

    try
      OneProp(Name, Value, Obj);
    except
      on E:Exception do
        FErrors.Add(E.Message);
    end;

    Delete(s, 1, j+1);
  end;
end;

function TfrxXMLSerializer.ObjToXML(Obj:TPersistent; const Add:String = ''):String;
var
  TypeInfo:PTypeInfo;
  PropCount:Integer;
  PropList:PPropList;
  i:Integer;
  s:String;
  Flag:Boolean;

  procedure DoOrdProp;
  var
    Value:Integer;
  begin
    Value:= GetOrdProp(Obj, PropList[i]);
    if (Value<>PropList[i].Default) or FSerializeDefaultValues then
      if PropList[i].PropType^.Kind = tkEnumeration then
        s:= GetEnumName(PropList[i].PropType^, Value) else
        s:= IntToStr(Value);
  end;

  procedure DoFloatProp;
  var
    Value:Extended;
  begin
    Value:= GetFloatProp(Obj, PropList[i]);
// commented out due to bug with tfrxmemoview.linespacing=0
// if (Value<>0) or FSerializeDefaultValues then
      s:= FloatToStr(Value);
  end;

  procedure DoStrProp;
  var
    Value:String;
  begin
    Value:= GetStrProp(Obj, PropList[i]);
    if (Value<>'') or FSerializeDefaultValues then
      s:= frxStrToXML(Value);
  end;

  procedure DoVariantProp;
  var
    Value:Variant;
  begin
    Value:= GetVariantProp(Obj, PropList[i]);
    s:= frxStrToXML(VarToStr(Value));
  end;

  procedure DoClassProp;
  var
    FClass:TClass;
    FComp:TComponent;
    FObj:TPersistent;
  begin
    FClass:= GetTypeData(PropList[i].PropType^).ClassType;
    if FClass.InheritsFrom(TComponent) then
    begin
      FComp:= TComponent(GetOrdProp(Obj, PropList[i]));
      if FComp<>nil then
        s:= frxGetFullName(FOwner, FComp);
    end
    else if FClass.InheritsFrom(TPersistent) then
    begin
      FObj:= TPersistent(GetOrdProp(Obj, PropList[i]));
      if FObj is TStrings then
      begin
        s:= TStrings(FObj).Text;
        if (Length(s) >= 2) and
           (s[Length(s)-1] = #13) and (s[Length(s)] = #10) then
          Delete(s, Length(s)-1, 2);
        s:= ' '+Add+PropList[i].Name+'.Text="'+
          frxStrToXML(s)+'"';
      end
      else
        s:= ObjToXML(FObj, Add+PropList[i].Name+'.');
      Flag:= True;
    end;
  end;

  procedure DoNonPublishedProps;
  var
    wr:TWriter;
    ms:TMemoryStream;
  begin
    ms:= TMemoryStream.Create;
    try
      wr:= TWriter.Create(ms, 4096);
      wr.Root:= FOwner;

      try
        THackPersistent(Obj).DefineProperties(wr);
      finally
        wr.Free;
      end;

      if ms.Size > 0 then
      begin
        s:= frxStreamToString(ms);
        Result:= Result+' '+Add+'PropData="'+s+'"';
      end;
    finally
      ms.Free;
    end;
  end;

begin
  Result:= '';
  TypeInfo:= Obj.ClassInfo;
  PropCount:= GetTypeData(TypeInfo).PropCount;
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  GetPropInfos(TypeInfo, PropList);

  try
    if Obj is TfrxComponent then
      TfrxComponent(Obj).IsWriting:= True;
    for i:= 0 to PropCount-1 do
    begin
      s:= '';
      Flag:= False;

      if IsStoredProp(Obj, PropList[i]) then
        case PropList[i].PropType^.Kind of
          tkInteger, tkSet, tkChar, tkWChar, tkEnumeration:
            DoOrdProp;

          tkFloat:
            DoFloatProp;

          tkString, tkLString, tkWString:
            DoStrProp;

          tkClass:
            DoClassProp;

          tkVariant:
            DoVariantProp;
        end;

      if s<>'' then
        if Flag then
          Result:= Result+s else
          Result:= Result+' '+Add+PropList[i].Name+'="'+s+'"';
    end;
    DoNonPublishedProps;

  finally
    if Obj is TfrxComponent then
      TfrxComponent(Obj).IsWriting:= False;
    FreeMem(PropList, PropCount * SizeOf(PPropInfo));
  end;
end;

procedure TfrxXMLSerializer.ReadRootComponent(Root:TfrxComponent;
  XMLItem:TfrxXMLItem = nil; DontCreateComponents:Boolean = False);
var
  XMLDoc:TfrxXMLDocument;
  CompList:TList;

  procedure DoRead(Item:TfrxXMLItem; Owner:TfrxComponent);
  var
    i:Integer;
    c:TfrxComponent;
  begin
    try
      FindClass(Item.Name);
    except
      FErrors.Add(frxResources.Get('xrCantFindClass')+' '+Item.Name);
      Exit;
    end;

    if Owner<>nil then
    begin
      if DontCreateComponents then
      begin
        c:= FOwner.FindComponent(Item.Prop['Name']) as TfrxComponent;
      end
      else
      begin
        c:= TfrxComponent(FindClass(Item.Name).NewInstance);
        c.Create(Owner);
      end;
    end
    else
      c:= Root;

    c.IsLoading:= True;
    XMLToObj(Item.Text, c);
    CompList.Add(c);

    for i:= 0 to Item.Count-1 do
      DoRead(Item[i], c);
  end;

  procedure DoLoaded;
  var
    i:Integer;
    c:TfrxComponent;
  begin
    for i:= 0 to CompList.Count-1 do
    begin
      c:= CompList[i];
      c.IsLoading:= False;
      if not (c is TfrxReport) then
        THackComponent(c).Loaded;
    end;
  end;

begin
  if Owner = nil then
    Owner:= Root;
  XMLDoc:= nil;
  CompList:= TList.Create;

  if XMLItem = nil then
  begin
    XMLDoc:= TfrxXMLDocument.Create;
    XMLItem:= XMLDoc.Root;
    XMLDoc.LoadFromStream(FStream);
  end;

  FReader.Root:= FOwner;
  FReader.BeginReferences;
  try
    DoRead(XMLItem, nil);
    FixupReferences;
    DoLoaded;
  finally
    if XMLDoc<>nil then
      XMLDoc.Free;
    CompList.Free;
  end;
end;

procedure TfrxXMLSerializer.WriteRootComponent(Root:TfrxComponent;
  SaveChildren:Boolean = True; XMLItem:TfrxXMLItem = nil);
var
  XMLDoc:TfrxXMLDocument;

  procedure DoWrite(Item:TfrxXMLItem; Root:TfrxComponent);
  var
    i:Integer;
  begin
    Item.Name:= Root.ClassName;
    Item.Text:= 'Name="'+Root.Name+'"'+ObjToXML(Root);

    if SaveChildren then
      for i:= 0 to Root.Objects.Count-1 do
        DoWrite(Item.Add, Root.Objects[i]);
  end;

begin
  if Owner = nil then
    Owner:= Root;
  XMLDoc:= nil;

  if XMLItem = nil then
  begin
    XMLDoc:= TfrxXMLDocument.Create;
    XMLItem:= XMLDoc.Root;
    XMLDoc.AutoIndent:= True;
  end;

  try
    DoWrite(XMLItem, Root);
    if XMLDoc<>nil then
      XMLDoc.SaveToStream(FStream);
  finally
    if XMLDoc<>nil then
      XMLDoc.Free;
  end;
end;

function TfrxXMLSerializer.ReadComponent(Root:TfrxComponent):TfrxComponent;
var
  rd:TfrxXMLReader;
  RootItem:TfrxXMLItem;
begin
  rd:= TfrxXMLReader.Create(FStream);
  RootItem:= TfrxXMLItem.Create;

  try
    rd.ReadRootItem(RootItem, False);
    Result:= ReadComponentStr(Root, RootItem.Name+' '+RootItem.Text);
  finally
    rd.Free;
    RootItem.Free;
  end;
end;

procedure TfrxXMLSerializer.WriteComponent(c:TfrxComponent);
var
  s:String;
begin
  s:= '<'+WriteComponentStr(c)+'/>';
  FStream.Write(s[1], Length(s));
end;

function TfrxXMLSerializer.ReadComponentStr(Root:TfrxComponent;
  s:String):TfrxComponent;
var
  n:Integer;
  s1:String;
begin
  Owner:= Root;
  if Trim(s) = '' then
    Result:= nil
  else
  begin
    n:= Pos(' ', s);
    s1:= Copy(s, n+1, MaxInt);
    Delete(s, n, MaxInt);

    Result:= TfrxComponent(FindClass(s).NewInstance);
    Result.Create(Root);

    FReader.Root:= Root;
    FReader.BeginReferences;
    try
      Result.IsLoading:= True;
      XMLToObj(s1, Result);
    finally
      FixupReferences;
      Result.IsLoading:= False;
      if not (Result is TfrxReport) then
        THackComponent(Result).Loaded;
    end;
  end;
end;

function TfrxXMLSerializer.WriteComponentStr(c:TfrxComponent):String;
begin
  Result:= c.ClassName+ObjToXML(c);
end;

procedure TfrxXMLSerializer.ReadPersistentStr(Root:TComponent;
  Obj:TPersistent; const s:String);
begin
  FReader.Root:= Root;
  FReader.BeginReferences;
  XMLToObj(s, Obj);
  FixupReferences;
end;

end.
