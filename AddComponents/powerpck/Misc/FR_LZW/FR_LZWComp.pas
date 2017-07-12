unit FR_LZWComp;

{$I FR.inc}

interface

uses
  SysUtils, Windows, Messages, Classes, Controls, Forms, StdCtrls, FR_Class;

type
  TLZWCompressor = class(TfrCompressor)
  private
    FOnAfterCompr,
    FOnBeforeCompr,
    FOnAfterDecomp,
    FOnBeforeDecompr: TNotifyEvent;
  public
    constructor Create; override;
    procedure Compress(StreamIn, StreamOut: TStream); override;
    procedure DeCompress(StreamIn, StreamOut: TStream); override;
  published
    property OnAfterCompr: TNotifyEvent read FOnAfterCompr write FOnAfterCompr;
    property OnBeforeCompr: TNotifyEvent read FOnBeforeCompr write FOnBeforeCompr;
    property OnAfterDeCompr: TNotifyEvent read FOnAfterDecomp write FOnAfterDecomp;
    property OnBeforeDeCompr: TNotifyEvent read FOnBeforeDecompr write FOnBeforeDecompr;
  end;

  TfrLZWCompressor = class(TComponent)
  private
    FLZWCompressor: TLZWCompressor;
    FEnabled: Boolean;
    procedure SetFrCompressor(Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetFrCompressor;
  end;


procedure Register;

implementation

uses LZRWKH;

constructor TLZWCompressor.Create;
begin
  inherited Create;
end;

procedure TLZWCompressor.Compress(StreamIn, StreamOut: TStream);
begin
  try
    if Assigned(FOnBeforeCompr) then FOnBeforeCompr(self);
    CompressStream(StreamIn, StreamOut);
    if Assigned(FOnAfterCompr) then FOnAfterCompr(self);
  except
    raise Exception.Create('Error writing compressed stream.');
  end;
end;

procedure TLZWCompressor.DeCompress(StreamIn, StreamOut: TStream);
begin
  try
    if Assigned(FOnBeforeDeCompr) then FOnBeforeDeCompr(self);
    DecompressStream(StreamIn, StreamOut);
    if Assigned(FOnAfterDecomp) then FOnAfterDecomp(self);
  except
    raise Exception.Create('Error reading compressed stream.');
  end;
end;

constructor TfrLZWCompressor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLZWCompressor := TLZWCompressor.Create;
  frCompressor := FLZWCompressor;
end;

destructor TfrLZWCompressor.Destroy;
begin
  frCompressor := nil;
  FLZWCompressor.Free;
  inherited Destroy;
end;

procedure TfrLZWCompressor.SetFrCompressor(Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    FLZWCompressor.Enabled := FEnabled;
  end;
end;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrLZWCompressor]);
end;

end.
