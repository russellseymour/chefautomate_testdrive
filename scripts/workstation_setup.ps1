#
# Script to install and configure items on the windows workstation
#

[CmdletBinding()]
param (
    [string]
    # Operations that should be performed
    $operation = "chefdk,putty,knife",

    [string]
    # Version of the ChefDK to download
    $chefdk_version = "1.4.3",

    [string]
    # Version of Putty to download
    $putty_version = "0.69"
)

# FUNCTIONS ###########################################

function DownloadAndInstall {

    [CmdletBinding()]
    param (
        [string]
        # URL to download package from
        $url
    )

    # Define the download file
    $target = "{0}\{1}" -f $((Get-Location).Path), $(Split-Path -Leaf -Path $url)

    # Use the .NET Webclient to download the file
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($url, $target)

    # Install the package now it has been downloaded
    Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/i $target /quiet" -Wait

}

########################################################

# Split the modes up so that they can be iterated over
# This is not set as an array in the parameters because when they are passed from the cmd they are seen as a string
$modes = $operation -split ","

# Iterate around the mode that has been set
foreach ($mode in $modes) {

  switch ($mode) {
    "chefdk" {

        # Download and install the ChefDK on the machine
        $url = "https://packages.chef.io/files/stable/chefdk/{0}/windows/2012r2/chefdk-{0}-1-x86.msi" -f $chefdk_version

        DownloadAndInstall -url $url

    }

    "putty" {

        # Download and install Putty
        $url = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-{0}-installer.msi" -f $putty_version

        DownloadAndInstall -url $url
    }

    "knife" {

        # This is where all the configuration for knife should go
        # If you need to pass in parameters, add them to the top of the file and ensure that are passed
        # in the command in the ARM template

    }

  }
}