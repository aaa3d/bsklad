{******************************************}
{ }
{ FastReport v3.0 }
{ Barcode RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxBarcodeRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxBarcode, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

initialization
  with fsGlobalUnit do
  begin
    AddEnum('TfrxBarcodeType', 'bcCode_2_5_interleaved, bcCode_2_5_industrial,'+
      'bcCode_2_5_matrix, bcCode39, bcCode39Extended, bcCode128A, bcCode128B,'+
      'bcCode128C, bcCode93, bcCode93Extended, bcCodeMSI, bcCodePostNet,'+
      'bcCodeCodabar, bcCodeEAN8, bcCodeEAN13, bcCodeUPC_A, bcCodeUPC_E0,'+
      'bcCodeUPC_E1, bcCodeUPC_Supp2, bcCodeUPC_Supp5, bcCodeEAN128A,'+
      'bcCodeEAN128B, bcCodeEAN128C');
    AddClass(TfrxBarcodeView, 'TfrxView');
  end;

end.
