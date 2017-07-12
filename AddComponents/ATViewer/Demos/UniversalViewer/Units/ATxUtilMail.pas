unit ATxUtilMail;

interface

function FSendEmail(const Text, Attachment: string): Boolean;

implementation

uses
  Windows, Mapi, Forms;

function FSendEmail(const Text, Attachment: string): Boolean;
var
  MapiMessage: TMapiMessage;
  MapiFileDesc: TMapiFileDesc;
begin
  FillChar(MapiMessage, SizeOf(MapiMessage), 0);
  FillChar(MapiFileDesc, SizeOf(MapiFileDesc), 0);
  with MapiFileDesc do
  begin
    lpszPathName := PAnsiChar(AnsiString(Attachment));
  end;
  with MapiMessage do 
  begin
    lpszSubject := nil;
    lpszNoteText := PAnsiChar(AnsiString(Text));
    nFileCount := 1;
    lpFiles := @MapiFileDesc;
  end;
  Result := MapiSendMail(0, Application.Handle, MapiMessage, MAPI_DIALOG or MAPI_LOGON_UI or MAPI_NEW_SESSION, 0) = SUCCESS_SUCCESS;
end;

end.
