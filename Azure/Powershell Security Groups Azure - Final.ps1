function Start-PortMonitor 
{
    Connect-AzAccount -Identity
    $CutoffAfternoon = Get-Date -Hour 18 -Minute 0 -Second 0
    $CutonMorning = Get-Date -Hour 8 -Minute 0 -Second 0
    $TimeStampNow = Get-Date
    if ($TimeStampNow -gt $CutonMorning -and $TimeStampNow -lt $CutoffAfternoon) 
    {
     $NetworkSGroup = Get-AzNetworkSecurityGroup -Name "Experimental-RHEL-1-nsg" -ResourceGroupName "Experimental"
     $NetworkSGroup | Get-AzNetworkSecurityRuleConfig -Name "RDP"
     Set-AzNetworkSecurityRuleConfig -Name "RDP" -NetworkSecurityGroup $NetworkSGroup -Access "Allow" `
     -DestinationAddressPrefix * -DestinationPortRange 3389 -Direction "Inbound" `
     -Priority 300 -Protocol "Tcp" -SourceAddressPrefix "Internet" -SourcePortRange * | Set-AzNetworkSecurityGroup
    }
    elseif ($TimeStampNow -lt $CutonMorning -or $TimeStampNow -gt $CutoffAfternoon) 
    {
     $NetworkSGroup = Get-AzNetworkSecurityGroup -Name "Experimental-RHEL-1-nsg" -ResourceGroupName "Experimental"
     $NetworkSGroup | Get-AzNetworkSecurityRuleConfig -Name "RDP"
     Set-AzNetworkSecurityRuleConfig -Name "RDP" -NetworkSecurityGroup $NetworkSGroup -Access "Deny" `
     -DestinationAddressPrefix * -DestinationPortRange 3389 -Direction "Inbound" `
     -Priority 300 -Protocol "Tcp" -SourceAddressPrefix "Internet" -SourcePortRange * | Set-AzNetworkSecurityGroup
    }
   
}

Start-PortMonitor