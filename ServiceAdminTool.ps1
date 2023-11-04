#This was an expansion on one of the Labs in my Udemy course.
#The orignial Lab was to write a simple bit of script to change the status of 'x' service from "running" to "stopped" and vice versa.
#It also had no space for user input, it just simply required a certain service to be designated as a variable and go from there.

function Launch-ServiceAdminTool{
    Write-Host ""
    Write-Host "Welcome to the Service administration tool"
    Write-Host ""
        do{
        Write-Host ""
        Write-Host "Please select function:"
        Write-Host "[1] Get all services"
        Write-Host "[2] Get all running services"
        Write-Host "[3] Get all stopped services"
        Write-Host "[4] Check individual service"
        Write-Host "[Q] Exit program"
        Write-Host ""
        $userInput = Read-Host
            if($userInput -eq 1){
                Get-Service
            }
            elseif($userInput -eq 2){
                $runningServices = Get-Service | Where-Object {$PSItem.Status -contains "running"}
                $runningServices
            }
            elseif($userInput -eq 3){
                $stoppedServices = Get-Service | Where-Object {$PSItem.Status -contains "stopped"}
                $stoppedServices
            }
            elseif($userInput -eq 4){
                $userSelection = Read-Host "Please enter the name of the service"
                $selectedService = Get-Service -Name $userSelection
                Write-Host ""
                Write-Host $selectedService.Name " is currently " $selectedService.Status
                if($selectedService.Status -contains "Running"){
                    do{
                        $stopService = Read-Host "Would you like to stop this Service? [y/n]"
                        if($stopService -eq 'y'){
                            Stop-Service -Name $selectedService.Name
                            Write-Host $selectedService.Name "has been stopped"
                        }
                        elseif($stopService -eq 'n'){
                            Write-Host $selectedService.Name "is still" $selectedService.Status
                        }
                        else{
                            Write-Host "Invalid input"
                        }
                    }until($stopService -eq 'y' -or $stopService -eq 'n')
                }
                elseif($selectedService.Status -contains "stopped"){
                    do{
                        $startService = Read-Host "Would you like to start this Service? [y/n]"
                        if($startService -eq 'y'){
                            Start-Service -Name $selectedService.Name
                            Write-Host $selectedService.Name "has been started"
                        }
                        elseif($startService -eq 'n'){
                            Write-Host $selectedService.Name "is still" $selectedService.Status
                        }
                        else{
                            Write-Host "Invalid input"
                        }
                    }until($startService -eq 'y' -or $startService -eq 'n')
                }
            }
            elseif($userInput -eq 'Q'){
                Write-Host "Exiting program"
            }
            else {
                Write-Host "Invalid input"
            }
        }Until($userInput -eq 'Q')
}
