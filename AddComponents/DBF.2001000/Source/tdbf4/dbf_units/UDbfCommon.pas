unit UDbfCommon;

interface
uses
  sysutils;
  
type
  TDbfFieldType = char;
  
//(CHAR,LOGIC,NUMERIC,DATE,MEMO,GRAPHIC,BLOB,AUTO_INCREMENT,INTEGER,FLOAT,DATE_TIME,DOUBLE_FLOAT);

{$I _DbfCommon.inc}

{$ifndef DELPHI_5}
procedure FreeAndNil(var v);
{$endif}

const
  _MAJOR_VERSION = 4;
  _MINOR_VERSION = 006;

type
  EDBFError = Exception;


implementation

{$ifndef DELPHI_5}
procedure FreeAndNil(var v);
begin
  try
    TObject(v).Free;
  finally
    TObject(v):=nil;
  end;
end;
{$endif}


end.
