{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 1999 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppWWRichEd;

interface

  { InfoPower RichEdit support.

    This unit defines a TwwDBRichEdit descendant and then registers the class
    with ReportBuilder. This enables the TppRichText and TppDBRichText controls
    in ReportBuilder to use the formatting capabilities of TwwDBRichEidt when
    rendering data.

    Add this unit to the 'uses' clauses of the main form of your application to
    use it a runtime.

    Install the rbRBIP44.bpl package into the Delphi IDE to use this unit at
    Delphi designt-time.

    }


uses
  Messages, RichEdit,
  ppDrwCmd, wwRichEd;

type

  {TppWWRichEdit }
  TppWWRichEdit = class(TwwDBRichEdit)
    private
      procedure EMFormatRange(var msg:TMessage); message EM_FORMATRANGE;

  end; {class, TppWWRichEdit}


implementation


{------------------------------------------------------------------------------}
{ TppWWRichEdit.EMFormatRange }

procedure TppWWRichEdit.EMFormatRange(var msg:TMessage);
begin
  {must bypass the EMFormatRange of the ancestor, TwwCustomRichEdit,
   because it modifies the target rectangle}
  DefaultHandler(Msg);

end; {procedure, EMFormatRange }

initialization
  ppRegisterRichEditClass(TppWWRichEdit);

finalization
  ppRegisterRichEditClass(nil);
  
end.
