' @file hades_url_handler.vbs
' @author marc dot pignat at hevs dot ch
' @brief handle hadessh:// and hadesvnc:// urls
'
' portable_kitty.exe has been renamed to putty.exe in for pagent compatibility
Option Explicit

' putty.exe configuration file model
Dim model_ktx
model_ktx = "PortKnocking\\" & VbCrLf & _
"ACSinUTF\0\" & VbCrLf & _
"Comment\\" & VbCrLf & _
"CtrlTabSwitch\0\" & VbCrLf & _
"Password\10nvb\" & VbCrLf & _
"ForegroundOnBell\0\" & VbCrLf & _
"SaveWindowPos\0\" & VbCrLf & _
"WindowState\0\" & VbCrLf & _
"TermYPos\-1\" & VbCrLf & _
"TermXPos\-1\" & VbCrLf & _
"LogTimeRotation\0\" & VbCrLf & _
"Folder\Default\" & VbCrLf & _
"AutocommandOut\\" & VbCrLf & _
"Autocommand\\" & VbCrLf & _
"LogTimestamp\\" & VbCrLf & _
"AntiIdle\\" & VbCrLf & _
"ScriptfileContent\\" & VbCrLf & _
"Scriptfile\\" & VbCrLf & _
"SFTPConnect\\" & VbCrLf & _
"IconeFile\\" & VbCrLf & _
"Icone\1\" & VbCrLf & _
"SaveOnExit\0\" & VbCrLf & _
"Fullscreen\0\" & VbCrLf & _
"Maximize\0\" & VbCrLf & _
"SendToTray\0\" & VbCrLf & _
"TransparencyValue\0\" & VbCrLf & _
"zDownloadDir\C%3A%5C\" & VbCrLf & _
"szOptions\-e%20-v\" & VbCrLf & _
"szCommand\\" & VbCrLf & _
"rzOptions\-e%20-v\" & VbCrLf & _
"rzCommand\\" & VbCrLf & _
"CygtermCommand\\" & VbCrLf & _
"Cygterm64\0\" & VbCrLf & _
"CygtermAutoPath\0\" & VbCrLf & _
"CygtermAltMetabit\0\" & VbCrLf & _
"HyperlinkRegularExpression\(((https%3F%7Cftp)%3A%5C%2F%5C%2F)%7Cwww%5C.)(([0-9]+%5C.[0-9]+%5C.[0-9]+%5C.[0-9]+)%7Clocalhost%7C([a-zA-Z0-9%5C-]+%5C.)%2A[a-zA-Z0-9%5C-]+%5C.(com%7Cnet%7Corg%7Cinfo%7Cbiz%7Cgov%7Cname%7Cedu%7C[a-zA-Z][a-zA-Z]))(%3A[0-9]+)%3F((%5C%2F%7C%5C%3F)[^%20%22]%2A[^%20,;%5C.%3A%22%3E)])%3F\" & VbCrLf & _
"HyperlinkRegularExpressionUseDefault\1\" & VbCrLf & _
"HyperlinkBrowser\\" & VbCrLf & _
"HyperlinkBrowserUseDefault\1\" & VbCrLf & _
"HyperlinkUseCtrlClick\1\" & VbCrLf & _
"HyperlinkUnderline\0\" & VbCrLf & _
"FailureReconnect\0\" & VbCrLf & _
"WakeupReconnect\0\" & VbCrLf & _
"ScriptHalt\\" & VbCrLf & _
"ScriptWait\\" & VbCrLf & _
"ScriptTimeout\30\" & VbCrLf & _
"ScriptExcept\0\" & VbCrLf & _
"ScriptEnable\0\" & VbCrLf & _
"ScriptCRLF\1\" & VbCrLf & _
"ScriptCondUse\0\" & VbCrLf & _
"ScriptCondLine\%3A\" & VbCrLf & _
"ScriptCharDelay\0\" & VbCrLf & _
"ScriptLineDelay\0\" & VbCrLf & _
"ScriptMode\0\" & VbCrLf & _
"ScriptFileName\\" & VbCrLf & _
"SSHManualHostKeys\\" & VbCrLf & _
"ConnectionSharingDownstream\1\" & VbCrLf & _
"ConnectionSharingUpstream\1\" & VbCrLf & _
"ConnectionSharing\0\" & VbCrLf & _
"WindowClass\\" & VbCrLf & _
"SerialFlowControl\1\" & VbCrLf & _
"SerialParity\0\" & VbCrLf & _
"SerialStopHalfbits\2\" & VbCrLf & _
"SerialDataBits\8\" & VbCrLf & _
"SerialSpeed\9600\" & VbCrLf & _
"SerialLine\COM1\" & VbCrLf & _
"ShadowBoldOffset\1\" & VbCrLf & _
"ShadowBold\0\" & VbCrLf & _
"WideBoldFontHeight\0\" & VbCrLf & _
"WideBoldFontCharSet\0\" & VbCrLf & _
"WideBoldFontIsBold\0\" & VbCrLf & _
"WideBoldFont\\" & VbCrLf & _
"WideFontHeight\0\" & VbCrLf & _
"WideFontCharSet\0\" & VbCrLf & _
"WideFontIsBold\0\" & VbCrLf & _
"WideFont\\" & VbCrLf & _
"BoldFontHeight\0\" & VbCrLf & _
"BoldFontCharSet\0\" & VbCrLf & _
"BoldFontIsBold\0\" & VbCrLf & _
"BoldFont\\" & VbCrLf & _
"ScrollbarOnLeft\0\" & VbCrLf & _
"LoginShell\1\" & VbCrLf & _
"StampUtmp\1\" & VbCrLf & _
"BugChanReq\0\" & VbCrLf & _
"BugWinadj\0\" & VbCrLf & _
"BugOldGex2\0\" & VbCrLf & _
"BugMaxPkt2\0\" & VbCrLf & _
"BugRekey2\0\" & VbCrLf & _
"BugPKSessID2\0\" & VbCrLf & _
"BugRSAPad2\0\" & VbCrLf & _
"BugDeriveKey2\0\" & VbCrLf & _
"BugHMAC2\0\" & VbCrLf & _
"BugIgnore2\0\" & VbCrLf & _
"BugRSA1\0\" & VbCrLf & _
"BugPlainPW1\0\" & VbCrLf & _
"BugIgnore1\0\" & VbCrLf & _
"RemotePortAcceptAll\0\" & VbCrLf & _
"LocalPortAcceptAll\0\" & VbCrLf & _
"X11AuthFile\\" & VbCrLf & _
"X11AuthType\1\" & VbCrLf & _
"X11Display\localhost%3A0\" & VbCrLf & _
"X11Forward\1\" & VbCrLf & _
"BlinkText\0\" & VbCrLf & _
"BCE\1\" & VbCrLf & _
"LockSize\0\" & VbCrLf & _
"EraseToScrollback\1\" & VbCrLf & _
"ScrollOnDisp\1\" & VbCrLf & _
"ScrollOnKey\0\" & VbCrLf & _
"ScrollBarFullScreen\0\" & VbCrLf & _
"ScrollBar\1\" & VbCrLf & _
"CapsLockCyr\0\" & VbCrLf & _
"Printer\\" & VbCrLf & _
"UTF8Override\1\" & VbCrLf & _
"CJKAmbigWide\0\" & VbCrLf & _
"LineCodePage\\" & VbCrLf & _
"Wordness224\2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2\" & VbCrLf & _
"Wordness192\2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2\" & VbCrLf & _
"Wordness160\1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\" & VbCrLf & _
"Wordness128\1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\" & VbCrLf & _
"Wordness96\1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1\" & VbCrLf & _
"Wordness64\1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2\" & VbCrLf & _
"Wordness32\0,1,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1\" & VbCrLf & _
"Wordness0\0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\" & VbCrLf & _
"MouseOverride\1\" & VbCrLf & _
"RectSelect\0\" & VbCrLf & _
"MouseIsXterm\0\" & VbCrLf & _
"PasteRTF\0\" & VbCrLf & _
"RawCNP\0\" & VbCrLf & _
"Colour33\187,187,187\" & VbCrLf & _
"Colour32\0,0,0\" & VbCrLf & _
"Colour31\187,187,187\" & VbCrLf & _
"Colour30\0,187,187\" & VbCrLf & _
"Colour29\187,0,187\" & VbCrLf & _
"Colour28\0,0,187\" & VbCrLf & _
"Colour27\187,187,0\" & VbCrLf & _
"Colour26\0,187,0\" & VbCrLf & _
"Colour25\187,0,0\" & VbCrLf & _
"Colour24\0,0,0\" & VbCrLf & _
"Colour23\0,0,0\" & VbCrLf & _
"Colour22\187,187,187\" & VbCrLf & _
"Colour21\255,255,255\" & VbCrLf & _
"Colour20\187,187,187\" & VbCrLf & _
"Colour19\85,255,255\" & VbCrLf & _
"Colour18\0,187,187\" & VbCrLf & _
"Colour17\255,85,255\" & VbCrLf & _
"Colour16\187,0,187\" & VbCrLf & _
"Colour15\85,85,255\" & VbCrLf & _
"Colour14\0,0,187\" & VbCrLf & _
"Colour13\255,255,85\" & VbCrLf & _
"Colour12\187,187,0\" & VbCrLf & _
"Colour11\85,255,85\" & VbCrLf & _
"Colour10\0,187,0\" & VbCrLf & _
"Colour9\255,85,85\" & VbCrLf & _
"Colour8\187,0,0\" & VbCrLf & _
"Colour7\85,85,85\" & VbCrLf & _
"Colour6\0,0,0\" & VbCrLf & _
"Colour5\0,255,0\" & VbCrLf & _
"Colour4\0,0,0\" & VbCrLf & _
"Colour3\85,85,85\" & VbCrLf & _
"Colour2\0,0,0\" & VbCrLf & _
"Colour1\255,255,255\" & VbCrLf & _
"Colour0\187,187,187\" & VbCrLf & _
"SelectedAsColour\0\" & VbCrLf & _
"UnderlinedAsColour\0\" & VbCrLf & _
"BoldAsColourTest\1\" & VbCrLf & _
"DisableBottomButtons\1\" & VbCrLf & _
"WindowHasSysMenu\1\" & VbCrLf & _
"WindowMaximizable\1\" & VbCrLf & _
"WindowMinimizable\1\" & VbCrLf & _
"WindowClosable\1\" & VbCrLf & _
"BoldAsColour\1\" & VbCrLf & _
"Xterm256Colour\1\" & VbCrLf & _
"ANSIColour\1\" & VbCrLf & _
"TryPalette\0\" & VbCrLf & _
"UseSystemColours\0\" & VbCrLf & _
"FontVTMode\4\" & VbCrLf & _
"FontQuality\3\" & VbCrLf & _
"FontHeight\10\" & VbCrLf & _
"FontCharSet\0\" & VbCrLf & _
"FontIsBold\0\" & VbCrLf & _
"Font\Courier%20New\" & VbCrLf & _
"TermHeight\24\" & VbCrLf & _
"TermWidth\80\" & VbCrLf & _
"WinTitle\\" & VbCrLf & _
"WinNameAlways\1\" & VbCrLf & _
"DisableBidi\0\" & VbCrLf & _
"DisableArabicShaping\0\" & VbCrLf & _
"CRImpliesLF\0\" & VbCrLf & _
"LFImpliesCR\0\" & VbCrLf & _
"AutoWrapMode\1\" & VbCrLf & _
"DECOriginMode\0\" & VbCrLf & _
"ScrollbackLines\10000\" & VbCrLf & _
"BellOverloadS\5000\" & VbCrLf & _
"BellOverloadT\2000\" & VbCrLf & _
"BellOverloadN\5\" & VbCrLf & _
"BellOverload\1\" & VbCrLf & _
"BellWaveFile\\" & VbCrLf & _
"BeepInd\0\" & VbCrLf & _
"Beep\1\" & VbCrLf & _
"BlinkCur\0\" & VbCrLf & _
"CurType\0\" & VbCrLf & _
"WindowBorder\1\" & VbCrLf & _
"SunkenEdge\0\" & VbCrLf & _
"HideMousePtr\0\" & VbCrLf & _
"FullScreenOnAltEnter\0\" & VbCrLf & _
"AlwaysOnTop\0\" & VbCrLf & _
"Answerback\putty.exe\" & VbCrLf & _
"LocalEdit\2\" & VbCrLf & _
"LocalEcho\2\" & VbCrLf & _
"TelnetRet\1\" & VbCrLf & _
"TelnetKey\0\" & VbCrLf & _
"CtrlAltKeys\1\" & VbCrLf & _
"ComposeKey\0\" & VbCrLf & _
"AltOnly\0\" & VbCrLf & _
"AltSpace\0\" & VbCrLf & _
"AltF4\1\" & VbCrLf & _
"NetHackKeypad\0\" & VbCrLf & _
"ApplicationKeypad\0\" & VbCrLf & _
"ApplicationCursorKeys\0\" & VbCrLf & _
"NoRemoteCharset\0\" & VbCrLf & _
"NoDBackspace\0\" & VbCrLf & _
"RemoteQTitleAction\1\" & VbCrLf & _
"NoRemoteWinTitle\0\" & VbCrLf & _
"NoAltScreen\0\" & VbCrLf & _
"NoRemoteResize\0\" & VbCrLf & _
"NoMouseReporting\0\" & VbCrLf & _
"NoApplicationCursors\0\" & VbCrLf & _
"NoApplicationKeys\0\" & VbCrLf & _
"LinuxFunctionKeys\0\" & VbCrLf & _
"RXVTHomeEnd\0\" & VbCrLf & _
"BackspaceIsDelete\1\" & VbCrLf & _
"PassiveTelnet\0\" & VbCrLf & _
"RFCEnviron\0\" & VbCrLf & _
"RemoteCommand\\" & VbCrLf & _
"SSH2DES\0\" & VbCrLf & _
"LogHost\\" & VbCrLf & _
"SshProt\3\" & VbCrLf & _
"SshNoShell\0\" & VbCrLf & _
"GSSCustom\\" & VbCrLf & _
"GSSLibs\gssapi32,sspi,custom\" & VbCrLf & _
"AuthGSSAPI\1\" & VbCrLf & _
"AuthKI\1\" & VbCrLf & _
"AuthTIS\0\" & VbCrLf & _
"SshBanner\1\" & VbCrLf & _
"SshNoAuth\0\" & VbCrLf & _
"RekeyBytes\1G\" & VbCrLf & _
"RekeyTime\60\" & VbCrLf & _
"KEX\dh-gex-sha1,dh-group14-sha1,dh-group1-sha1,rsa,WARN\" & VbCrLf & _
"Cipher\aes,blowfish,3des,WARN,arcfour,des\" & VbCrLf & _
"ChangeUsername\1\" & VbCrLf & _
"GssapiFwd\0\" & VbCrLf & _
"AgentFwd\1\" & VbCrLf & _
"TryAgent\1\" & VbCrLf & _
"Compression\1\" & VbCrLf & _
"NoPTY\0\" & VbCrLf & _
"LocalUserName\cluster\" & VbCrLf & _
"UserNameFromEnvironment\0\" & VbCrLf & _
"Environment\\" & VbCrLf & _
"ProxyTelnetCommand\plink%20sshfwd@%25proxyhost%20-nc%20%25host%3A%25port%20-hostkey%20c1%3Ae5%3Ac9%3A16%3A93%3A60%3A8d%3A13%3Adc%3A1f%3A70%3A74%3Afb%3A8a%3Aa5%3Aea%20%20-agent%20-X\" & VbCrLf & _
"ProxyPassword\\" & VbCrLf & _
"ProxyUsername\\" & VbCrLf & _
"ProxyPort\22\" & VbCrLf & _
"ProxyHost\153.109.6.61\" & VbCrLf & _
"ProxyMethod\5\" & VbCrLf & _
"ProxyLocalhost\0\" & VbCrLf & _
"ProxyDNS\1\" & VbCrLf & _
"ProxyExcludeList\\" & VbCrLf & _
"AddressFamily\0\" & VbCrLf & _
"TerminalModes\CS7=A,CS8=A,DISCARD=A,DSUSP=A,ECHO=A,ECHOCTL=A,ECHOE=A,ECHOK=A,ECHOKE=A,ECHONL=A,EOF=A,EOL=A,EOL2=A,ERASE=A,FLUSH=A,ICANON=A,ICRNL=A,IEXTEN=A,IGNCR=A,IGNPAR=A,IMAXBEL=A,INLCR=A,INPCK=A,INTR=A,ISIG=A,ISTRIP=A,IUCLC=A,IXANY=A,IXOFF=A,IXON=A,KILL=A,LNEXT=A,NOFLSH=A,OCRNL=A,OLCUC=A,ONLCR=A,ONLRET=A,ONOCR=A,OPOST=A,PARENB=A,PARMRK=A,PARODD=A,PENDIN=A,QUIT=A,REPRINT=A,START=A,STATUS=A,STOP=A,SUSP=A,SWTCH=A,TOSTOP=A,WERASE=A,XCASE=A\" & VbCrLf & _
"TerminalSpeed\38400,38400\" & VbCrLf & _
"TerminalType\xterm\" & VbCrLf & _
"TCPKeepalives\0\" & VbCrLf & _
"TCPNoDelay\1\" & VbCrLf & _
"PingIntervalSecs\0\" & VbCrLf & _
"PingInterval\0\" & VbCrLf & _
"WarnOnClose\1\" & VbCrLf & _
"CloseOnExit\1\" & VbCrLf & _
"PortNumber\22\" & VbCrLf & _
"Protocol\ssh\" & VbCrLf & _
"SSHLogOmitData\0\" & VbCrLf & _
"SSHLogOmitPasswords\1\" & VbCrLf & _
"LogFlush\1\" & VbCrLf & _
"LogFileClash\-1\" & VbCrLf & _
"LogType\0\" & VbCrLf & _
"LogFileName\putty.log\" & VbCrLf & _
"UserNameFromEnvironment\0\" & VbCrLf & _
"Present\1\"

' Decode the URL
Dim url, protocol, user, ip, debug
debug = False
url = WScript.Arguments(0)

if InStr(url, "/debug") then
	url = Replace(url, "/debug", "")
	debug = true
end if

protocol = split(url, ":")(0)
if debug then
	Wscript.echo "protocol:" + protocol
end if

url = Replace(url, protocol + "://", "")
url = Replace(url, "/", "")


if debug then
	Wscript.echo "URL:" + url
end if


if Ubound(Split(url, "@")) = 0 then
	ip = url
	user = "cluster"
end if
if Ubound(Split(url, "@")) = 1 then
	user = Split(url, "@")(0)
	ip = Split(url, "@")(1)
end if

' Get the path of this script, putty.exe and vncviewer.exe are in the same directory
Dim objShell, scriptPahth, scriptDir, filesys, objFile, tempfolder, tempname, tempfile
Set objShell = WScript.CreateObject("WScript.Shell")
scriptPahth = Wscript.ScriptFullName

Set filesys = CreateObject("Scripting.FileSystemObject")
Set objFile = filesys.GetFile(scriptPahth)
scriptDir = filesys.GetParentFolderName(objFile)
objShell.CurrentDirectory = scriptDir

if debug then
	Wscript.echo scriptDir
	Wscript.echo "user:" + user
	Wscript.echo "ip:" + ip
end if

' Create a configuration file for kitty
Set tempfolder = filesys.GetSpecialFolder(2)
tempname = filesys.GetTempName
Set tempfile = tempfolder.CreateTextFile(tempname)

tempfile.writeline model_ktx
tempfile.writeline "HostName\"+ip+"\"
if not isempty(user) then
	tempfile.writeline "UserName\"+user+"\"
else
	tempfile.writeline "UserName\\"
end if

' Try to get an unused port number for VNC forwarding, let's roll a dice ;)
Dim port
port = cstr(int(rnd*55000)+10000)

if protocol = "hadesvnc" then
	if debug then
		Wscript.echo "port : " + port
	end if
	tempfile.writeline "PortForwardings\L"+port+"=localhost%3A5900\"
else
	tempfile.writeline "PortForwardings\\"
end if
tempfile.close

if debug then
	Wscript.echo tempfolder+"\"+tempname
end if

'run pageant with our key
Dim keyfile
keyfile = objShell.ExpandEnvironmentStrings("%USERPROFILE%") +"\"+"hades\sshfwd.ppk"

if debug then
	Wscript.echo keyfile
end if

objShell.Run """"+scriptDir + "\" + "pageant.exe"" """+keyfile+"", 1, False
if Not filesys.FileExists(keyfile) then
	Wscript.echo "keyfile '" + keyfile + "' not found"
	WScript.quit 1
end if

' Now run
Select case protocol
case "hadesvnc"
	objShell.Run """"+scriptDir + "\" + "putty.exe"" -N -nofiles -kload "+tempfolder+"\"+tempname, 1, False
	WScript.Sleep 1000
	objShell.Run """"+scriptDir + "\" + "vncviewer.exe"" localhost:"+port, 1, False
case "hadesssh"
	objShell.Run """"+scriptDir + "\" + "putty.exe"" -nofiles -kload "+tempfolder+"\"+tempname, 1, False
case "hadesscp"
	objShell.Run """"+scriptDir + "\" + "WinSCP.exe"" sftp://"+user+"@"+ip+" /rawsettings AgentFwd=1 Tunnel=1 TunnelHostName=hades.hevs.ch TunnelUserName=sshfwd ProxyMethod=0 AddressFamily=1 SshSimple=1", 1, False
end Select

Set objShell = Nothing
