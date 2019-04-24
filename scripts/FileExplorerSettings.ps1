#--- Configuring Windows properties ---
#--- Windows Features ---
# Show hidden files, Show protected OS files, Show file extensions
# Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles 
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableExpandToOpenFolder -DisableOpenFileExplorerToQuickAccess -DisableShowFrequentFoldersInQuickAccess -DisableShowRecentFilesInQuickAccess


#--- File Explorer Settings ---
# Adds things back in your left pane like recycle bin
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
# Taskbar where window is open for multi-monitor
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

## Change Explorer home screen back to "This PC"
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
## Change it back to "Quick Access" (Windows 10 default)
## Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 2

## Will expand explorer to the actual folder you're in
#Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1

## These make "Quick Access" behave much closer to the old "Favorites"
## Disable Quick Access: Recent Files
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0
## Disable Quick Access: Frequent Folders
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0
## To Restore:
## Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 1
## Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 1

