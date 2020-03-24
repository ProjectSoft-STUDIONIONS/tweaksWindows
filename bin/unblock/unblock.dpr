program unblock;



uses
  Winapi.Windows,
  ShellAPI,
  System.SysUtils,
  System.Types,
  System.IOUtils;

{$R *.res}
{$R icons.res}

var
  ParamFile: String;
  CmdChar: PWideChar;
  ExePath: String;
  files: TStringDynArray;
  i: integer;
begin
  {$IFDEF MSWINDOWS}
  {$WARN SYMBOL_PLATFORM OFF}
  ExePath := ExtractFilePath(ParamStr(0));
  if(ParamCount>=1) then
  begin
    ParamFile := ParamStr(1);
    if(DirectoryExists(ParamFile)) then
    begin
      // Directory
      files := TDirectory.GetFiles(ParamFile, '*.*', TSearchOption.soAllDirectories);
      i := 0;
      for i := 0 to Length(files) - 1 do
      begin
        FileSetAttr(files[i], FILE_ATTRIBUTE_NORMAL);
        Sleep(20);
      end;
      Sleep(100);
      CmdChar := PWideChar('-d -s "' + ParamFile +'"');
      ShellExecute(0, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, 0);
    end;
    if(FileExists(ParamFile))then
    begin
      // File
      FileSetAttr(ParamFile, FILE_ATTRIBUTE_NORMAL);
      Sleep(100);
      CmdChar := PWideChar('-d "' + ParamFile + '"');
      ShellExecute(0, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, 0);
    end;
    {$ENDIF}
  end;
end.
