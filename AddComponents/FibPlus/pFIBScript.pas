{*************************************************}
{                                                 }
{             FIBPlus Script, version 1.5         }
{                                                 }
{     Copyright by Nikolay Trifonov, 2003-2004    }
{                                                 }
{           E-mail: t_nick@mail.ru                }
{                                                 }
{*************************************************}

unit pFIBScript;

interface

uses
  SysUtils, Classes, pFIBDatabase, pFIBDataset, pFIBQuery, FIBQuery, pFIBScript_util {-> dk, IB_Services <- dk};

type
  TpFIBScript = class;

  TpFIBParseKind = (stmtDDL, stmtDML, stmtSET, stmtCONNECT, stmtDrop,
    stmtCREATE, stmtALTER, stmtINPUT, stmtUNK, stmtEMPTY, stmtTERM, stmtERR,
    stmtCOMMIT, stmtROLLBACK, stmtReconnect);

  TpFIBSQLParseError = procedure(Sender: TObject; Error: string; SQLText: string;
    LineIndex: Integer) of object;
  TpFIBSQLExecuteError = procedure(Sender: TObject; Error: string; SQLText:
    string;
    LineIndex: Integer; var Ignore: Boolean) of object;
  TpFIBSQLParseStmt = procedure(Sender: TObject; AKind: TpFIBParseKind; SQLText:
    string) of object;
  TpFIBScriptParamCheck = procedure(Sender: TpFIBScript; var Pause: Boolean) of
    object;

  TpFIBSQLParser = class(TComponent)
  private
    FOnError: TpFIBSQLParseError;
    FOnParse: TpFIBSQLParseStmt;
    FScript, FInput: TStrings;
    FTerminator: string;
    FPaused: Boolean;
    FFinished: Boolean;
    FBlobFileName: String;
    procedure SetScript(const Value: TStrings);
    procedure SetPaused(const Value: Boolean);
    function StripQuote(const Text: string): string;
    { Private declarations }
  private
    FTokens: TStrings;
    FWork: string;
    ScriptIndex, LineIndex, ImportIndex: Integer;
    InInput: Boolean;
    FEndLine: Integer;

    //Get Tokens plus return the actual SQL to execute
    function TokenizeNextLine: string;
    // Return the Parse Kind for the Current tokenized statement
    function IsValidStatement: TpFIBParseKind;
    procedure RemoveComment;
    function AppendNextLine: Boolean;
    procedure LoadInput;
  protected
    { Protected declarations }
    procedure DoOnParse(AKind: TpFIBParseKind; SQLText: string); virtual;
    procedure DoOnError(Error: string; SQLText: string); virtual;
    procedure DoParser;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Parse;
    property EndLine: Integer read FEndLine;
    property CurrentLine: Integer read LineIndex;
    property CurrentTokens: TStrings read FTokens;
  published
    { Published declarations }
    property Finished: Boolean read FFinished;
    property Paused: Boolean read FPaused write SetPaused;
    property Script: TStrings read FScript write SetScript;
    property Terminator: string read FTerminator write FTerminator;
    property BlobFileName: String read FBlobFileName write FBlobFileName;
    property OnParse: TpFIBSQLParseStmt read FOnParse write FOnParse;
    property OnError: TpFIBSQLParseError read FOnError write FOnError;
  end;

  TpFIBScriptStats = class
  private
    FBuffers: int64;
    FReadIdx: int64;
    FWrites: int64;
    FFetches: int64;
    FSeqReads: int64;
    FReads: int64;
    FDeltaMem: int64;

    FStartBuffers: int64;
    FStartReadIdx: int64;
    FStartWrites: int64;
    FStartFetches: int64;
    FStartSeqReads: int64;
    FStartReads: int64;
    FStartingMem : Int64;

    FDatabase: TpFIBDatabase;

    procedure SetDatabase(const Value: TpFIBDatabase);
    function AddStringValues( list : TStrings) : int64;
  public
    procedure Start;
    procedure Clear;
    procedure Stop;

    property Database : TpFIBDatabase read FDatabase write SetDatabase;
    property Buffers : int64 read FBuffers;
    property Reads : int64 read FReads;
    property Writes : int64 read FWrites;
    property SeqReads : int64 read FSeqReads;
    property Fetches : int64 read FFetches;
    property ReadIdx : int64 read FReadIdx;
    property DeltaMem : int64 read FDeltaMem;
    property StartingMem : int64 read FStartingMem;
  end;

  TpFIBScript = class(TComponent)
  private
    FSQLParser: TpFIBSQLParser;
    FAutoDDL: Boolean;
    FStatsOn: boolean;
    FDataset: TpFIBDataset;
    FDatabase: TpFIBDatabase;
    FOnError: TpFIBSQLParseError;
    FOnParse: TpFIBSQLParseStmt;
    FDDLTransaction: TpFIBTransaction;
    FTransaction: TpFIBTransaction;
    FTerminator: string;
    FDDLQuery, FDMLQuery: TpFIBQuery;
    FContinue: Boolean;
    FOnExecuteError: TpFIBSQLExecuteError;
    FOnParamCheck: TpFIBScriptParamCheck;
    FValidate, FValidating: Boolean;
    FStats: TpFIBScriptStats;
    FSQLDialect : Integer;
    FCharSet : String;
    FBlobFile: TMappedMemoryStream;
    FBlobFileName: String;
    FLastDDLLog : String;
    FLastDMLLog : String;

    FCurrentStmt: TpFIBParseKind;
    FExecuting : Boolean;
    function GetPaused: Boolean;
    procedure SetPaused(const Value: Boolean);
    procedure SetTerminator(const Value: string);
    procedure SetupNewConnection;
    procedure SetDatabase(const Value: TpFIBDatabase);
    procedure SetTransaction(const Value: TpFIBTransaction);
    function StripQuote(const Text: string): string;
    function GetScript: TStrings;
    procedure SetScript(const Value: TStrings);
    function GetSQLParams: TFIBXSQLDA;
    procedure SetStatsOn(const Value: boolean);
    function GetTokens: TStrings;
    function GetSQLParser: TpFIBSQLParser;
    procedure SetSQLParser(const Value: TpFIBSQLParser);
    procedure SetBlobFileName(const Value: String);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure DoDML(const Text: string); virtual;
    procedure DoDDL(const Text: string); virtual;
    procedure DoSET(const Text: string); virtual;
    procedure DoConnect(const SQLText: string); virtual;
    procedure DoCreate(const SQLText: string); virtual;
    procedure DoReconnect; virtual;
    procedure DropDatabase(const SQLText: string); virtual;

    procedure ParserError(Sender: TObject; Error, SQLText: string;
      LineIndex: Integer);
    procedure ParserParse(Sender: TObject; AKind: TpFIBParseKind;
      SQLText: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ValidateScript: Boolean;
    procedure ExecuteScript;
    function ParamByName(Idx : String) : TFIBXSQLVAR;
    property Paused: Boolean read GetPaused write SetPaused;
    property Params: TFIBXSQLDA read GetSQLParams;
    property Stats : TpFIBScriptStats read FStats;
    property CurrentTokens : TStrings read GetTokens;
    property Validating : Boolean read FValidating;
  published
    property AutoDDL: Boolean read FAutoDDL write FAutoDDL default true;
    property Dataset: TpFIBDataset read FDataset write FDataset;
    property Database: TpFIBDatabase read FDatabase write SetDatabase;
    property LastDDLQueryLog: String read FLastDDLLog write FLastDDLLog;
    property LastDMLQueryLog: String read FLastDMLLog write FLastDMLLog;
    property Transaction: TpFIBTransaction read FTransaction write SetTransaction;
    property Terminator: string read FTerminator write SetTerminator;
    property Script: TStrings read GetScript write SetScript;
    property Statistics: boolean read FStatsOn write SetStatsOn default true;
    property SQLDialect: Integer read FSQLDialect write FSQLDialect default 3;
    property SQLParser: TpFIBSQLParser read GetSQLParser write SetSQLParser;
    property OnParse: TpFIBSQLParseStmt read FOnParse write FOnParse;
    property OnParseError: TpFIBSQLParseError read FOnError write FOnError;
    property OnExecuteError: TpFIBSQLExecuteError read FOnExecuteError write
      FOnExecuteError;
    property OnParamCheck: TpFIBScriptParamCheck read FOnParamCheck write
      FOnParamCheck;
  end;

implementation

uses FIB, FIBConsts;

const
  QUOTE = '''';
  DBL_QUOTE = '"';

resourcestring
  SFIBInvalidStatement = 'Invalid statement';
  SFIBInvalidComment = 'Invalid Comment';

{ TpFIBSQLParser }

function TpFIBSQLParser.StripQuote(const Text: string): string;
begin
  Result := Text;
  if Result[1] in [Quote, DBL_QUOTE] then begin
    Delete(Result, 1, 1);
    Delete(Result, Length(Result), 1);
  end;
end;

function TpFIBSQLParser.AppendNextLine: Boolean;
var
  FStrings: TStrings;
  FIndex: ^Integer;
begin
  if (FInput.Count > ImportIndex) then begin
    InInput := true;
    FStrings := FInput;
    FIndex := @ImportIndex;
  end else begin
    InInput := false;
    FStrings := FScript;
    FIndex := @ScriptIndex;
  end;

  if FIndex^ = FStrings.Count then Result := false
  else begin
    Result := true;
    repeat
      FWork := FWork + CRLF + FStrings[FIndex^];
      Inc(FIndex^);
    until (FIndex^ = FStrings.Count) or
      (Trim(FWork) <> '');
  end;
end;

constructor TpFIBSQLParser.Create(AOwner: TComponent);
begin
  inherited;
  FScript := TStringList.Create;
  FTokens := TStringList.Create;
  FInput := TStringList.Create;
  ImportIndex := 0;
  FTerminator := ';';  {do not localize}
end;

destructor TpFIBSQLParser.Destroy;
begin
  FScript.Free;
  FTokens.Free;
  FInput.Free;
  inherited;
end;

procedure TpFIBSQLParser.DoOnError(Error, SQLText: string);
begin
  if Assigned(FOnError) then FOnError(Self, Error, SQLText, LineIndex);
end;

procedure TpFIBSQLParser.DoOnParse(AKind: TpFIBParseKind; SQLText: string);
begin
  if Assigned(FOnParse) then FOnParse(Self, AKind, SQLText);
end;

procedure TpFIBSQLParser.DoParser;
var
  Stmt: TpFIBParseKind;
  Statement: string;
  i: Integer;
begin
  while ((ScriptIndex < FScript.Count) or
    (Trim(FWork) <> '') or
    (ImportIndex < FInput.Count)) and not FPaused do
  begin
    Statement := TokenizeNextLine;
    Stmt := IsValidStatement;
    case Stmt of
      stmtERR:
        DoOnError(SFIBInvalidStatement, Statement);
      stmtTERM:
        begin
          DoOnParse(Stmt, FTokens[2]);
          FTerminator := FTokens[2];
        end;
      stmtINPUT:
        try
          LoadInput;
        except
          on E: Exception do DoOnError(E.Message, Statement);
        end;
      stmtEMPTY:
        Continue;
      stmtSET:
        begin
          Statement := '';
          for i := 1 to FTokens.Count - 1 do Statement := Statement + FTokens[i] + ' ';
          Statement := TrimRight(Statement);
          DoOnParse(Stmt, Statement);
        end;
    else begin
      if (FTokens[0]='DESCRIBE') and (FTokens[1]='TABLE') then
        Statement := 'UPDATE RDB$RELATIONS SET RDB$DESCRIPTION = '+FTokens[3]+' WHERE (RDB$RELATION_NAME = '''+FTokens[2]+''')';
      if (FTokens[0]='DESCRIBE') and (FTokens[1]='FIELD') then
        Statement := 'UPDATE RDB$RELATION_FIELDS SET RDB$DESCRIPTION = '+FTokens[5]+' WHERE (RDB$RELATION_NAME = '''+FTokens[4]+''') and (RDB$FIELD_NAME = '''+FTokens[2]+''')';
      DoOnParse(stmt, Statement);
    end;
    end;
  end;
end;

function TpFIBSQLParser.IsValidStatement: TpFIBParseKind;
var
  Token, Token1, Token2, Token3, Token4: String;
begin
  if FTokens.Count = 0 then begin
    Result := stmtEmpty;
    Exit;
  end;
  Token := AnsiUpperCase(FTokens[0]);
  if Token = 'COMMIT' then  {do not localize}
  begin
    Result := stmtCOMMIT;
    exit;
  end;
  if Token = 'ROLLBACK' then   {do not localize}
  begin
    Result := stmtROLLBACK;
    Exit;
  end;
  if Token = 'RECONNECT' then
  begin
    Result := stmtReconnect;
    Exit;
  end;
  Token1 := AnsiUpperCase(FTokens[1]);
  Token2 := AnsiUpperCase(FTokens[2]);
  if (FTokens.Count>=4) then Token3 := AnsiUpperCase(FTokens[3]);
  if (FTokens.Count>=5) then Token4 := AnsiUpperCase(FTokens[4]);
  if FTokens.Count < 2 then begin
    Result := stmtERR;
    Exit;
  end;
  if (Token = 'INSERT') or (Token = 'DELETE') or   {do not localize}
    (Token = 'SELECT') or (Token = 'UPDATE') or    {do not localize}
    (Token = 'EXECUTE')  or (Token = 'DESCRIBE') or {do not localize}
    ((Token = 'EXECUTE') and (Token1 = 'PROCEDURE')) or
    ((Token = 'ALTER') and (Token1 = 'TRIGGER') and ((Token3 = 'INACTIVE') or (Token3 = 'ACTIVE')) and (Token4 = {';'}FTerminator)) then  {do not localize}//Mybe so: Token4 = FTreminator ?//Pavel
    Result := stmtDML
  else
    if Token = 'INPUT' then         {do not localize}
      Result := stmtINPUT
    else
      if Token = 'CONNECT' then         {do not localize}
        Result := stmtCONNECT
      else
        if (Token = 'CREATE') and
          ((Token1 = 'DATABASE') or (Token1 = 'SCHEMA')) then   {do not localize}
          Result := stmtCREATE
        else
          if (Token = 'DROP') and (Token1 = 'DATABASE') then    {do not localize}
            Result := stmtDROP
          else
            if (Token = 'DECLARE') or (Token = 'CREATE') or (Token = 'ALTER') or {do not localize}
               // -> dk
               (Token = 'RECREATE') or
               // <- dk
              (Token = 'GRANT') or (Token = 'REVOKE') or (Token = 'DROP') or        {do not localize}
              ((Token = 'SET') and ((Token1 = 'GENERATOR'))) or  {do not localize}
              ((Token = 'CREATE') and (Token1 = 'OR') and (Token2 = 'ALTER')) then  {do not localize}
              Result := stmtDDL
            else
              if (Token = 'SET') then       {do not localize}
              begin
                if (Token1 = 'TERM') then     {do not localize}
                  if FTokens.Count = 3 then
                    Result := stmtTERM
                  else
                    Result := stmtERR
                else
                  if (Token1 = 'SQL') then  {do not localize}
                     if (FTokens.Count = 4) and
                        (AnsiUpperCase(FTokens[2]) = 'DIALECT') then  {do not localize}
                       Result := stmtSET
                     else
                       Result := stmtERR
                  else
                    if (Token1 = 'AUTODDL') or (Token1 = 'STATISTICS') or  {do not localize}
                       (Token1 = 'NAMES') then {do not localize}
                      if FTokens.Count = 3 then
                        Result := stmtSET
                      else
                        Result := stmtERR
                    else
                      if (Token[1] = 'BLOBFILE') then
                         BlobFileName := StripQuote(Token[2])
                      else
                        Result := stmtERR;
              end
              else
                Result := stmtERR;
end;

procedure TpFIBSQLParser.LoadInput;
var
  FileName: string;
begin
  FInput.Clear;
  ImportIndex := 0;
  FileName := FTokens[1];
  if FileName[1] in [QUOTE, DBL_QUOTE] then Delete(FileName, 1, 1);
  if FileName[Length(FileName)] in [QUOTE, DBL_QUOTE] then Delete(FileName, Length(FileName), 1);

  FInput.LoadFromFile(FileName);
end;

procedure TpFIBSQLParser.Parse;
begin
  ScriptIndex := 0;
  ImportIndex := 0;
  FInput.Clear;
  FPaused := false;
  DoParser;
end;

procedure TpFIBSQLParser.RemoveComment;
var
  Start, Ending: Integer;
begin
  FWork := TrimLeft(FWork);
  Start := AnsiPos('/*', FWork);    {do not localize}
  while Start = 1 do begin
    Ending := AnsiPos('*/', FWork); {do not localize}
    while Ending < Start do begin
      if AppendNextLine = false then
        raise Exception.Create(SFIBInvalidComment);
      Ending := AnsiPos('*/', FWork);    {do not localize}
    end;
    Delete(FWork, Start, Ending - Start + 2);
    FWork := TrimLeft(FWork);
    if FWork = '' then AppendNextLine;
    FWork := TrimLeft(FWork);
    Start := AnsiPos('/*', FWork);    {do not localize}
  end;
  FWork := TrimLeft(FWork);
end;

procedure TpFIBSQLParser.SetPaused(const Value: Boolean);
begin
  if FPaused <> Value then begin
    FPaused := Value;
    if not FPaused then DoParser;
  end;
end;

procedure TpFIBSQLParser.SetScript(const Value: TStrings);
begin
  FScript.Assign(Value);
  FPaused := false;
  ScriptIndex := 0;
  ImportIndex := 0;
  FInput.Clear;
end;

{ Note on TokenizeNextLine.  This is not intended to actually tokenize in
  terms of SQL tokens.  It has two goals.  First is to get the primary statement
  type in FTokens[0].  These are items like SELECT, UPDATE, CREATE, SET, IMPORT.
  The secondary function is to correctly find the end of a statement.  So if the
  terminator is ; and the statement is "SELECT 'FDR'';' from Table1;" while
  correct SQL tokenization is SELECT, 'FDR'';', FROM, Table1 but this is more
  than needed.  The Tokenizer will tokenize this as SELECT, 'FDR', ';', FROM,
  Table1.  We get that it is a SELECT statement and get the correct termination
  and whole statement in the case where the terminator is embedded inside
  a ' or ". }

function TpFIBSQLParser.TokenizeNextLine: string;
var
  InQuote, InDouble, InComment, InSpecial, Done: Boolean;
  NextWord: string;
  Index: Integer;

  procedure ScanToken;
  var
    SDone: Boolean;
  begin
    NextWord := '';
    SDone := false;
    Index := 1;
    while (Index <= Length(FWork)) and (not SDone) do begin
      { Hit the terminator, but it is not embedded in a single or double quote
          or inside a comment }
      if ((not InQuote) and (not InDouble) and (not InComment)) and
        (((CompareStr(FTerminator, Copy(FWork, Index, Length(FTerminator))) = 0) and
          (not InSpecial)) or
         (InSpecial and
          (FTokens.Count > 1) and
          (*//(AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'END') and {do not localize}
          //(FTokens[FTokens.Count - 1] = ';'))) then {do not localize}
          (AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'INACTIVE') and {do not localize}
          (FTokens[FTokens.Count - 1] = ';'))) then {do not localize}*)
          ((AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'END') or {do not localize}
            (AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'INACTIVE') or {do not localize}
            (AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'ACTIVE')) and {do not localize}
//          (FTokens[FTokens.Count - 1] = ';'))) then {do not localize}
          (FTokens[FTokens.Count - 1] = FTerminator))) then {do not localize}//pavel
      begin
        if InSpecial then begin
          Result := Copy(Result, 1, Length(Result) - 1);
          InSpecial := false;
        end;
        Done := true;
        Result := Result + NextWord;
        Delete(FWork, 1, Length(NextWord) + Length(FTerminator));
        NextWord := Trim(AnsiUpperCase(NextWord));
        if NextWord <> '' then FTokens.Add(AnsiUpperCase(NextWord));
        Exit;
      end;

      { Are we entering or exiting an inline comment? }
      if (Index < Length(FWork)) and ((not Indouble) or (not InQuote)) and
        (FWork[Index] = '/') and (FWork[Index + 1] = '*') then     {do not localize}
        InComment := true;
      if InComment and (Index <> 1) and
         (FWork[Index] = '/') and (FWork[Index - 1] = '*') then     {do not localize}
        InComment := false;

      if not InComment then
        { Handle case when the character is a single quote or a double quote }
        case FWork[Index] of
          QUOTE:
            if not InDouble then
            begin
              if InQuote then
              begin
                InQuote := false;
                SDone := true;
              end
              else
                InQuote := true;
            end;
          DBL_QUOTE:
            if not InQuote then
            begin
              if InDouble then
              begin
                Indouble := false;
                SDone := true;
              end
              else
                InDouble := true;
            end;
//          ' ':                   {do not localize}
          ' ',#13,#9,#10,#0,'(',')': //pavel
            if (not InDouble) and (not InQuote) then
              SDone := true;
        end;
      NextWord := NextWord + FWork[Index];
      Inc(Index);
    end;
    { copy over the remaining non character or spaces until the next word }
    while (Index <= Length(FWork)) and (FWork[Index] <= #32) do  begin
      NextWord := NextWord + FWork[Index];
      Inc(Index);
    end;
    Result := Result + NextWord;
    Delete(FWork, 1, Length(NextWord));
    NextWord := Trim(NextWord);
    if (Length(NextWord) > 0) and (NextWord[Length(NextWord)] in ['(', ')']) then
      Delete(NextWord, Length(NextWord), 1);

    // -> dk
    // native
    // if NextWord <> '' then FTokens.Add(NextWord);
    // На случай, если какой-то ебантей напишет так: CREATE /* */ PROCEDURE ...
    if (NextWord <> '') and (Pos('/*', NextWord) <> 1) then
       FTokens.Add(NextWord);
    // <- dk
    
    if ((AnsiUpperCase(NextWord) = 'PROCEDURE') or {do not localize}
       (AnsiUpperCase(NextWord) = 'TRIGGER')) and
       (FTerminator = ';') then {do not localize}
      InSpecial := true;
      //мои изменения для правильной работы DROP TRIGGER, DROP PROCEDURE, EXECUTE PROCEDURE
      if Inspecial and (FTokens.Count > 1) and
        (
        (((AnsiUpperCase(FTokens[FTokens.Count-2])='DROP') and
         ((AnsiUpperCase(FTokens[FTokens.Count-1])='TRIGGER') or
          (AnsiUpperCase(FTokens[FTokens.Count-1])='PROCEDURE'))) or
//PAVEL ->
//         ((AnsiUpperCase(FTokens[FTokens.Count-2])='EXECUTE') and (AnsiUpperCase(FTokens[FTokens.Count-1])='PROCEDURE')))
         ((AnsiUpperCase(FTokens[0])='EXECUTE') and (AnsiUpperCase(FTokens[1])='PROCEDURE'))))
//PAVEL <-
        then Inspecial := False;
      if Inspecial and (FTokens.Count > 1) and (AnsiUpperCase(FTokens[0])='DESCRIBE') then Inspecial := False;
      //
//    if InSpecial and (AnsiUpperCase(NextWord) = 'END;') then {do not localize}
    if InSpecial and (AnsiUpperCase(NextWord) = 'END' + FTerminator) then {do not localize} //pavel
    begin
      FTokens[FTokens.Count - 1] := Copy(FTokens[FTokens.Count - 1], 1, 3);
//      FTokens.Add(';'); {do not localize}
      FTokens.Add(FTerminator); {do not localize}   //pavel
    end;
    (*pavel*)
    if  (InSpecial and
          (FTokens.Count > 1) and
          ((AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'END') or {do not localize}
            (AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'INACTIVE') or {do not localize}
            (AnsiUpperCase(FTokens[FTokens.Count - 2]) = 'ACTIVE')) and {do not localize}
          (FTokens[FTokens.Count - 1] = FTerminator)) then {do not localize}//pavel
      begin
        InSpecial := false;
        Done := true;
      end;
    (*pavel*)
  end;

begin
  InSpecial := false;
  FTokens.Clear;
  if Trim(FWork) = '' then AppendNextLine;
  try
    RemoveComment;
  except
    on E: Exception do begin
      DoOnError(E.Message, '');
      exit;
    end
  end;
  if not InInput then LineIndex := ScriptIndex - 1;//pavel  перенесено со строки 599, т.к. в событие OnParse свойство CurrentLine содержало значения начала комментария
  InQuote := false;
  InDouble := false;
  InComment := false;
  Done := false;
  Result := '';
  while not Done do begin
    { Check the work queue, if it is empty get the next line to process }
    if FWork = '' then
      if not AppendNextLine then Exit;
    ScanToken;
  end;
  if not InInput then FEndLine := ScriptIndex - 1;
end;

{ TpFIBScript }

constructor TpFIBScript.Create(AOwner: TComponent);
begin
  inherited;
  FSQLParser := TpFIBSQLParser.Create(self);
  FSQLParser.OnError := ParserError;
  FSQLParser.OnParse := ParserParse;
  Terminator := ';';                    {do not localize}
  FDDLTransaction := TpFIBTransaction.Create(self);
  FDDLQuery := TpFIBQuery.Create(self);
  FDDLQuery.ParamCheck := False;
  FAutoDDL := true;
  FStatsOn := true;
  FStats := TpFIBScriptStats.Create;
  FStats.Database := FDatabase;
  FSQLDialect := 3;
  FBlobFileName := '';
end;

destructor TpFIBScript.Destroy;
begin
  FStats.Free;
  inherited;
end;

procedure TpFIBScript.DoConnect(const SQLText: string);
var
  i: integer;
  Param: string;
begin
//  SetupNewConnection;
  if Database.Connected then Database.Connected := false;
  Database.SQLDialect := FSQLDialect;
  DataBase.DBParams.Clear;
  Database.DatabaseName := StripQuote(SQLParser.CurrentTokens[1]);
  i := 2;
  while i < SQLParser.CurrentTokens.Count - 1 do begin
    if AnsiCompareText(SQLParser.CurrentTokens[i], 'USER') = 0 then   {do not localize}
    begin
      Database.ConnectParams.UserName := StripQuote(SQLParser.CurrentTokens[i + 1]);
      Inc(i, 2);
    end else
    if AnsiCompareText(SQLParser.CurrentTokens[i], 'PASSWORD') = 0 then  {do not localize}
    begin
      Database.ConnectParams.Password := StripQuote(SQLParser.CurrentTokens[i + 1]);
      Inc(i, 2);
    end else
    if AnsiCompareText(SQLParser.CurrentTokens[i], 'ROLE') = 0 then   {do not localize}
    begin
      Database.ConnectParams.RoleName := StripQuote(SQLParser.CurrentTokens[i + 1]);
      Inc(i, 2);
    end else
    if (AnsiCompareText(SQLParser.CurrentTokens[i], 'SET') = 0) and
      (AnsiCompareText(SQLParser.CurrentTokens[i-1], 'CHARACTER') = 0) then   {do not localize}
    begin
      Database.ConnectParams.CharSet := StripQuote(SQLParser.CurrentTokens[i + 1]);
      FCharSet := Database.ConnectParams.CharSet;
      Inc(i, 2);
    end else
      Inc(i, 1);
  end;
  Database.Connected := true;
end;

procedure TpFIBScript.DoCreate(const SQLText: string);
var
  i: Integer;
begin
//  SetupNewConnection;
  FDatabase.DatabaseName := StripQuote(SQLParser.CurrentTokens[2]);
  i := 3;
  while i < SQLParser.CurrentTokens.Count - 1 do begin
    Database.DBParams.Add(SQLParser.CurrentTokens[i] + ' ' +
      SQLParser.CurrentTokens[i + 1]);
    Inc(i, 2);
  end;
  FDatabase.SQLDialect := FSQLDialect;
  FDatabase.CreateDatabase;
  if FStatsOn and Assigned(FDatabase) and FDatabase.Connected then FStats.Start;
end;

procedure TpFIBScript.DoDDL(const Text: string);
begin
  if AutoDDL then FDDLQuery.Transaction := FDDLTransaction
             else FDDLQuery.Transaction := FTransaction;
  if not FDDLQuery.Transaction.InTransaction then FDDLQuery.Transaction.StartTransaction;

  FDDLQuery.SQL.Text := Text;
  if FLastDDLLog<>'' then FDDLQuery.SQL.SaveToFile(FLastDDLLog);
  FDDLQuery.ExecQuery;
  if AutoDDL then FDDLTransaction.Commit;
end;

procedure TpFIBScript.DoDML(const Text: string);
var
  FPaused : Boolean;
  i, lo, len: Integer;
  p: PChar;
  m: TMemoryStream;
begin
  FPaused := false;
  if Assigned(FDataSet) then begin
    if FDataSet.Active then FDataSet.Close;
    FDataSet.SelectSQL.Text := Text;
    if FLastDMLLog<>'' then FDataSet.SelectSQL.SaveToFile(FLastDMLLog);
    FDataset.Prepare;
    if (FDataSet.Params.Count <> 0) and Assigned(FOnParamCheck) then begin
      FOnParamCheck(self, FPaused);
      if FPaused then begin
        SQLParser.Paused := true;
        exit;
      end;
    end;
    //чтобы злобный юзер ничего не испортил в FOnParamCheck, обработка блобов идет после
    if (FDataSet.Params.Count > 0) and (Assigned(fBlobFile)) then begin
        for i := 0 to FDataSet.Params.Count - 1 do begin
          if (AnsiUpperCase(FDataSet.ParamName(i)[1]) = 'H') then begin
            lo := HexStr2Int(Copy(FDataSet.ParamName(i), 2, 8));
            len := HexStr2Int(Copy(FDataSet.ParamName(i), 11, 8));
            m := TMemoryStream.Create;
            m.Size := len;
            p := fBlobFile.Memory;
            Inc(p, lo);
            Move(p^, m.Memory^, len);
            FDataSet.Params[i].LoadFromStream(m);
            m.Destroy;
          end;
        end;
    end;
    if FDataset.StatementType = SQLSelect then FDataSet.Open
                                          else FDataSet.QSelect.ExecQuery;
  end else begin
    if FDMLQuery.Open then FDMLQuery.Close;
    FDMLQuery.SQL.Text := Text;
    if FLastDMLLog<>'' then FDMLQuery.SQL.SaveToFile(FLastDMLLog);
    if not FDMLQuery.Transaction.InTransaction then FDMLQuery.Transaction.StartTransaction;
    FDMLQuery.Prepare;
    if (FDMLQuery.Params.Count <> 0) and Assigned(FOnParamCheck) then begin
      FOnParamCheck(self, FPaused);
      if FPaused then begin
        SQLParser.Paused := true;
        exit;
      end;
    end;
    //чтобы злобный юзер ничего не испортил в FOnParamCheck, обработка блобов идет после
    if (FDMLQuery.Params.Count > 0) and (Assigned(fBlobFile)) then begin
        for i := 0 to FDMLQuery.Params.Count - 1 do begin
          if (AnsiUpperCase(FDMLQuery.ParamName(i)[1]) = 'H') then begin
            lo := HexStr2Int(Copy(FDMLQuery.ParamName(i), 2, 8));
            len := HexStr2Int(Copy(FDMLQuery.ParamName(i), 11, 8));
            m := TMemoryStream.Create;
            m.Size := len;
            p := fBlobFile.Memory;
            Inc(p, lo);
            Move(p^, m.Memory^, len);
            FDMLQuery.Params[i].LoadFromStream(m);
            m.Destroy;
          end;
        end;
    end;
    FDMLQuery.ExecQuery;
  end;
end;

procedure TpFIBScript.DoReconnect;
begin
  if Assigned(FDatabase) then begin
    FDatabase.Connected := false;
    FDatabase.Connected := true;
  end;
end;

procedure TpFIBScript.DoSET(const Text: string);
begin
  if AnsiCompareText('AUTODDL', SQLParser.CurrentTokens[1]) = 0 then    {do not localize}
    FAutoDDL := SQLParser.CurrentTokens[2] = 'ON'                    {do not localize}
  else
      if (AnsiCompareText('SQL', SQLParser.CurrentTokens[1]) = 0) and  {do not localize}
         (AnsiCompareText('DIALECT', SQLParser.CurrentTokens[2]) = 0) then  {do not localize}
      begin
        FSQLDialect := StrToInt(SQLParser.CurrentTokens[3]);
        if Database.SQLDialect <> FSQLDialect then begin
          if Database.Connected then begin
            Database.Close;
            Database.SQLDialect := FSQLDialect;
            Database.Open;
          end else
            Database.SQLDialect := FSQLDialect;
        end;
      end else
        if (AnsiCompareText('NAMES', SQLParser.CurrentTokens[1]) = 0) then  {do not localize}
          FCharSet := SQLParser.CurrentTokens[2];
end;

procedure TpFIBScript.DropDatabase(const SQLText: string);
begin
  FDatabase.DropDatabase;
end;

procedure TpFIBScript.ExecuteScript;
begin
  FContinue := true;
  FExecuting := true;
  FCharSet := '';
  if not Assigned(FDataset) then begin
    FDMLQuery := TpFIBQuery.Create(FDatabase);
    FDMLQuery.Transaction := FTransaction; //fixed 28.01.2004
  end;
  try
    FStats.Clear;
    if FStatsOn and Assigned(FDatabase) and FDatabase.Connected then FStats.Start;
    SQLParser.Parse;
    if FStatsOn then FStats.Stop;
  finally
    FExecuting := false;
    if Assigned(FDMLQuery) then FreeAndNil(FDMLQuery);
  end;
end;

function TpFIBScript.GetPaused: Boolean;
begin
  Result := SQLParser.Paused;
end;

function TpFIBScript.GetScript: TStrings;
begin
  Result := SQLParser.Script;
end;

function TpFIBScript.GetSQLParams: TFIBXSQLDA;
begin
  if Assigned(FDataset) then Result := FDataset.Params
                        else Result := FDMLQuery.Params;
end;

function TpFIBScript.GetTokens: TStrings;
begin
  Result := SQLParser.CurrentTokens;
end;

function TpFIBScript.GetSQLParser: TpFIBSQLParser;
begin
  if not Assigned(FSQLParser) then
  begin
    FSQLParser := TpFIBSQLParser.Create(self);
    FSQLParser.OnError := ParserError;
    FSQLParser.OnParse := ParserParse; //pavel
  end;
  Result := FSQLParser;
end;

procedure TpFIBScript.SetSQLParser(const Value: TpFIBSQLParser);
begin
  if FSQLParser <> Value then
  begin
    if Assigned(FSQLParser) and (FSQLParser.Owner = Self) then
      FSQLParser.Free;
    FSQLParser := Value;
    FOnParse := FSQLParser.OnParse;
    FOnError := FSQLParser.OnError;
    FSQLParser.OnError := ParserError;
    FSQLParser.OnParse := ParserParse; //pavel
  end;
end;

procedure TpFIBScript.SetBlobFileName(const Value: String);
begin
  if AnsiUpperCase(FBlobFileName) <> AnsiUpperCase(Value) then
  begin
    if Assigned(FBlobFile) then
    begin
      FBlobFile.Destroy;
    end;
    FBlobFile := TMappedMemoryStream.Create(Value);
    FBlobFile.Position := 0;
  end;
end;

procedure TpFIBScript.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then begin
    if AComponent = FDataset then
      FDataset := nil
    else
      if AComponent = FDatabase then
        FDatabase := nil
      else
        if AComponent = FTransaction then
          FTransaction := nil;
  end;
end;

function TpFIBScript.ParamByName(Idx: String): TFIBXSQLVAR;
begin
  if Assigned(FDataset) then Result := FDataset.Params.ParamByName(Idx)
                        else Result := FDMLQuery.ParamByName(Idx);
end;

procedure TpFIBScript.ParserError(Sender: TObject; Error,
  SQLText: string; LineIndex: Integer);
begin
  if Assigned(FOnError) then FOnError(Self, Error, SQLText, LineIndex);
  FValidate := false;
  SQLParser.Paused := true;
end;

procedure TpFIBScript.ParserParse(Sender: TObject; AKind: TpFIBParseKind;
  SQLText: string);
begin
  try
    if Assigned(FOnParse) then FOnParse(self, AKind, SQLText);
    FCurrentStmt := AKind;
    if not FValidating then
      case AKind of
        stmtDrop : DropDatabase(SQLText);
        stmtDDL : DoDDL(SQLText);
        stmtDML: DoDML(SQLText);
        stmtSET: DoSET(SQLText);
        stmtCONNECT: DoConnect(SQLText);
        stmtCREATE: DoCreate(SQLText);
        stmtTERM: FTerminator := Trim(SQLText);
        stmtCOMMIT:
          if FTransaction.InTransaction then
            FTransaction.Commit;
        stmtROLLBACK:
          if FTransaction.InTransaction then
            FTransaction.Rollback;
        stmtReconnect:
          DoReconnect;
      end;
//    if Assigned(FOnParse) then FOnParse(self, AKind, SQLText);//pavel - moved up
  except
    on E: EFIBError do begin
      FContinue := false;
      FValidate := false;
      SQLParser.Paused := true;
      if Assigned(FOnExecuteError) then
        FOnExecuteError(Self, E.Message, SQLText, SQLParser.CurrentLine, FContinue)
      else
        raise;
      if FContinue then SQLParser.Paused := false else
      begin
//        if FTransaction.InTransaction then FTransaction.Rollback;
//        if FDDLTransaction.InTransaction then FDDLTransaction.Rollback;
      end;
    end;
  end;
end;

procedure TpFIBScript.SetDatabase(const Value: TpFIBDatabase);
begin
  if FDatabase <> Value then begin
    FDatabase := Value;
    FDDLQuery.Database := Value;
    FDDLTransaction.DefaultDatabase := Value;
    FStats.Database := Value;
    if Assigned(FDMLQuery) then FDMLQuery.Database := Value;
  end;
end;

procedure TpFIBScript.SetPaused(const Value: Boolean);
begin
  if SQLParser.Paused and (FCurrentStmt = stmtDML) then
    if Assigned(FDataSet) then begin
      if FDataset.StatementType = SQLSelect then FDataSet.Open
                                            else FDataset.QSelect.ExecQuery;
    end else begin
      FDMLQuery.ExecQuery;
    end;
  SQLParser.Paused := Value;
end;

procedure TpFIBScript.SetScript(const Value: TStrings);
begin
  SQLParser.Script.Assign(Value);
end;

procedure TpFIBScript.SetStatsOn(const Value: boolean);
begin
  if FStatsOn <> Value then begin
    FStatsOn := Value;
    if FExecuting then begin
      if FStatsOn then FStats.Start
                  else FStats.Stop;
    end;
  end;
end;

procedure TpFIBScript.SetTerminator(const Value: string);
begin
  if FTerminator <> Value then begin
    FTerminator := Value;
    SQLParser.Terminator := Value;
  end;
end;

procedure TpFIBScript.SetTransaction(const Value: TpFIBTransaction);
begin
  FTransaction := Value;
  if Assigned(FDMLQuery) then FDMLQuery.Transaction := Value;
end;

procedure TpFIBScript.SetupNewConnection;
begin
  FDDLTransaction.RemoveDatabase(FDDLTransaction.FindDatabase(FDatabase));
  if FDatabase.Owner = self then FDatabase.Free;
  Database := TpFIBDatabase.Create(self);
  if FTransaction.Owner = self then FTransaction.Free;
  FTransaction := TpFIBTransaction.Create(self);
  FDatabase.DefaultTransaction := FTransaction;
  FTransaction.DefaultDatabase := FDatabase;
  FDDLTransaction.DefaultDatabase := FDatabase;
  FDDLQuery.Database := FDatabase;
  if Assigned(FDataset) then begin
    FDataset.Database := FDatabase;
    FDataset.Transaction := FTransaction;
  end;
end;

function TpFIBScript.StripQuote(const Text: string): string;
begin
  Result := Text;
  if Result[1] in [Quote, DBL_QUOTE] then begin
    Delete(Result, 1, 1);
    Delete(Result, Length(Result), 1);
  end;
end;

function TpFIBScript.ValidateScript: Boolean;
begin
  FValidating := true;
  FValidate := true;
  SQLParser.Parse;
  Result := FValidate;
  FValidating := false;
end;

{ TpFIBScriptStats }

function TpFIBScriptStats.AddStringValues(list: TStrings): int64;
var
  i : integer;
  index : integer;
begin
  try
    Result := 0;
    for i := 0 to list.count-1 do begin
      index := Pos('=', list.strings[i]);   {do not localize}
      if index > 0 then Result := Result + StrToInt(Copy(list.strings[i], index + 1, 255));
    end;
  except
    Result := 0;
  end;
end;

procedure TpFIBScriptStats.Clear;
begin
  FBuffers := 0;
  FReads := 0;
  FWrites := 0;
  FSeqReads := 0;
  FFetches := 0;
  FReadIdx := 0;
  FDeltaMem := 0;
end;

procedure TpFIBScriptStats.SetDatabase(const Value: TpFIBDatabase);
begin
  FDatabase := Value;
end;

procedure TpFIBScriptStats.Start;
begin
  FStartBuffers := FDatabase.NumBuffers;
  FStartReads := FDatabase.Reads;
  FStartWrites := FDatabase.Writes;
  FStartSeqReads := AddStringValues(FDatabase.ReadSeqCount);
  FStartFetches := FDatabase.Fetches;
  FStartReadIdx := AddStringValues(FDatabase.ReadIdxCount);
  FStartingMem := FDatabase.CurrentMemory;
end;

procedure TpFIBScriptStats.Stop;
begin
  FBuffers := FDatabase.NumBuffers - FStartBuffers + FBuffers;
  FReads := FDatabase.Reads - FStartReads + FReads;
  FWrites := FDatabase.Writes - FStartWrites + FWrites;
  FSeqReads := AddStringValues(FDatabase.ReadSeqCount) - FStartSeqReads + FSeqReads;
  FReadIdx := AddStringValues(FDatabase.ReadIdxCount) - FStartReadIdx + FReadIdx;
  FFetches := FDatabase.Fetches - FStartFetches + FFetches;
  FDeltaMem := FDatabase.CurrentMemory - FStartingMem + FDeltaMem;
end;

end.

