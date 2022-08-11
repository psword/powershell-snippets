Param(
    [Parameter(Mandatory=$true, position=0)][string]$csvfile
)

$ColumnHeader = "IPAddress"

Write-Host "Reading file" $csvfile
$ipaddresses = import-csv $csvfile | Select-Object $ColumnHeader

Write-Host "Started Pinging.."
foreach( $ip in $ipaddresses) {
    if (test-connection $ip.("IPAddress") -count 1 -Quiet) {
        Write-Host $ip.("IPAddress") "Ping succeeded." -ForegroundColor Green
    } else {
        Write-Host $ip.("IPAddress") "Ping failed." -ForegroundColor Red
    }

}

Write-Host "Pinging Completed."