#define MyAppName "Streams installer"
#define MyAppVersion "1.1.3.0"
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
SolidCompression=true
WizardStyle=modern
UninstallDisplayName={cm:UninstallApp} {#MyAppName}
UninstallDisplayIcon={app}\icon.ico

DisableWelcomePage=False
DisableReadyPage=true
DisableReadyMemo=true
DisableFinishedPage=false
FlatComponentsList=false
AlwaysShowComponentsList=false
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

PrivilegesRequired=admin
InfoBeforeFile=bin\Eula.txt
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: rus; MessagesFile: compiler:Languages\Russian.isl

#include "comonMessage.iss"

[Icons]
Name: {group}\{cm:UninstallApp} {#MyAppName}; Filename: {uninstallexe}

[Files]
Source: bin\streams.exe; DestDir: {app}; DestName: streams.exe; Flags: solidbreak
Source: bin\unblock.exe; DestDir: {app}; DestName: unblock.exe; Flags: solidbreak

[Tasks]
Name: add_streams_path; Description: {cm:AddPathMessage}; Flags: exclusive
Name: add_cmd; Description: {cm:AddCmdMessage}
Name: good_mode; Description: {cm:GoodModeTask}
Name: reload_explorer; Description: {cm:ReloadExplorerTask}
Name: copy_path; Description: {cm:CopyPathTask}
;Name: shutdown_task; Description: Варианты завершения работы или с вариантами перезагрузки

[Run]
Filename: {sys}\rundll32.exe; WorkingDir: {sys}; Parameters: user32.dll,UpdatePerUserSystemParameters; StatusMsg: {cm:RegistryModule}

#include "my_tweaks.iss"

[UninstallDelete]
Name: {app}\*.*; Type: filesandordirs
Name: {app}; Type: dirifempty

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
