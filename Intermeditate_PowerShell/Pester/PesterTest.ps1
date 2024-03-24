
param (
    $Computername
)
# Components Describe,Context,It
Describe 'Checking Deployment'{
        Context 'Checking Windows Services'{
            }
        It 'Making sure the print spooler is running'{
            $Service = Invoke-Command -ComputerName $Computername -ScriptBlock{
                Get-Service Spooler
            }
            $Service.status | Should be 'Running'
        }
    }

    #-Credential $Credentials