# installing Windows Template Studio VSIX
Write-Host "Installing Windows Template Studio" -ForegroundColor "Yellow"

$wtsFullPath = [System.IO.Path]::Combine((Resolve-Path $env:USERPROFILE).path, $wtsVsix);


# Set Vivid settings

# List of folders to check for and create the folders if they don't exist
$RMMBase = $env:SystemDrive + "\" + "Vivid"
$ErrorPath = $RMMBase + "\Errors"
$LogPath = $RMMBase + "\Logs"
$StagingPath = $RMMBase + "\Staging"
$AllFolders = $RMMBase, $ErrorPath, $LogPath, $StagingPath

# Create Folders
foreach ($item in $AllFolders) {
    Install-Directory -Path $item
}

# Make sure the Vivid folder is hidden
Get-Item -Path $RMMBase -Force | ForEach-Object { $_.Attributes = $_.Attributes -bor "Hidden" }

# Environment Variables
Set-EnvironmentVariable -Name 'VividFolder' -Value $RMMBase -ForComputer -Force
