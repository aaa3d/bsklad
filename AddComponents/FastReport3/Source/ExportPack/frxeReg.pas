
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Exports Registration unit        }
{                                          }
{         Copyright (c) 1998-2005          }
{          by Alexander Fediachov,         }
{             Fast Reports Inc.            }
{                                          }
{******************************************}

unit frxeReg;

{$I frx.inc}

interface


procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
{$IFNDEF Delphi6}
  DsgnIntf,
{$ELSE}
  DesignIntf, DesignEditors,
{$ENDIF}
  frxExportXML, frxExportHTML, frxExportXLS, frxExportTXT, frxExportImage, 
  frxExportRTF, frxExportPDF;

{-----------------------------------------------------------------------}

procedure Register;
begin
  RegisterComponents('FastReport 3 exports',
    [TfrxTXTExport, TfrxHTMLExport, TfrxXLSExport,
    TfrxXMLExport, TfrxRTFExport, TfrxBMPExport, TfrxJPEGExport,
    TfrxTIFFExport, TfrxPDFExport]);
end;

end.
