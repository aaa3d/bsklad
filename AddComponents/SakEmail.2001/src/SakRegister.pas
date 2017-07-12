//===============================================================
//
//      SakEmail components
//      Copyright © 1997, 1998, 1999 Sak
//      Sergio A. Kessler
//      sergio@perio.unlp.edu.ar
//      http://sak.org.ar
//
//      Legal stuff: see License.txt file.
//
//
//---------------------------------------------------------------
//
//      Copyrigth (c) 1997, 1998, 1999 Sergio A. Kessler
//      and authors cited
//
//===============================================================



unit SakRegister;

interface

uses SakMsg, SakSMTP, SakPOP3, SakIMAP;


procedure Register;


implementation
{$R *.res}

uses Classes;

procedure Register;
begin
  RegisterComponents('Internet', [TSakPOP, TSakIMAP, TSakSMTP, TSakMsg, TSakMsgList]);
end;


end.
