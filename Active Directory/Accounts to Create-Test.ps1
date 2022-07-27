#Accounts to Create
$AccountNames =@("Test1Delete",
                "Test2Delete"
)

[int]$incre = 0
function PasswordAddon([ref]$incre) {
    $incre.value++;
}

## This block for testing the increment function
    ###PasswordAddon([ref]$incre) #compare 2 variables
    ###Write-Host $incre
    ###PasswordAddon([ref]$incre) #compare 2 variables
    ###Write-Host $incre


#$credential = Get-Credential


#Create New AD User Accounts
foreach($Account in $AccountNames){
    #We are incrementing a number to add on to the password
    PasswordAddon([ref]$incre)

    #Define the variable that will be the password
    $i ="Superpass!" + $incre.ToString()
    
    #Output the password to terminal
    Write-Host "Password for $Account is $i"

    #$password = ConvertTo-SecureString "$i" -AsPlainText -Force

    # Set the account password and pass creds
    New-ADUser -Name "$Account" -AccountPassword (ConvertTo-SecureString "$i" -AsPlainText -Force) -Enabled $false -UserPrincipalName $Account -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Path "OU=Custom OU Path,DC=domain,DC=local" -Description "An Account"
}

