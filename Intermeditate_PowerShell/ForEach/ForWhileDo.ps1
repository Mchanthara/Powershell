#### For While Loop 
#### Do While Loop
#### Do Unitl Loop
## i++ incrementer
For($i=0;$i -lt 10;$i++){

        Write-Output $i
}

## i++ incrementer $i+=2
For($i=0;$i -lt 10;$i+=2){

    Write-Output $i
}

# two ways in doing the same thing
$testArray =@('Steve','Mike','Tim')

for($i=0;$i -lt $testArray.Length;$i++){

  $testArray[$i]+="Chanthara"
}

$testArray


### Best way to keep original data safe and creating new data off of that data

$testArray =@('Steve','Mike','Tim')
# another way using Foreach loop
Foreach($item in $testArray){

    $item+="Doe"
    Write-Output $item
}

$testArray

################## While loop
### While(This condition is true/fale){execute this}

Get-Date
while ((get-date).Minute -eq 52){
    Get-Date
}

while($true){
    Write-Output "Welcome to the Parrot Application"
    Write-Output "Enter 'Q' to Quit"

    $input = Read-Host -Prompt "Please enter a phrase to quit"
        If($input -eq "Q"){
            Break
        }
    Write-Output "You have entered: $input"
}

### Prompt user to input data
Write-Output "Welcome to the Parrot Application"
Write-Output "Enter 'Q' to Quit"
$input = Read-Host -Prompt "Please enter a phrase to quit"
while($input -ne 'Q'){
    Write-Output "You have entered: $input"
    $input = Read-Host -Prompt "Please enter a phrase to quit"
}


########### Do While Loop... makes more sense 

Write-Output "Welcome to the Parrot Application"
Write-Output "Enter 'Q' to Quit"

do{
    $input = Read-Host -Prompt "Please enter a phrase"
    if($input -ne 'q'){
            Write-Output "You have entered $input"
            Write-Host "You not entered the right phrase! :D"
    }
   
}While($input -ne 'Q')    # difference between do while and do until


############# Do Until Loop, be careful with infinite loop

do{
Write-Output "hi"
}until($true)



Write-Output "Welcome to the Parrot Application"
Write-Output "Enter 'Q' to Quit"

do{
    $input = Read-Host -Prompt "Please enter a phrase"
    if($input -ne 'q'){
            Write-Output "You have entered $input"
            Write-Host "You not entered the right phrase! :D"
    }
   
    }until($input -eq 'q')
    