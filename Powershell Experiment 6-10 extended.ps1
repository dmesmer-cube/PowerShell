$ServicesRunning = Get-Service | Where-Object {($_.Status -match 'Running') -and ($_.DisplayName -like 'Intel*')}
Write-Host ("The number of active Intel services are: " + ($ServicesRunning).Count)
$DisplayService = "to" #Initializing Variable
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
$DisplayNew = "to" #Initialization
while ($DisplayNew.ToUpper() -ne 'Y' -or 'N') 
{
    $DisplayNew = Read-Host "Display other services? (y/n)"
    if ($DisplayNew.ToUpper() -match 'Y') 
    {
        $ServiceReceived = "to"
        [String]$ServiceReceived = Read-Host "Type name of service"
        $MoreServicesRunning = Get-Service | Where-Object {$_.DisplayName -match $ServiceReceived}
        if ($MoreServicesRunning.DisplayName -notmatch $ServiceReceived) 
        {
        Write-Host "No results found"    
        }
        else 
        {
            $MoreServicesRunning
        break
        }
        
    }
    elseif ($DisplayNew.ToUpper() -match 'N')
    {
        break
    }
    else 
    {
    Write-Host "Your option was not valid; please check your value"    
    }  
}
