{******************************************}
{ }
{ FastReport v3.0 }
{ Language resources management }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxRes;

interface

{$I frx.inc}

uses
  Windows, SysUtils, Classes, Controls, Graphics, Forms, ImgList, TypInfo
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxResources = class(TObject)
  private
    FDisabledButtonImages:TImageList;
    FMainButtonImages:TImageList;
    FNames:TStringList;
    FObjectImages:TImageList;
    FValues:TStringList;
    function GetMainButtonImages:TImageList;
    function GetObjectImages:TImageList;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const StrName:String):String;
    procedure Add(const Ref, Str:String);
    procedure Clear;
    procedure LocalizeForm(Form:TForm);
    procedure SetButtonImages(Images:TBitmap; Clear:Boolean = False);
    procedure SetObjectImages(Images:TBitmap; Clear:Boolean = False);
    procedure MakeID;
    property DisabledButtonImages:TImageList read FDisabledButtonImages;
    property MainButtonImages:TImageList read GetMainButtonImages;
    property ObjectImages:TImageList read GetObjectImages;
  end;

function frxResources:TfrxResources;

implementation

uses frxUtils;

var
  FResources:TfrxResources = nil;

{ TfrxResources }

constructor TfrxResources.Create;
begin
  inherited;
  FDisabledButtonImages:= TImageList.Create(nil);
  FDisabledButtonImages.Width:= 16;
  FDisabledButtonImages.Height:= 16;
  FMainButtonImages:= TImageList.Create(nil);
  FMainButtonImages.Width:= 16;
  FMainButtonImages.Height:= 16;
  FObjectImages:= TImageList.Create(nil);
  FObjectImages.Width:= 22;
  FObjectImages.Height:= 22;
  FNames:= TStringList.Create;
  FValues:= TStringList.Create;
  FNames.Sorted:= True;
end;

destructor TfrxResources.Destroy;
begin
  FDisabledButtonImages.Free;
  FMainButtonImages.Free;
  FObjectImages.Free;
  FNames.Free;
  FValues.Free;
  inherited;
end;

procedure TfrxResources.Add(const Ref, Str:String);
var
  i:Integer;
begin
  i:= FNames.IndexOf(Ref);
  if i =-1 then
  begin
    FNames.AddObject(Ref, Pointer(FValues.Count));
    FValues.Add(Str);
  end
  else
    FValues[Integer(FNames.Objects[i])]:= Str;
end;

procedure TfrxResources.Clear;
begin
  FNames.Clear;
  FValues.Clear;
end;

procedure TfrxResources.LocalizeForm(Form:TForm);
var
  i:Integer;
  CompList:TStrings;
  s, CompName, PropName, PropValue:String;
  c:TComponent;

begin
  i:= FNames.IndexOf(Form.ClassName);
  if i =-1 then Exit;

  CompList:= TStringList.Create;
  CompList.Text:= FValues[Integer(FNames.Objects[i])];

  for i:= 0 to CompList.Count-1 do
  begin
    s:= CompList.Names[i];
    if s = '' then continue;
    if Pos('.', s) = 0 then
    begin
      SetStrProp(Form, GetPropInfo(PTypeInfo(Form.ClassInfo), s), CompList.Values[s]);
      continue;
    end;

    CompName:= Copy(s, 1, Pos('.', s)-1);
    PropName:= Copy(s, Pos('.', s)+1, 255);
    s:= CompList[i];
    PropValue:= Copy(s, Pos('=', s)+1, 4096);

    c:= Form.FindComponent(CompName);
    if c<>nil then
      SetStrProp(c, GetPropInfo(PTypeInfo(c.ClassInfo), PropName), PropValue);
  end;

  CompList.Free;
end;

function TfrxResources.Get(const StrName:String):String;
var
  i:Integer;
begin
  i:= FNames.IndexOf(StrName);
  if i<>-1 then
    Result:= FValues[Integer(FNames.Objects[i])] else
    Result:= StrName;
end;

function TfrxResources.GetMainButtonImages:TImageList;
var
  Images:TBitmap;
begin
  if FMainButtonImages.Count = 0 then
  begin
    Images:= TBitmap.Create;
    try
      Images.LoadFromResourceName(hInstance, 'frxBUTTONS');
      SetButtonImages(Images);
    finally
      Images.Free;
    end;
  end;

  Result:= FMainButtonImages;
end;

function TfrxResources.GetObjectImages:TImageList;
var
  Images:TBitmap;
begin
  if FObjectImages.Count = 0 then
  begin
    Images:= TBitmap.Create;
    try
      Images.LoadFromResourceName(hInstance, 'frxOBJECTS');
      SetObjectImages(Images);
    finally
      Images.Free;
    end;
  end;

  Result:= FObjectImages;
end;

procedure TfrxResources.SetButtonImages(Images:TBitmap; Clear:Boolean = False);
begin
  if Clear then
  begin
    FMainButtonImages.Clear;
    FDisabledButtonImages.Clear;
  end;
  frxAssignImages(Images, 16, 16, FMainButtonImages, FDisabledButtonImages);
end;

procedure TfrxResources.SetObjectImages(Images:TBitmap; Clear:Boolean = False);
begin
  if Clear then
    FObjectImages.Clear;
  frxAssignImages(Images, 22, 22, FObjectImages);
end;

function frxResources:TfrxResources;
begin
  if FResources = nil then
    FResources:= TfrxResources.Create;
  Result:= FResources;
end;

procedure TfrxResources.MakeID;
var
  i, j:Integer;
  nm, vl:String;
  ID, ID1, sl:TStringList;

  procedure Process(const s:String);
  var
    i:Integer;
  begin
    for i:= 0 to ID.Count-1 do
      if ID[i] = s then Exit;
    ID.Add(s);
  end;

begin
  ID:= TStringList.Create;
  ID1:= TStringList.Create;
  sl:= TStringList.Create;
  for i:= 0 to FNames.Count-1 do
  begin
    nm:= FNames[i];
    vl:= FValues[Integer(FNames.Objects[i])];
    if Pos('tfrx', Lowercase(nm)) = 1 then
    begin
      sl.Text:= vl;
      for j:= 0 to sl.Count-1 do
        Process(sl.Values[sl.Names[j]]);
    end
    else
      Process(vl);
  end;

  for i:= 0 to FNames.Count-1 do
  begin
    nm:= FNames[i];
    vl:= FValues[Integer(FNames.Objects[i])];
    if Pos('tfrx', Lowercase(nm)) = 1 then
    begin
      sl.Text:= vl;
      ID1.Add(' Add('''+nm+''', ');
      for j:= 0 to sl.Count-1 do
        ID1.Add(' '''+sl.Names[j]+'='+IntToStr(ID.IndexOf(sl.Values[sl.Names[j]]))+'''+#13#10+');
      ID1.Add(' '''');');
    end
    else
      ID1.Add(' Add('''+nm+''', '''+IntToStr(ID.IndexOf(vl))+''');');
  end;

  ID1.SaveToFile('c:\res.txt');

  for i:= 0 to ID.Count-1 do
    ID[i]:= IntToStr(i)+'='+ID[i];
  ID.SaveToFile('c:\resid.txt');

  ID.Free;
  ID1.Free;
  sl.Free;
end;

initialization

finalization
  if FResources<>nil then
    FResources.Free;
  FResources:= nil;

end.
