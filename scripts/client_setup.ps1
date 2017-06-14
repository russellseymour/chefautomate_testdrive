$OrgUser = "orguser"
$ChefAutomateUrl = "https://chefautouxv22.eastus.cloudapp.azure.com/organizations/$OrgUser"
$ValidationClient = "$OrgUser-validator"
$SrcPath = "c:/users/chefuser"
$SrcUserPath = "/.chef/"
$ValidationKey = "$OrgUser-validator.pem"
$User = "chefuser"
$KeyPath = "$SrcPath$SrcUserPath$ValidationKey"

echo $OrgUser
echo $ChefAutomateUrl
echo $ValidationClient
echo $SrcPath
echo $SrcUserPath
echo $ValidationKey
echo $User
echo $KeyPath
cd C:\opscode\chefdk\bin
#echo `n | knife configure --server-url $ChefAutomateUrl  --validation-client-name $ValidationClient --validation-key $KeyPath --user $User --repository $SrcPath
