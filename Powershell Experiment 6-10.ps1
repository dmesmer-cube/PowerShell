$ServicesRunning = Get-Service | Where-Object {($_.Status -match 'Running') -and ($_.DisplayName -like 'Intel*')}
Write-Host ("The number of active Intel services are: " + ($ServicesRunning).Count)
$DisplayService = "to"
while ($DisplayService.ToUpper() -ne 'Y' -or 'N')
{
    $DisplayService = Read-Host "Display Services? (y/n) "
if($DisplayService.ToUpper() -match 'Y')
{
    $ServicesRunning
    break
}
elseif ($DisplayService.ToUpper() -match 'N')
{
    Write-Host ("Services will not be displayed")
    break
}
else 
{
    Write-Host "Your option was not valid; please check your value"
}
}