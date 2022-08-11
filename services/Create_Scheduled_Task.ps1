$task = New-ScheduledTaskAction -Execute 'powershell.exe -ExecutionPolicy Bypass -command "C:\Scripts\Get-Service_Start.ps1"'
$trigger = New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask -Action $task -Trigger $trigger -TaskPath "\" -TaskName "Check Service at Startup" -Description "This task will check and start the service if it is not running." -User domain\gmsa$ -RunLevel Highest
Set-ScheduledTask -TaskName "Check Service service at Startup" -Action $task
schtasks /Change /TN "\Check Service at Startup" /RU "domain\gmsa$" /RP ""