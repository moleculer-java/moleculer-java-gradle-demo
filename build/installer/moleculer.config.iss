; --- INNO SETUP CONFIGURATION FILE FOR MOLECULER --- 

#define SetupVersion '1.0.0'
#define ProgramName  'Moleculer Demo Project'
#define CompanyName  'My Company'

[Setup]
AppId={{DC63DAD1-5818-4040-9BDE-0FE801D2555B}
OutputBaseFilename=moleculer_setup_{#SetupVersion}
DefaultDirName={pf}\{#ProgramName}
AppPublisherURL=http://www.company.com
AppName={#ProgramName}
AppVerName={#ProgramName} {#SetupVersion}
DefaultGroupName={#ProgramName} {#SetupVersion}
VersionInfoDescription={#ProgramName}
UninstallDisplayName={#ProgramName} {#SetupVersion}
VersionInfoCompany={#CompanyName}
AppPublisher={#CompanyName}
OutputDir=build\installer\dist
SourceDir=..\..
DisableProgramGroupPage=true
Compression=lzma2/ultra64
LZMAUseSeparateProcess=true
DisableStartupPrompt=true
AppVersion={#SetupVersion}
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: build\installer\bin\*; DestDir: {app}\bin;  Flags: recursesubdirs createallsubdirs replacesameversion 
Source: cfg\*;                 DestDir: {app}\cfg;  Flags: recursesubdirs createallsubdirs replacesameversion
Source: build\installer\jre\*; DestDir: {app}\jre;  Flags: recursesubdirs createallsubdirs replacesameversion 
Source: build\libs\*;          DestDir: {app}\lib;  Flags: recursesubdirs createallsubdirs replacesameversion 

[Dirs]
Name: "{app}\tmp"
Name: "{app}\log"

[Tasks]
Name: StartService; Description: Start Moleculer service; Flags: checkedonce

[Run]
Filename: {app}\bin\service-install.bat; WorkingDir: {app}\bin; StatusMsg: Installing service...
Filename: {app}\bin\service-start.bat; WorkingDir: {app}\bin; Tasks: StartService; StatusMsg: Starting service...

[UninstallRun]
Filename: {app}\bin\service-stop.bat; WorkingDir: {app}\bin; Flags: skipifdoesntexist; StatusMsg: Stopping service...
Filename: {app}\bin\Tomcat7.exe; Parameters: "//DS/MoleculerJava"; WorkingDir: {app}\bin; Flags: skipifdoesntexist; StatusMsg: Uninstalling service...

[Registry]
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Java; ValueType: string; ValueName: Jvm; ValueData: "{app}\jre\bin\server\jvm.dll"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Java; ValueType: string; ValueName: Classpath; ValueData: "{app}\cfg\;{app}\lib\*"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Java; ValueType: multisz; ValueName: Options; ValueData: "-Djava.net.preferIPv4Stack=true{break}-Djava.library.path={app}\bin{break}-Djava.io.tmpdir={app}\tmp{break}-Djava.util.logging.config.file={app}\cfg\logger\only-to-file.properties{break}-XX:MaxPermSize=256m{break}"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Java; ValueType: dword; ValueName: JvmMs; ValueData: 0
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Java; ValueType: dword; ValueName: JvmMx; ValueData: 900
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Java; ValueType: dword; ValueName: JvmSs; ValueData: 0

Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Log; ValueType: string; ValueName: Level; ValueData: "Info"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Log; ValueType: string; ValueName: Path; ValueData: "{app}\log"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Log; ValueType: string; ValueName: Prefix; ValueData: "service.runner"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Log; ValueType: string; ValueName: StdError; ValueData: "{app}\log\standard.error.log"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Log; ValueType: string; ValueName: StdOutput; ValueData: "{app}\log\standard.output.log"

Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Start; ValueType: string; ValueName: Class; ValueData: "services.moleculer.config.MoleculerRunner"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Start; ValueType: string; ValueName: WorkingPath; ValueData: "{app}"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Start; ValueType: string; ValueName: Mode; ValueData: "jvm"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Start; ValueType: multisz; ValueName: Params; ValueData: "/moleculer.config.xml"

Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Stop; ValueType: string; ValueName: Class; ValueData: "services.moleculer.config.MoleculerRunner"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Stop; ValueType: string; ValueName: WorkingPath; ValueData: "{app}"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Stop; ValueType: dword; ValueName: Timeout; ValueData: 15
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Stop; ValueType: string; ValueName: Mode; ValueData: "jvm"
Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava\Parameters\Stop; ValueType: multisz; ValueName: Params; ValueData: "stop"

Root: HKLM32; Subkey: SOFTWARE\Apache Software Foundation\Procrun 2.0\MoleculerJava; Flags: uninsdeletekey

[Languages]
Name: English; MessagesFile: compiler:Default.isl