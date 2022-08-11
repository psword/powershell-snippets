<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	3/23/2022 10:01 AM
	 Created by:   	psword-ad
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
$service_name = 'Windows Update'
$service_status = (Get-Service -DisplayName $service_name).status
$timestamp = Get-Date
$log_filepath = "C:\Scripts\TaskStartLog.log"
If (!(Test-Path -LiteralPath $log_filepath))
{
	New-Item $log_filepath -ItemType File -Force -Value "Log created on $timestamp."
}
$line_count = (Get-Content -Path $log_filepath | Measure-Object -Line).Lines

If ($line_count -gt '96')
{
	Clear-Content -Path $log_filepath -Force
	"Log cleared on $timestamp." | Out-File -Encoding utf8 $log_filepath -Append
}


If ($service_status -eq 'Stopped')
{
	Start-Service $service_name
	"Started Service on $timestamp." | Out-File -Encoding utf8 $log_filepath -Append
}
else
{
	"`nChecked at $timestamp that service_name is already running.  Exiting." | Out-File -Encoding utf8 $log_filepath -Append
}
