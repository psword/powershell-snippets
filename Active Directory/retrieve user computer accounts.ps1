get-adcomputer -filter * | select Name,DNSHostName,DistinguishedName,Enabled | Export-Csv C:\Temp\test3.csv

get-aduser -filter * | select Name,UserPrincipalName,Enabled | Export-Csv C:\Temp\test2.csv


get-adcomputer -filter * -properties * | Select Name,DNSHostName,DistinguishedName,LastLogonDate,Enabled | Export-CSV c:\temp\test.csv

