//===============================================================
//
//       SakAttFile unit, part of SakEmail
//
//       Contains: TAttachedFile, TAttachedFiles
//
//---------------------------------------------------------------
//
//      Copyrigth (c) 1997, 1998, 1999, 2000 Sergio A. Kessler
//      and authors cited
//      http://sak.org.ar
//
//===============================================================


unit SakAttFile;

interface

uses Classes, SysUtils;

type

// ---------------- AttachedFile ----------------

  TAttachedFile  = class( TCollectionItem)
  private
    FFileName: string;
    FUNCFileName: string;
    FBodyEncoded: TStringList;
    FBodyBin: TMemoryStream;
    FMIMEType: string;
    FBase64EncodeCancel: boolean;
    function GetBodyBin: TMemoryStream;
  protected
  public
    constructor Create( Collection: TCollection); override;
    destructor Destroy; override;
    procedure SaveToFile( fn: string);
    procedure SaveToStream( Stream: TStream);
    procedure Base64Encode;
    procedure Base64Decode;
    procedure UUDecode;
    property FileName: string read FFileName write FFileName;
//    property FileStream: TMemoryStream read FBodyBin write FBodyBin;
    property MIMEType: string read FMIMEType;
    property BodyEncoded: TStringList read FBodyEncoded write FBodyEncoded;
    property BodyBin: TMemoryStream read GetBodyBin write FBodyBin;
    property UNCFileName: string read FUNCFileName write FUNCFileName;
    property Base64EncodeCancel: boolean read FBase64EncodeCancel write FBase64EncodeCancel;
  end;

// ---------------- AttachedFiles ----------------

  TAttachedFiles = class( TCollection)
  private
    function GetItem( index: integer): TAttachedFile;
    procedure SetItem( index: integer; value: TAttachedFile);
  public
    constructor Create;
    function Add( fn: string): TAttachedFile;
    property Items[ index: integer]: TAttachedFile read GetItem write SetItem; default;
  end;


implementation

uses SakMIME, sak_util, forms;

// ***************** TAttachedFile *****************

constructor TAttachedFile.Create( Collection: TCollection);
begin
  FBodyEncoded := TStringList.Create;
  FBodyBin := TMemoryStream.Create;
  inherited create( Collection);
end;

destructor TAttachedFile.Destroy;
begin
  if Assigned(FBodyBin) then
  begin
    FBodyBin.Clear;
    FBodyBin.Free;
  end;
  if Assigned(FBodyEncoded) then
  begin
    FBodyEncoded.Clear;
    FBodyEncoded.Free;
  end;
  inherited destroy;
end;

procedure TAttachedFile.SaveToFile( fn: string);
begin
  if FBodyBin = nil then
    raise Exception.create( 'AttachedFile.Body = nil');

  FBodyBin.SaveToFile( fn);
end;

procedure TAttachedFile.SaveToStream( Stream: TStream);
begin
  if FBodyBin = nil then
    raise Exception.create( 'AttachedFile.Body = nil');

  FBodyBin.SaveToStream( Stream);
end;

function TAttachedFile.GetBodyBin: TMemoryStream;
begin
  FBodyBin.Position := 0;
  Result := FBodyBin;
end;

procedure TAttachedFile.Base64Encode;
const
  BytesToRead = 1024;
var
  b: array[0..1024] of byte;
  BytesRead: integer;
  TextCoded: TFileStream;
  TextBin: TStream;
  b64Encode: TBase64EncodingStream;
  fn: string;
  FileIsInMemory: boolean;
begin
  Base64EncodeCancel := False;

  if BodyBin.Size > 0 then
  begin
    // The file is in memory (either from ParseMail or the user loaded it for us)
    FileIsInMemory := True;
    TextBin := BodyBin;
  end else
  begin // The file is not in memory
    FileIsInMemory := False;
    TextBin := TFileStream.Create( UNCFileName, fmOpenRead or fmShareDenyNone);
  end;

  fn := sak_GetTempPath + 'sak_b64e.$$$';
  TextCoded := TFileStream.Create( fn, fmCreate or fmOpenReadWrite or fmShareExclusive);

  b64Encode := TBase64EncodingStream.Create( TextCoded);

  repeat
    Application.ProcessMessages;
    if Base64EncodeCancel then
    begin
      if not FileIsInMemory then
        TextBin.Free;
      b64Encode.Free;
      TextCoded.Free;
      DeleteFile( fn);
      exit;
    end;

    BytesRead := TextBin.Read( b, BytesToRead);
    b64Encode.Write( b, BytesRead);

  until (BytesRead < BytesToRead);

  b64Encode.Free;  // first, to flush the remaining bytes
  TextCoded.Free;

  BodyEncoded.LoadFromFile( fn);
  DeleteFile( fn);

  if not FileIsInMemory then
  begin
    TextBin.Free;
    BodyBin.LoadFromFile( UNCFileName);
  end;
end;

procedure TAttachedFile.Base64Decode;
var
  i:  integer;
  Dest: TFileStream;
  line, tmp: string;
  b64Decode: TBase64DecodingStream;
begin
  tmp := sak_GetTempPath + 'sak_b64d.$$$';

  try
     Dest := TFileStream.Create( tmp, fmCreate or fmOpenReadWrite or fmShareExclusive);
     b64Decode := TBase64DecodingStream.Create( Dest);

     for i := 0 to BodyEncoded.Count-1 do
     begin
       line := BodyEncoded[i];
       b64Decode.Write( pointer(line)^, length( line));
       Application.ProcessMessages;
     end;

     b64Decode.Free;
     Dest.Free;
     BodyBin.LoadFromFile( tmp);
   finally
     DeleteFile( tmp);
  end;
end;

procedure TAttachedFile.UUDecode;
const
  Table = '`!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';
var
   A45Bytes: array[1..45] of byte;
   A24Bits: array[0..8*45] of boolean;
   i,j,k,b,m, BytesGenerated: word;
   ndx : LongInt;
   Txt: TStringList;
   line, tmpFileName: string;
   LineLen, ActualLen : byte;
   buff: TFileStream;
//  step:  integer;

  function ByteFromTable(Ch : Char) : byte;
  var
    n: byte;
  begin
    n := 0;
    repeat
      inc(n);
    until (n > 64) or (Ch = Table[n]);

    if n > 64 then
    begin
      if Ch = ' ' then n := 1
                  else raise Exception.Create( 'Oops...');
    end;
    Result := n-1;
  end;

begin
  Txt := BodyEncoded;
{  FDoDecodeStart( AttachedFile.FileName, Txt.Count);
  step := FDecodeProgressStep;}

  tmpFileName := sak_GetTempPath + 'sak_uud.$$$';

  buff := TFileStream.create( tmpFileName, fmCreate or fmOpenReadWrite or fmShareExclusive);
  try
    ndx := 1;  // the first line (0) is 'begin 6xx bla bla'
    repeat
      line := Txt.Strings[ ndx];

      FillChar( A45Bytes, 45, 0);
      FillChar( A24Bits, 8*45+1, 0);
      k:=0;
      LineLen := length( line);
      ActualLen := 4*ByteFromTable( line[1]) div 3;
      if ActualLen <> (4*45 div 3) then
         ActualLen := LineLen-1;
      for i:=2 to ActualLen+1 do
      begin
        b:=ByteFromTable( line[i]);
        for j:=5 DownTo 0 do
        begin
          m:=1 shl j;
          if (b and m = m) then
          begin
            A24Bits[k]:=true;
          end;
          Inc(k);
        end;
      end;
      k:=0;
      for i:=1 to 45 do
      begin
        b:=0;
        for j:=7 DownTo 0 do
        begin
          if A24Bits[k] then
          begin
            b:= b or (1 shl j);
          end;
          Inc(k);
        end;
        A45Bytes[i] := b;
      end;
      BytesGenerated:=ByteFromTable( line[1]);

      Buff.Write( A45Bytes, BytesGenerated);
{      FDecodeProgress := Round(100*ndx/Txt.Count);
      if ( FDecodeProgress >= step) then
      begin
         FDoDecodeProgress( FDecodeProgress);
         inc( step, FDecodeProgressStep);
      end;
      Application.ProcessMessages;}
      Inc( ndx);
    until (ndx = Txt.Count) or (Txt[ndx] = 'end') or
          (Txt[ndx] = Table[1]);

    buff.Position := 0;
    BodyBin.LoadFromStream( buff );
  finally
    buff.Free;
    DeleteFile( tmpFileName);
{    if FDecodeProgress < 100 then
       FDoDecodeProgress( 100);
    FDoDecodeEnd;}
  end;
end;


// ***************** TAttachedFiles *****************

constructor TAttachedFiles.create;
begin
  inherited create( TAttachedFile);
end;

function TAttachedFiles.GetItem( index: integer): TAttachedFile;
begin
  result := TAttachedFile( inherited GetItem( index));
end;

procedure TAttachedFiles.SetItem( index: integer; value: TAttachedFile);
begin
  inherited SetItem( index, value);
end;

function TAttachedFiles.Add( fn: string): TAttachedFile;
var
  Attach: TAttachedFile;
begin
  Attach := TAttachedFile( inherited Add);
  Attach.FFileName := ExtractFileName( fn);
  Attach.FUNCFileName := fn;
  Attach.FMIMEType := sak_GetMIMEType( fn);
  Result := Attach;
end;



end.
