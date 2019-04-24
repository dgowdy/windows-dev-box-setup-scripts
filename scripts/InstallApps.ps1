### HACK Workaround choco / boxstarter path too long error
## https://github.com/chocolatey/boxstarter/issues/241
New-Item -Path "$env:userprofile\AppData\Local\Temp\ChocoCache" -ItemType directory -Force | Out-Null
$ChocoCachePath = "--cacheLocation=`"$env:userprofile\AppData\Local\Temp\ChocoCache`""

# tools we expect devs across many scenarios will want
#--- Windows Subsystems/Features ---
cinst -y NetFx3 -source windowsfeatures

#--- Tools ---
cup -y 7zip.install $ChocoCachePath
cup -y notepadplusplus.install $ChocoCachePath
cup -y sysinternals --params="'/InstallDir:C:\Vivid\Sysinternals'" $ChocoCachePath
cup -y treesizefree $ChocoCachePath

#--- Apps ---
cup -y adobereader $ChocoCachePath
cup -y googlechrome $ChocoCachePath
cup -y putty.install $ChocoCachePath

# personalize
#choco install -y office365business

