Write-Host `n"IP and Port Configurations for Host Machine" -BackgroundColor Blue
$NetworkIPv4 = Get-NetIPAddress | Where-Object{($_.AddressFamily -match "IPv4")}
$array = ($NetworkIPv4.IPAddress).count
Write-Host `n"IPv4 Address Adapters" -ForegroundColor Magenta
for ($i = 0; $i -lt $array; $i++) 
{
    Write-Host Address (${i}+1): $NetworkIPv4.IPAddress[$i]
    Write-Host Interface (${i}+1): $NetworkIPv4.InterfaceAlias[$i]`n   
}
Write-Host Public IP -ForegroundColor Green
(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
Write-Host ""
Write-Host Computer Info. -ForegroundColor Blue -BackgroundColor Gray
$ComputerInfo = Get-ComputerInfo 
Write-Host $ComputerInfo.CsManufacturer $ComputerInfo.CsModel Model`# $ComputerInfo.CsName
Write-Host $ComputerInfo.OsName v. $ComputerInfo.OsVersion
Write-Host Number of Processors: $ComputerInfo.CsNumberOfLogicalProcessors`nOwned by $ComputerInfo.OsOrganization
Write-Host `nTime Stamp: (Get-Date)`n