# Description: Boxstarter Script
# Author: Microsoft
# chocolatey fest demo
#
# https://boxstarter.org/package/url?https://raw.githubusercontent.com/dgowdy/windows-dev-box-setup-scripts/master/demos/Vividchocolateyfest.ps1
# http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/dgowdy/windows-dev-box-setup-scripts/master/demos/Vividchocolateyfest.ps1

Disable-UAC
$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

### HACK Workaround choco / boxstarter path too long error
## https://github.com/chocolatey/boxstarter/issues/241
$ChocoCachePath = "$env:USERPROFILE\AppData\Local\ChocoCache"
New-Item -Path $ChocoCachePath -ItemType directory -Force | Out-Null


# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$strpos = $helperUri.LastIndexOf("/demos/")
$helperUri = $helperUri.Substring(0, $strpos)
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	Invoke-Expression ((new-object net.webclient).DownloadString("$helperUri/$script"))
}


#--- Setting up Windows ---
executeScript "RemoveDefaultApps.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "InstallApps.ps1";

RefreshEnv

#--- Windows Settings ---
#Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableExpandToOpenFolder -DisableOpenFileExplorerToQuickAccess -DisableShowFrequentFoldersInQuickAccess -DisableShowRecentFilesInQuickAccess
#Set-TaskbarOptions -Size Small
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen
Disable-BingSearch
Disable-GameBarTips
Enable-RemoteDesktop
TZUTIL /s "Eastern Standard Time"


Enable-UAC
Enable-MicrosoftUpdate
#Install-WindowsUpdate -acceptEula
