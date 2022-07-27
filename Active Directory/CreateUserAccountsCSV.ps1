<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2/7/2022 12:57 PM
	 Created by:   	
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		This will import a CSV file with User Attributes and create the corresponding User Accounts.  Original script here: 
		https://www.alitajran.com/create-active-directory-users-from-csv-with-powershell/#h-generate-passwords
		I have modified it by adding a few fields.
#>
# Import active directory module for running AD cmdlets
Import-Module ActiveDirectory

# Store the data from a csv in the $ADUsers variable
$path = Read-Host "Please provide the path to the CSV file"
$ADUsers = Import-Csv $path -Delimiter ","

# Define UPN
$UPN = "intat.com"

# Loop through each row containing user details in the CSV file
foreach ($User in $ADUsers)
{
	
	#Read user data from each field in each row and assign the data to a variable as below
	$username = $User.username
	$password = $User.password
	$firstname = $User.firstname
	$lastname = $User.lastname
	$initials = $User.initials
	$OU = $User.ou #This field refers to the OU the user account is to be created in
	$email = $User.email
	$logonworkstations = $User.logonworkstations
	$streetaddress = $User.streetaddress
	$pobox = $User.pobox
	$city = $User.city
	$zipcode = $User.zipcode
	$state = $User.state
	$country = $User.country
	$telephone = $User.telephone
	$mobile = $User.mobile
	$jobtitle = $User.jobtitle
	$company = $User.company
	$manager = $User.manager
	$department = $User.department
	$description = $User.description
	
	# Check to see if the user already exists in AD
	if (Get-ADUser -F { SamAccountName -eq $username })
	{
		
		# If user does exist, give a warning
		Write-Warning "A user account with username $username already exists in Active Directory."
	}
	else
	{
		
		# User does not exist then proceed to create the new user account
		# Account will be created in the OU provided by the $OU variable read from the CSV file
		New-ADUser `
				   -SamAccountName $username `
				   -UserPrincipalName "$username@$UPN" `
				   -Name "$firstname $lastname" `
				   -GivenName $firstname `
				   -Surname $lastname `
				   -Initials $initials `
				   -description $description `
				   -Enabled $True `
				   -DisplayName "$firstname $lastname" `
				   -Path $OU `
				   -LogonWorkstations $logonworkstations `
				   -City $city `
				   -PostalCode $zipcode `
				   -Country $country `
				   -Company $company `
				   -State $state `
				   -StreetAddress $streetaddress `
				   -POBox $pobox `
				   -OfficePhone $telephone `
				   -MobilePhone $mobile `
				   -EmailAddress $email `
				   -Title $jobtitle `
				   -Department $department `
				   -Manager $manager `
				   -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True
		# -WhatIf #Uncomment and add a backtick to the previous line to use in test mode
		
		# If user is created, show message.
		Write-Host "The user account $username is created." -ForegroundColor Cyan
	}
}

Read-Host -Prompt "Press Enter to exit"