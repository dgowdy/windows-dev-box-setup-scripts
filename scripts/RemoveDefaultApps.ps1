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
	Get-AppXProvisionedPackage -Online | Where DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}

$applicationList = @(
	"Microsoft.3DBuilder"
	"Microsoft.BingFinance"
	"Microsoft.BingNews"
	"Microsoft.BingSports"
	"Microsoft.BingWeather"
	"Microsoft.Getstarted"
	"Microsoft.GetHelp"
	"Microsoft.MicrosoftOfficeHub"
	"Microsoft.MicrosoftStickyNotes"
	"Microsoft.Office.Sway"
	"Microsoft.XboxApp"
	"Microsoft.XboxIdentityProvider"
	"Microsoft.ZuneMusic"
	"Microsoft.ZuneVideo"
	"Microsoft.NetworkSpeedTest"
	"Microsoft.FreshPaint"
	"Microsoft.Print3D"
	"*MarchofEmpires*"
	"*Minecraft*"
	"*Solitaire*"
	   
	# non-Microsoft
	"*Autodesk*"
	"*BubbleWitch*"
    "king.com*"
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
	#"Microsoft.MicrosoftEdge"
	#"Microsoft.Windows.Cortana"
	#"Microsoft.WindowsFeedback"
	#"Microsoft.XboxGameCallableUI"
	#"Microsoft.XboxIdentityProvider"
	#"Windows.ContactSupport"
	#"Microsoft.OneConnect"
	#"Microsoft.CommsPhone"
	#"Microsoft.WindowsMaps"
	#"Microsoft.Messaging"
	#"Microsoft.WindowsPhone"
	#"Microsoft.WindowsSoundRecorder"
);

foreach ($app in $applicationList) {
    removeApp $app
}