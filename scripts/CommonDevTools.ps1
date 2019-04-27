### HACK Workaround choco / boxstarter path too long error
## https://github.com/chocolatey/boxstarter/issues/241
$ChocoCachePath = "$env:USERPROFILE\AppData\Local\ChocoCache"
New-Item -Path $ChocoCachePath -ItemType directory -Force | Out-Null

# tools we expect devs across many scenarios will want
choco upgrade -y --cacheLocation="$ChocoCachePath" vscode
choco upgrade -y --cacheLocation="$ChocoCachePath" git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco upgrade -y --cacheLocation="$ChocoCachePath" putty.install
choco upgrade -y --cacheLocation="$ChocoCachePath" netscan
