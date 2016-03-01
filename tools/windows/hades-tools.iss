; \file hades-tools.iss
; \brief Create a windows installer for hades tools
; \author marc dot pignat at hevs dot ch
;
; Tested with Inno Setup Compiler 5.5.5 (u)
;

; debug can be 1 for debugging and 0 for release
#define debug 0

#if debug == 1
#elif debug == 0
#else
#error debug should be 0 or 1
#endif

; Add -testing at the end of the file for debug versions (prevent releasing debug versions)
#if debug == 0
#define MyAppVersion GetDateTimeString('yyyy-mm-dd', '', '');
#else
#define MyAppVersion GetDateTimeString('yyyy-mm-dd', '', '') + "-testing";
#endif

#define MyAppName "hades"
#define MyAppPublisher "hevs.ch"
#define MyAppURL "http://hades.hevs.ch"
#define MyAppExeName "start.bat"

[Setup]
AppId={{24D93112-BE5C-4C3A-A1E2-F55B0EF50FB7}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName="Hades"
AllowNoIcons=yes
OutputDir=.\GeneratedSetup\
OutputBaseFilename=hades-tools-windows-{#MyAppVersion}
DirExistsWarning=no
DisableWelcomePage=yes
RestartIfNeededByRun=no

; Disable compression for debug builds
#if debug == 0
CompressionThreads=auto
Compression=lzma/ultra64
SolidCompression=yes
#else
Compression=none
#endif

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
DestDir: {app}; Source: input\hades_url_handler.vbs;
DestDir: {app}; Source: input\pageant.exe;
DestDir: {app}; Source: input\plink.exe;
DestDir: {app}; Source: input\putty.exe;
DestDir: {app}; Source: input\kitty.ini;
DestDir: {app}; Source: input\puttygen.exe;
DestDir: {app}; Source: input\vncviewer.exe;

[Icons]
Name: "{group}\Hades web interface"; Filename : "http://hades.hevs.ch/"
Name: "{group}\Hades documentation"; Filename : "http://hevs-isi.github.io/hades/"
Name: "{group}\Kitty"; Filename: "{app}\putty.exe"; Comment: "ssh client"
Name: "{group}\Pageant"; Filename: "{app}\pageant.exe"; Comment: "ssh key agent"
Name: "{group}\PuttyGen"; Filename: "{app}\puttygen.exe"; Comment: "ssh key pair generator"
Name: "{group}\Uninstall hades tools"; Filename: "{uninstallexe}"; Comment: "Guess what"

[Registry]
Root: HKCR; Subkey: "hadesvnc"; ValueType: "string"; ValueData: "hadesvnc Protocol"; Flags: uninsdeletekey
Root: HKCR; Subkey: "hadesvnc"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "hadesvnc\DefaultIcon"; ValueType: "string"; ValueData: "{app}\vncviewer.exe,0"
Root: HKCR; Subkey: "hadesvnc\shell\open\command"; ValueType: "string"; ValueData: """wscript.exe"" ""//NoLogo"" ""{app}\hades_url_handler.vbs"" ""%1"""

Root: HKCR; Subkey: "hadesssh"; ValueType: "string"; ValueData: "hadesssh Protocol"; Flags: uninsdeletekey
Root: HKCR; Subkey: "hadesssh"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "hadesssh\DefaultIcon"; ValueType: "string"; ValueData: "{app}\putty.exe,0"
Root: HKCR; Subkey: "hadesssh\shell\open\command"; ValueType: "string"; ValueData: """wscript.exe"" ""//NoLogo"" ""{app}\hades_url_handler.vbs"" ""%1"""

