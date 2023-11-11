function Switch-MacAddress{
    Get-NetAdapter
    [String]$interface = Read-Host "enter interface you wish to change: "
    $usrSelection = Read-Host "do you want to change you MAC address for " $interface + " y/n: "
    
    if ($usrSelection -eq 'y'){
        $interfaceObject = Get-NetAdapter -Name $interface
        $newMac = Read-Host "enter new MAC address. format xx:xx:xx:xx:xx:xx: "
            if ($interfaceObject.Status -eq "up"){
                Disable-NetAdapter -Name $interface
                Set-NetAdapter -Name $interface -MacAddress $newMac
                Enable-NetAdapter -Name $interface
            }
            elseif ($interfaceObject.Status -eq "Disconnected"){
                Set-NetAdapter -Name $interface -MacAddress $newMac
            }
    }
    else{
        Write-Host "MAC address not changed"
    }
}