unit OutLookTools;

interface

uses
  Windows, Classes, ComCtrls, SysUtils, Dialogs, ComObj,Graphics, Controls, Forms;

{

Outlook Toolbox

by Perr Lothar
e-mail: lothar.perr@gmx.net

}


const
// OlOutlookBarViewType
  olLargeIcon      = 0;
  olSmallIcon      = 1;
// OlDaysOfWeek
  olFriday = 32;
  olMonday = 2;
  olSaturday = 64;
  olSunday = 1;
  olThursday = 16;
  olTuesday = 4;
  olWednesday = 8;
//OlSortOrder
  olAscending = 1;
  olDescending = 2;
  olSortNone = 0;
//OlItemType
  olAppointmentItem = 1;
  olContactItem = 2;
  olDistributionListItem = 7;
  olJournalItem = 4;
  olMailItem = 0;
  olNoteItem = 5;
  olPostItem = 6;
  olTaskItem = 3;
//OlDefaultFolders
  olFolderCalendar = 9;
  olFolderContacts = 10;
  olFolderDeletedItems = 3;
  olFolderDrafts = 16;
  olFolderInbox = 6;
  olFolderJournal = 11;
  olFolderNotes = 12;
  olFolderOutbox = 4;
  olFolderSentMail = 5;
  olFolderTasks = 13;

const
  msoControlButton = 1;
  msoButtonIcon = 1;
  msoButtonCaption = 2;
  msoButtonIconAndCaption = 3;

type
  TToolbar =  Variant;
  TContact =  Variant;
  TContacts = Variant;

type
  TCustomEnumWindowsProc = procedure(WinHandle : HWND);

  TWindowInfo = class(TObject)
  public
    Handle : HWND;
  end;

  TOutlookConnect = class(TComponent)
  private
    MyOlApp:Variant;  // Instanz von OLE-Object Outlook.Application
    MyNameSpace:Variant; // Namespace von Outlook
    Active: Boolean;  // Angemeldet?
    MyOLEObject:String;
    MyOLENameSpace:String;
    fOnConnected: TNotifyEvent;
    fOnDisConnected: TNotifyEvent;
    procedure ConnectOutlook(Connect:Boolean);
  protected
  public
    Constructor Create(AOwner : TComponent); override;  //Initialisierung
    Destructor Destroy; override; // Objekt zerstören
    function Contact(Index:Variant):Variant;
    function ContactCount:Word;
    procedure ShowContact(Index:Word);
    function GetSelection(Index:Word):Variant;
    function GetSelectionCount:Word;
    function CreateContact:Variant;
    procedure DeleteContact(MyContact:Variant);
    function FindContact(FindWhat:String):Variant;
    function OutlookApplication: Variant;
    function OutlookNameSpace: Variant;
    function OutlookActiveExplorer: Variant;
    function CommandBars:Variant;
    function Contacts:Variant;
    function Calendar:Variant;
    function DeletedItems:Variant;
    function Drafts:Variant;
    function Inbox:Variant;
    function Journal:Variant;
    function Notes:Variant;
    function Outbox:Variant;
    function SentMail:Variant;
    function Tasks:Variant;
  published
    property Connected : Boolean read Active write ConnectOutlook;
    property OLEObject : String read MyOLEObject write MyOLEObject;
    property OLENameSpace : String read MyOLENameSpace write MyOLENameSpace;
    property OnConnect: TNotifyEvent read fOnConnected write fOnConnected;
    property OnDisConnect: TNotifyEvent read fOnDisConnected write fOnDisConnected;
  end;

procedure Register;

implementation

{$r Outlooktools.res}

procedure TOutlookConnect.ConnectOutlook(Connect:Boolean);
begin
  if Connect then
  begin
    try
       MyOlApp:=CreateOleObject(OLEObject);
       MyNameSpace:=MyOlApp.GetNamespace(OLENameSpace);
       if (Assigned(fOnConnected)) then
         fOnConnected(Self);
    except
      raise Exception.Create('Outlook registration failed');
    end;
  end else
  begin
    MyOlApp:=NULL;
    MyNameSpace:=NULL;
    if (Assigned(fOnDisConnected)) then
      fOnDisConnected(Self);
  end;
  Active:=Connect;
end;

function TOutlookConnect.Contact(Index:Variant) : Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    Result:=myNameSpace.GetDefaultFolder(olFolderContacts).Items[Index];
  except
    raise Exception.Create('Cannot import Item');
  end;
end;

function TOutlookConnect.Contacts : Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    Result:=myNameSpace.GetDefaultFolder(olFolderContacts);
  except
    raise Exception.Create('Cannot access to Contacts');
  end;
end;

function TOutLookConnect.ContactCount:Word;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    Result:=myNameSpace.GetDefaultFolder(olFolderContacts).Items.Count;
  except
    Result:=0;
  end;
end;

function TOutlookConnect.GetSelection(Index:Word): Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    Result:=MyOlApp.ActiveExplorer.Selection(Index);
  except
    raise Exception.Create('No item selected');
  end;
end;

function TOutlookConnect.GetSelectionCount:Word;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    Result:=MyOlApp.ActiveExplorer.Selection.Count;
  except
    result:=0;
  end;
end;

function TOutlookConnect.CreateContact:Variant;
var
  MyContact:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    MyContact:=myNameSpace.GetDefaultFolder(olFolderContacts).Items.Add;
    Result:=MyContact;
  except
    raise Exception.Create('Cannot create contact');
  end;
end;

procedure TOutlookConnect.DeleteContact(MyContact:Variant);
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    MyContact.Delete;
  except
    raise Exception.Create('Cannot delete item');
  end;
end;

function TOutlookConnect.FindContact(FindWhat:String):Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    Result:=myNameSpace.GetDefaultFolder(olFolderContacts).Items.Find(FindWhat);
  except
    raise Exception.Create('Error finding Item');
  end;
end;

function TOutlookConnect.OutlookApplication: Variant;
begin
  Result:=MyOlApp;
end;

function TOutlookConnect.OutlookNameSpace: Variant;
begin
  Result:=MyNameSpace;
end;

function TOutlookConnect.OutlookActiveExplorer: Variant;
begin
  Result:=MyOlApp.ActiveExplorer;
end;

function TOutlookConnect.CommandBars : Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=MyOlApp.ActiveExplorer.CommandBars;
end;

Procedure TOutLookConnect.ShowContact(Index:Word);
var
  MyContact:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  try
    MyContact:=myNameSpace.GetDefaultFolder(olFolderContacts).Items[Index];
    MyContact.Display;
  except
    raise Exception.Create('Cannot display contact');
  end;
end;

function TOutlookConnect.Calendar:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderCalendar);
end;

function TOutlookConnect.DeletedItems:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderDeletedItems);
end;

function TOutlookConnect.Drafts:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderDrafts);
end;

function TOutlookConnect.Inbox:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderInbox);
end;

function TOutlookConnect.Journal:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderJournal);
end;

function TOutlookConnect.Notes:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderNotes);
end;

function TOutlookConnect.Outbox:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderOutbox);
end;

function TOutlookConnect.SentMail:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderSentMail);
end;

function TOutlookConnect.Tasks:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderTasks);
end;

constructor TOutlookConnect.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  if Active then ConnectOutlook(True);
  if OLEObject='' then OLEObject:='Outlook.Application';
  if OLENameSpace='' then OLENameSpace:='MAPI';
{  Application.MessageBox(
              'Outlook 2000 Toolbox'+#10#13+
              '________________________________________________'+#10#13#13+
              '(c) 1999 by perr-Kommunikation & EDV'+#10#13#13+
              'by Lothar Perr'+#10#13+
              'Landstrasse 84'+#10#13+
              '4020 Linz'+#10#13+
              'email: lothar.perr@gmx.net'+#10#13+
              'Version 1.1'+#10#13,
              'OutlookConnect version 1.1', MB_OK+ MB_ICONINFORMATION);}
end;

destructor TOutlookConnect.Destroy;
begin
  ConnectOutlook(False);
  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents('Outlook', [TOutlookConnect]);  // na ja, e schon wissen...
end;

end.
// as last some code-Samples
{Function TOutLookConnect.CreateToolBar(Name:String; Position:Byte; Visible:Boolean):Variant;
var
  customBar:Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  CustomBar := MyOlApp.ActiveExplorer.CommandBars.Add(Name);
  CustomBar.Position := Position;
  CustomBar.visible:= Visible;
  result:=CustomBar.Index;
end;

function TOutlookConnect.CommandBar(Index:Variant) : Variant;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=MyOlApp.ActiveExplorer.CommandBars(Index);
end;

function TOutLookConnect.CommandBarCount:Word;
begin
  if not Active then
    raise Exception.Create('No connection to outlook');
  Result:=myNameSpace.GetDefaultFolder(olFolderContacts).Items.Count;
end;





