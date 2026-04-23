# Auto-login script for Administrator
# Sets Windows to automatically log in as Administrator on boot

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$Username = "Administrator"
$Password = "M33s0108!"

Write-Host "Setting up auto-login for $Username..."

# Set registry values
Set-ItemProperty -Path $RegPath -Name "AutoAdminLogon" -Value "1" -Type String
Set-ItemProperty -Path $RegPath -Name "DefaultUserName" -Value $Username -Type String
Set-ItemProperty -Path $RegPath -Name "DefaultPassword" -Value $Password -Type String

# Remove ForceAutoLogon if it exists (can interfere)
Remove-ItemProperty -Path $RegPath -Name "ForceAutoLogon" -ErrorAction SilentlyContinue

Write-Host "Auto-login configured successfully!"
Write-Host "User: $Username"
Write-Host "Restart the computer to test."
