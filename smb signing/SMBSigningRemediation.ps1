# Reg2CI (c) 2021 by Roger Zander
if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'enablesecuritysignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'requiresecuritysignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;

if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'EnableSecuritySignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'RequireSecuritySignature' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;