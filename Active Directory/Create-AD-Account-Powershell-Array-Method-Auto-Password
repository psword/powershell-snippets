#This script only works with Powershell v5 - Pwsh 7 does not support System.Web Assembly.

# Import System.Web assembly
Add-Type -AssemblyName System.Web
# Generate random password - 99 chars with 25 special.
[System.Web.Security.Membership]::GeneratePassword(99,25)

#Accounts to Create
$AccountNames =@("Account1",
                "Account2",
                "Account3",
                "Account4",
                "Account5",
                "Account6",
                "Account7",
                "Account8",
                "Account9",
                "Account10",
                "Account11",
                "Account12",
                "Account13",
                "Account14"
)

[int]$incre = 0
function PasswordAddon([ref]$incre) {
    $incre.value++;
}

# This block for testing the increment function
#PasswordAddon([ref]$incre) #compare 2 variables
#Write-Host $incre
#PasswordAddon([ref]$incre) #compare 2 variables
#Write-Host $incre

#If we need to get credentials for the executing user from terminal, uncomment
#$credential = Get-Credential


#Create New AD User Accounts
foreach($Account in $AccountNames){
    #We are incrementing a number to add on to the password
    PasswordAddon([ref]$incre)

    #Define the variable that will be the password
    $i ="Superpass!" + $incre.ToString()
    
    #Output the password to terminal
    Write-Host "Password for $Account is $i"

    # Set the account password and pass creds if needed
    New-ADUser -Name "$Account" -AccountPassword (ConvertTo-SecureString "$i" -AsPlainText -Force) -Enabled $false -LogonWorkstations $Account -UserPrincipalName $Account -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Path "OU=OU-Path,DC=domain,DC=com" -Description "$Account"
}
