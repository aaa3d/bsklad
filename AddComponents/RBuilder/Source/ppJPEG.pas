{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppJPEG;

interface

{$I ppIfDef.pas}

uses
  ppCtrls, JPEG;

implementation

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterGraphicClass('JPEG', TJPEGImage);

finalization

  ppUnRegisterGraphicClass(TJPEGImage);

end.
 