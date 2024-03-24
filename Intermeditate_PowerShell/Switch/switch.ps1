<#

In PowerShell, the switch statement provides a way to perform different actions based on the value of a variable or expression. 
It's similar to the switch statement found in many other programming languages.
#>

$filepath = "C:\Temp\Intermeditate_PowerShell\Switch\Names.txt"

$Data = Get-Content -path $filepath
    $firstName = $Data[0]


    If($firstName -eq "Mike"){
                Write-Output "My name is Mike"
            }elseif ($firstName -eq "Sam") {
                Write-Out "My name is Sam"
            }elseif ($firstName -eq "Danny") { 
                Write-Output "My name is Danny"
            }else {
                Write-Output "I don't know my name"
            }

# lets create in a switch statement
switch($firstName) {
        "Mike"{  Write-Output "My name is Mike" 
            Break            
            }
       
        "Sam"{  Write-Output "My name is Sam" 
        break}
        "Danny"{  Write-Output "My name is Danny"
        break}
        
        default{
            Write-Output "I don't know my name"
        }
}

# Switch statements usually faster than If statements .. it all depends
switch($Data.Count){
   {$_ -in (2..6)}{
    Write-Output "this file has between 2-6 lines"
    }
  
   {$_ -eq 6}{
    Write-Output "this file EXACTLY  6 lines"
    break    # stop when evaluation reaches , or it will continue testing the other cases
    }

   {$_ -lt 7}{
    Write-Output "this file has  7 or less lines"
   }
   default{
    Write-Output "this file has more than 6 lines"
   
   }
}



# Sample of a powershell switch

$fruit = "apple"

switch ($fruit)
{
    "apple" { Write-Host "It's an apple" }
    "banana" { Write-Host "It's a banana" }
    "orange" { Write-Host "It's an orange" }
    default { Write-Host "It's something else" }
}
