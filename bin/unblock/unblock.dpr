program unblock;



uses
  Winapi.Windows,
  ShellAPI,
  System.SysUtils;

{$R *.res}
{$R icons.res}

var
  ParamFile: String;
  CmdChar: PWideChar;
  ExePath: String;

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
      CmdChar := PWideChar('-d -s "' + ParamFile +'"');
      ShellExecute(0, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, 0);
    end;
    if(FileExists(ParamFile))then
    begin
      // File
      CmdChar := PWideChar('-d "' + ParamFile + '"');
      ShellExecute(0, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, 0);
    end;
    {$ENDIF}
  end;
end.
