// Досмотреть CreateAX.
unit untUtil;
{------------------------------------------------------------------------------}
{ Всмопогательные утилиты для использования в тесте.                           }
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, SysUtils, Classes, Graphics, Registry, Dialogs, ComObj, OleCtrls,
  Forms;

{------------------------------------------------------------------------------}
{ Создаёт объект драйвера. При необходимости выдаётся запрос на регистрацию.   }
{------------------------------------------------------------------------------}
function CreateAX(const ClassName, AXFileName, LSFileName: string): OleVariant;

{------------------------------------------------------------------------------}
{ Получение параметров шрифта, используемого драйвером для отображения окон.   }
{------------------------------------------------------------------------------}
procedure GetRegistryFont(aFont :TFont);

{------------------------------------------------------------------------------}
{ Установка параметров шрифта, используемого драйвером для отображения окон.   }
{------------------------------------------------------------------------------}
procedure SetRegistryFont(aFont: TFont);


implementation

{------------------------------------------------------------------------------}
procedure GetRegistryFont(aFont :TFont);
var
  fRegistry: TRegistry;
begin
  fRegistry:= TRegistry.Create;
  try
    fRegistry.RootKey:= HKEY_CURRENT_USER;
    fRegistry.OpenKey('Software\ShtrihM', TRUE);
    if fRegistry.ValueExists('FontName') then
      aFont.Name:= fRegistry.ReadString('FontName') else
      aFont.Name:= 'MS Sans Serif';
    if fRegistry.ValueExists('FontSize') then
      aFont.Size:= fRegistry.ReadInteger('FontSize') else
      aFont.Size:= 8;
    if fRegistry.ValueExists('FontColor') then
      aFont.Color:= fRegistry.ReadInteger('FontColor') else
      aFont.Color:= clWindowText;
    if fRegistry.ValueExists('FontCharset') then
      aFont.Charset:= fRegistry.ReadInteger('FontCharset') else
      aFont.Charset:= RUSSIAN_CHARSET;
    aFont.Style :=[];
    if fRegistry.ValueExists('FontfsBold') then
      if fRegistry.ReadBool('FontfsBold') then
        aFont.Style:= aFont.Style + [fsBold];
    if fRegistry.ValueExists('FontfsItalic') then
      if fRegistry.ReadBool('FontfsItalic') then
        aFont.Style:= aFont.Style + [fsItalic];
    if fRegistry.ValueExists('FontfsUnderline') then
      if fRegistry.ReadBool('FontfsUnderline') then
        aFont.Style:= aFont.Style + [fsUnderline];
    if fRegistry.ValueExists('FontfsStrikeOut') then
      if fRegistry.ReadBool('FontfsStrikeOut') then
        aFont.Style:= aFont.Style+[fsStrikeOut];
  finally
    fRegistry.Free;
  end;
end;

{------------------------------------------------------------------------------}
procedure SetRegistryFont(aFont: TFont);
var
  fRegistry: TRegistry;
begin
  fRegistry := TRegistry.create;
  try
    fRegistry.RootKey := HKEY_CURRENT_USER;
    fRegistry.OpenKey('Software\ShtrihM',true);
    fRegistry.WriteString('FontName', aFont.Name);
    fRegistry.WriteInteger('FontSize', aFont.Size);
    fRegistry.WriteInteger('FontColor', aFont.Color);
    fRegistry.WriteInteger('FontCharset', aFont.Charset);
    fRegistry.WriteBool('FontfsBold', (fsBold in aFont.Style));
    fRegistry.WriteBool('FontfsItalic', (fsItalic in aFont.Style));
    fRegistry.WriteBool('FontfsUnderline', (fsUnderline in aFont.Style));
    fRegistry.WriteBool('FontfsStrikeOut', (fsStrikeOut in aFont.Style));
  finally
    fRegistry.Free;
  end;
end;

{------------------------------------------------------------------------------}
function CreateAX(const ClassName, AXFileName, LSFileName: string): OleVariant;

  function RegisterExeByFileName(const aFileName : string): boolean;
  var
    fStartupInfo : TStartupInfo;
    fProcessInfo : TProcessInformation;
    fExitCode : DWORD;
  begin
    RESULT:= FALSE;
    FillChar(fStartupInfo, SizeOf(fStartupInfo), 0 );
    with fStartupInfo do
      begin
      cb:= SizeOf(fStartupInfo);
      dwFlags:= STARTF_USESHOWWINDOW;
      wShowWindow:= SW_HIDE;
      end;
    ExitCode:= 0;
    if CreateProcess(nil, PChar(ExtractFileName(aFileName)+' /RegServer'), nil,
     nil, FALSE, NORMAL_PRIORITY_CLASS, nil, PChar(ExtractFilePath(aFileName)),
     fStartupInfo , fProcessInfo ) then
      begin
      WaitForSingleObject(fProcessInfo.hProcess, Infinite );
      GetExitCodeProcess(fProcessInfo.hProcess, fExitCode );
      RESULT:= TRUE;
      end;
    CloseHandle(fProcessInfo.hProcess);
    CloseHandle(fProcessInfo.hThread);
  end;

  function RegisterDllByFileName(const FileName : string): boolean;
  begin
    try
      RegisterComServer(FileName);
      RESULT:= TRUE;
    except
      RESULT:= FALSE;
    end;
  end;

  procedure TryToRegisterAX(AFileName: string);
  var
    OpenDialog: TOpenDialog;
  begin
    if Application.MessageBox( PChar('Необходимо зарегистрировать драйвер.'+Chr(13)+
      'Укажите местоположение файла '+AFileName), 'Тест: Общий драйвер ККМ',
      MB_ICONEXCLAMATION or MB_OKCANCEL) = ID_Cancel then Halt;
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.FileName := AFileName;
      OpenDialog.Filter := 'Драйвер (*.dll)|*.dll|';
      OpenDialog.DefaultExt := 'dll';
      if Not(OpenDialog.Execute) then Halt;
      RegisterDllByFileName(OpenDialog.FileName);
    finally
      OpenDialog.Free;
    end;
  end;

  function TryToRegisterLS(AFileName: string): Boolean;
  var
    OpenDialog: TOpenDialog;
  begin
    result := False;
    case
      Application.MessageBox( PChar(
      'Невозможно создать объект сервера оборудования.'+Chr(13)+
      'Возможные причины:'+Chr(13)+
      'сервер оборудования не зарегистрирован'+Chr(13)+
      'или компьютер, на котором он находится, недоступен.'+Chr(13)+Chr(13)+
      '"Да"'+Chr(vk_Tab)+'зарегистрировать сервер оборудования'+Chr(13)+
      '"Нет"'+Chr(vk_Tab)+'продолжить выполнение программы без регистрации'+Chr(13)+
      '"Отмена"'+Chr(vk_Tab)+'прервать выполнение программы'),
      'Тест: Общий драйвер ККМ',
      mb_IconExclamation or mb_YesNoCancel) of

      ID_Cancel: Halt;
      ID_No: Exit;
      ID_Yes:
      begin
        OpenDialog := TOpenDialog.Create(nil);
        try
          OpenDialog.FileName := AFileName;
          OpenDialog.Filter := 'Сервер оборудования (*.exe)|*.exe|';
          OpenDialog.DefaultExt := 'exe';
          if Not(OpenDialog.Execute) then Exit;
          result := True;
          RegisterExeByFileName(OpenDialog.FileName);
        finally
          OpenDialog.Free;
        end;
      end;
    end;
  end;

var
  tmpStr: string;
begin
  repeat
    repeat
      try
        RESULT:= CreateOleObject(ClassName);
      except
      end;
      if VarIsEmpty(RESULT) then TryToRegisterAX(AXFileName);
    until not(VarIsEmpty(RESULT));
    tmpStr:= RESULT.ServerVersion;
    if RESULT.ResultCode = -13 then
    begin
      if Not(TryToRegisterLS(LSFileName)) then
        Break
      else
        VarClear(RESULT);
    end else
      Break;
  until FALSE;
end;

end.
