{******************************************}
{ }
{ FastReport v3.0 }
{ Various routines }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxUtils;

interface

{$I frx.inc}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  StdCtrls, Menus, ImgList, ActnList, ComCtrls, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

function frxFindComponent(Owner:TComponent; const Name:String):TComponent;
procedure frxGetComponents(Owner:TComponent; ClassRef:TClass;
  List:TStrings; Skip:TComponent);
function frxGetFullName(Owner:TComponent; c:TComponent):String;
procedure frxSetCommaText(const Text:String; sl:TStrings; Comma:Char = ';');
function frxRemoveQuotes(const s:String):String;
function frxStreamToString(Stream:TStream):String;
procedure frxStringToStream(const s:String; Stream:TStream);
function frxStrToFloat(s:String):Extended;
function frxFloatToStr(d:Extended):String;
function frxRect(ALeft, ATop, ARight, ABottom:Extended):TfrxRect;
function frxPoint(X, Y:Extended):TfrxPoint;
function frxGetBrackedVariable(const Str, OpenBracket, CloseBracket:String;
  var i, j:Integer):String;
procedure frxErrorMsg(const Text:String);
procedure frxFormToRes(Form:TForm);
function frxIsValidFloat(const Value:string):Boolean;
procedure frxAssignImages(Bitmap:TBitmap; dx, dy:Integer;
  ImgList1:TImageList; ImgList2:TImageList = nil);
procedure frxDrawTransparent(Canvas:TCanvas; x, y:Integer; bmp:TBitmap);
procedure frxDrawGraphic(Canvas:TCanvas; DestRect:TRect; aGraph:TGraphic);
procedure frxParsePageNumbers(const PageNumbers:String; List:TStrings;
  Total:Integer);
{$IFNDEF Delphi6}
function Utf8Encode(const WS:WideString):String;
function UTF8Decode(const S:String):WideString;
{$ENDIF}
function HTMLRGBColor(Color:TColor):string;
procedure frxWriteCollection(Collection:TCollection; Writer:TWriter;
  Owner:TfrxComponent);
procedure frxReadCollection(Collection:TCollection; Reader:TReader;
  Owner:TfrxComponent);
function frxCreateTempFile(const TempDir:String):String;

implementation

uses frxXMLSerializer, frxRes, TypInfo;

function frxFindComponent(Owner:TComponent; const Name:String):TComponent;
var
  n:Integer;
  s1, s2:String;
begin
  Result:= nil;
  n:= Pos('.', Name);
  try
    if n = 0 then
    begin
      if Owner<>nil then
        Result:= Owner.FindComponent(Name);
      if (Result = nil) and (Owner is TfrxReport) and (Owner.Owner<>nil) then
        Result:= Owner.Owner.FindComponent(Name);
    end
    else
    begin
      s1:= Copy(Name, 1, n-1); // module name
      s2:= Copy(Name, n+1, 255); // component name
      Owner:= FindGlobalComponent(s1);
      if Owner<>nil then
      begin
        n:= Pos('.', s2);
        if n<>0 then // frame name-Delphi5
        begin
          s1:= Copy(s2, 1, n-1);
          s2:= Copy(s2, n+1, 255);
          Owner:= Owner.FindComponent(s1);
          if Owner<>nil then
            Result:= Owner.FindComponent(s2);
        end
        else
          Result:= Owner.FindComponent(s2);
      end;
    end;
  except
    on Exception do
      raise EClassNotFound.Create('Missing '+Name);
  end;
end;

{$HINTS OFF}
procedure frxGetComponents(Owner:TComponent; ClassRef:TClass;
  List:TStrings; Skip:TComponent);
var
  i, j:Integer;

  procedure EnumComponents(f:TComponent);
  var
    i:Integer;
    c:TComponent;
  begin
{$IFDEF Delphi5}
    if f is TForm then
      for i:= 0 to TForm(f).ControlCount-1 do
      begin
        c:= TForm(f).Controls[i];
        if c is TFrame then
          EnumComponents(c);
      end;
{$ENDIF}
    for i:= 0 to f.ComponentCount-1 do
    begin
      c:= f.Components[i];
      if (c<>Skip) and (c is ClassRef) then
        List.AddObject(frxGetFullName(Owner, c), c);
    end;
  end;

begin
  List.Clear;
  if Owner is TfrxReport then
    EnumComponents(Owner);
  for i:= 0 to Screen.FormCount-1 do
    EnumComponents(Screen.Forms[i]);
  for i:= 0 to Screen.DataModuleCount-1 do
    EnumComponents(Screen.DataModules[i]);
{$IFDEF Delphi6} // D6 bugfix
  with Screen do
    for i:= 0 to CustomFormCount-1 do
      with CustomForms[i] do
      if (ClassName = 'TDataModuleForm') then
        for j:= 0 to ComponentCount-1 do
        begin
          if (Components[j] is TDataModule) then
            EnumComponents(Components[j]);
        end;
{$ENDIF}
end;
{$HINTS ON}

function frxGetFullName(Owner:TComponent; c:TComponent):String;
var
  o:TComponent;
begin
  Result:= '';
  if c = nil then Exit;

  o:= c.Owner;
  if (o = nil) or (o = Owner) or ((Owner is TfrxReport) and (o = Owner.Owner)) then
    Result:= c.Name
  else if ((o is TForm) or (o is TDataModule)) then
    Result:= o.Name+'.'+c.Name
{$IFDEF Delphi5}
  else if o is TFrame then
    Result:= o.Owner.Name+'.'+c.Owner.Name+'.'+c.Name
{$ENDIF}
end;

procedure frxSetCommaText(const Text:String; sl:TStrings; Comma:Char = ';');
var
  i:Integer;

  function ExtractCommaName(s:string; var Pos:Integer):string;
  var
    i:Integer;
  begin
    i:= Pos;
    while (i <= Length(s)) and (s[i]<>Comma) do Inc(i);
    Result:= Copy(s, Pos, i-Pos);
    if (i <= Length(s)) and (s[i] = Comma) then Inc(i);
    Pos:= i;
  end;

begin
  i:= 1;
  sl.Clear;
  while i <= Length(Text) do
    sl.Add(ExtractCommaName(Text, i));
end;

function frxRemoveQuotes(const s:String):String;
begin
  if (Length(s) > 2) and (s[1] = '"') and (s[Length(s)] = '"') then
    Result:= Copy(s, 2, Length(s)-2) else
    Result:= s;
end;

function frxStreamToString(Stream:TStream):String;
var
  Size:Integer;
  p:PChar;
begin
  Size:= Stream.Size;
  SetLength(Result, Size * 2);
  GetMem(p, Size);

  Stream.Position:= 0;
  Stream.Read(p^, Size);

  BinToHex(p, @Result[1], Size);

  FreeMem(p, Size);
end;

procedure frxStringToStream(const s:String; Stream:TStream);
var
  Size:Integer;
  p:PChar;
begin
  Size:= Length(s) div 2;
  GetMem(p, Size);

  HexToBin(@s[1], p, Size * 2);

  Stream.Position:= 0;
  Stream.Write(p^, Size);

  FreeMem(p, Size);
end;

function frxStrToFloat(s:String):Extended;
var
  i:Integer;
begin
  for i:= 1 to Length(s) do
    if s[i] in [',', '.'] then
      s[i]:= DecimalSeparator;
  while Pos(' ', s)<>0 do
    Delete(s, Pos(' ', s), 1);
  Result:= StrToFloat(s);
end;

function frxFloatToStr(d:Extended):String;
begin
  if Int(d) = d then
    Result:= FloatToStr(d) else
    Result:= Format('%2.2f', [d]);
end;

function frxRect(ALeft, ATop, ARight, ABottom:Extended):TfrxRect;
begin
  with Result do
  begin
    Left:= ALeft;
    Top:= ATop;
    Right:= ARight;
    Bottom:= ABottom;
  end;
end;

function frxPoint(X, Y:Extended):TfrxPoint;
begin
  Result.X:= X;
  Result.Y:= Y;
end;

function frxGetBrackedVariable(const Str, OpenBracket, CloseBracket:String;
  var i, j:Integer):String;
var
  c:Integer;
  fl1, fl2:Boolean;
begin
  Result:= '';
  j:= i;
  fl1:= True;
  fl2:= True;
  c:= 0;
  if (Str = '') or (j > Length(Str)) then Exit;

  Dec(j);
  repeat
    Inc(j);
    if isDBCSLeadByte(Byte(Str[j])) then { if DBCS then skip 2 bytes }
      Inc(j, 2);
    
    if fl1 and fl2 then
      if Copy(Str, j, Length(OpenBracket)) = OpenBracket then
      begin
        if c = 0 then i:= j;
        Inc(c);
      end
      else if Copy(Str, j, Length(CloseBracket)) = CloseBracket then
        Dec(c);
    if fl1 then
      if Str[j] = '"' then fl2:= not fl2;
    if fl2 then
      if Str[j] = '''' then fl1:= not fl1;
  until (c = 0) or (j >= Length(Str));

  Result:= Copy(Str, i+Length(OpenBracket), j-i-Length(OpenBracket));
  if i<>j then
    Inc(j, Length(CloseBracket)-1);
end;

procedure frxErrorMsg(const Text:String);
begin
  Application.MessageBox(PChar(Text), PChar(frxResources.Get('mbError')),
    mb_Ok+mb_IconError);
end;

type
  THackControl = class(TControl);

procedure frxFormToRes(Form:TForm);
var
  f:TFileStream;
  l:TList;
  s:String;

  function QStr(s:String):String;
  begin
    s:= QuotedStr(s);
    Result:= Copy(s, 2, Length(s)-2);
  end;

  procedure EnumControls(Parent:TComponent);
  var
    i:Integer;
    s:String;
  begin
    if (Parent is TForm) and not (Parent = Form) then Exit;
    l.Add(Parent);
    s:= '';
    if Parent.Name<>'' then
    begin
      if (Parent is TMenuItem) and (TMenuItem(Parent).Action = nil) then
      begin
        if TMenuItem(Parent).Caption<>'-' then
          s:= ' '''+Parent.Name+'.Caption='+
            QStr(TMenuItem(Parent).Caption)+'''+#13#10+';
      end
      else if (Parent is TControl) and not (Parent is TCustomComboBox) then
      begin
        if (Trim(THackControl(Parent).Caption)<>'') and
          (TControl(Parent).Action = nil) and not (Parent is TEdit) then
          s:= ' '''+Parent.Name+'.Caption='+
            QStr(THackControl(Parent).Caption)+'''+#13#10+';
        if Trim(THackControl(Parent).Hint)<>'' then
        begin
          if s<>'' then
            s:= s+#13#10;
          s:= s+' '''+Parent.Name+'.Hint='+
            QStr(THackControl(Parent).Hint)+'''+#13#10+';
        end;
      end
      else if Parent is TAction then
      begin
        if TAction(Parent).Caption<>'-' then
          s:= ' '''+Parent.Name+'.Caption='+
            QStr(TAction(Parent).Caption)+'''+#13#10+';
      end;

      if s<>'' then
      begin
        s:= s+#13#10;
        f.Write(s[1], Length(s));
      end;
    end;

    if Parent is TWinControl then
      for i:= 0 to TWinControl(Parent).ControlCount-1 do
        EnumControls(TWinControl(Parent).Controls[i]);

    for i:= 0 to Parent.ComponentCount-1 do
      if l.IndexOf(Parent.Components[i]) =-1 then
        EnumControls(Parent.Components[i]);
  end;

begin
  if FileExists('c:\1.pas') then
    f:= TFileStream.Create('c:\1.pas', fmOpenWrite) else
    f:= TFileStream.Create('c:\1.pas', fmCreate);
  f.Position:= f.Size;
  l:= TList.Create;

  s:= #13#10+' frxResources.Add('''+Form.ClassName+''','+#13#10;
  f.Write(s[1], Length(s));

  EnumControls(Form);

  s:= ' '''');'+#13#10;
  f.Write(s[1], Length(s));

  l.Free;
  f.Free;
end;

function frxIsValidFloat(const Value:string):Boolean;
begin
  Result:= True;
  try
    frxStrToFloat(Value);
  except
    Result:= False;
  end;
end;

procedure frxAssignImages(Bitmap:TBitmap; dx, dy:Integer;
  ImgList1:TImageList; ImgList2:TImageList = nil);
var
  b:TBitmap;
  x, y:Integer;
  Done:Boolean;

  procedure ReplaceWhite;
  var
    i, j:Integer;
  begin
    with b.Canvas do
      for i:= 0 to dx-1 do
        for j:= 0 to dy-1 do
          if Pixels[i, j] = clWhite then
            Pixels[i, j]:= $E0E0E0;
  end;

begin
  b:= TBitmap.Create;
  b.Width:= dx;
  b.Height:= dy;

  x:= 0; y:= 0;

  repeat
    b.Canvas.CopyRect(Rect(0, 0, dx, dy), Bitmap.Canvas, Rect(x, y, x+dx, y+dy));
    Done:= y > Bitmap.Height;

    if not Done then
    begin
      ImgList1.AddMasked(b, b.TransparentColor);
      if ImgList2<>nil then
      begin
        Inc(x, dx);
        b.Canvas.CopyRect(Rect(0, 0, dx, dy), Bitmap.Canvas, Rect(x, y, x+dx, y+dy));
        ReplaceWhite;
        ImgList2.AddMasked(b, b.TransparentColor);
      end;
    end;

    Inc(x, dx);
    if x >= Bitmap.Width then
    begin
      x:= 0;
      Inc(y, dy);
    end;
  until Done;

  b.Free;
end;

procedure frxDrawTransparent(Canvas:TCanvas; x, y:Integer; bmp:TBitmap);
var
  img:TImageList;
begin
  img:= TImageList.Create(nil);
  img.Width:= bmp.Width;
  img.Height:= bmp.Height;
  img.AddMasked(bmp, bmp.TransparentColor);
  img.Draw(Canvas, x, y, 0);
  img.Clear;
  img.Free;
end;

procedure DrawBitmap(aCanvas:TCanvas; Dest:TRect; Bitmap:TBitmap);
var
  Info:PBitmapInfo;
  HInfo:HGLOBAL;
  InfoSize:DWord;
  Image:Pointer;
  HImage:HGLOBAL;
  ImageSize:DWord;
begin
  with Bitmap do
  begin
    GetDIBSizes(Handle, InfoSize, ImageSize);
    HInfo:= GlobalAlloc(GMEM_MOVEABLE or GMEM_SHARE, InfoSize);
    Info:= PBitmapInfo(GlobalLock(HInfo));
    try
      HImage:= GlobalAlloc(GMEM_MOVEABLE or GMEM_SHARE, ImageSize);
      Image:= Pointer(GlobalLock(HImage));
      try
        GetDIB(Handle, Palette, Info^, Image^);
        if not Monochrome then
          SetStretchBltMode(ACanvas.Handle, STRETCH_DELETESCANS);
        with Info^.bmiHeader do
          StretchDIBits(aCanvas.Handle, Dest.Left, Dest.Top,
            Dest.RIght-Dest.Left, Dest.Bottom-Dest.Top,
            0, 0, biWidth, biHeight, Image, Info^, DIB_RGB_COLORS, SRCCOPY);
      finally
        GlobalUnlock(HImage);
        GlobalFree(HImage);
      end;
    finally
      GlobalUnlock(HInfo);
      GlobalFree(HInfo);
    end;
  end;
end;

procedure frxDrawGraphic(Canvas:TCanvas; DestRect:TRect; aGraph:TGraphic);
var
  Bitmap:TBitmap;
begin
  if aGraph is TMetaFile then
    Canvas.StretchDraw(DestRect, aGraph)
  else
  begin
    Bitmap:= TBitmap.Create;
    try
      Bitmap.Width:= aGraph.Width;
      Bitmap.Height:= aGraph.Height;
      Bitmap.PixelFormat:= pf32Bit;
      Bitmap.Canvas.Draw(0, 0, aGraph);
      DrawBitmap(Canvas, DestRect, Bitmap);
    finally
      Bitmap.Free;
    end;
  end;
end;

procedure frxParsePageNumbers(const PageNumbers:String; List:TStrings;
  Total:Integer);
var
  i, j, n1, n2:Integer;
  s:String;
  IsRange:Boolean;
begin
  List.Clear;
  s:= PageNumbers;
  while Pos(' ', s)<>0 do
    Delete(s, Pos(' ', s), 1);
  if s = '' then Exit;

  if s[Length(s)] = '-' then
    s:= s+IntToStr(Total);
  s:= s+',';
  i:= 1; j:= 1; n1:= 1;
  IsRange:= False;

  while i <= Length(s) do
  begin
    if s[i] = ',' then
    begin
      n2:= StrToInt(Copy(s, j, i-j));
      j:= i+1;
      if IsRange then
        while n1 <= n2 do
        begin
          List.Add(IntToStr(n1));
          Inc(n1);
        end
      else
        List.Add(IntToStr(n2));
      IsRange:= False;
    end
    else if s[i] = '-' then
    begin
      IsRange:= True;
      n1:= StrToInt(Copy(s, j, i-j));
      j:= i+1;
    end;
    Inc(i);
  end;
end;

{$IFNDEF Delphi6}
function Utf8Encode(const WS:WideString):String;
var
  L:Integer;
  Temp:String;

  function ToUtf8(Dest:PChar; MaxDestBytes:Cardinal;
           Source:PWideChar; SourceChars:Cardinal):Cardinal;
  var
    i, count:Cardinal;
    c:Cardinal;
  begin
    Result:= 0;
    if Source = nil then Exit;
    count:= 0;
    i:= 0;
    if Dest<>nil then
    begin
      while (i < SourceChars) and (count < MaxDestBytes) do
      begin
        c:= Cardinal(Source[i]);
        Inc(i);
        if c <= $7F then
        begin
          Dest[count]:= Char(c);
          Inc(count);
        end
        else if c > $7FF then
        begin
          if count+3 > MaxDestBytes then
            break;
          Dest[count]:= Char($E0 or (c shr 12));
          Dest[count+1]:= Char($80 or ((c shr 6) and $3F));
          Dest[count+2]:= Char($80 or (c and $3F));
          Inc(count,3);
        end
        else // $7F < Source[i] <= $7FF
        begin
          if count+2 > MaxDestBytes then
            break;
          Dest[count]:= Char($C0 or (c shr 6));
          Dest[count+1]:= Char($80 or (c and $3F));
          Inc(count,2);
        end;
      end;
      if count >= MaxDestBytes then count:= MaxDestBytes-1;
      Dest[count]:= #0;
    end
    else
    begin
      while i < SourceChars do
      begin
        c:= Integer(Source[i]);
        Inc(i);
        if c > $7F then
        begin
          if c > $7FF then
            Inc(count);
          Inc(count);
        end;
        Inc(count);
      end;
    end;
    Result:= count+1;
  end;

begin
  Result:= '';
  if WS = '' then Exit;
  SetLength(Temp, Length(WS) * 3);
  L:= ToUtf8(PChar(Temp), Length(Temp)+1, PWideChar(WS), Length(WS));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp:= '';
  Result:= Temp;
end;

function Utf8Decode(const S:String):WideString;
var
  L:Integer;
  Temp:WideString;

  function Utf8ToUnicode(Dest:PWideChar; MaxDestChars:Cardinal; Source:PChar; SourceBytes:Cardinal):Cardinal;
  var
    i, count:Cardinal;
    c:Byte;
    wc:Cardinal;
  begin
    if Source = nil then
    begin
      Result:= 0;
      Exit;
    end;
    Result:= Cardinal(-1);
    count:= 0;
    i:= 0;
    if Dest<>nil then
    begin
      while (i < SourceBytes) and (count < MaxDestChars) do
      begin
        wc:= Cardinal(Source[i]);
        Inc(i);
        if (wc and $80)<>0 then
        begin
          wc:= wc and $3F;
          if i > SourceBytes then Exit; // incomplete multibyte char
          if (wc and $20)<>0 then
          begin
            c:= Byte(Source[i]);
            Inc(i);
            if (c and $C0)<>$80 then Exit; // malformed trail byte or out of range char
            if i > SourceBytes then Exit; // incomplete multibyte char
            wc:= (wc shl 6) or (c and $3F);
          end;
          c:= Byte(Source[i]);
          Inc(i);
          if (c and $C0)<>$80 then Exit; // malformed trail byte

          Dest[count]:= WideChar((wc shl 6) or (c and $3F));
        end
        else
          Dest[count]:= WideChar(wc);
        Inc(count);
      end;
    if count >= MaxDestChars then count:= MaxDestChars-1;
    Dest[count]:= #0;
    end
    else
    begin
    while (i <= SourceBytes) do
    begin
      c:= Byte(Source[i]);
      Inc(i);
      if (c and $80)<>0 then
      begin
      if (c and $F0) = $F0 then Exit; // too many bytes for UCS2
      if (c and $40) = 0 then Exit; // malformed lead byte
      if i > SourceBytes then Exit; // incomplete multibyte char

      if (Byte(Source[i]) and $C0)<>$80 then Exit; // malformed trail byte
      Inc(i);
      if i > SourceBytes then Exit; // incomplete multibyte char
      if ((c and $20)<>0) and ((Byte(Source[i]) and $C0)<>$80) then Exit; // malformed trail byte
      Inc(i);
      end;
      Inc(count);
    end;
    end;
    Result:= count+1;
  end;

begin
  Result:= '';
  if S = '' then Exit;
  SetLength(Temp, Length(S));

  L:= Utf8ToUnicode(PWideChar(Temp), Length(Temp)+1, PChar(S), Length(S));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp:= '';
  Result:= Temp;
end;
{$ENDIF}

function HTMLRGBColor(Color:TColor):string;
var
  TheRgbValue:TColorRef;
begin
  TheRgbValue:= ColorToRGB(Color);
  Result:= '#'+Format('%.2x%.2x%.2x', [GetRValue(TheRGBValue), GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
end;

procedure ConvertOneItem(Item:TCollectionItem; ToAnsi:Boolean);
var
  i:Integer;
  TypeInfo:PTypeInfo;
  PropCount:Integer;
  PropList:PPropList;

  function Convert(const Value:String):String;
  var
    i:Integer;
  begin
    Result:= '';
    i:= 1;
    while i <= Length(Value) do
    begin
      if ToAnsi then
      begin
        if Value[i] >= #128 then
          Result:= Result+#1+Chr(Ord(Value[i])-128) else
          Result:= Result+Value[i];
      end
      else
      begin
        if (Value[i] = #1) and (i < Length(Value)) then
        begin
          Result:= Result+Chr(Ord(Value[i+1])+128);
          Inc(i);
        end
        else
          Result:= Result+Value[i];
      end;

      Inc(i);
    end;
  end;

  procedure DoStrProp;
  var
    Value, NewValue:String;
  begin
    Value:= GetStrProp(Item, PropList[i]);
    NewValue:= Convert(Value);
    if Value<>NewValue then
      SetStrProp(Item, PropList[i], NewValue);
  end;

  procedure DoVariantProp;
  var
    Value:Variant;
  begin
    Value:= GetVariantProp(Item, PropList[i]);
    if (TVarData(Value).VType = varString) or (TVarData(Value).VType = varOleStr) then
    begin
      Value:= Convert(Value);
      SetVariantProp(Item, PropList[i], Value);
    end;
  end;

begin
  TypeInfo:= Item.ClassInfo;
  PropCount:= GetTypeData(TypeInfo).PropCount;
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  GetPropInfos(TypeInfo, PropList);

  try
    for i:= 0 to PropCount-1 do
    begin
      case PropList[i].PropType^.Kind of
        tkString, tkLString, tkWString:
          DoStrProp;

        tkVariant:
          DoVariantProp;
      end;
    end;

  finally
    FreeMem(PropList, PropCount * SizeOf(PPropInfo));
  end;
end;

procedure frxWriteCollection(Collection:TCollection; Writer:TWriter;
  Owner:TfrxComponent);
var
  i, l:Integer;
  xs:TfrxXMLSerializer;
  s:String;
  vt:TValueType;
begin
  if Owner.IsWriting then
  begin
    { called from SaveToStream }
    Writer.WriteListBegin;
    xs:= TfrxXMLSerializer.Create(nil);
    try
      xs.Owner:= Owner.Report;
      for i:= 0 to Collection.Count-1 do
      begin
        Writer.WriteListBegin;
        s:= xs.ObjToXML(Collection.Items[i]);
        vt:= vaLString;
        Writer.Write(vt, SizeOf(vt));
        l:= Length(s);
        Writer.Write(l, SizeOf(l));
        Writer.Write(s[1], l);
        Writer.WriteListEnd;
      end;
    finally
      Writer.WriteListEnd;
      xs.Free;
    end;
  end
  else
  begin
    { called from Delphi streamer }
    Writer.WriteCollection(Collection);
  end;
end;

procedure frxReadCollection(Collection:TCollection; Reader:TReader;
  Owner:TfrxComponent);
var
  i:Integer;
  vt:TValueType;
  xs:TfrxXMLSerializer;
  s:String;
  Item:TCollectionItem;
  NeedFree:Boolean;
begin
  vt:= Reader.ReadValue;
  if vt<>vaCollection then
  begin
    { called from LoadFromStream }
    NeedFree:= False;
    xs:= nil;
    if Owner.Report<>nil then
      xs:= TfrxXMLSerializer(Owner.Report.XMLSerializer);

    if xs = nil then
    begin
      xs:= TfrxXMLSerializer.Create(nil);
      xs.Owner:= Owner.Report;
      NeedFree:= True;
    end;

    try
      Collection.Clear;

      while not Reader.EndOfList do
      begin
        Reader.ReadListBegin;
        Item:= Collection.Add;
        s:= Reader.ReadString;
        if NeedFree then
          xs.ReadPersistentStr(Owner.Report, Item, s)
        else
          xs.XMLToObj(s, Item);
        Reader.ReadListEnd;
      end;
    finally
      Reader.ReadListEnd;
      if NeedFree then
        xs.Free;
    end;
  end
  else
  begin
    { called from Delphi streamer }
    Reader.ReadCollection(Collection);
    for i:= 0 to Collection.Count-1 do
      ConvertOneItem(Collection.Items[i], False);
  end;
end;

function frxCreateTempFile(const TempDir:String):String;
var
  Path:String[255];
  FileName:String[255];
begin
  Path:= TempDir;
  if Path = '' then
    Path[0]:= Chr(GetTempPath(64, @Path[1])) else
    Path:= Path+#0;
  if (Path<>'') and (Path[Length(Path)]<>'\') then
    Path:= Path+'\';

  GetTempFileName(@Path[1], PChar('fr'), 0, @FileName[1]);
  Result:= StrPas(@FileName[1]);
end;

end.
