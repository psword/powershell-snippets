#Password auto-generation
 

$AccountNames = @(
        "account name"
        )
#Accounts that we are resetting:
Write-Host "$AccountNames"

 

#import AD Module
Import-Module ActiveDirectory

 

# Import System.Web assembly
Add-Type -AssemblyName System.Web

 

#Obtain user credentials for this session
$credential = Get-Credential

 

foreach ($account in $AccountNames) {
    # Generate random password
    $randompassword = [System.Web.Security.Membership]::GeneratePassword(99,25)
    $securepassword = ConvertTo-SecureString "$randompassword" -AsPlainText -Force

 

    # Set the account password and pass creds
    Set-ADAccountPassword -Identity "$account" -NewPassword $securepassword -Reset -Credential $credential

 

    # Write the output to the terminal
    Write-Host $account, $randompassword
}