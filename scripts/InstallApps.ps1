# Use Remembered Arguments For Upgrade
choco feature enable -n useRememberedArgumentsForUpgrades

### HACK Workaround choco / boxstarter path too long error
## https://github.com/chocolatey/boxstarter/issues/241
New-Item -Path "$env:userprofile\AppData\Local\Temp\ChocoCache" -ItemType directory -Force | Out-Null
$ChocoCachePath = "--cacheLocation=`"$env:userprofile\AppData\Local\Temp\ChocoCache`""

# Standard tools most customers will want
#--- Windows Subsystems/Features ---
choco install -y NetFx3 -source windowsfeatures

#--- Tools ---
choco upgrade -y 7zip.install $ChocoCachePath
choco upgrade -y notepadplusplus.install $ChocoCachePath
choco upgrade -y sysinternals $ChocoCachePath --params="/InstallDir:C:\Vivid\Sysinternals"
choco upgrade -y treesizefree $ChocoCachePath

#--- Apps ---
choco upgrade -y adobereader $ChocoCachePath
choco upgrade -y googlechrome $ChocoCachePath

# personalize
#choco install -y office365business

