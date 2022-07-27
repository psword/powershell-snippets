# Sets Logon Workstation Using Array
#
$Array = @(
    "account name"
)

$credential = (Get-Credential)

$DCs = "DomainController"

foreach ($user in $Array) {
Set-ADUser -Identity $user -Credential $credential -LogonWorkstations "$DCs"
}


# Retrieves Logon Workstation using array
#
$Array = @(
    "account name"
)

$credential = (Get-Credential)

$DCs = "DomainController"

foreach ($user in $Array) {
Get-ADUser -Identity $user -Credential $credential -LogonWorkstations "$DCs"
}
