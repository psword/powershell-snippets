#Accounts to Create
$AccountNames =@("Test"
)

#Create New AD User Accounts
foreach($Account in $AccountNames){

    # Set the account password and pass creds
    New-ADUser -Name "$Account" -AccountPassword (Read-Host -AsSecureString "Enter password") -Enabled $false -UserPrincipalName $Account -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Path "OU=OU-Path,DC=domain,DC=com" -Description "Test Account"
}

