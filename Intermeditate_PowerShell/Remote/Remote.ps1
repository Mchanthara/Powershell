# know what a script block

$env:COMPUTERNAME

$test= Write-Output "This is some text"

$TestBlock={Write-Output "This is a scriptblock"}

& $TestBlock # & execute what is inside of scriptblock, good for executing commands


<#
PS C:\Users\Xexacute01> Set-Item Wsman:\localhost\Client\TrustedHosts -value 'MikeC-I9,192.168.1.9'
WSManConfig: Microsoft.WSMan.Management\WSMan::localhost\Client

Type            Name                           SourceOfValue   Value
----            ----                           -------------   -----
System.String   TrustedHosts                                   MikeC-I9,192.168.1.9
#>
Write-Output "This is running on  $($env:COMPUTERNAME)"

$someVariable = "This is from Mikes Desktop"

$Creds=Get-Credential
Invoke-Command -ComputerName "192.168.1.9" -Credential $Creds  -ScriptBlock{
   Write-Output "This is running on  $($env:COMPUTERNAME) and $($someVariable)"
}


### TO Pass a Variable to a remote machine there are 2 Ways to do this using Arguementlist
$someVariable = "This is from Mikes Desktop"
$Creds=Get-Credential
Invoke-Command -ComputerName "192.168.1.9" -Credential $Creds  -ScriptBlock{
   Write-Output "This is running on  $($env:COMPUTERNAME) and $($args[0])"
} -ArgumentList $someVariable 

## 2way to pass a variable using the word using:
$someVariable = "This is from Mikes Desktop"
$Creds=Get-Credential
Invoke-Command -ComputerName "192.168.1.9" -Credential $Creds  -ScriptBlock{
   Write-Output "This is running on  $($env:COMPUTERNAME) and $($using:someVariable)"
}


#### How to get values from Remote computer, put variable in front of Invoke-Command cmdlet
$Users=Invoke-Command -ComputerName "192.168.1.9" -Credential $Creds  -ScriptBlock{
    Get-ADUser -Filter * -Server Ad.BTMNA.com
 }
 
$Users | select name


## Persistent Session.. HOW to PS Session remote to it, exit 

$NewSession=New-PSSession -ComputerName "192.168.1.9" -Credential $Creds 

Enter-PSSession -Session $NewSession

# Invoke-command session send to create variable or command
Invoke-Command -Session $NewSession -ScriptBlock {
               $test="Testing testing"
               Write-Output $test
            }   
# Invoke-command always open a new session... 
Invoke-Command -Session $NewSession -ScriptBlock {
                Write-Output $test
             }   

### Disconnecting from PS Sessions and closing out sessions
# Check open sessions
Get-PSSession

#Closing out Sessions
Disconnect-PSSession -Session $NewSession
Remove-PSSession -Session $NewSession

## To remove all PS Sessions from the server
Get-PSSession | Disconnect-PSSession | Remove-PSSession
 
 




Invoke-Command -ComputerName "192.168.1.9" -ScriptBlock{
    Write-Output "This is running on  $($env:COMPUTERNAME)"
 }

