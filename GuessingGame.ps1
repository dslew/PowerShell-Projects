#This was also an expansion of one of the Labs from my course.
#It really isn't anything impressive, however, it does display the development of my skills.
#It was originally a task of nesting if/elseif/else statements which I decided to take a little further.
#At the end of the code in the 'expert' level you will see that I made the realisation that this game could be scripted waaaaay more easily.
#Please keep in mind the purpose of the actual Lab (although not the ideal solution for this game) was to practice nesting.

function Launch-GuessingGame{
    do{
        Write-Host ""
        Write-Host "Welcome to the Guessing Game!"
        Write-Host "Select your difficulty:"
        Write-Host "[1] Beginner"
        Write-Host "[2] Intermediate"
        Write-Host "[3] Expert"
        Write-Host "[Q] Exit Game"
        $difficultySelection = Read-Host
        Write-Host ""
        if($difficultySelection -eq 1){
            Get-Beginner
        }
        elseif($difficultySelection -eq 2){
            Get-Intermediate
        }
        elseif($difficultySelection -eq 3){
            Get-Expert
        }
        elseif($difficultySelection -eq 'Q'){
            Write-Host "Exiting Game"
        }
        else{
        }
    }until($difficultySelection -eq 'Q')
}

function Get-Beginner {
#also beginner scripting
    do{
    Write-Host "Alright Newby, Listen up!"
    Write-Host "This is a super simple game. I'm gonna think of a number between 1 and 3"
    Write-Host "you're gonna get two guesses"
    [Int]$userAttempt1 = Read-Host
    $numberToGuess = Get-Random -Minimum 1 -Maximum 3
        if($userAttempt1 -eq $numberToGuess){
            Write-Host "Bingo! you got it. My number was " $numberToGuess
            $anotherGame = Read-Host "Another game? [y/n]"
        }
        elseif($userAttempt1 -lt $numberToGuess){
            Write-Host "Nope. Too low! try again!"
            $userAttempt2 = Read-Host
            if($userAttempt2 -eq $numberToGuess){
                Write-Host "Bingo! you got it. My number was " $numberToGuess
                $anotherGame = Read-Host "Another game? [y/n]"
            }
            else{
                Write-Host "Sorry... My Number was " $numberToGuess
                $anotherGame = Read-Host "Another game? [y/n]"
            }
        }
        elseif($userAttempt1 -gt $numberToGuess){
            Write-Host "Nope. Too high! try again!"
            $userAttempt2 = Read-Host
            if($userAttempt2 -eq $numberToGuess){
                Write-Host "Bingo! you got it. My number was " $numberToGuess
                $anotherGame = Read-Host "Another game? [y/n]"
            }
            else{
                Write-Host "Sorry... My Number was " $numberToGuess
                $anotherGame = Read-Host "Another game? [y/n]"
            }
        }
    }until($anotherGame -eq 'n')
}


function Get-Intermediate {
#still a beginner but i guess it was good practice for nesting my if/elseif/else
    do{
    Write-Host "So, you think you're good at guessing? well, Listen up!"
    Write-Host "This is a super simple game. I'm gonna think of a number between 1 and 10"
    Write-Host "you're gonna get three guesses"
    [Int]$userAttempt1 = Read-Host
    $numberToGuess = Get-Random -Minimum 1 -Maximum 10
        if($userAttempt1 -eq $numberToGuess){
            Write-Host "Bingo! you got it. My number was " $numberToGuess
            $anotherGame = Read-Host "Another game? [y/n]"
        }
        elseif($userAttempt1 -lt $numberToGuess){
            Write-Host "Nope. Too low! try again!"
            $userAttempt2 = Read-Host
                if($userAttempt2 -eq $numberToGuess){
                Write-Host "Bingo! you got it. My number was " $numberToGuess
                $anotherGame = Read-Host "Another game? [y/n]"
                }
                elseif($userAttempt2 -lt $numberToGuess){
                    Write-Host "Nope. Too low! try again!"
                    $userAttempt3 = Read-Host
                    if($userAttempt3 -eq $numberToGuess){
                        Write-Host "Bingo! you got it. My number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                    else{
                        Write-Host "Sorry... My Number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                }
                elseif($userAttempt2 -gt $numberToGuess){
                    Write-Host "Nope. Too high! try again!"
                    $userAttempt3 = Read-Host
                    if($userAttempt3 -eq $numberToGuess){
                        Write-Host "Bingo! you got it. My number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                    else{
                        Write-Host "Sorry... My Number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                }
        }
        elseif($userAttempt1 -gt $numberToGuess){
            Write-Host "Nope. Too high! try again!"
            $userAttempt2 = Read-Host
            if($userAttempt2 -eq $numberToGuess){
                Write-Host "Bingo! you got it. My number was " $numberToGuess
                $anotherGame = Read-Host "Another game? [y/n]"
                }
                elseif($userAttempt2 -lt $numberToGuess){
                    Write-Host "Nope. Too low! try again!"
                    $userAttempt3 = Read-Host
                    if($userAttempt3 -eq $numberToGuess){
                        Write-Host "Bingo! you got it. My number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                    else{
                        Write-Host "Sorry... My Number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                }
                elseif($userAttempt2 -gt $numberToGuess){
                    Write-Host "Nope. Too high! try again!"
                    $userAttempt3 = Read-Host
                    if($userAttempt3 -eq $numberToGuess){
                        Write-Host "Bingo! you got it. My number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
                    else{
                        Write-Host "Sorry... My Number was " $numberToGuess
                        $anotherGame = Read-Host "Another game? [y/n]"
                    }
        }

    }
    }until($anotherGame -eq 'n')
}

function Get-Expert {
#got too lazy to nest the same decision five layers deep and found an easier way to do it.
    do{
    Write-Host "feeling lucky, Punk? well, Listen up!"
    Write-Host "This is a super simple game. I'm gonna think of a number between 1 and 100"
    Write-Host "you're gonna get five guesses"
    
       
        $numberToGuess = Get-Random -Minimum 1 -Maximum 100
    $attempts = 5

    for ($i = 1; $i -le $attempts; $i++){
    
    [Int]$userAttempt = Read-Host
        if($userAttempt -eq $numberToGuess){
            Write-Host "Bingo! you got it. My number was " $numberToGuess
            $anotherGame = Read-Host "Another game? [y/n]"
        }
        elseif($userAttempt -lt $numberToGuess){
            Write-Host "Nope. Too low! try again!"
        }
        elseif($userAttempt -gt $numberToGuess){
            Write-Host "Nope. Too high! try again!"
        }

    }
    Write-Host "Sorry... My Number was " $numberToGuess
    $anotherGame = Read-Host "Another game? [y/n]"
    }until($anotherGame -eq 'n')
}
