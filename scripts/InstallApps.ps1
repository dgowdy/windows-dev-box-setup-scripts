
### HACK Workaround choco / boxstarter path too long error
## https://github.com/chocolatey/boxstarter/issues/241
#New-Item -Path "$env:userprofile\AppData\Local\Temp\ChocoCache" -ItemType directory -Force | Out-Null
#$ChocoCachePath = "--cacheLocation=`"$env:userprofile\AppData\Local\Temp\ChocoCache`""
$ChocoCachePath = "$env:USERPROFILE\AppData\Local\ChocoCache"
New-Item -Path $ChocoCachePath -ItemType directory -Force | Out-Null

# Standard tools most customers will want
#--- Windows Subsystems/Features ---
choco install -y NetFx3 -source windowsfeatures

#--- Tools ---
choco upgrade -y --cacheLocation="$ChocoCachePath" 7zip.install
choco upgrade -y --cacheLocation="$ChocoCachePath" notepadplusplus.install
choco upgrade -y --cacheLocation="$ChocoCachePath" sysinternals --params="/InstallDir:C:\Vivid\Sysinternals"
choco upgrade -y --cacheLocation="$ChocoCachePath" treesizefree

#--- Apps ---
choco upgrade -y --cacheLocation="$ChocoCachePath" adobereader
choco upgrade -y --cacheLocation="$ChocoCachePath" googlechrome

# personalize
#choco install -y office365business

