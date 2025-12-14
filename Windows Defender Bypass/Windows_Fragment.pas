unit Windows_Fragment;

interface

uses
  Windows;

type
  POSVersionInfoA = ^TOSVersionInfoA;
  POSVersionInfoW = ^TOSVersionInfoW;
  POSVersionInfo = POSVersionInfoA;
  _OSVERSIONINFOA = record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
    dwBuildNumber: DWORD;
    dwPlatformId: DWORD;
    szCSDVersion: array[0..127] of AnsiChar; { Maintenance string for PSS usage }
    wServicePackMajor,
    wServicePackMinor,
    wSuiteMask : word;
    wProductType,
    wReserved : byte;
  end;
  {$EXTERNALSYM _OSVERSIONINFOA}
  _OSVERSIONINFOW = record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
    dwBuildNumber: DWORD;
    dwPlatformId: DWORD;
    szCSDVersion: array[0..127] of WideChar; { Maintenance string for PSS usage }
    wServicePackMajor,
    wServicePackMinor,
    wSuiteMask : word;
    wProductType,
    wReserved : byte;
  end;
  {$EXTERNALSYM _OSVERSIONINFOW}
  _OSVERSIONINFO = _OSVERSIONINFOA;
  TOSVersionInfoA = _OSVERSIONINFOA;
  TOSVersionInfoW = _OSVERSIONINFOW;
  TOSVersionInfo = TOSVersionInfoA;
  OSVERSIONINFOA = _OSVERSIONINFOA;
  {$EXTERNALSYM OSVERSIONINFOA}
  {$EXTERNALSYM OSVERSIONINFO}
  OSVERSIONINFOW = _OSVERSIONINFOW;
  {$EXTERNALSYM OSVERSIONINFOW}
  {$EXTERNALSYM OSVERSIONINFO}
  OSVERSIONINFO = OSVERSIONINFOA;

const
  {$EXTERNALSYM VERSIONINFOSIZEA}
  VERSIONINFOSIZEA = sizeof(TOSVersionInfoA) -
    (sizeof(word) * 3) - (sizeof(byte) * 2);
  {$EXTERNALSYM VERSIONINFOSIZEW}
  VERSIONINFOSIZEW = sizeof(TOSVersionInfoW) -
    (sizeof(word) * 3) - (sizeof(byte) * 2);
  {$EXTERNALSYM VERSIONINFOSIZE}
  VERSIONINFOSIZE = VERSIONINFOSIZEA;


const
  //
  // RtlVerifyVersionInfo() os product type values
  //
  VER_NT_WORKSTATION = $0000001;
  VER_NT_DOMAIN_CONTROLLER = $0000002;
  VER_NT_SERVER = $0000003;

  VER_SERVER_NT = $80000000;
  VER_WORKSTATION_NT = $40000000;
  VER_SUITE_SMALLBUSINESS = $00000001;
  VER_SUITE_ENTERPRISE = $00000002;
  VER_SUITE_BACKOFFICE = $00000004;
  VER_SUITE_COMMUNICATIONS = $00000008;
  VER_SUITE_TERMINAL = $00000010;
  VER_SUITE_SMALLBUSINESS_RESTRICTED = $00000020;
  VER_SUITE_EMBEDDEDNT = $00000040;
  VER_SUITE_DATACENTER = $00000080;
  VER_SUITE_SINGLEUSERTS = $00000100;
  VER_SUITE_PERSONAL = $00000200;
  VER_SUITE_BLADE = $00000400;
  VER_SUITE_EMBEDDED_RESTRICTED = $00000800;
  VER_SUITE_SECURITY_APPLIANCE = $00001000;




function GetVersionExA(var lpVersionInformation: TOSVersionInfo): BOOL; stdcall;
{$EXTERNALSYM GetVersionExA}
function GetVersionExW(var lpVersionInformation: TOSVersionInfo): BOOL; stdcall;
{$EXTERNALSYM GetVersionExW}
function GetVersionEx(var lpVersionInformation: TOSVersionInfo): BOOL; stdcall;
{$EXTERNALSYM GetVersionEx}

implementation

function GetVersionExA; external kernel32 name 'GetVersionExA';
function GetVersionExW; external kernel32 name 'GetVersionExW';
function GetVersionEx; external kernel32 name 'GetVersionExA';

end.