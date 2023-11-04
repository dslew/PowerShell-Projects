#This project is very much a 'work in progress", so please don't be too critical!
#The purpose of this project was to build on the practical application of PowerShell.
#I'm hoping to put together something similar for creating Users and Groups on Azure.
#So this is I guess the foundations for my future project.
#
#You will see in the comments where I have had issues, please feel free to add suggestions/corrections in the comments section.

#SUB FUNCTIONS:
#having trouble with displaying Local Users: doesn't seem to work on first attempt. The users are displayed only after the next function is run. Have tried a few different variations but it seems to produce the same result.
function Display-Users{
    $userList = Get-LocalUser
    $userList
}

#hoping to add passwords in the future.
function New-BulkLocalUser{
    do {
        $exit = Read-Host 'Would you like to create a new user[y/n]?'
            if($exit -eq 'y'){
                Write-Host 'Enter New User Name'
                [String]$newUserName = Read-Host
                $date = Get-Date
                $userDescription = 'User created on ' + $date.ToString()
                New-LocalUser -Name $newUserName -NoPassword -Description $userDescription
            }
         }
    until ($exit -eq 'n')
 }   

function Disable-BulkLocalUser{
    do {
        $exit = Read-Host 'Would you like to disable a user[y/n]?'
            if($exit -eq 'y'){
                [String]$disableUserName = Read-Host 'Enter User Name '
                Disable-LocalUser -Name $disableUserName
                $printDU = Get-LocalUser -Name $disableUserName
                $printDU
            }
         }
    until ($exit -eq 'n')
 }

function Enable-BulkLocalUser{
    do {
        $exit = Read-Host 'Would you like to enable a user[y/n]?'
            if($exit -eq 'y'){
                [String]$enableUserName = Read-Host 'Enter User Name '
                enable-LocalUser -Name $enableUserName
                $printEU = Get-LocalUser -Name $enableUserName
                $printEU
            }
         }
    until ($exit -eq 'n')
 }

function Remove-BulkLocalUser{
    $cannotDelete = 'Administrator','DefaultAccount','dslew', 'WDAGUtilityAccount','Kat'
    do {
        $exit = Read-Host 'Would you like to remove a user[y/n]?'
            if($exit -eq 'y'){
                [String]$removeUserName = Read-Host 'Enter User Name'
                    if($cannotDelete -contains $removeUserName){
                            Write-Host -ForegroundColor Red "You cannot delete this account"
                    }
                    else{
                        Write-Host -ForegroundColor Red 'Are you sure you want to remove' $removeUserName '[y/n]?'
                        $confirm = Read-Host
                        if($confirm -eq 'y'){
                            Remove-LocalUser -Name $removeUserName
                            Write-Host $removeUserName "has been removed"
                        }
                        elseif($confirm -eq 'n'){
                            Write-Host 'User not deleted'
                        }
            }
         }
    
    }until($exit -eq 'n')
 }

 function New-UserFromCsv {

 Write-Host "Enter file Path"
 [String]$source = Read-Host
 $userCsv = Import-Csv -Path $source

     foreach($usr in $UserCsv){
        do{
            Write-Host "Would you like to create user: " $usr.LOGINNAME " [y/n]"
            $userInput = Read-Host
                if($userInput -eq 'y'){
                    $password =  ConvertTo-SecureString $usr.USERPASSWORD -AsPlainText -Force
                    $description = 'User created on ' + $date.ToString()
                    New-LocalUser -Name $usr.LOGINNAME -Password $password -Description $description
                }
                elseif($userInput -eq 'n'){
                    Write-Host $usr.LOGINNAME "Not created"
                }
                else{
                    Write-Host "Invalid Input"
            }
            }until ($userInput -eq 'n' -or $userInput -eq 'y')
     }

 }


#MAIN FUNCTION
function Launch-UserAdminTool{

    Write-Host ""
    Write-Host -BackgroundColor White -ForegroundColor Black "Welcome to the user administration tool"
    Write-Host ""


        do{
            Write-Host "Choose Administrative task:"
            Write-Host "[1] Display all Users"
            Write-Host "[2] Create new Users"
            Write-Host "[3] Disable Users"
            Write-Host "[4] Enable User"
            Write-Host "[5] Remove User"
            Write-host "[6] Create User from CSV"
            Write-Host "[Q] Quit"
            Write-Host ""
            $input = Read-Host 
            if($input -eq '1'){
                #Get-LocalUser
                Display-Users
            }
            elseif($input -eq '2'){
                New-BulkLocalUser
            }
            elseif($input -eq '3'){
                Disable-BulkLocalUser
            }
            elseif($input -eq '4'){
                Enable-BulkLocalUser
            }
            elseif($input -eq '5'){
                Remove-BulkLocalUser
            }
            elseif($input -eq '6'){
                New-UserFromCsv
            }
            Elseif($input -eq 'Q'){
                Write-Host "Exiting Program"
            }
            Else {
                Write-Host "Invalid input"
            }
        }
        until($input -eq 'Q')
}
