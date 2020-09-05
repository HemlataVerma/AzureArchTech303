## VM Scale Set

1. Create Resource Group `YOUR_NAME-group01` in location `southeastasia`

2. Create Virtual network in `group01` and name `Vnet1`

    IPAddress:  20.0.0.0/16
    Subnet1:    20.0.1.0/24

3.  Create A new VM ScaleSet

    ScaleSet Name:  ScaleSet1
    ResourceGroup: YOUR_NAME-group01
    Location:       southeastasia
    Image:          Windows Server 2019
    Size:           DS1v2
    Network:        VNet1
    Use LB?         Yes
    LB Type:        Azure load balancer
    Initial Instance Count: 2
    
4.  Create a SCRIPT file 'iis-install.ps1' with following lines:

    ```pwsh
    Install-WindowsFeature -name Web-Server -IncludeManagementTools
    cd \inetpub\wwwroot
    set-content -path .\index.html -Value "Hello $env:COMPUTERNAME" 
    ```

5.  Goto VMScale Set, Locate "Extensions" > Click "Add" Button > Choose "Custom Powershell Script"

6.  Click "Browse" and either create or use existing storage account.

7.  Create a container "scripts" and upload "iis-install.ps1" file

8.  Select the file and click "Add" or "Apply"

9.  Goto "Instances" for ScaleSet and select all instances and click "Upgrade"

10. Update the Inbound rules for ScaleSet to allow port "80" and port "3389"