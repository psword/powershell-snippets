#
New-NetIPAddress -IPAddress <REDACTED> -PrefixLength 24 -InterfaceIndex <REDACTED> -DefaultGateway <REDACTED>
Set-DnsClientServerAddress -InterfaceIndex <REDACTED> -ServerAddresses ("<REDACTED>","<REDACTED>")
Rename-NetAdapter -Name <REDACTED> -NewName <REDACTED>
Get-NetAdapter -Name '<REDACTED>' | Set-DnsClient -ConnectionSpecificSuffix intat.local -RegisterThisConnectionsAddress:$true -UseSuffixWhenRegistering:$true -Verbose
#
netsh advfirewall import C:\TempPath\repository1.wfw
#
WinRM QuickConfig
Enable-PSRemoting
#
Set-TimeZone -Id "US Eastern Standard Time"
#
Rename-Computer <REDACTED>
Restart-Computer
#
New-LocalUser -Name <REDACTED> -Password (ConvertTo-SecureString -AsPlainText -String "enter real password" -Force)
Add-LocalGroupMember -Name Administrators -Member <REDACTED>
Set-LocalUser -Name <REDACTED> -PasswordNeverExpires:$true
Disable-LocalUser -Name Administrator

#
Rename-NetAdapter -Name <REDACTED> -NewName <REDACTED>
New-NetIPAddress -InterfaceIndex 10 -IPAddress <REDACTED> -PrefixLength 24

#
Start-Service -Name MSiSCSI
Set-Service -Name MSiSCSI -StartupType Automatic

#
New-IscsiTargetPortal -TargetPortalAddress <REDACTED>

#
Get-InitiatorId

#
Get-InitiatorPort

#
Connect-IscsiTarget -TargetPortalAddress <REDACTED> -TargetPortalPortNumber 32<REDACTED>0 -IsPersistent:$true -InitiatorPortalAddress <REDACTED> 

#
diskpart.exe

list disk

select disk <REDACTED>

online disk

list volume

attributes disk

attributes disk clear readonly

#




# The Reg add below for LocalAccountTokenFilterPolicy is fixed by"winrm quickconfig"
## Reg2CI (c) 2021 by Roger Zander
#if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -force -ea SilentlyContinue };
#New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'LocalAccountTokenFilterPolicy' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;

#
# Reg2CI (c) 2021 by Roger Zander
if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'enablesecuritysignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'requiresecuritysignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;

if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'EnableSecuritySignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'RequireSecuritySignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;


#
# Reg2CI (c) 2021 by Roger Zander
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate") -ne $true) {  New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU") -ne $true) {  New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DoNotConnectToWindowsUpdateInternetLocations' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AcceptTrustedPublisherCerts' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ElevateNonAdmins' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'TargetGroupEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'TargetGroup' -Value 'WSUS Servers' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ExcludeWUDriversInQualityUpdate' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'WUServer' -Value '<REDACTED>' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'WUStatusServer' -Value '<REDACTED>' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'UpdateServiceUrlAlternate' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'SetProxyBehaviorForUpdateDetection' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAUShutdownOption' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAUAsDefaultShutdownOption' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoUpdate' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AUOptions' -Value 3 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'ScheduledInstallDay' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'ScheduledInstallTime' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'ScheduledInstallEveryWeek' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AllowMUUpdateService' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'DetectionFrequencyEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'DetectionFrequency' -Value 2 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'EnableFeaturedSoftware' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AutoInstallMinorUpdates' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'IncludeRecommendedUpdates' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoRebootWithLoggedOnUsers' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'RebootRelaunchTimeoutEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'RebootRelaunchTimeout' -Value 10 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'RebootWarningTimeoutEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'RebootWarningTimeout' -Value 5 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'RescheduleWaitTimeEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'RescheduleWaitTime' -Value 5 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AlwaysAutoRebootAtScheduledTime' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'UseWUServer' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
