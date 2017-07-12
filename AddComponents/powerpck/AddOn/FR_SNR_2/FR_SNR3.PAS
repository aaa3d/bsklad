{ FR_SNR Delphi 3 compatible routines }
unit fr_snr3;

interface

Uses SysUtils;

{$I fr.inc}

{$IFNDEF DELPHI6}
{--- from D6 ent: $(DELPHI)/sources/vcl/common/StrUtils.pas ---}
type
  TReplaceFlags = set of (rfReplaceAll, rfIgnoreCase);

function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;
function AnsiContainsText(const AText, ASubText : String) : Boolean;
function AnsiReplaceText(const AText, AFromText, AToText: string): string;
function AnsiContainsStr(const AText, ASubText : String) : Boolean;
function AnsiReplaceStr(const AText, AFromText, AToText: string): string;
{$ENDIF}

implementation

{$IFNDEF DELPHI6}
function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;
var
  SearchStr, Patt, NewStr: string;
  Offset: Integer;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr := AnsiUpperCase(S);
    Patt := AnsiUpperCase(OldPattern);
  end else
  begin
    SearchStr := S;
    Patt := OldPattern;
  end;
  NewStr := S;
  Result := '';
  while SearchStr <> '' do
  begin
    Offset := AnsiPos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

function AnsiContainsText(const AText, ASubText : String) : Boolean;
begin
  Result := AnsiPos(AnsiUppercase(ASubText), AnsiUppercase(AText)) > 0;
end;

function AnsiReplaceText(const AText, AFromText, AToText: string): string;
begin
  Result := StringReplace(AText, AFromText, AToText, [rfReplaceAll, rfIgnoreCase]);
end;

function AnsiContainsStr(const AText, ASubText : String) : Boolean;
begin
  Result := AnsiPos(ASubText, AText) > 0;
end;

function AnsiReplaceStr(const AText, AFromText, AToText: string): string;
begin
  Result := StringReplace(AText, AFromText, AToText, [rfReplaceAll]);
end;
{$ENDIF}

end.
 