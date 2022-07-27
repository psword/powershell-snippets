# Account
 $account = Read-Host "Please enter the account name"

# Import System.Web assembly
Add-Type -AssemblyName System.Web

#import AD Module
Import-Module ActiveDirectory

# Generate random password
 $randompassword = [System.Web.Security.Membership]::GeneratePassword(10,2)
 $securepassword = ConvertTo-SecureString "$randompassword" -AsPlainText -Force

# Crendential
 $credential = (Get-Credential)

 # Set the account password and pass creds
 Set-ADAccountPassword -Identity "$account" -NewPassword $securepassword -Reset -Credential $credential

 # Write the output to the terminal
 Write-Host $account, $randompassword