Install-WindowsFeature -name Web-Server -IncludeManagementTools
cd \inetpub\wwwroot
set-content -path .\index.html -Value "Hello $env:COMPUTERNAME" 