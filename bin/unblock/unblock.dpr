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
  Attr: integer;
  //Msg: String;
begin
  {$IFDEF MSWINDOWS}
  {$WARN SYMBOL_PLATFORM OFF}
  ExePath := ExtractFilePath(ParamStr(0));
  if(ParamCount>=1) then
  begin
    ParamFile := ParamStr(1);
    // Если передан только один параметр - Директория или Файл
    // Если на файле не стоит атрибут Скрытый - файл обрабатываем,
    // чтобы снять атрибут "только для чтения", если таковой имеется
    // Устанавливаем для файла FILE_ATTRIBUTE_NORMAL
    // Всё остальное ложится на плечи stream.
    if(ParamCount = 1) then
    begin
      if(DirectoryExists(ParamFile)) then
      begin
        // Directory
        files := TDirectory.GetFiles(ParamFile, '*.*', TSearchOption.soAllDirectories);
        i := 0;
        for i := 0 to Length(files) - 1 do
        begin
          Attr := FileGetAttr(files[i]);
          if(Attr = (Attr and not FILE_ATTRIBUTE_HIDDEN)) then
          begin
            if(Attr = (Attr or FILE_ATTRIBUTE_READONLY)) then
            begin
              //Msg := Msg + files[i] + #10#13;
              FileSetAttr(files[i], FILE_ATTRIBUTE_NORMAL);
            end;
          end;
        end;
        Sleep(100);
        //MessageBox(0, PWideChar(Msg), 'Title', MB_ICONASTERISK);
        CmdChar := PWideChar('-d -s "' + ParamFile +'"');
        ShellExecute(0, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, 0);
      end;
      if(FileExists(ParamFile))then
      begin
        // File
        Attr := FileGetAttr(ParamFile);
        if(Attr = (Attr and not FILE_ATTRIBUTE_HIDDEN)) then
        begin
          FileSetAttr(ParamFile, FILE_ATTRIBUTE_NORMAL);
          Sleep(100);
          CmdChar := PWideChar('-d "' + ParamFile + '"');
          ShellExecute(0, 'open', PWideChar(ExePath +'streams.exe'), CmdChar, nil, 0);
        end;
      end;
    end else if(ParamCount > 1) then
    // Если передано два и более параметров.
    // Мы обрабатываем только два.
    // Первый - всегда Файл или директория
    // Второй - тип операции - TStringSet
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
