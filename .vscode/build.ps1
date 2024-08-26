# Vars
. ".vscode\Global.ps1"

# intunewin
[string]$Uri = "https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/tree/master"
[string]$Exe = "IntuneWinAppUtil.exe"

# Source content prep tool
if (-not(Test-Path -Path 'E:\Intune Tools\IntuneWinAppUtil.exe')) {
    Invoke-WebRequest -Uri "$Uri/$Exe" -OutFile "E:\Intune Tools\$Exe"
}

# Execute content prep tool
$processOptions = @{
    FilePath = "E:\Intune Tools\IntuneWinAppUtil.exe"
    ArgumentList  = "-c ""$Cache"" -s ""$Cache\Deploy-Application.exe"" -o ""$env:TEMP"" -q"
    WindowStyle = "Normal"
    Wait = $true
}
Start-Process @processOptions

# Rename and prepare for upload
$Dest = "E:\Intune Tools\Intune Apps"
mkdir $Dest\$Application
# Move-Item -Path "$env:TEMP\Deploy-Application.intunewin" -Destination "$Desktop\$Application\$Application.intunewin" -Force -Verbose
Move-Item -Path "$env:TEMP\Deploy-Application.intunewin" -Destination "E:\Intune Tools\Intune Apps\$Application\$Application.intunewin" -Force -Verbose

explorer $Dest
