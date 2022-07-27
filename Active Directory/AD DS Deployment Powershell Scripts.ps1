#
# Windows PowerShell script for AD DS Deployment
#
#
# To add a domain controller to an existing domain, use this sequence.
#
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -NoGlobalCatalog:$false -CreateDnsDelegation:$false -Credential (Get-Credential Domain\Administrator) `
-CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "domain.name" -InstallDns:$true -LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false -SiteName "Default-First-Site-Name" -SysvolPath "C:\Windows\SYSVOL" -Force:$true
#
#
# To demote, use this sequence.
Import-Module ADDSDeployment
Uninstall-ADDSDomainController `
-DemoteOperationMasterRole:$true `
-Force:$true