New-ADServiceAccount -Name NAMEgmsa -DNSHostName NAMEgmsa.intat.local -PrincipalsAllowedToRetrieveManagedPassword COMPUTERNAME$ -Credential (Get-Credential) 
New-ADServiceAccount -Name NAME1gmsa -DNSHostName Tasksgmsa.intat.local -PrincipalsAllowedToRetrieveManagedPassword GroupName -Credential (Get-Credential)
