//===============================================================
//
//       sak_util unit, part of SakEmail
//
//       Contains: a lot of helper functions
//
//
//---------------------------------------------------------------
//
//      Copyrigth (c) 1997, 1998, 1999, 2000 Sergio A. Kessler
//      and authors cited
//      http://sak.org.ar
//
//===============================================================


unit sak_util;

interface

uses classes;

type
  TOnError = procedure(Sender: TObject; Error: integer; Msg: string) of object;
  TOnCodeStartEvent = procedure( Sender: TObject; FileName: string; BytesCount: longint) of object;
  TOnCodeProgressEvent = procedure( Sender: TObject; Percent: word) of object;

// this function by hou yg <yghou@yahoo.com>
function sak_IsIPAddress(const ss : string): boolean;

// this function by Dmitry Bondarenko & Sergio Kessler
function sak_StrWord2Int( const s: string;       //input text
                          wordNum: word;   //number of the word to convert
                          defVal: integer  //default value
                         ): integer;

function sak_GetBoundaryOutOfLine( const s: string): string;

// this function by Matjaz Bravc *)
function sak_GetInternetDate( const Date: TDateTime):string;

function sak_MakeUniqueID( const HostName: string): string;

function sak_GenerateBoundary: string;

function sak_GetTempPath: string;

function sak_ConvertCharSet( const Line : string ) : string;

// this function by Chris Günther
function sak_ExtractAddress( const sAddress : string; WithDelimit : Boolean ) : string;

// this function by Chris Günther
function sak_ExtractAlias( const sAddress : string; WithDelimit : Boolean ) : string;

function sak_DelFromStr( const sSource: string; sChar: Char ): string;

function sak_CleanUpAddresses( const AddressList: string): TStringList;

function sak_UnQuote( const s: string): string;

function sak_FindFieldInHeaders( const field: string; const Headers: TStringList;
                                 var line: string): boolean;

function sak_GetFieldValueFromLine( const Field, Line: string): string;

procedure sak_DeleteHeaders( var aText: TStringList);

function sak_FormatAddress( const sAddress: string): string;

const
  sak_esNotConnected = 'Not connected.';
  sak_esInvalidOp = 'Invalid op.';
  sak_esNotOrigin = '"From" field not specified.';
  sak_esNotDestination = '"SendTo" field not specified.';
  // es = exception string
  // this strings are used only in design stage



implementation

uses sysutils, SakMIME, windows;

// this function by hou yg <yghou@yahoo.com>
function sak_IsIPAddress( const ss : string):boolean;
var
  s,s1 : string;
  ii,p : integer;
begin
  s1 := ss;
  result := false;
  for ii := 1 to 3 do
  begin
    p := pos( '.', s1);
    if p = 0 then exit;
    s := Copy( s1, 1, p-1);
    s1 := copy( s1, p+1, Length( s1));
    p := StrToIntDef( s, -1);
    if (p < 0) or (p > 255) then exit;
  end;
  p := StrToIntDef( s1, -1);
  if (p < 0) or (p > 255) then exit;
  result := true;
end;


// this function by Dmitry Bondarenko & Sergio Kessler
function sak_StrWord2Int( const s: string;       //input text
                          wordNum: word;   //number of the word to convert
                          defVal: integer  //default value
                         ): integer;
var
  space_index,
  i: integer;
  st: string;
begin
  result := defVal;
  st := trim( s);
  st := StringReplace( st, #13#10, ' ', [rfReplaceAll, rfIgnoreCase]);
  for i := 1 to WordNum-1 do
  begin
    space_index := pos( ' ', st);
    if space_index = 0 then
    begin
      exit;
    end else
    begin
      st := trim( copy( st, space_index, length(s)));
    end;
  end;

  space_index := pos( ' ', st);
  if space_index > 0 then
  begin
    // here we delete the trailing words
    st := trim( copy( st, 1, space_index));
  end;

  st := sak_DelFromStr( st, '(');
  st := sak_DelFromStr( st, ')');
  st := sak_DelFromStr( st, '{');
  st := sak_DelFromStr( st, '}');
  result := StrToIntDef( st, defVal);
end;

function sak_GetBoundaryOutOfLine( const s: string): string;
var
  x, position: integer;
begin
  Result := '';
  position := pos( 'BOUNDARY', UpperCase( s));
  if position = 0 then exit;
  result := trim( copy( s, position + length('BOUNDARY'), 72));
  if length(result) = 0 then exit;
  delete( result, 1, 1); // remove the =
  result := trim( result);  // remove any leading spaces
  if length(result) = 0 then exit;
  if result[1] = '"' then
  begin
    delete( result, 1, 1);
    x := pos( '"', result);      //sometimes there are a ; in the end
    if x > 0 then delete( result, x, 72);
  end;
  x := pos( ';', result);
  if x > 0 then
  begin
    delete( result, x, 72);
  end;
  result := '--' + trim( result);
end;


// this function by Matjaz Bravc
function sak_GetInternetDate( const Date: TDateTime):string;
(* The date in RFC 822 conform string format *)

 function int2str(value:integer; len:byte):string;
  begin
    result := IntToStr( value);
    while length( result) < len do result := '0' + result;
  end;

 function GetTimeZoneBias:longint;
 (* The offset to UTC/GMT in minutes of the local time zone *)
 var tz_info: TTimeZoneInformation;
 begin
   case GetTimeZoneInformation(tz_info) of
        1: result := tz_info.StandardBias+tz_info.Bias;
        2: result := tz_info.DaylightBias+tz_info.Bias;
    else
        result := tz_info.DaylightBias+tz_info.Bias;
   end;
 end;

 function GetTimeZone:string;
 var bias: longint;
 begin
   bias := GetTimeZoneBias;
   if bias = 0 then
   begin
     result := 'GMT';
   end else
   begin
     if bias < 0 then
     begin
       result := '+' + int2str(abs(bias) div 60,2)+int2str(abs(bias) mod 60,2);
     end else
     begin
       if bias > 0 then
       begin
         result := '-' + int2str(bias div 60,2)+int2str(bias mod 60,2);
       end;
     end;
   end;
 end;

var
  d, m, y, w, h, mm, s, ms: word;
const
  WeekDays: array [1..7] of string[3] = ('Sun','Mon','Tue','Wed',
                                         'Thu','Fri','Sat');
  Months: array [1..12] of string[3] = ('Jan','Feb','Mar','Apr','May','Jun',
                                        'Jul','Aug','Sep','Oct','Nov','Dec');
begin
  DecodeDate( date, y, m, d);
  DecodeTime( date, h, mm, s, ms);
  w := DayOfWeek( date);
  Result := weekdays[w] + ', ' +
            inttostr(d) + ' ' +
            months[m] + ' ' +
            inttostr(y) + ' ' +
            int2str(h,2) + ':' +
            int2str(mm,2) + ':' +
            int2str(s,2) + ' ' +
            GetTimeZone;
end;

function sak_MakeUniqueID( const HostName: string) : string;
var
  s: string;
  i : Integer;
begin
  Randomize;
  s := '';
  for i := 1 to 16 do
  begin
    s := Concat( s, chr( 97 + Random(20)));
  end;
  result := '<' + 'SAK.' +  formatDateTime( 'yyyy"."mm"."dd"."', date) +
            s + '@' + HostName + '>';
end;


function sak_GenerateBoundary : string;
var
  s: string;
  i : integer;
begin
  randomize;
  s := '';
  for i := 1 to 12 do
  begin
    s := s + chr( 97 + random( 25));
  end;
  result := '--_SAK_bound_' + s;
end;

function sak_GetTempPath: string;
var
  tmpPath: string;
begin
  SetLength( tmpPath, Max_Path);
  GetTempPath( Max_Path-1, PChar( tmpPath));
  SetLength( tmpPath, StrLen( PChar( tmpPath)));
  result := tmpPath;
end;

// this function by Chris Günther and Sergio Kessler
function sak_ConvertCharSet( const Line : string ) : string;
var
  strToDecode, RestBefore, RestAfter, strActual, decoded: string;
  iLast, iFirst, eFirst, i: integer;
  Encoding, c: char;
  b64Decode: TBase64DecodingStream;
  Dest: TMemoryStream;
begin
  strActual := Line;

  iFirst := Pos( '=?', strActual );
  while (iFirst > 0) do
  begin
    RestBefore := copy( strActual, 1, iFirst-1 );
    strToDecode := copy( strActual, iFirst+2, length( strActual) );
    eFirst := pos( '?', strToDecode);
    if eFirst > 0 then
    begin
      Encoding := UpperCase( strToDecode[eFirst+1])[1];
      delete( strToDecode, 1, eFirst + 2);  // remove until ?Q? or ?B? inclusive
      iLast := Pos( '?=', strToDecode );
      if iLast > 0 then
      begin
        RestAfter := copy( strToDecode, iLast+2, length( strToDecode) );
        delete( strToDecode, iLast, length( strToDecode));  // remove the ?= and the rest

        strActual := RestBefore + RestAfter;
        if Encoding = 'Q' then
        begin
           strActual := RestBefore +
                        sak_QuotedPrintableDecode( PChar( strToDecode) ) +
                        RestAfter;
        end else
        if Encoding = 'B' then
        begin
          Dest := TMemoryStream.Create;

          b64Decode := TBase64DecodingStream.Create( Dest);
          b64Decode.Write( pointer(strToDecode)^, length( strToDecode));
          b64Decode.Free;

          decoded := '';
          Dest.Position := 0;
          for i:= 1 to Dest.Size do
          begin
            Dest.Read( c, 1);
            decoded := decoded + c;
          end;
          Dest.Free;
          strActual := RestBefore + decoded + RestAfter;
        end;

        iFirst := Pos( '=?', strActual );
      end
      else iFirst := 0;
    end
    else iFirst := 0;
  end;
  Result := strActual;
end;


// this function by Chris Günther
function sak_ExtractAddress( const sAddress: string; WithDelimit: Boolean ): string;
var
  iStart, iEnd, par1, par2 : integer;
begin
  result := sAddress;
  repeat
    par1 := pos( '(', result);
    par2 := pos( ')', result);
    if (par1 > 0) and (par2 > 0) then
    begin
      delete( result, par1, par2-par1+1);
    end;
  until (par1 = 0) or (par2 = 0);

  result := trim( result);
  iStart := Pos( '<', result );
  iEnd := Pos( '>', result );
  if ( iStart > 0 ) and ( iEnd > 0 ) then
  begin
    Result := copy( result, iStart + 1, iEnd - iStart - 1 );
  end;

  if WithDelimit then result := '<' + result + '>';
end;


function sak_ExtractAlias( const sAddress: string; WithDelimit: Boolean ): string;
var
  iStart, iEnd: integer;
begin
  result := sAddress;
  iStart := Pos( '<', result );
  iEnd := Pos( '>', result );
  if (iStart > 0) and (iEnd > 0) then
  begin
    delete( result, iStart, iEnd-iStart+1);
  end;

  iStart := Pos( '(', result );
  iEnd := Pos( ')', result );
  if (iStart > 0) and (iEnd > 0) then
  begin
    result := copy( result, iStart+1, iEnd-iStart-1);
  end;

  Result := sak_DelFromStr( Result, '"' );
  Result := sak_DelFromStr( Result, '''' );
  Result := trim( Result);

  if WithDelimit then
  begin
    Result := '"' + Result + '"'
  end
end;

// delete all the ocurrences of sChar in the string sSource
function sak_DelFromStr( const sSource: string; sChar: Char ): string;
var
  i: Integer;
begin
  Result := sSource;
  i := pos( sChar, Result);
  while i > 0 do
  begin
      delete( Result, i, 1);
      i := pos( sChar, Result);
  end;
end;


function sak_CleanUpAddresses( const AddressList: string): TStringList;
var
  i,
  quote1,
  quote2: integer;
  s: string;
begin
  result := TStringList.Create;
  s := trim( AddressList);
  if s = '' then exit;

  // here we must remove all that is betwen ""
  repeat
    quote1 := pos( '"', s);
    if (quote1 > 0) then
    begin
      delete( s, quote1, 1);
    end;
    quote2 := pos( '"', s);
    if (quote2 > 0) then
    begin
      delete( s, quote1, quote2-quote1+1);
    end;
  until (quote1 = 0) or (quote2 = 0);

  s := lowercase( s);

  i := pos( ',', s);
  while i > 0 do
  begin
    result.Add( sak_ExtractAddress( copy( s, 1, i-1), False));
    delete( s, 1, i);
    i := pos( ',', s);
  end;
  result.Add( sak_ExtractAddress( s, False));
end;

// convert the addresses in the form: "alias" <address>
function sak_FormatAddress( const sAddress: string): string;
var
  i,
  quote1,
  quote2: integer;
  addr,
  s: string;
begin
  result := '';
  s := sAddress;

  // here we must remove all that is betwen ""
  // sorry, but could be a ',' within quotes
  // and there are no rules to deal with this, I've checked Netscape
  // and M$ and they do a really poor job parsing addresses, so don't
  // expect much from me
  repeat
    quote1 := pos( '"', s);
    if (quote1 > 0) then
    begin
      delete( s, quote1, 1);
    end;
    quote2 := pos( '"', s);
    if (quote2 > 0) then
    begin
      delete( s, quote1, quote2-quote1+1);
    end;
  until (quote1 = 0) or (quote2 = 0);

  i := pos( ',', s);
  while i > 0 do
  begin
    addr := copy( s, 1, i-1);
    result := result + sak_ExtractAlias( sak_ConvertCharSet( addr), True) +
                 ' ' + sak_ExtractAddress( addr, True) + ', ';
    delete( s, 1, i);
    i := pos( ',', s);
  end;
  result := result + sak_ExtractAlias( sak_ConvertCharSet( s), True) +
               ' ' + sak_ExtractAddress( s, True);
end;

// return the same string unquoted, ie: "hola" -> hola  or 'hola' -> hola
function sak_UnQuote( const s: string): string;
begin
  result := s;
  if s = '' then exit;
  if (result[ 1] = #34) or (result[ 1] = #39) then
    delete( result, 1, 1);           // here we delete the first "
  if (result[ length( result)] = #34) or (result[ length( result)] = #39) then
    delete( result, length( result), 1);  // here we delete the last "
end;

function sak_GetFieldValueFromLine( const Field, Line: string): string;
var
  position, i: integer;
begin
  result := '';
  position := pos( field, uppercase( line));
  if position > 0 then
  begin
    result := trim( copy( line, position + length( field), length(line)));
    i := pos( ';', result);
    if i > 0 then
    begin
      result := trim( copy( result, 1, i-1));
    end;
  end;
end;

function  sak_FindFieldInHeaders( const field: string; const Headers: TStringList;
                                  var line: string): boolean;
var
  s: string;
  lineNumber, i: integer;
begin
  result := false;
  if Headers.Count = 0 then
    exit;

  lineNumber := 0;

  while (lineNumber < Headers.count) and
        (Headers[ lineNumber] = '') do
  begin
    lineNumber := lineNumber + 1;
  end;

  while (lineNumber < Headers.count) and
        (Headers[ lineNumber] <> '') do
  begin
    s := upperCase( Headers[ lineNumber]);
    if pos( field, s) = 1 then
    begin
      line := Headers[ lineNumber];
      i := lineNumber + 1;
      while (i < Headers.Count) and (Headers[i] <> '') and
            ((Headers[i][1] = ' ') or (Headers[i][1] = #9)) do
      begin
        line := line + trim( Headers[i]);
        inc( i);
      end;
      result := true;
      break;
    end;
    inc( lineNumber);
  end;
end;

procedure sak_DeleteHeaders( var aText: TStringList);
begin
  // delete the headers
  while (aText.Count > 0) and (trim(aText[ 0]) <> '') do
  begin
    aText.Delete( 0);
  end;

  // delete the blank lines
  while (aText.Count > 0) and (trim(aText[ 0]) = '') do
  begin
    aText.Delete( 0);
  end;
end;


end.
