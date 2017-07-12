{******************************************}
{ }
{ FastReport v3.0 }
{ PSOFT Barcode RTTI }
{ http://www.psoft.sk }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxPBarcodeRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxPBarcode, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};

initialization
  with fsGlobalUnit do
  begin
    AddEnum('TTypBarCode',
      'bcEan8, bcEan13, bcCodabar, bcCode39Standard, bcCode39Full, bcCode93Standard, '+
      'bcCode93Full, bcCode128, bcABCCodabar, bc25Datalogic, bc25Interleaved, '+
      'bc25Matrix, bc25Industrial, bc25IATA, bc25Invert, bc25Coop, bcITF, bcISBN, '+
      'bcISSN, bcISMN, bcUPCA, bcUPCE0, bcUPCE1, bcUPCShipping, bcJAN8, bcJAN13, '+
      'bcMSIPlessey, bcPostNet, bcOPC, bcEan128, bcCode11, bcPZN, bcPDF417');
    AddClass(TfrxPBarcodeView, 'TfrxView');
  end;

end.
