[Registry]
; Unblock Files Directory Background
Root: HKCR; Subkey: Directory\Background\shell\unblock; ValueType: string; ValueName: MUIVerb; ValueData: {cm:UnblockSubdirs}; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\Background\shell\unblock; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,0; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\Background\shell\unblock\command; ValueType: string; ValueData: "{app}\unblock.exe ""%V"""; Flags: uninsdeletekey
; Unblock Files Directory
Root: HKCR; Subkey: Directory\shell\unblock; ValueType: string; ValueName: MUIVerb; ValueData: {cm:UnblockSubdirs}; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\shell\unblock; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,0; Flags: uninsdeletekey
Root: HKCR; Subkey: Directory\shell\unblock\command; ValueType: string; ValueData: "{app}\unblock.exe ""%V"""; Flags: uninsdeletekey
; Unblock File
Root: HKCR; Subkey: *\shell\unblock; ValueType: string; ValueName: MUIVerb; ValueData: {cm:UnblockFile}; Flags: uninsdeletekey
Root: HKCR; Subkey: *\shell\unblock; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,0; Flags: uninsdeletekey
Root: HKCR; Subkey: *\shell\unblock\command; ValueType: string; ValueData: "{app}\unblock.exe ""%1"""; Flags: uninsdeletekey

; Directory Background
Root: HKCR; Subkey: Directory\Background\shell\user_cmd; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,1; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd; ValueType: string; ValueName: SubCommands; ValueData: ; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommand}; Flags: uninsdeletekey; Tasks: add_cmd
; Directory Background User
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\default_user; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,1; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\default_user; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandUser}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\default_user\command; ValueType: string; ValueName: ; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd
; Directory Background Admin
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\runas; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,2; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\runas; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandAdmin}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\Background\shell\user_cmd\shell\runas\command; ValueType: string; ValueName: ; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd

; Directory
Root: HKCR; Subkey: Directory\shell\user_cmd; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,1; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd; ValueType: string; ValueName: SubCommands; ValueData: ; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommand}; Flags: uninsdeletekey; Tasks: add_cmd
; Directory User
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\default_user; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,1; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\default_user; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandUser}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\default_user\command; ValueType: string; ValueName: ; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd
; Directory Admin
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\runas; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,2; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\runas; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCommandAdmin}; Flags: uninsdeletekey; Tasks: add_cmd
Root: HKCR; Subkey: Directory\shell\user_cmd\shell\runas\command; ValueType: string; ValueName: ; ValueData: "cmd.exe /s /k pushd ""%V"" && title %V && echo off && cls"; Flags: uninsdeletekey; Tasks: add_cmd


;Режим бога
Root: HKCR; SubKey: DesktopBackground\shell\GoodMode; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextGoodMode}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: good_mode

Root: HKCR; SubKey: DesktopBackground\shell\GoodMode; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,4; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: good_mode

Root: HKCR; SubKey: DesktopBackground\shell\GoodMode; ValueType: string; ValueName: Position; ValueData: Bottom; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: good_mode

Root: HKCR; SubKey: DesktopBackground\shell\GoodMode\command; ValueType: string; ValueData: explorer shell:::{{ED7BA470-8E54-465E-825C-99712043E01C}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: good_mode

;Перезапустить Explorer
Root: HKCR; SubKey: DesktopBackground\shell\ReloadExplorer; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextReloadExplorer}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: DesktopBackground\shell\ReloadExplorer; ValueType: string; ValueName: Icon; ValueData: explorer.exe,0; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: DesktopBackground\shell\ReloadExplorer\command; ValueType: string; ValueData: "cmd.exe /q /c (taskkill /f /im ""explorer.exe"" >nul && start explorer.exe >nul)"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: Directory\Background\shell\ReloadExplorer; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextReloadExplorer}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: Directory\Background\shell\ReloadExplorer; ValueType: string; ValueName: Icon; ValueData: explorer.exe,0; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: Directory\Background\shell\ReloadExplorer\command; ValueType: string; ValueData: "cmd.exe /q /c (taskkill /f /im ""explorer.exe"" >nul && start explorer.exe >nul)"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: Directory\shell\ReloadExplorer; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextReloadExplorer}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: Directory\shell\ReloadExplorer; ValueType: string; ValueName: Icon; ValueData: explorer.exe,0; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

Root: HKCR; SubKey: Directory\shell\ReloadExplorer\command; ValueType: string; ValueData: "cmd.exe /q /c (taskkill /f /im ""explorer.exe"" >nul && start explorer.exe >nul)"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: reload_explorer

; Копирование пути
; Для всех файлов
Root: HKCR; SubKey: *\shell\Menu_CopyToClip; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPath}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: *\shell\Menu_CopyToClip; ValueType: string; ValueName: SubCommands; ValueData: "CopyFile_Name;CopyFile_NameExt;CopyFile_Full;CopyFile_FullEsc"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: *\shell\Menu_CopyToClip; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: *\shell\Menu_CopyToClip\command; ValueType: string; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

; Для ярлыков
Root: HKCR; SubKey: lnkfile\shell\Menu_CopyToClip; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPath}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: lnkfile\shell\Menu_CopyToClip; ValueType: string; ValueName: SubCommands; ValueData: "CopyFile_Name;CopyFile_NameExt;CopyFile_Full;CopyFile_FullEsc"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: lnkfile\shell\Menu_CopyToClip; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: lnkfile\shell\Menu_CopyToClip\command; ValueType: string; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path


;Для каталогов
Root: HKCR; SubKey: Directory\shell\Menu_CopyToClip; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPath}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\shell\Menu_CopyToClip; ValueType: string; ValueName: SubCommands; ValueData: "CopyDir_Name;CopyDir_Full;CopyDir_FullEsc"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\shell\Menu_CopyToClip; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\shell\Menu_CopyToClip\command; ValueType: string; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\Background\shell\Menu_CopyToClip; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPath}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\Background\shell\Menu_CopyToClip; ValueType: string; ValueName: SubCommands; ValueData: "CopyDir_Name;CopyDir_Full;CopyDir_FullEsc"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\Background\shell\Menu_CopyToClip; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKCR; SubKey: Directory\Background\shell\Menu_CopyToClip\command; ValueType: string; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

; Commands
;Скопировать только имя в буфер обмена
; ФАЙЛЫ
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_Name; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathName}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_Name; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_Name\command; ValueType: string; ValueData: "{app}\unblock.exe ""%1"" cn"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

; Директории
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_Name; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathName}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_Name; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_Name\command; ValueType: string; ValueData: "{app}\unblock.exe ""%V"" cn"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path


;Скопировать имя с расширением в буфер обмена
; ФАЙЛЫ
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_NameExt; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathNameExt}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_NameExt; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_NameExt\command; ValueType: string; ValueData: "{app}\unblock.exe ""%1"" ce"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

;Скопировать полный путь
; ФАЙЛЫ
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_Full; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathFull}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_Full; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_Full\command; ValueType: string; ValueData: "{app}\unblock.exe ""%1"" cf"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

; Директории
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_Full; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathFull}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_Full; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_Full\command; ValueType: string; ValueData: "{app}\unblock.exe ""%V"" cf"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

;Скопировать полный путь в ковычках
; ФАЙЛЫ
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_FullEsc; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathFullQuote}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_FullEsc; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyFile_FullEsc\command; ValueType: string; ValueData: "{app}\unblock.exe ""%1"" cfc"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

; Директории
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_FullEsc; ValueType: string; ValueName: MUIVerb; ValueData: {cm:ContextCopyPathFullQuote}; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_FullEsc; ValueType: string; ValueName: Icon; ValueData: {app}\unblock.exe,3; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path

Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\CopyDir_FullEsc\command; ValueType: string; ValueData: "{app}\unblock.exe ""%V"" cfc"; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: copy_path


