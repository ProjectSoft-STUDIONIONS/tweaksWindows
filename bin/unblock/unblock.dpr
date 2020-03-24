program unblock;



uses
  Vcl.Forms,
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
  Application.Initialize;
  ExePath := ExtractFilePath(ParamStr(0));
  if(ParamCount>=1) then
  begin
    ParamFile := ParamStr(1);
    if(DirectoryExists(ParamFile)) then
    begin
      // Directory
      CmdChar := PWideChar('-d -s "' + ParamFile +'"');
      ShellExecute(Application.Handle, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, SW_HIDE);
    end;
    if(FileExists(ParamFile))then
    begin
      // File
      CmdChar := PWideChar('-d "' + ParamFile + '"');
      ShellExecute(Application.Handle, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, SW_HIDE);
    end;
    {$ENDIF}
  end;
  Application.Run;
end.
