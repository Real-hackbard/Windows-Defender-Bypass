unit Unit1;

interface

uses
  Windows, Winapi.Messages, SysUtils, Vcl.ComCtrls, Vcl.Controls,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Variants, Graphics, Forms,
  Dialogs, jpeg, Registry, Vcl.Buttons, ShellApi, Menus, ShlObj,
  Windows_Fragment, TlHelp32, IniFiles;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label11: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox13: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox5: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox25: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    Label12: TLabel;
    StatusBar1: TStatusBar;
    Label21: TLabel;
    Panel2: TPanel;
    Image3: TImage;
    Memo1: TMemo;
    Label22: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure JumpToKey(Key: string);
    procedure WriteOptions;
    procedure ReadOptions;
    procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  mHandle: THandle;
  TIF : TIniFile;

implementation

{$R *.dfm}
{$R 'admin.res'}
// application path
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
     WriteBool(OPT,'KillDefenderSmartScreenON',CheckBox13.Checked);
     WriteBool(OPT,'KillDefenderSmartScreenOFF',CheckBox12.Checked);
     WriteBool(OPT,'ExecuteKillTaskSFC',CheckBox4.Checked);
     WriteBool(OPT,'ExecuteSFC',CheckBox5.Checked);
     WriteBool(OPT,'DeactivateService',CheckBox6.Checked);
     WriteBool(OPT,'ActivateService',CheckBox9.Checked);
     WriteBool(OPT,'DeactivateWdNisSvc',CheckBox7.Checked);
     WriteBool(OPT,'ActivateWdNisSvc',CheckBox10.Checked);
     WriteBool(OPT,'KeepaliveOFF',CheckBox8.Checked);
     WriteBool(OPT,'KeepaliveON',CheckBox11.Checked);
     WriteBool(OPT,'RealTimeMonitoringOFF',CheckBox14.Checked);
     WriteBool(OPT,'RealTimeMonitoringON',CheckBox15.Checked);
     WriteBool(OPT,'RealTimeProtectionOFF',CheckBox17.Checked);
     WriteBool(OPT,'RealTimeProtectionON',CheckBox18.Checked);
     WriteBool(OPT,'SecurityHealthServiceOFF',CheckBox19.Checked);
     WriteBool(OPT,'SecurityHealthServiceON',CheckBox20.Checked);
     WriteBool(OPT,'TamperProtectionOFF',CheckBox21.Checked);
     WriteBool(OPT,'TamperProtectionON',CheckBox22.Checked);
     WriteBool(OPT,'UpdateON',CheckBox24.Checked);
     WriteBool(OPT,'UpdateOFF',CheckBox25.Checked);
     WriteInteger(OPT,'OS',RadioGroup1.ItemIndex);
     WriteBool(OPT,'BypassManipulateProtection',CheckBox3.Checked);
     WriteBool(OPT,'BypassTrustedInstallerRights',CheckBox23.Checked);
     Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
  TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
  with TIF do
    begin
      CheckBox13.Checked:=ReadBool(OPT,'KillDefenderSmartScreenON',CheckBox13.Checked);
      CheckBox12.Checked:=ReadBool(OPT,'KillDefenderSmartScreenOFF',CheckBox12.Checked);
      CheckBox4.Checked:=ReadBool(OPT,'ExecuteKillTaskSFC',CheckBox4.Checked);
      CheckBox5.Checked:=ReadBool(OPT,'ExecuteSFC',CheckBox5.Checked);
      CheckBox6.Checked:=ReadBool(OPT,'DeactivateService',CheckBox6.Checked);
      CheckBox9.Checked:=ReadBool(OPT,'ActivateService',CheckBox9.Checked);
      CheckBox7.Checked:=ReadBool(OPT,'DeactivateWdNisSvc',CheckBox7.Checked);
      CheckBox10.Checked:=ReadBool(OPT,'ActivateWdNisSvc',CheckBox10.Checked);
      CheckBox8.Checked:=ReadBool(OPT,'KeepaliveOFF',CheckBox8.Checked);
      CheckBox11.Checked:=ReadBool(OPT,'KeepaliveON',CheckBox11.Checked);
      CheckBox14.Checked:=ReadBool(OPT,'RealTimeMonitoringOFF',CheckBox14.Checked);
      CheckBox15.Checked:=ReadBool(OPT,'RealTimeMonitoringON',CheckBox15.Checked);
      CheckBox17.Checked:=ReadBool(OPT,'RealTimeProtectionOFF',CheckBox17.Checked);
      CheckBox18.Checked:=ReadBool(OPT,'RealTimeProtectionON',CheckBox18.Checked);
      CheckBox19.Checked:=ReadBool(OPT,'SecurityHealthServiceOFF',CheckBox19.Checked);
      CheckBox20.Checked:=ReadBool(OPT,'SecurityHealthServiceON',CheckBox20.Checked);
      CheckBox21.Checked:=ReadBool(OPT,'TamperProtectionOFF',CheckBox21.Checked);
      CheckBox22.Checked:=ReadBool(OPT,'TamperProtectionON',CheckBox22.Checked);
      CheckBox24.Checked:=ReadBool(OPT,'UpdateON',CheckBox24.Checked);
      CheckBox25.Checked:=ReadBool(OPT,'UpdateOFF',CheckBox25.Checked);
      RadioGroup1.ItemIndex:=ReadInteger(OPT,'OS',RadioGroup1.ItemIndex);
      CheckBox3.Checked:=ReadBool(OPT,'BypassManipulateProtection',CheckBox3.Checked);
      CheckBox23.Checked:=ReadBool(OPT,'BypassTrustedInstallerRights',CheckBox23.Checked);
      Free;
    end;
  end;
end;

function IsWindows64: Boolean;
type
  TIsWow64Process = function(Handle: Windows.THandle; var Res: Windows.BOOL):
        Windows.BOOL; stdcall;
var
  IsWow64Result: Windows.BOOL;
  IsWow64Process: TIsWow64Process;
begin
  IsWow64Process := Windows.GetProcAddress(
    Windows.GetModuleHandle('kernel32'), 'IsWow64Process');

  if Assigned(IsWow64Process) then
  begin
    if not IsWow64Process(
      Windows.GetCurrentProcess, IsWow64Result) then
      raise SysUtils.Exception.Create('IsWindows64: bad process handle');
    Result := IsWow64Result;
  end
  else
    Result := False;
end;

function AddAccessRights(lpszFileName : PChar; lpszAccountName : PChar;
                         dwAccessMask : DWORD) : boolean;
const
   HEAP_ZERO_MEMORY = $00000008;
   ACL_REVISION = 2;
   ACL_REVISION2 = 2;
   INHERITED_ACE = $10;

type
   ACE_HEADER = Record
      AceType,
      AceFlags : BYTE;
      AceSize : WORD;
   end;

   PACE_HEADER = ^ACE_HEADER;
   ACCESS_ALLOWED_ACE = Record
      Header : ACE_HEADER;
      Mask : ACCESS_MASK;
      SidStart : DWORD;
   end;

   PACCESS_ALLOWED_ACE = ^ACCESS_ALLOWED_ACE;

   ACL_SIZE_INFORMATION = Record
      AceCount,
      AclBytesInUse,
      AclBytesFree : DWORD;
   end;

   SetSecurityDescriptorControlFnPtr = function (pSecurityDescriptor : PSecurityDescriptor;
                                                 ControlBitsOfInterest : SECURITY_DESCRIPTOR_CONTROL;
                                                 ControlBitsToSet : SECURITY_DESCRIPTOR_CONTROL) : boolean; stdcall;

var
   snuType : SID_NAME_USE;
   szDomain : PChar;
   cbDomain : DWORD;
   pUserSID : Pointer;
   cbUserSID : DWORD;
   pFileSD : PSecurityDescriptor;
   cbFileSD : DWORD;
   newSD : TSecurityDescriptor;
   ptrACL : PACL;
   fDaclPresent,
   fDaclDefaulted : BOOL;
   AclInfo : ACL_SIZE_INFORMATION;
   pNewACL : PACL;
   cbNewACL : DWORD;
   pTempAce : Pointer;
   CurrentAceIndex,
   newAceIndex : UINT;
   fResult,
   fAPISuccess : boolean;
   secInfo : SECURITY_INFORMATION;
   _SetSecurityDescriptorControl : SetSecurityDescriptorControlFnPtr;
   controlBitsOfInterest,
   controlBitsToSet,
   oldControlBits : SECURITY_DESCRIPTOR_CONTROL;
   dwRevision : DWORD;
   AceFlags : BYTE;

function myheapalloc(x : integer) : Pointer;
begin
   Result := HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, x);
end;

function myheapfree(x : Pointer) : boolean;
begin
   Result := HeapFree(GetProcessHeap(), 0, x);
end;

function SetFileSecurityRecursive(lpFileName: PChar; SecurityInformation: SECURITY_INFORMATION;
                                 pSecurityDescriptor: PSecurityDescriptor): BOOL;
var
  sr : TSearchRec;
begin
  Result := SetFileSecurity(lpFileName, SecurityInformation, pSecurityDescriptor);
  if Not Result then  Exit;
  if (FileGetAttr(lpFileName) AND faDirectory) = faDirectory then
    begin
     if FindFirst(IncludeTrailingPathDelimiter(lpFileName) + '*', $EFFF, sr) = 0 then
       begin
        Repeat
         if (sr.Name <> '.') AND (sr.Name <> '..') then
            SetFileSecurityRecursive(PChar(IncludeTrailingPathDelimiter(lpFileName) + sr.Name),
                                     SecurityInformation, pSecurityDescriptor);
        until FindNext(sr) <> 0;
        FindClose(sr);
       end;
    end;
end;

begin
   szDomain := nil;
   cbDomain := 0;
   pUserSID := nil;
   cbUserSID := 0;
   pFileSD := nil;
   cbFileSD := 0;
   ptrACL := nil;
   pNewACL := nil;
   cbNewACL := 0;
   pTempAce := nil;
   CurrentAceIndex := 0;
   newAceIndex := 0;
   fResult := FALSE;
   secInfo := DACL_SECURITY_INFORMATION;
   _SetSecurityDescriptorControl := nil;
   Result := FALSE;
   try
      fAPISuccess := LookupAccountName(nil, lpszAccountName,
            pUserSID, cbUserSID, szDomain, cbDomain, snuType);
      if (Not fAPISuccess) AND (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
         raise Exception.Create('LookupAccountName Error=' + IntToStr(GetLastError()));

      pUserSID := myheapalloc(cbUserSID);
      if pUserSID = nil then
         raise Exception.Create('myheapalloc Error=' + IntToStr(GetLastError()));

      szDomain := PChar(myheapalloc(cbDomain * sizeof(PChar)));
      if szDomain = nil then
         raise Exception.Create('myheapalloc Error=' + IntToStr(GetLastError()));

      fAPISuccess := LookupAccountName(nil, lpszAccountName,
            pUserSID, cbUserSID, szDomain, cbDomain, snuType);
      if Not fAPISuccess then
         raise Exception.Create('LookupAccountName Error=' + IntToStr(GetLastError()));

      fAPISuccess := GetFileSecurity(lpszFileName,
            secInfo, pFileSD, 0, cbFileSD);
      if (Not fAPISuccess) AND (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
         raise Exception.Create('GetFileSecurity Error=' + IntToStr(GetLastError()));

      pFileSD := myheapalloc(cbFileSD);
      if pFileSD = nil then
         raise Exception.Create('myheapalloc Error=' + IntToStr(GetLastError()));

      fAPISuccess := GetFileSecurity(lpszFileName,
            secInfo, pFileSD, cbFileSD, cbFileSD);
      if Not fAPISuccess then
         raise Exception.Create('GetFileSecurity Error=' + IntToStr(GetLastError()));

      if Not InitializeSecurityDescriptor(@newSD,
            SECURITY_DESCRIPTOR_REVISION) then
         raise Exception.Create('InitializeSecurityDescriptor Error=' + IntToStr(GetLastError()));

      if Not GetSecurityDescriptorDacl(pFileSD, fDaclPresent, ptrACL,
            fDaclDefaulted) then
         raise Exception.Create('GetSecurityDescriptorDacl Error=' + IntToStr(GetLastError()));

      AclInfo.AceCount := 0; 
      AclInfo.AclBytesFree := 0;
      AclInfo.AclBytesInUse := sizeof(ACL);
      if ptrACL = nil then fDaclPresent := FALSE;
      if Not fDaclPresent then
         if Not GetAclInformation(ptrACL^, @AclInfo,
               sizeof(ACL_SIZE_INFORMATION), AclSizeInformation) then
            raise Exception.Create('GetAclInformation ' + IntToStr(GetLastError()));

      cbNewACL := AclInfo.AclBytesInUse + sizeof(ACCESS_ALLOWED_ACE)
                + GetLengthSid(pUserSID) - sizeof(DWORD);
      pNewACL := PACL(myheapalloc(cbNewACL));
      if pNewACL = nil then
         raise Exception.Create('myheapalloc ' + IntToStr(GetLastError()));

      if Not InitializeAcl(pNewACL^, cbNewACL, ACL_REVISION2) then
         raise Exception.Create('InitializeAcl ' + IntToStr(GetLastError()));

      newAceIndex := 0;
      if (fDaclPresent) AND (AclInfo.AceCount > 0) then
        begin
         for CurrentAceIndex := 0 to AclInfo.AceCount - 1 do
           begin
            if Not GetAce(ptrACL^, CurrentAceIndex, pTempAce) then
               raise Exception.Create('GetAce ' + IntToStr(GetLastError()));

            if PACCESS_ALLOWED_ACE(pTempAce)^.Header.AceFlags AND INHERITED_ACE > 0 then
               break;
            if EqualSid(pUserSID, @(PACCESS_ALLOWED_ACE(pTempAce)^.SidStart)) then
               continue;
            if Not AddAce(pNewACL^, ACL_REVISION, MAXDWORD, pTempAce,
                  PACE_HEADER(pTempAce)^.AceSize) then
               raise Exception.Create('AddAce ' + IntToStr(GetLastError()));

            Inc(newAceIndex);
           end;
        end;
      AceFlags := $1   (* OBJECT_INHERIT_ACE *)
               OR $2   (* CONTAINER_INHERIT_ACE *)
               OR $10  (* INHERITED_ACE*);

      if Not AddAccessAllowedAceEx(pNewACL^, ACL_REVISION2, AceFlags, dwAccessMask,
               pUserSID) then
         raise Exception.Create('AddAccessAllowedAce ' + IntToStr(GetLastError()));

      if (fDaclPresent) AND (AclInfo.AceCount > 0) then
        begin
         while CurrentAceIndex < AclInfo.AceCount do
           begin
            if Not GetAce(ptrACL^, CurrentAceIndex, pTempAce) then
               raise Exception.Create('GetAce ' + IntToStr(GetLastError()));

            if Not AddAce(pNewACL^, ACL_REVISION, MAXDWORD, pTempAce,
                  PACE_HEADER(pTempAce)^.AceSize) then
               raise Exception.Create('AddAce ' + IntToStr(GetLastError()));

           end;
           Inc(CurrentAceIndex);
        end;
      if Not SetSecurityDescriptorDacl(@newSD, TRUE, pNewACL, FALSE) then
         raise Exception.Create('SetSecurityDescriptorDacl ' + IntToStr(GetLastError()));

      _SetSecurityDescriptorControl := SetSecurityDescriptorControlFnPtr(
                                          GetProcAddress(GetModuleHandle('advapi32.dll'),
                                                         'SetSecurityDescriptorControl'));
      if @_SetSecurityDescriptorControl <> nil then
        begin
         controlBitsOfInterest := 0;
         controlBitsToSet := 0;
         oldControlBits := 0;
         dwRevision := 0;

         if Not GetSecurityDescriptorControl(pFileSD, oldControlBits,
                  dwRevision) then
            raise Exception.Create('GetSecurityDescriptorControl ' + IntToStr(GetLastError()));

         if (oldControlBits AND SE_DACL_AUTO_INHERITED) <> 0 then
           begin
            controlBitsOfInterest := SE_DACL_AUTO_INHERIT_REQ OR SE_DACL_AUTO_INHERITED;
            controlBitsToSet := controlBitsOfInterest;
           end
         else if (oldControlBits AND SE_DACL_PROTECTED) <> 0 then
           begin
            controlBitsOfInterest := SE_DACL_PROTECTED;
            controlBitsToSet := controlBitsOfInterest;
           end;

         if controlBitsOfInterest <> 0 then
            if Not _SetSecurityDescriptorControl(@newSD, controlBitsOfInterest, controlBitsToSet) then
               raise Exception.Create('SetSecurityDescriptorControl ' + IntToStr(GetLastError()));
        end;
      // if Not SetFileSecurity(lpszFileName, secInfo, @newSD) then
      if Not SetFileSecurityRecursive(lpszFileName, secInfo, @newSD) then
         raise Exception.Create('SetFileSecurity ' + IntToStr(GetLastError()));

   except
      on E: Exception do
       begin
         MessageDlg(E.Message, mtError, [mbAbort], -1);
         // WriteLog(ltError, Format('AddAccessRights: When changing the permissions on the directory ''%s'' for ''%s'' An error has occurred. %s',
         // [lpszFileName, lpszAccountName, E.Message]), []);
         Exit;
       end;
   end;
   if pUserSID <> nil then myheapfree(pUserSID);
   if szDomain <> nil then myheapfree(szDomain);
   if pFileSD <> nil then myheapfree(pFileSD);
   if pNewACL <> nil then myheapfree(pNewACL);
   fResult := TRUE;
end;

(* Disabling UAC can have serious security implications, as it will no
   longer prompt for elevated privileges when applications need them,
   potentially allowing malicious software to run with administrator
   rights without your consent. It is highly recommended to re-enable
   UAC after you have completed the task for which you temporarily disabled it.*)
procedure UAC(bTF: Boolean);
var
  reg: TRegistry;
begin
  try
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SOFTWARE', True);
    reg.OpenKey('Microsoft', True);
    reg.OpenKey('Windows', True);
    reg.OpenKey('CurrentVersion', True);
    reg.OpenKey('Policies', True);
    reg.OpenKey('System', True);

    if bTF = True then
    begin
      reg.WriteInteger('EnableLUA', 0);
    end else
    if bTF = False then
    begin
    reg.WriteInteger('EnableLUA', 1);
    end;

  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

procedure DisableAntiSpyware(bTF: Boolean);
var
  reg: TRegistry;
begin
  // To disable AntiSpyware (Windows Defender) via the registry,
  try
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SOFTWARE', True);
    reg.OpenKey('Policies', True);
    reg.OpenKey('Microsoft', True);
    reg.OpenKey('Windows Defender', True);

    if bTF = True then
    begin
      reg.WriteInteger('DisableAntiSpyware', 0);
    end else if bTF = False then
    begin
      reg.WriteInteger('DisableAntiSpyware', 1);
    end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
  // AntiSpyware

   /// RealTimeMonotoring
   if (Form1.CheckBox14.Checked = true) or (Form1.CheckBox15.Checked = true) then
   begin
     try
     // To disable Windows Real-Time Monitoring via the registry
       reg := TRegistry.Create;
       reg.RootKey := HKEY_LOCAL_MACHINE;
       reg.OpenKey('SOFTWARE', True);
       reg.OpenKey('Policies', True);
       reg.OpenKey('Microsoft', True);
       reg.OpenKey('Windows Defender', True);

       if bTF = True then
       begin
        reg.WriteInteger('DisableRealtimeMonitoring', 0);
       end else if bTF = False then
       begin
        reg.WriteInteger('DisableRealtimeMonitoring', 1);
       end;

     finally
      reg.CloseKey;
      reg.Free;
     end;
   end;
   /// RealTimeMonotoring

   /// Service
   if (Form1.CheckBox6.Checked = true) or (Form1.CheckBox9.Checked = true) then
   begin
    try
    (* The Windows Registry settings for controlling TCP/IP keep-alive
       behavior are primarily located under the Tcpip\Parameters key.
       These settings affect the entire operating system's TCP stack and
       are used by applications that enable the SO_KEEPALIVE socket option.*)
     reg := TRegistry.Create;
     reg.RootKey := HKEY_LOCAL_MACHINE;
     reg.OpenKey('SOFTWARE', True);
     reg.OpenKey('Policies', True);
     reg.OpenKey('Microsoft', True);
     reg.OpenKey('Windows Defender', True);

     if bTF = True then
     begin
      reg.WriteInteger('ServiceKeepAlive', 0);
      end else if bTF = False then
     begin
      reg.WriteInteger('ServiceKeepAlive', 1);
     end;
    finally
      reg.CloseKey;
      reg.Free;
     end;
    end;
   /// Service

   /// WdNisSvc
   if (Form1.CheckBox7.Checked = true) or (Form1.CheckBox10.Checked = true)
   then
   begin
    try
    (* The WdNisSvc service, which stands for Windows Defender Antivirus
       Network Inspection Service, has its primary registry information
       located under the HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\
       WdNisSvc key.*)
     reg := TRegistry.Create;
     reg.RootKey := HKEY_LOCAL_MACHINE;
     reg.OpenKey('SYSTEM', True);
     reg.OpenKey('CurrentControlSet', True);
     reg.OpenKey('Services', True);
     reg.OpenKey('WdNisSvc', True);

     if bTF = True then
     begin
      reg.WriteInteger('Start', 3);
     end else if bTF = False then
     begin
      reg.WriteInteger('Start', 2);
     end;
    finally
     reg.CloseKey;
     reg.Free;
    end;
   end;
   /// WdNisSvc

   /// WinDefend
   if (Form1.CheckBox8.Checked = true) or (Form1.CheckBox11.Checked = true)
   then
   begin
    try
    (* WinDefend (Microsoft Defender Antivirus) registry info lives
       primarily under HKLM\SOFTWARE\Microsoft\Windows Defender and related
       paths, controlling settings like exclusions, features
       (e.g., DisableAntiSpyware), and service configurations,
       but directly editing is risky.*)
     reg := TRegistry.Create;
     reg.RootKey := HKEY_LOCAL_MACHINE;
     reg.OpenKey('SYSTEM', True);
     reg.OpenKey('CurrentControlSet', True);
     reg.OpenKey('Services', True);
     reg.OpenKey('WinDefend', True);

     if bTF = True then
     begin
      reg.WriteInteger('Start', 3);
     end else if bTF = False then
     begin
      reg.WriteInteger('Start', 2);
     end;
    finally
      reg.CloseKey;
      reg.Free;
    end;
   end;
   /// WinDefend

   /// RealTimeProtection
   if (Form1.CheckBox17.Checked = true) or (Form1.CheckBox18.Checked = true)
   then
   begin
    try
     reg := TRegistry.Create;
     reg.RootKey := HKEY_LOCAL_MACHINE;

     (* Real-Time Protection (RTP) for Windows Defender is managed through
        specific registry keys, primarily under
        HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection,
        where values like DisableRealtimeMonitoring (DWORD) control its state.*)
      if bTF = True then
      begin
       with Reg Do begin
          try
            OpenKey('\SOFTWARE\Policies\Microsoft\Windows Defender\',false);
            if not KeyExists('Real-Time Protection') then
            CreateKey('Real-Time Protection');
            CloseKey;
          except
          end;
       end;
      end;

      reg.OpenKey('SOFTWARE', True);
      reg.OpenKey('Policies', True);
      reg.OpenKey('Microsoft', True);
      reg.OpenKey('Windows Defender', True);
      reg.OpenKey('Real-Time Protection', True);

      (* The registry key used to control the real-time monitoring feature of
      Microsoft Defender Antivirus is DisableRealtimeMonitoring.*)
      if bTF = True then
      begin
        reg.WriteInteger('DisableRealtimeMonitoring', 0);
      end else if bTF = False then
      begin
        reg.WriteInteger('DisableRealtimeMonitoring', 1);
        reg.Rootkey := HKEY_LOCAL_MACHINE;
        reg.DeleteKey('\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection');
      end;
    finally
      reg.CloseKey;
      reg.Free;
    end;
   end;
   /// RealTimeProtection

   /// SecurityHealthService
   if (Form1.CheckBox19.Checked = true) or (Form1.CheckBox20.Checked = true) then
   begin
   (* SecurityHealthService.exe is the core process for the Windows Security
      app, residing at C:\Windows\system32\, and its registry info
      (e.g., HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService)
      controls its startup (usually Start value of 2 or 3 for Automatic/Manual),
      linking to the wscsvc service for real-time protection status, and
      while generally safe, registry tweaks can fix issues like blank security
      screens but require caution and backups.*)
    try
    reg := TRegistry.Create; reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SYSTEM', True);
    reg.OpenKey('ControlSet001', True);
    reg.OpenKey('Services', True);
    reg.OpenKey('SecurityHealthService', True);

    if bTF = True then
    begin
      reg.WriteInteger('Start', 4);
      end else if bTF = False then
     begin
     reg.WriteInteger('Start', 2);
     end;
     reg.CloseKey;
     reg.Free;

      reg := TRegistry.Create;
      reg.RootKey := HKEY_LOCAL_MACHINE;
      reg.OpenKey('SYSTEM', True);
      reg.OpenKey('ControlSet', True);
      reg.OpenKey('Services', True);
      reg.OpenKey('SecurityHealthService', True);

      if bTF = True then
      begin
        reg.WriteInteger('Start', 4);
        end else if bTF = False then
      begin
        reg.WriteInteger('Start', 2);
      end;
    finally
      reg.CloseKey;
      reg.Free;
    end;
   end;
   /// SecurityHealthService

   /// TamperProtection
   if (Form1.CheckBox21.Checked = true) or (Form1.CheckBox22.Checked = true) then
   begin
    try
    (* Tamper Protection in Windows Defender safeguards critical security
       settings (like exclusions, real-time protection) from unauthorized
       changes, even through the registry, by reverting modifications or
       blocking them entirely; specific keys exist for checking managed
       status (HKLM\SOFTWARE\Microsoft\Windows Defender), but directly
       altering tamper-protected settings via registry is blocked unless
       you're an admin using Intune/ConfigMgr or temporarily disabling
       it via Troubleshooting Mode.*)
     reg := TRegistry.Create;
     reg.RootKey := HKEY_LOCAL_MACHINE;
     reg.OpenKey('SOFTWARE', True);
     reg.OpenKey('Microsoft', True);
     reg.OpenKey('Windows Defender', True);
     reg.OpenKey('Features', True);

     if bTF = True then
     begin
      reg.WriteInteger('TamperProtection', 0);
      end else if bTF = False then
     begin
     reg.WriteInteger('TamperProtection', 5);
     end;
    finally
     reg.CloseKey;
     reg.Free;
    end;
   end;
   /// TamperProtection

  /// Defender Update
   if (Form1.CheckBox24.Checked = true) or (Form1.CheckBox25.Checked = true) then
   begin
    try
      reg := TRegistry.Create;
      reg.RootKey := HKEY_LOCAL_MACHINE;
      reg.OpenKey('SOFTWARE', True);
      reg.OpenKey('Policies', True);
      reg.OpenKey('Microsoft', True);
      reg.OpenKey('Windows Defender', True);

      if bTF = True then
      begin
        reg.WriteInteger('DisableRealtimeMonitoring', 0);
        end else if
        bTF = False then
      begin
        reg.WriteInteger('DisableRealtimeMonitoring', 1);
      end;
    finally
      reg.CloseKey;
      reg.Free;
      end;
    end;
   /// Defender Update
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));

     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

(* In Delphi, you can implement a function called IsExeRunning (or similar)
   to check if a specific executable file (EXE) is currently running.
   This function typically uses the Windows API, specifically functions
   from the TlHelp32 unit, to take a snapshot of running processes
   and scan through them.*)
function IsExeRunning(const AExeName: string): boolean;
var
  h : THandle;
  p : TProcessEntry32;
begin
  Result := False;
  p.dwSize := SizeOf(p);
  h := CreateToolHelp32Snapshot(TH32CS_SnapProcess, 0);
  try
    Process32First(h, p);
    repeat
      Result := AnsiUpperCase(AExeName) = AnsiUpperCase(p.szExeFile);
    until Result or (not Process32Next(h, p));
  finally
    CloseHandle(h);
  end;
end;

function EditionID: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      // Windows Edition ID (such as Home, Pro, Enterprise) and Version (e.g. 22H2)
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
          Result := Reg.ReadString('EditionID');
          Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  except
  end;
end;

function BuildLabEx: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
    (* BuildLabEx is an extended Windows build number that contains
       specific internal information about the Windows build, often used
       in Insider Previews or development releases to determine
       the exact iteration.*)
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
        Result := Reg.ReadString('BuildLabEx');
        Reg.CloseKey;
      end;
    finally
    Reg.Free;
    end;
  except
  end;
end;

function BuildLab: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
        Result := Reg.ReadString('BuildLab');
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  except
  end;
end;

function ReleaseID: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
    // Windows ReleaseID is an internal identifier for a specific version.
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
        Result := Reg.ReadString('ReleaseID');
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  except
  end;
end;

function CurrentVersion: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
    (* The CurrentVersion registry key in the Windows registry stores
       important configuration information about the installed operating
       system and application-specific settings.*)
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
        Result := Reg.ReadString('CurrentVersion');
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  except
  end;
end;

function DisplayVersion: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
    (* The registry value DisplayVersion provides information about the
       installed feature update of your Windows operating system, often in
       the format YYHn (e.g., 21H2 or 22H2).*)
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
        Result := Reg.ReadString('DisplayVersion');
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  except
  end;
end;

function CurrentBuild: String;
var
  Reg: TRegistry;
begin
  Result := '';
  try
    Reg:= TRegistry.Create(KEY_READ);
    try
    (* The Windows CurrentBuild information refers to the specific build
       and revision number of the installed operating system, which is
       crucial for identifying the exact update level.*)
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
      begin
        Result := Reg.ReadString('CurrentBuild');
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
  except
  end;
end;

{ // This is the detection of older Windows systems VER_PLATFORM_WIN32_NT
function GetWinVersion: string;
var
  osvi : TOSVersionInfo;
  bOsVersionInfoEx : boolean;
  key : HKEY;
  szProductType : array[0..79]of char;
  dwBuflen : dword;
begin
  ZeroMemory(@osvi,sizeof(TOSVersionInfo));
  osvi.dwOSVersionInfoSize := sizeof(TOSVersionInfo);
  bOsVersionInfoEx := GetVersionEx(osvi);
  if(not bOsVersionInfoEx) then begin
    osvi.dwOSVersionInfoSize := VERSIONINFOSIZE;

    if(not GetVersionEx(osvi)) then begin
      Result := 'Error determining Windows Version!';
      exit;
    end;
  end;

  case osvi.dwPlatformId of
    VER_PLATFORM_WIN32_NT:
      begin
        if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 2) then
          Result := 'Microsoft Windows Server 2003 family, ';

        if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 1) then
          Result := 'Microsoft Windows XP ';

        if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 0) then
          Result := 'Microsoft Windows 2000 ';

        if(osvi.dwMajorVersion <= 4) then
          Result := 'Microsoft Windows NT ';

        if(bOsVersionInfoEx) then begin
          if(osvi.wProductType = VER_NT_WORKSTATION) then begin
            if(osvi.dwMajorVersion = 4) then
              Result := Result + 'Workstation 4.0 '
            else if(osvi.wSuiteMask and VER_SUITE_PERSONAL <> 0) then
              Result := Result + 'Home Edition '
            else
              Result := Result + 'Professional ';
          end
          else if(osvi.wProductType = VER_NT_SERVER) then begin
            if(osvi.dwMajorVersion = 5) and
              (osvi.dwMinorVersion = 2) then
            begin
              if(osvi.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                Result := Result + 'Datacenter Edition '
              else if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                Result := Result + 'Enterprise Edition '
              else if(osvi.wSuiteMask = VER_SUITE_BLADE) then
                Result := Result + 'Web Edition '
              else
                Result := Result + 'Standard Edition ';
            end
            else if(osvi.dwMajorVersion = 5) and
              (osvi.dwMinorVersion = 0) then
            begin
              if(osvi.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                Result := Result + 'Datacenter Server '
              else if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                Result := Result + 'Advanced Server '
              else
                Result := Result + 'Server ';
            end
            else begin
              if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                Result := Result + 'Server 4.0, Enterprise Edition '
              else
                Result := Result + 'Server 4.0 ';
            end;
          end
        end
        else begin
          dwBufLen := sizeof(szProductType);
          if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
            'SYSTEM\CurrentControlSet\Control\ProductOptions',0,
            KEY_QUERY_VALUE,key) = ERROR_SUCCESS) then
          try
            ZeroMemory(@szProductType,sizeof(szProductType));

            if(RegQueryValueEx(key,'ProductType',nil,nil,
              @szProductType,@dwBufLen) <> ERROR_SUCCESS) or
              (dwBufLen > sizeof(szProductType)) then
            ZeroMemory(@szProductType,sizeof(szProductType));
          finally
            RegCloseKey(key);
          end;

          if(lstrcmpi('WINNT',szProductType) = 0) then
            Result := Result + 'Workstation ';
          if(lstrcmpi('LANMANNT',szProductType) = 0) then
            Result := Result + 'Server ';
          if(lstrcmpi('SERVERNT',szProductType) = 0) then
            Result := Result + 'Advanced Server ';

          Result := Format('%s%d.%d',[Result,osvi.dwMajorVersion,
            osvi.dwMinorVersion]);
        end;

        if(osvi.dwMajorVersion = 4) and
          (lstrcmpi(osvi.szCSDVersion,'Service Pack 6') = 0) then
        begin
          if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
            'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Hotfix\Q246009',
            0,KEY_QUERY_VALUE,key) = ERROR_SUCCESS) then

            Result := Format('%sService Pack 6a (Build %d)',[Result,
              osvi.dwBuildNumber and $ffff])
          else
            Result := Format('%s%s (Build %d)',[Result,
              osvi.szCSDVersion,osvi.dwBuildNumber and $ffff]);
          RegCloseKey(key);
        end
        else begin
          Result := Format('%s%s (Build %d)',[Result,
            osvi.szCSDVersion,osvi.dwBuildNumber and $ffff]);
        end;
      end;
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        if(osvi.dwMajorVersion = 4) and
          (osvi.dwMinorVersion = 0) then
        begin
          Result := 'Microsoft Windows 95 ';
          if(osvi.szCSDVersion[0] = 'C') or
            (osvi.szCSDVersion[0] = 'B') then Result := Result + 'OSR2 ';
        end;

        if(osvi.dwMajorVersion = 4) and
          (osvi.dwMinorVersion = 10) then
        begin
          Result := 'Microsoft Windows 98 ';
          if(osvi.szCSDVersion[0] = 'A') then Result:= Result + 'SE ';
        end;

        if(osvi.dwMajorVersion = 4) and
          (osvi.dwMinorVersion = 90) then
        begin
          Result := 'Microsoft Windows Millennium Edition';
        end;
      end;
    VER_PLATFORM_WIN32s:
      Result := 'Microsoft Win32s';
  end;
end;
}
procedure TForm1.JumpToKey(Key: string);
var
  i, n: Integer;
  hWin: HWND;
  ExecInfo: ShellExecuteInfoA;
begin
  hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), nil);
  if hWin = 0 then
  begin
    FillChar(ExecInfo, 60, #0);
    with ExecInfo do
    begin
      cbSize := 60;
      fMask  := SEE_MASK_NOCLOSEPROCESS;
      lpVerb := PAnsiChar('open');
      lpFile := PAnsiChar('regedit.exe');
      nShow  := 1;
    end;
    ShellExecuteExA(@ExecInfo);
    WaitForInputIdle(ExecInfo.hProcess, 200);
    hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), nil);
  end;
  ShowWindow(hWin, SW_SHOWNORMAL);
  hWin := FindWindowExA(hWin, 0, PAnsiChar('SysTreeView32'), nil);
  SetForegroundWindow(hWin);
  i := 30;

  repeat
    SendMessageA(hWin, WM_KEYDOWN, VK_LEFT, 0);
    Dec(i);
  until i = 0;

  Sleep(300);
  SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
  Sleep(300);
  i := 1;
  n := Length(Key);

  repeat
    if Key[i] = '\' then
    begin
      SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
      Sleep(500);
    end
    else
      SendMessageA(hWin, WM_CHAR, Integer(Key[i]), 0);
    i := i + 1;
  until i = n;
end;

(* The functionality for determining the security identifier (SID) for
   the local administrators group must be manually implemented in Delphi
   using several Windows API functions, mainly from the Winapi.Windows unit.*)
function GetAdminSid: PSID;
const
  SECURITY_NT_AUTHORITY: TSIDIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5));
  SECURITY_BUILTIN_DOMAIN_RID: DWORD = $00000020;
  DOMAIN_ALIAS_RID_ADMINS: DWORD = $00000220;  
begin  
  Result := nil;  
  AllocateAndInitializeSid(SECURITY_NT_AUTHORITY, 2,  
    SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS,  
    0, 0, 0, 0, 0, 0, Result);  
end;

(* the simplest way to check if a program is running with administrator
   privileges is to use the IsUserAnAdmin() function from the
   Windows Shell API.*)
function IsAdmin: LongBool;  
var  
  TokenHandle: THandle;  
  ReturnLength: DWORD;  
  TokenInformation: PTokenGroups;  
  AdminSid: PSID;  
  Loop: Integer;  
begin  
  Result := False;  
  TokenHandle := 0;  
  if OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, TokenHandle) then  
  try  
    ReturnLength := 0;  
    GetTokenInformation(TokenHandle, TokenGroups, nil, 0, ReturnLength);  
    TokenInformation := GetMemory(ReturnLength);  
    if Assigned(TokenInformation) then  
    try  
      if GetTokenInformation(TokenHandle, TokenGroups, TokenInformation,  
        ReturnLength, ReturnLength) then  
      begin  
        AdminSid := GetAdminSid;  
        for Loop := 0 to TokenInformation^.GroupCount - 1 do  
        begin
          (* This is for older Delphi versions that are not compatible
             with the new VCL.*)
          //if EqualSid(TokenInformation^.Groups[Loop].Sid, AdminSid) then
          //begin
          //  Result := True;
          //  Break;
          //end;
        end;  
        FreeSid(AdminSid);  
      end;  
    finally  
      FreeMemory(TokenInformation);  
    end;  
  finally  
    CloseHandle(TokenHandle); 
 end;
end;

function GetUsername: String;
var
  Buffer: array[0..255] of Char;
  Size: DWord;
begin
  // get user name
  Size := SizeOf(Buffer);
  if not Windows.GetUserName(Buffer, Size) then
    RaiseLastOSError; 
  SetString(Result, Buffer, Size - 1);
end;

function MyExitWindows(RebootParam: Longword): Boolean;
var
  TTokenHd: THandle;
  TTokenPvg: TTokenPrivileges;
  cbtpPrevious: DWORD;
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD;
  tpResult: Boolean;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  // shutdown system
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      // with privilegs
      tpResult := LookupPrivilegeValue(nil,
                                       SE_SHUTDOWN_NAME,
                                       TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        Windows.AdjustTokenPrivileges(TTokenHd,
                                      False,
                                      TTokenPvg,
                                      cbtpPrevious,
                                      rTTokenPvg,
                                      pcbtpPreviousRequired);
    end;
  end;
    // reboot
  Result := ExitWindowsEx(RebootParam, 0);
end;

procedure TForm1.CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning: DWord;
 begin
   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;

           OemToAnsi(pBuffer, pBuffer);
           AMemo.Lines.Add(String(pBuffer));
         until (dRead < CReadBuffer);
       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;
     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var reg : TRegistry;
    Output, Errors: String;
    RC: Cardinal; tmp: TStringList;
begin
   Application.HintPause := 0;
   Application.HintHidePause := 50000;
   CheckBox13.Hint := 'SmartScreen Filter is a security feature developed ' + #13#10 +
                        'by Microsoft and built into the Windows operating ' + #13#10 +
                        'system and the Microsoft Edge web browser.';
   CheckBox12.Hint := 'SmartScreen Filter is a security feature developed ' + #13#10 +
                        'by Microsoft and built into the Windows operating ' + #13#10 +
                        'system and the Microsoft Edge web browser.';
   CheckBox4.Hint  := 'The sfc /scannow Command Scans all Protected System ' + #13#10 +
                       'Files and replaces the corrupted Files with a cached Copy.';
   CheckBox5.Hint  := 'The sfc /scannow Command Scans all Protected System ' + #13#10 +
                       'Files and replaces the corrupted Files with a cached Copy.';
   CheckBox6.Hint  := 'If you use a non-Microsoft Antivirus/Antimalware Product ' + #13#10 +
                       'on your Device, you may be able to run Microsoft Defender ' + #13#10 +
                       'Antivirus in passive mode along with this Antivirus solution.';
   CheckBox9.Hint  := 'If you use a non-Microsoft Antivirus/Antimalware Product ' + #13#10 +
                       'on your Device, you may be able to run Microsoft Defender ' + #13#10 +
                       'Antivirus in passive mode along with this Antivirus solution.';
   CheckBox7.Hint  := 'Microsoft Defender Antivirus Network Inspection Service is a ' + #13#10 +
                        'Win32 service. In Windows 10 it is starting only if the user, ' + #13#10 +
                        'an application or another service starts it.';
   CheckBox10.Hint := 'Microsoft Defender Antivirus Network Inspection Service is a ' + #13#10 +
                        'Win32 service. In Windows 10 it is starting only if the user, ' + #13#10 +
                        'an application or another service starts it.';
   CheckBox8.Hint  := 'This Policy Setting allows you to Configure whether or not ' + #13#10 +
                        'the Antimalware Service remains running when Antivirus and ' + #13#10 +
                        'Antispyware Security Intelligence is disabled.';
   CheckBox11.Hint := 'This Policy Setting allows you to Configure whether or not ' + #13#10 +
                        'the Antimalware Service remains running when Antivirus and ' + #13#10 +
                        'Antispyware Security Intelligence is disabled.';
   CheckBox14.Hint := 'This Policy Setting turns Off Real-Time Protection prompts ' + #13#10 +
                        'for known Malware Detection.';
   CheckBox15.Hint := 'This Policy Setting turns Off Real-Time Protection prompts ' + #13#10 +
                        'for known Malware Detection.';
   CheckBox3.Hint  := 'Microsoft prevents Users from Manipulating its ' + #13#10 +
                       'Security Software via the Registry. With this ' + #13#10 +
                       'Section you get around the Obstacle.';
   Button4.Hint    := 'Here you can Jump directly to the Windows Defender ' + #13#10 +
                     'Registry key.';
   Button1.Hint    := 'Reboots your System, close all Programs';
   Button2.Hint    := 'Reload Windows Defender Status!';
   CheckBox17.Hint := 'Starting with Windows 10 1703, Microsoft has expanded ' + #13#10 +
                        'Protection. Despite External Anti-Virus Software, Defender ' + #13#10 +
                        'remains Active in the background and also scans the ' + #13#10 +
                        'PC via Task planning.';
   CheckBox18.Hint := 'Starting with Windows 10 1703, Microsoft has expanded ' + #13#10 +
                        'Protection. Despite External Anti-Virus Software, Defender ' + #13#10 +
                        'remains Active in the background and also scans the ' + #13#10 +
                        'PC via Task planning.';
   CheckBox19.Hint := 'If she wants to disable the ' + #13#10 +
                        'Windows Defender Security Center Service (SecurityHealthService), ' + #13#10 +
                        'she will find everything "grayed out" under the Services.';
   CheckBox20.Hint := 'If she wants to disable the ' + #13#10 +
                        'Windows Defender Security Center Service (SecurityHealthService), ' + #13#10 +
                        'she will find everything "grayed out" under the Services.';
   CheckBox21.Hint := 'If you use an Antivirus Program such as: AVIRA, then the ' + #13#10 +
                        'Tamper Protection entry cannot be Manipulated. This function ' + #13#10 +
                        'needs "TrustedInstaller" Right.';
   CheckBox22.Hint := 'If you use an Antivirus Program such as: AVIRA, then the ' + #13#10 +
                        'Tamper Protection entry cannot be Manipulated. This function ' + #13#10 +
                        'needs "TrustedInstaller" Right.';
   CheckBox16.Hint := 'UAC uses Mandatory Integrity Control to Isolate Running Processes ' + #13#10 +
                        'with different Privileges. To reduce the possibility of Lower-Privilege ' + #13#10 +
                        'Applications communicating with Higher-Privilege ones.';
   CheckBox23.Hint := 'Windows System Files and the most Registry ' + #13#10 +
                        'Entries are owned by the User "TrustedInstaller".';

   CheckBox24.Hint := 'Microsoft continually updates security intelligence in ' + #13#10 +
                        'antimalware products to cover the latest threats and to ' + #13#10 +
                        'constantly tweak detection logic, enhancing the ability of ' + #13#10 +
                        'Microsoft Defender Antivirus and other Microsoft antimalware ' + #13#10 +
                        'solutions to accurately identify threats.';
   CheckBox25.Hint := 'Microsoft continually updates security intelligence in ' + #13#10 +
                        'antimalware products to cover the latest threats and to ' + #13#10 +
                        'constantly tweak detection logic, enhancing the ability of ' + #13#10 +
                        'Microsoft Defender Antivirus and other Microsoft antimalware ' + #13#10 +
                        'solutions to accurately identify threats.';

   Label15.Hint := 'Builds that were not built by the build lab machines, but are rather compiled by' + #13#10 +
                   'individual Microsoft employees, are called private builds. They are identified by having the' + #13#10 +
                   'VS_FF_PRIVATEBUILD file flag.' ;

   Label20.Hint := 'The EditionID is not the name for the Product version, ' + #13#10 +
                   'but for the Features included in the Windows version, ' + #13#10 +
                   'with Enterprise being the version with the most Features. ' + #13#10 +
                   '( Existing Fundamentals,  Management and Deployment,  Security).';

   Label16.Hint := 'The buildLabEx Version Info is another piece of Information ' + #13#10 +
                   'that quantifies how up-to-date the System is. In Windows 10, ' + #13#10 +
                   'it changes more frequently than in previous Systems.';


   CaptureConsoleOutput('cmd /c', 'wmic os get caption', Memo1);

   // get user name
   Caption:= 'Windows Defender Bypass : ' +  GetUsername;

   // check are you admin or not
   if IsAdmin then  begin
    StatusBar1.Panels[1].Text := 'You are Administrator';
   end else begin
    StatusBar1.Panels[1].Text := 'You are not Administrator';
   end;

   // check is windows a 64 bit system
   if IsWindows64 = true then begin
    Label6.Caption := Memo1.Lines[2] + '(x64)';
   end else begin
    Label6.Caption := Memo1.Lines[2] + '(x86)';
   end;

   Label7.Caption := CurrentBuild;
   Label8.Caption := DisplayVersion;
   Label9.Caption := CurrentVersion;
   Label10.Caption := ReleaseID;
   Label18.Caption := GetUsername;
   Label15.Caption := BuildLab;
   Label16.Caption := BuildLabEx;
   Label20.Caption := EditionID;

   (* This program is only compatible with Windows builds from version 1703
      onwards; everything below that is designed differently.*)
   // this checks your build is not under 1703
   if StrToInt(Label7.Caption) < 1703 then
   begin
    MessageBox(Form1.Handle,
    Pchar('Your System is older than the 1703 Current Build Version, you cannot use this Program on operated System.'),Pchar('OS Information'),
    MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_SETFOREGROUND + MB_TOPMOST);
    RadioButton1.Enabled := false; RadioButton2.Enabled := false;
    CheckBox3.Checked := false; CheckBox4.Checked := false;
    CheckBox5.Checked := false; CheckBox6.Checked := false;
    CheckBox7.Checked := false; CheckBox8.Checked := false;
    CheckBox9.Checked := false; CheckBox10.Checked := false;
    CheckBox11.Checked := false; CheckBox13.Checked := false;
    CheckBox14.Checked := false; CheckBox12.Checked := false;
    CheckBox15.Checked := false;
    
    CheckBox3.Enabled := false; CheckBox4.Enabled := false;
    CheckBox5.Enabled := false; CheckBox6.Enabled := false;
    CheckBox7.Enabled := false; CheckBox8.Enabled := false;
    CheckBox9.Enabled := false; CheckBox10.Enabled := false;
    CheckBox11.Enabled := false; CheckBox13.Enabled := false;
    CheckBox14.Enabled := false; CheckBox12.Enabled := false;
    CheckBox15.Enabled := false; CheckBox17.Enabled := false;
    CheckBox18.Enabled := false; CheckBox19.Enabled := false;
    CheckBox20.Enabled := false; CheckBox21.Enabled := false;
    CheckBox22.Enabled := false; CheckBox23.Enabled := false;
    CheckBox24.Enabled := false; CheckBox25.Enabled := false;
    RadioGroup1.Enabled := false;
   end;

   // check the smart screen.exe that operates as part of the defender
   if IsExeRunning('smartscreen.exe') then begin
    Label12.Caption := 'Windows Defender Smart Process is running.';
   end else begin
    Label12.Caption := 'Windows Defender Smart Process is not running.';
   end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  reg : TRegistry;
  ValueExists: Boolean;
begin
  ReadOptions;
  CheckBox3.OnClick(sender);
  CheckBox23.OnClick(sender);
  (* Here, the key value DisableAntiSpyware is checked
     for its existence. That is the main value of Windows Defender.*)
  try
      reg:= TRegistry.Create(KEY_ALL_ACCESS);
      reg.RootKey:= HKEY_LOCAL_MACHINE;
      if reg.OpenKey('SOFTWARE\Policies\Microsoft\Windows Defender', false) then
      begin
        try
        ValueExists := Reg.ValueExists('DisableAntiSpyware');

          if not ValueExists then
          begin
            Label11.Caption := 'The value "DisableAntiSpyware" was not found.';
            Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\off.jpg');
            Exit;
          end;

          if reg.ReadInteger('DisableAntiSpyware') = 0 then
            begin
              Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\off.jpg');
              Label11.Caption := 'Windows Defender Service is Deactivated.';
              StatusBar1.Panels[3].Text := 'Windows Defender Deactivated';
            end;

          if reg.ReadInteger('DisableAntiSpyware') = 1 then
            begin
              Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\on.jpg');
              Label11.Caption := 'Windows Defender Service is Activated.';
              StatusBar1.Panels[3].Text := 'Windows Defender Active';
            end;

        except
          on E: Exception do
            ShowMessage('No access to the registration : ' + E.Message);
        end;
      end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  IF MessageDlg('ATTENTION !'+#13+ 'System Reboot close all Programs, are you sure ? !',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
    BEGIN
      MyExitWindows(EWX_REBOOT);
    END;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  a : integer;
  reg : TRegistry;
begin
  try
  // Here, the UAC (User Account Control) status is checked.
   reg:= TRegistry.Create; reg.RootKey:= HKEY_LOCAL_MACHINE;
    if reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', false) then
    begin
      if reg.ValueExists('EnableLUA') then
      begin
          a := reg.ReadInteger('EnableLUA');
          if a = 0 then
          begin
            CheckBox16.Caption := 'Bypass UAC (UAC is disabled)';
            CheckBox16.Checked := true;
          end else begin
            CheckBox16.Caption := 'Bypass UAC (UAC is enabled)';
            CheckBox16.Checked := false;
          end;
          end;
      if not reg.ValueExists('EnableLUA') then
      begin
          CheckBox16.Caption := 'Bypass UAC (UAC Key not available)';
      end;
    end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 2 then
    begin
      CheckBox4.Checked := false;
      CheckBox5.Checked := false;
      CheckBox4.Enabled := false;
      CheckBox5.Enabled := false;

     (* If you are running a Windows Server version and click on it in the
        upper right corner, it will check your build version here; a version
        below 1803 is not supported.*)
     if StrToInt(Label7.Caption) < 1803 then begin
      MessageBox(Form1.Handle,
      Pchar('Your Windows Server System is older than the 1803 Current Build Version, you cannot use this Program on this System.'),Pchar('OS Information'),
      MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_SETFOREGROUND + MB_TOPMOST);
      RadioButton1.Enabled := false; RadioButton2.Enabled := false;
      CheckBox3.Checked := false; CheckBox4.Checked := false;
      CheckBox5.Checked := false; CheckBox6.Checked := false;
      CheckBox7.Checked := false; CheckBox8.Checked := false;
      CheckBox9.Checked := false; CheckBox10.Checked := false;
      CheckBox11.Checked := false; CheckBox13.Checked := false;
      CheckBox14.Checked := false; CheckBox12.Checked := false;
      CheckBox15.Checked := false;
      CheckBox3.Enabled := false; CheckBox4.Enabled := false;
      CheckBox5.Enabled := false; CheckBox6.Enabled := false;
      CheckBox7.Enabled := false; CheckBox8.Enabled := false;
      CheckBox9.Enabled := false; CheckBox10.Enabled := false;
      CheckBox11.Enabled := false; CheckBox13.Enabled := false;
      CheckBox14.Enabled := false; CheckBox12.Enabled := false;
      CheckBox15.Enabled := false;
      Button1.Enabled := false; Button4.Enabled := false;
     end;

    end else begin
      CheckBox4.Enabled := true;
      CheckBox5.Enabled := true;
    end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  // The defender is deactivated here.
  DisableAntiSpyware(true);
  Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\off.jpg');

   if CheckBox4.Checked = true then
   begin
    if shellexecute(handle,'open',PChar(MainDir + 'Data\bat\sfc.bat'),nil,nil,SW_HIDE)<=32
    then showmessage('sfc.bat not found');
   end;

   Screen.Cursor := crHourGlass;
   // wait for the registry work
   Sleep(300);
   Screen.Cursor := crDefault;
   StatusBar1.Panels[0].Text := 'System must be Reboot..';
   // info to restart the system
   MessageBox(Form1.Handle,Pchar('System must be Reboot, to enable function!'),Pchar('Information'),
   MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_SETFOREGROUND + MB_TOPMOST);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  // The defender is activated here.
  DisableAntiSpyware(false);
   Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\on.jpg');

   if CheckBox5.Checked = true then
   begin
     if shellexecute(handle,'open',PChar(MainDir + 'Data\bat\sfckill.bat'),nil,nil,SW_HIDE)<=32
     then showmessage('sfckill.bat not found');
   end;
   Screen.Cursor := crHourGlass;
   // wait for the registry work
   Sleep(300);
   Screen.Cursor := crDefault;
   StatusBar1.Panels[0].Text := 'System must be Reboot..';
   // info to restart the system
   MessageBox(Form1.Handle,Pchar('System must be Reboot, to enable function!'),Pchar('Information'),
   MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_SETFOREGROUND + MB_TOPMOST);
end;

procedure TForm1.CheckBox13Click(Sender: TObject);
begin
  (* smartscreen.exe is the executable file for Windows Defender SmartScreen,
     a Microsoft security feature that protects against malicious websites
     and harmful downloads.

     In most versions, this only applies to the current session;
     smart screen.exe will reactivate upon the next restart.*)
  KillTask('smartscreen.exe');
end;

procedure TForm1.CheckBox16Click(Sender: TObject);
begin
  // deactivate uac
  if CheckBox16.Checked = true then
  begin
    UAC(true);
    StatusBar1.Panels[3].Text := 'UAC disabled';
  end else begin
    UAC(false);
    StatusBar1.Panels[3].Text := 'UAC enabled';
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = true then
  begin
    CheckBox14.Enabled := true; CheckBox15.Enabled := true;
    CheckBox17.Enabled := true; CheckBox18.Enabled := true;
    CheckBox24.Enabled := true; CheckBox25.Enabled := true;
  end else begin
    CheckBox14.Checked := false; CheckBox15.Checked := false;
    CheckBox14.Enabled := false; CheckBox15.Enabled := false;
    CheckBox17.Checked := false; CheckBox18.Checked := false;
    CheckBox17.Enabled := false; CheckBox18.Enabled := false;
    CheckBox24.Checked := false; CheckBox25.Checked := false;
    CheckBox24.Enabled := false; CheckBox25.Enabled := false;
  end;
end;

procedure TForm1.CheckBox23Click(Sender: TObject);
begin
  (* TrustedInstaller rights refer to the highly privileged system account
     in Windows that owns and manages critical system files, preventing
     accidental changes by users (even admins) to protect the OS from malware
     or bad software, essentially acting as a security layer for core
     components like the Windows directory.*)
  if CheckBox23.Checked = true then
  begin
    Screen.Cursor := crHourGlass;
    AddAccessRights(PChar(MainDir), 'Jeder', $FFFFFFFF);
    Sleep(500);
    CheckBox21.Enabled := true;
    CheckBox22.Enabled := true;
    StatusBar1.Panels[3].Text := 'Trusted Installer Rights initialization';
  end else begin
    CheckBox21.Checked := false;
    CheckBox22.Checked := false;
    CheckBox21.Enabled := false;
    CheckBox22.Enabled := false;
    StatusBar1.Panels[3].Text := 'Trusted Installer Rights deinitialization';
  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.CheckBox12Click(Sender: TObject);
begin
  // execute "smart screen.exe"
  ShellExecute(Application.Handle, 'open',
  Pchar('C:\Windows\System32\smartscreen.exe'), nil, nil, SW_SHOW);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  reg : TRegistry;
  Output, Errors: String;
  RC: Cardinal;
  tmp: TStringList;
begin
  StatusBar1.SetFocus;
  Screen.Cursor := crHourGlass;
  Memo1.Clear;
  tmp := TStringList.Create;

  CaptureConsoleOutput('cmd /c', 'wmic os get caption', Memo1);
  Caption:= 'Windows Defender Bypass : ' +  GetUsername;

   if IsAdmin then
   begin
    StatusBar1.Panels[1].Text := 'You are Administrator';
   end else begin
    StatusBar1.Panels[1].Text := 'You are not Administrator';
   end;

   try
    begin
      reg:= TRegistry.Create(KEY_ALL_ACCESS);
      reg.RootKey:= HKEY_LOCAL_MACHINE;
      try
      if reg.OpenKey('SOFTWARE\Policies\Microsoft\Windows Defender', false) then
        begin
          if reg.ReadInteger('DisableAntiSpyware') = 0 then
            begin
              Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\off.jpg');
              Label11.Caption := 'Windows Defender Service is Deactivated.';
              StatusBar1.Panels[3].Text := 'Windows Defender Deactivated';
            end;
          if reg.ReadInteger('DisableAntiSpyware') = 1 then
            begin
              Image3.Picture.LoadFromFile(MainDir + 'Data\gfx\on.jpg');
              Label11.Caption := 'Windows Defender Service is Activated.';
              StatusBar1.Panels[3].Text := 'Windows Defender Active';
            end;
        end;
      finally
        reg.CloseKey;
        reg.Free;
      end;
    end;
   except
      on E: Exception do
       ShowMessage('Cant find Key Value "DisableAntiSpyware" : ' + E.Message);
   end;

   if StrToInt(Label7.Caption) < 1703 then
   begin
    MessageBox(Form1.Handle,
    Pchar('Your System is older than the 1703 Current Build Version, you cannot use this Program on this System.'),Pchar('OS Information'),
    MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_SETFOREGROUND + MB_TOPMOST);
    RadioButton1.Enabled := false; RadioButton2.Enabled := false;
    CheckBox3.Checked := false; CheckBox4.Checked := false;
    CheckBox5.Checked := false; CheckBox6.Checked := false;
    CheckBox7.Checked := false; CheckBox8.Checked := false;
    CheckBox9.Checked := false; CheckBox10.Checked := false;
    CheckBox11.Checked := false; CheckBox13.Checked := false;
    CheckBox14.Checked := false; CheckBox12.Checked := false;
    CheckBox15.Checked := false;

    CheckBox3.Enabled := false; CheckBox4.Enabled := false;
    CheckBox5.Enabled := false; CheckBox6.Enabled := false;
    CheckBox7.Enabled := false; CheckBox8.Enabled := false;
    CheckBox9.Enabled := false; CheckBox10.Enabled := false;
    CheckBox11.Enabled := false; CheckBox13.Enabled := false;
    CheckBox14.Enabled := false; CheckBox12.Enabled := false;
    CheckBox15.Enabled := false;

    Button1.Enabled := false; Button4.Enabled := false;
   end;

   if IsExeRunning('smartscreen.exe') then
   begin
    Label12.Caption := 'Windows Defender Smart Process is running.';
   end else begin
    Label12.Caption := 'Windows Defender Smart Process is not running.';
   end;

   Screen.Cursor := crDefault;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Screen.Cursor := crHourGlass;
  WriteOptions;
  Sleep(300);
  Screen.Cursor := crDefault;
  StatusBar1.Panels[3].Text := 'Settings Saved.';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
  0 : JumpToKey('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender');
  1 : JumpToKey('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender');
  2 : JumpToKey('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender');
  3 : JumpToKey('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc');
  4 : JumpToKey('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend');
  5 : JumpToKey('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection');
  6 : JumpToKey('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SecurityHealthService (001)');
  7 : JumpToKey('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet\Services\SecurityHealthService');
  8 : JumpToKey('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features');
  end;
end;

initialization
  mHandle := CreateMutex(nil, True, 'xyz');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
  Beep;
    ShowMessage('Windows Defender Bypass is running, you can not use two Instance!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle);
///

end.
