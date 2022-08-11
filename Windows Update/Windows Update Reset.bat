net stop bits
net stop wuauserv

REM Delete the qmgr*.dat files. To do this, type the following command at a command prompt, and then press ENTER:

REM Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"

REM If this is your first attempt at resolving your Windows Update issues by using the steps in this article, go to next step without carrying out the steps in step 4. The steps in step 4 should only be performed at this point in the troubleshooting if you cannot resolve your Windows Update issues after following all steps but step 4. The steps in step 4 are also performed by the "Aggressive" mode of the Fix it Solution above.

REM Rename the following folders to *.BAK:

%systemroot%\SoftwareDistribution\DataStore
%systemroot%\SoftwareDistribution\Download
%systemroot%\system32\catroot2

REM To do this, type the following commands at a command prompt. Press ENTER after you type each command.

Ren %systemroot%\SoftwareDistribution\DataStore *.bak
Ren %systemroot%\SoftwareDistribution\Download *.bak
Ren %systemroot%\system32\catroot2 *.bak

REM Reset the BITS service and the Windows Update service to the default security descriptor. To do this, type the following commands at a command prompt. Press ENTER after you type each command.

sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)

REM Type the following command at a command prompt, and then press ENTER:

cd /d %windir%\system32

REM Reregister the BITS files and the Windows Update files. To do this, type the following commands at a command prompt. Press ENTER after you type each command.


regsvr32.exe atl.dll
regsvr32.exe urlmon.dll
regsvr32.exe mshtml.dll
regsvr32.exe shdocvw.dll
regsvr32.exe browseui.dll
regsvr32.exe jscript.dll
regsvr32.exe vbscript.dll
regsvr32.exe scrrun.dll
regsvr32.exe msxml.dll
regsvr32.exe msxml3.dll
regsvr32.exe msxml6.dll
regsvr32.exe actxprxy.dll
regsvr32.exe softpub.dll
regsvr32.exe wintrust.dll
regsvr32.exe dssenh.dll
regsvr32.exe rsaenh.dll
regsvr32.exe gpkcsp.dll
regsvr32.exe sccbase.dll
regsvr32.exe slbcsp.dll
regsvr32.exe cryptdlg.dll
regsvr32.exe oleaut32.dll
regsvr32.exe ole32.dll
regsvr32.exe shell32.dll
regsvr32.exe initpki.dll
regsvr32.exe wuapi.dll
regsvr32.exe wuaueng.dll
regsvr32.exe wuaueng1.dll
regsvr32.exe wucltui.dll
regsvr32.exe wups.dll
regsvr32.exe wups2.dll
regsvr32.exe wuweb.dll
regsvr32.exe qmgr.dll
regsvr32.exe qmgrprxy.dll
regsvr32.exe wucltux.dll
regsvr32.exe muweb.dll
regsvr32.exe wuwebv.dll

REM Reset Winsock. To do this, type the following command at a command prompt, and then press ENTER:

netsh winsock reset


REM Restart the BITS service and the Windows Update service. To do this, type the following commands at a command prompt. Press ENTER after you type each command.

net start bits

net start wuauserv