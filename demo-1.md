## VM Scale Set

1. Create Resource Group `YOUR_NAME-group01` in location `southeastasia`

2. Create Virtual network in `group01` and name `Vnet1`

    IPAddress:  20.0.0.0/16
    Subnet1:    20.0.1.0/24

3.  Create A new VM ScaleSet

    ScaleSet Name:  ScaleSet1
    ResourceGroup: YOUR_NAME-group01
    Location:       southeastasia
    Image:          Ubuntu 18.04
    Size:           DS1v2
    Network:        VNet1
    Use LB?         Yes
    LB Type:        Azure load balancer
    Initial Instance Count: 2
    
4.  Create a SCRIPT file 'installscript.sh' with following lines:

    ```bash
    apt update -y
    apt install nginx -y
    cd /var/wwwroot/html
    rm index*.html
    echo "<h1>Hello $HOSTNAME</h1>" > index.html
    ```

5.  Goto VMScale Set, Locate "Extensions" > Click "Add" Button > Choose "Custom Linux Script"

6.  Click "Browse" and either create or use existing storage account.

7.  Create a container "scripts" and upload "installscript.sh" file

8.  Select the file and click "Add" or "Apply"

9.  Goto "Instances" for ScaleSet and select all instances and click "Upgrade"

10. Update the Inbound rules for ScaleSet to allow port "80" and port "22"