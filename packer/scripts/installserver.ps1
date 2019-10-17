$licensekey = ""
$email = ""
$installerpath = "C:\Users\Administrator\Desktop\AlteryxServerInstallx64_2019.2.7.63499.exe"
$licensecmd = "C:\Program Files\Alteryx\bin\AlteryxActivateLicenseKeyCmd.exe"
$servicepath = "C:\Program Files\Alteryx\bin\AlteryxService.exe"

cmd.exe /c $installerpath /s

cmd.exe /c $licensecmd $licensekey $email

cmd.exe /c "powershell mv -Force C:\Users\Administrator\Desktop\RuntimeSettings.xml C:\ProgramData\Alteryx\RuntimeSettings.xml"

cmd.exe /c $servicepath start