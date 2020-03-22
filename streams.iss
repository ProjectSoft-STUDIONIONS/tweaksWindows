#define MyAppName "Streams installer"
#define MyAppVersion "1.0"
#define MyAppPublisher "ProjectSoft"
#define MyAppURL "https://projectsoft.ru/"

[Setup]
AppId={{984E903F-553C-455C-9428-1994CA8C1DBE}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\streams
DefaultGroupName={#MyAppName}
OutputDir=installer
OutputBaseFilename=streams_installer
Compression=lzma
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName={cm:UninstallApp} {#MyAppName}
UninstallDisplayIcon={app}\icon.ico

DisableWelcomePage=False
DisableReadyPage=true
DisableReadyMemo=true
DisableFinishedPage=false
FlatComponentsList=false
AlwaysShowComponentsList=no
ShowComponentSizes=false
WindowShowCaption=false
WindowResizable=false
UsePreviousAppDir=false
UsePreviousGroup=false
AppendDefaultDirName=false
BackSolid=true
WindowStartMaximized=false
DisableProgramGroupPage=true
DisableDirPage=true
ShowLanguageDialog=yes

VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoProductTextVersion={#MyAppName} v{#MyAppVersion}

ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
ChangesEnvironment=yes

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: rus; MessagesFile: compiler:Languages\Russian.isl

[CustomMessages]
en.AddPathMessage=Add the path to the application in the system variable PATH
rus.AddPathMessage=Добавьте путь к приложению в системную переменную PATH
en.AddCmdMessage=Add a command line item to the context menu
rus.AddCmdMessage=Добавить в контекстное меню пункт командной строки
en.ContextCommand=Command line
rus.ContextCommand=Командная строка
en.ContextCommandUser=Run CMD User
rus.ContextCommandUser=Запустить CMD Пользователь
en.ContextCommandAdmin=Run CMD Administrator
rus.ContextCommandAdmin=Запустить CMD Администратор
en.RegistryModule=Registering module...
rus.RegistryModule=Регистрация модуля...
en.UnblockSubdirs=Unblock all Files...
rus.UnblockSubdirs=Разблокировать все файлы...
en.UnblockFile=Unblock File...
rus.UnblockFile=Разблокировать файл...
en.UninstallApp=Uninstall 
rus.UninstallApp=Деинсталлировать

[Icons]
Name: {group}\{cm:UninstallApp} {#MyAppName}; Filename: {uninstallexe}

[Files]
Source: bin\streams.exe; DestDir: {app}; DestName: streams.exe; Check: Is64BitInstallMode
Source: bin\streams64.exe; DestDir: {app}; DestName: streams.exe; Check: not Is64BitInstallMode; Flags: solidbreak
Source: bin\icon.ico; DestDir: {app}; Flags: solidbreak
Source: bin\cmd.ico; DestDir: {app}; Flags: solidbreak
Source: bin\cmd_admin.ico; DestDir: {app}; Flags: solidbreak

[Tasks]
Name: add_streams_path; Description: {cm:AddPathMessage}; Flags: exclusive
Name: add_cmd; Description: {cm:AddCmdMessage}

[Run]
Filename: {sys}\rundll32.exe; WorkingDir: {sys}; Parameters: user32.dll,UpdatePerUserSystemParameters; StatusMsg: {cm:RegistryModule}

[Registry]
; Unblock Files Directory Background
Root: HKCR; Subkey: Directory\Background\shell\unblock; ValueType: string; ValueName: MUIVerb; ValueData: {cm:UnblockSubdirs}; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\Background\shell\unblock; ValueType: string; ValueName: Icon; ValueData: {app}\icon.ico; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\Background\shell\unblock\command; ValueType: string; ValueData: "cmd.exe /c pushd ""%V"" && streams.exe -d -s -nobanner && exit"; Flags: uninsdeletekey
; Unblock Files Directory
Root: HKCR; Subkey: Directory\shell\unblock; ValueType: string; ValueName: MUIVerb; ValueData: {cm:UnblockSubdirs}; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\shell\unblock; ValueType: string; ValueName: Icon; ValueData: {app}\icon.ico; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\shell\unblock\command; ValueType: string; ValueData: "cmd.exe /c pushd ""%V"" && streams.exe -d -s -nobanner"; Flags: uninsdeletekey
; Unblock File
Root: HKCR; Subkey: *\shell\unblock; ValueType: string; ValueName: MUIVerb; ValueData: {cm:UnblockFile}; Flags: uninsdeletekey
Root: HKCR; Subkey: *\shell\unblock; ValueType: string; ValueName: Icon; ValueData: {app}\icon.ico; Flags: uninsdeletekey
Root: HKCR; Subkey: *\shell\unblock\command; ValueType: string; ValueData: "cmd.exe /s /k streams.exe -d -nobanner ""%1"" && exit"; Flags: uninsdeletekey

; Directory Background
Root: HKCR; Subkey: Directory\Background\shell\user_cmd; ValueType: string; ValueName: Icon; ValueData: {app}\cmd.ico; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd; ValueType: string; ValueName: SubCommands; ValueData: ""; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommand}; Flags: uninsdeletekey; Tasks: add_cmd
; Directory Background User
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\default_user; ValueType: string; ValueName: Icon; ValueData: {app}\cmd.ico; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\default_user; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandUser}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\default_user\command; ValueType: string; ValueName: ""; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd
; Directory Background Admin
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\runas; ValueType: string; ValueName: Icon; ValueData: {app}\cmd_admin.ico; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\runas; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandAdmin}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\runas\command; ValueType: string; ValueName: ""; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd

; Directory
Root: HKCR; Subkey: Directory\shell\user_cmd; ValueType: string; ValueName: Icon; ValueData: {app}\cmd.ico; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd; ValueType: string; ValueName: SubCommands; ValueData: ""; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommand}; Flags: uninsdeletekey; Tasks: add_cmd
; Directory User
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\default_user; ValueType: string; ValueName: Icon; ValueData: {app}\cmd.ico; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\default_user; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandUser}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\default_user\command; ValueType: string; ValueName: ""; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd
; Directory Admin
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\runas; ValueType: string; ValueName: Icon; ValueData: {app}\cmd_admin.ico; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\runas; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandAdmin}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\runas\command; ValueType: string; ValueName: ""; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd

[UninstallDelete]
Name: "{app}\*.*"; Type: filesandordirs
Name: "{app}"; Type: dirifempty

[UninstallRun]
Filename: {sys}\rundll32.exe; WorkingDir: {sys}; Parameters: user32.dll,UpdatePerUserSystemParameters; StatusMsg: {cm:RegistryModule}

[Code]
const
	ModPathName = 'add_streams_path';
	ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
	setArrayLength(Result, 1)
	Result[0] := ExpandConstant('{app}');
end;

#include "modpath.iss"
