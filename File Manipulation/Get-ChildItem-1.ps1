Get-ChildItem -Path Z: -Recurse -Attributes Directory | Select-Object Name > c:\TempPath\path.csv


$var = Get-ChildItem -Path Z: -Recurse
$name = Get-Content -Path C:\TempPath\path.csv
if ($var -like $name) {
    Remove-Item -Path $var
}

$var = Get-ChildItem -Path Z: -Recurse
$name = Get-Content -Path C:\TempPath\path.csv
if ($var -like $name) {
   Write-Host -ForegroundColor Green $var
}