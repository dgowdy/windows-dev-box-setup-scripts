# Description: Boxstarter Script
# Author: Microsoft
# chocolatey fest demo

Disable-UAC
$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

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
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "InstallApps.ps1";

RefreshEnv

#--- Windows Settings ---
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableExpandToOpenFolder -DisableOpenFileExplorerToQuickAccess -DisableShowFrequentFoldersInQuickAccess -DisableShowRecentFilesInQuickAccess
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen
Set-TaskbarOptions -Size Small
Disable-BingSearch
Disable-GameBarTips
Enable-RemoteDesktop
TZUTIL /s "Eastern Standard Time"


Enable-UAC
Enable-MicrosoftUpdate
#Install-WindowsUpdate -acceptEula
