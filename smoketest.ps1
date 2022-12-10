Write-Output "Testing Arcana"
$url = "http://localhost:80"
$result = (Invoke-WebRequest -uri $url -UseBasicParsing).StatusCode
if ($result -ne "200") {
    Write-Host "Application returned failure"
    exit 1
}
Else {
    Write-Output "Application returned expected result"
}