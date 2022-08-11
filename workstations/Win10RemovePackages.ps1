$appname = @(
"*3dbuilder*"
"*windowsalarms*"
"*windowscommunicationsapps*"
"*windowscamera*"
"*officehub*"
"*skypeapp*"
"*getstarted*"
"*zunemusic*"
"*windowsmaps*"
"*bingfinance*"
"*zunevideo*"
"*bingnews*"
"*onenote*"
"*people*"
"*windowsphone*"
"*photos*"
"*windowsstore*"
"*bingsports*"
"*soundrecorder*"
"*bingweather*"
"*xboxapp*"
"*xbox*"
"*3dviewer*"
"*messaging*"
"*mixedreality*"
"*feedbackhub*"
"*solitairecollection*"
"*yourphone*"
"*print3d*"
"*OneConnect*"
"*mspaint*"
"*king.com*"
"*spotifymusic*"
"*cbspreview*"
"*windowsphone*"
)

ForEach($app in $appname){
Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
}

ForEach($app in $appname){
Get-AppxProvisionedPackage -Online | where {$_.PackageName -like $app} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}
