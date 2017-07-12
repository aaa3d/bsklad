{$ifdef win32} unit Tlzrw132; {$else} unit Tlzrw116; {$endif}

interface
uses
  Classes,
  Lzrw1, Lzh, Lzrw1kh;  { LZRW1 }

procedure Register;

implementation

{ Register our component. }
procedure Register;
begin
  RegisterComponents('Compon', [TLzrw1]);
end;


end.
 
