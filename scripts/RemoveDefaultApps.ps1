#--- Uninstall unecessary applications that come with Windows out of the box ---
Write-Host "Uninstall some applications that come with Windows out of the box" -ForegroundColor "Yellow"

#Referenced to build script
# https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
# https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
# https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
# https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1

function removeApp {
    Param ([string]$appName)
    Write-Output "Trying to remove $appName"
    Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}

$applicationList = @(
    "Microsoft.3DBuilder"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingWeather"
    "Microsoft.FreshPaint"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.Sway"
    "Microsoft.Print3D"
    "Microsoft.XboxApp"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "*MarchofEmpires*"
    "*Minecraft*"
    "*Solitaire*"

    # non-Microsoft
    "*Autodesk*"
    "*BubbleWitch*"
    "G5*"
    "*Facebook*"
    "*Keeper*"
    "*Netflix*"
    "*Twitter*"
    "*Plex*"
    "*.Duolingo-LearnLanguagesforFree"
    "*.EclipseManager"
    "ActiproSoftwareLLC.562882FEEB491" # Code Writer
    "*.AdobePhotoshopExpress"
    "PandoraMediaInc.29680B314EFC2"
    "Flipboard.Flipboard"
    "ShazamEntertainmentLtd.Shazam"
    "king.com.CandyCrushSaga"
    "king.com.CandyCrushSodaSaga"
    "king.com.*"
    "ClearChannelRadioDigital.iHeartRadio"
    "6Wunderkinder.Wunderlist"
    "Drawboard.DrawboardPDF"
    "2FE3CB00.PicsArt-PhotoStudio"
    "D52A8D61.FarmVille2CountryEscape"
    "TuneIn.TuneInRadio"
    "GAMELOFTSA.Asphalt8Airborne"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "flaregamesGmbH.RoyalRevolt2"
    "Playtika.CaesarsSlotsFreeCasino"
    "A278AB0D.MarchofEmpires"
    "KeeperSecurityInc.Keeper"
    "ThumbmunkeysLtd.PhototasticCollage"
    "XINGAG.XING"
    "ActiproSoftwareLLC.562882FEEB491"
    "*Dropbox*"

    # apps which cannot be removed using Remove-AppxPackage
    #"Microsoft.BioEnrollment"
    #"Microsoft.CommsPhone"
    #"Microsoft.Messaging"
    #"Microsoft.MicrosoftEdge"
    #"Microsoft.OneConnect"
    #"Microsoft.Windows.Cortana"
    #"Microsoft.WindowsFeedback"
    #"Microsoft.WindowsMaps"
    #"Microsoft.WindowsPhone"
    #"Microsoft.WindowsSoundRecorder"
    #"Microsoft.XboxGameCallableUI"
    #"Microsoft.XboxIdentityProvider"
    #"Windows.ContactSupport"
);

foreach ($app in $applicationList) {
    removeApp $app
}

# To prevent these apps from reappearing at the next update, create a registry key for each app, then update the computer.
# Remove the registry keys belonging to the apps you want to keep. 
# For example, if you want to keep the Bing Weather app, delete it's registry key:

$Deprovisioned = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned"
If (-Not (Test-Path -Path $Deprovisioned)) {
    New-Item -Path $Deprovisioned -Force | Out-Null
}

# Block Apps
$blockapps = @(
    
    # Microsoft Apps
    "Microsoft.BingWeather_4.28.10351.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.GetHelp_10.1706.20381.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.Getstarted_6.15.12641.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.Microsoft3DViewer_6.1903.4012.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.MicrosoftOfficeHub_18.1903.1152.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.MicrosoftSolitaireCollection_4.3.4032.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.MicrosoftStickyNotes_3.1.55.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.MSPaint_2019.408.1721.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.Office.OneNote_16001.11601.20066.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.People_2019.305.632.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.Print3D_3.3.791.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.SkypeApp_14.42.60.0_neutral_~_kzf8qxf38zg5c"
    "Microsoft.Wallet_2.1.18009.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.WebMediaExtensions_1.0.13321.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.Windows.Photos_2019.19021.18010.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.WindowsCamera_2019.124.60.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.WindowsFeedbackHub_2019.327.1732.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.Xbox.TCUI_1.24.10001.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.XboxApp_44.44.7002.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.XboxGameOverlay_1.40.23001.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.XboxGamingOverlay_1.16.1012.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.XboxIdentityProvider_12.46.25001.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.ZuneMusic_2019.19031.11411.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.ZuneVideo_2019.19031.11411.0_neutral_~_8wekyb3d8bbwe"        

    # apps which cannot be blocked
    #"Microsoft.OneConnect_5.1902.361.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.StorePurchaseApp_11811.1001.1813.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.WindowsAlarms_2019.305.627.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.WindowsCalculator_10.1902.42.0_neutral_~_8wekyb3d8bbwe"
    #"microsoft.windowscommunicationsapps_16005.11425.20190.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.WindowsMaps_2019.325.2243.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.WindowsSoundRecorder_2019.305.610.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.WindowsStore_11811.1001.2713.0_neutral_~_8wekyb3d8bbwe"
    #"Microsoft.DesktopAppInstaller_8wekyb3d8bbwe"
);

foreach ($app in $blockapps) {
    Write-Output "Trying to block $app"
    New-Item -Path $Deprovisioned\$app -Force | Out-Null
}
