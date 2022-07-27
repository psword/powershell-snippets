$OUpath = 'ou=Managers,dc=enterprise,dc=com'
$ExportPath = 'c:\data\users_in_ou1.csv'

Get-ADUser -Filter * -SearchBase 'ou=customOU,dc=domain,dc=name' | Select-object DistinguishedName,Name,UserPrincipalName | Export-Csv -NoType $ExportPath

$disabledUsers = Get-ADObject -Filter "ObjectClass -eq 'User' -and userAccountControl -eq '514'"

foreach ($disabledUser in $disabledUsers) {

    Get-ADReplicationAttributeMetadata $disabledUser -Server localhost | 
        Where-Object {$_.AttributeName -eq 'UserAccountControl'} | Select Object,LastOriginatingChangeTime |
            Where-Object {$_.LastOriginatingChangeTime -lt (Get-Date).AddDays(-365)}

Get-ADUser -Filter * -Properties Enabled,whenChanged | Where-Object{$_.Enabled -like "false"} | Export-CSV c:\Disabled.csv

Get-ADUser -filter {Enabled -eq $False}

Get-ADUser -Filter {PasswordExpired -eq $True}

Get-ADUser -Filter {(PasswordNeverExpires -eq $False) -and (Mail -like '*@intat.com')}

get-aduser -Identity *| Where-Object {($_.Enabled -eq $false) -AND ($_.DistinguishedName -like '*Users*')}

get-aduser -Identity *| Where-Object {($_.Enabled -eq $false) -AND ($_.DistinguishedName -like '*Users*') -AND ($_.DistinguishedName -notlike '*Template*')}

Get-ADUser -Filter * -SearchBase 'ou=customOU,dc=domain,dc=name'