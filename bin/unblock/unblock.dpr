program unblock;

uses
  TypInfo,
  Winapi.Windows,
  ShellAPI,
  System.SysUtils,
  System.Types,
  System.IOUtils,
  ClipBrd;

type
  TStringSet = (cn, ce, cf, cfc);

{$R *.res}
{$R icons.res}

var
  ParamFile: String;
  CmdChar: PWideChar;
  ExePath: String;
  files: TStringDynArray;
  i: integer;
  Param2: String;
  CopyStr: String;
  StrVal: TStringSet;
begin
  {$IFDEF MSWINDOWS}
  {$WARN SYMBOL_PLATFORM OFF}
  ExePath := ExtractFilePath(ParamStr(0));
  if(ParamCount>=1) then
  begin
    ParamFile := ParamStr(1);
    if(ParamCount = 1) then
    begin
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
    end else if(ParamCount > 1) then
    begin
      // Copy path, file, name
      Param2 := ParamStr(2);
      StrVal := TStringSet(GetEnumValue(TypeInfo(TStringSet), Param2));
      if(DirectoryExists(ParamFile) or FileExists(ParamFile)) then
      begin
        case StrVal of
          cn:
          begin
            // Копировать Имя
            if(FileExists(ParamFile)) then
            begin
              CopyStr := TPath.GetFileNameWithoutExtension(ParamFile);
            end
            else
            begin
              CopyStr := TPath.GetFileName(ParamFile);
            end;
            Clipboard.AsText := CopyStr;
            //MessageBox(0, PWideChar(Param2 + #10#13 + CopyStr), 'Title', MB_ICONASTERISK);
          end;
          ce:
          begin
            // Копировать с расширением
            if(FileExists(ParamFile)) then
            begin
              CopyStr := TPath.GetFileName(ParamFile);
            end
            else
            begin
              CopyStr := TPath.GetFileName(ParamFile);
            end;
            Clipboard.AsText := CopyStr;
            //MessageBox(0, PWideChar(Param2 + #10#13 + CopyStr), 'Title', MB_ICONASTERISK);
          end;
          cf:
          begin
            // Копировать полный путь
            CopyStr := ParamFile;
            Clipboard.AsText := ParamFile;
            //MessageBox(0, PWideChar(Param2 + #10#13 + CopyStr), 'Title', MB_ICONASTERISK);
          end;
          cfc:
          begin
            // Копировать в кавычках
            CopyStr := ParamFile;
            Clipboard.AsText := '"' + CopyStr + '"';
            //MessageBox(0, PWideChar(Param2 + #10#13 + CopyStr), 'Title', MB_ICONASTERISK);
          end;
        end;
      end;
    end;
    {$ENDIF}
  end;
end.
