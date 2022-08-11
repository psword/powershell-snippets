<#
.SYNOPSIS
This script will test a pre-set range of IPs.

.DESCRIPTION
Ping-testing script.

.EXAMPLE
Test-ConnectionIPs

.NOTES
This script can be modified to fit various needs.
#>
function Test-ConnectionIPs {
    $IPArray = @(
        "IPAddress1";
        "IPAddress2"
)
arp -d
foreach ($IP in $IPArray){
$Date = Get-Date
$entry= Write-Host "Testing $IP ..."
$line="_____________________________________________________________"
$ping=Test-Connection $IP -Count 3 -Quiet
$arp=[boolean](arp -a | Select-String "$IP")
If ($ping -and $arp)
{$line; Write-Host "ICMP: successful" -ForegroundColor Green`n; Write-Host "ARP : successful" -ForegroundColor Green`n; $line; Write-Host "Host ${IPAddress} is up" -ForegroundColor Green; Write-Host ""}
elseif ($ping -and !$arp)
{$line; Write-Host "ICMP: successful" -ForegroundColor Green`n; Write-Host "ARP : failure" -ForegroundColor Red`n; $line; Write-Host "Host ${IPAddress} is up, but possibly not on local subnet"; Write-Host ""}
elseif (!$ping -and $arp)
{$line; Write-Host "ICMP: failure" -ForegroundColor Red`n; Write-Host "ARP : successful" -ForegroundColor Green`n; $line; Write-Host "Possible Cause on ${IPAddress}: Windows Firewall is blocking traffic"; Write-Host ""}
else
{$line; Write-Host "ICMP: failure" -ForegroundColor Red`n; Write-Host "ARP : failure" -ForegroundColor Red`n; $line; Write-Host "Host ${IPAddress} is down" -ForegroundColor Red; Write-Host ""}
}
}

Test-ConnectionIPs
