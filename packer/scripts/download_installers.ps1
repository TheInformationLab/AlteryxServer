## This s3 bucket needs to be made public first...
$url = "https://ayx-installers.s3-us-west-2.amazonaws.com/AlteryxServerInstallx64_2019.2.7.63499.exe"
$output = "C:\Users\Administrator\Desktop\AlteryxServerInstallx64_2019.2.7.63499.exe"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)" 