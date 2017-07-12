{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppGIF;

interface

{$I ppIfDef.pas}

uses
  ppCtrls, GIFImage;

implementation

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterGraphicClass('GIF', TGIFImage);

finalization

  ppUnRegisterGraphicClass(TGIFImage);

end.
 