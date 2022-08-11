<#
.SYNOPSIS
This script will test a pre-set range of IPs for the server infrastructure subnet.

.DESCRIPTION
This function requires the use of a specially-formatted CSV file to pull data.  This CSV file is first constructed in an infrastructure tracking sheet, then is moved to a simple text file.
The Headers "IPAddress" and "Description" must exist in order for this script to work.

.EXAMPLE
Check-Network -csvfile c:\temp\test.csv -print

.NOTES
The -Print switch will show the successful pings in order to give a reference point for what we are pinging.  Without the -Print switch, the script will simply show failures with FQDN, network switch the IP is connected to, the network switch port the IP is found on, and the IP's associated Layer-2 address.
#>

Function Check-Network{
Param(
    [Parameter(Mandatory=$true)][Alias("List")][string]$csvfile,
    [switch]$print=$false
    )    
    Write-Host "Reading file" $csvfile
    "`n"
    $csv = import-csv $csvfile
    
    foreach($unit in $csv)
    {
    $IPAddress = $unit.IPAddress
    $Description = $unit.Description
    $namecrosscheck=[System.Net.Dns]::gethostentry($IPAddress).HostName
        if ($print){
            if (test-connection $IPAddress -count 1 -Quiet) {
                Write-Host $IPAddress "ICMP Check succeeded.  DNS Zone Record Cross-Check ; $namecrosscheck" -ForegroundColor Green
            }
        }
        if (!(test-connection $IPAddress -count 1 -Quiet)) {
            $ErrorActionPreference = 'ignore'
            Write-Host $IPAddress "ICMP Check failed. Logical Connections from CSV:"$Description -ForegroundColor Red
        }
    }
"`n"
Write-Host "Connection Test Complete."
"`n"
}
