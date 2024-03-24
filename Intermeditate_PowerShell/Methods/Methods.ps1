# Methods prevents you from writing code over and over again with functions
# Create files that other systems can use to automate your systems
# cmdlet bindings - can run as verbose or debug , add different param meters
# Write-Verbose ... write stuff out in Yellow
# Creating CMDLets and Methods

$configPath ="C:\Temp\PowerShell\Methods\Config"
function Create-Configuration {
    [CmdletBinding()]
    param (
          
            [Parameter(Mandatory,ValueFromPipeLine, ValueFromPipelineByPropertyName)]                      # Need to add valuefromPipeLine
            [string]$Name , # add another parameter with  ,
            [Parameter()]
            [String]$Version='1.0.0',
            [Parameter(Mandatory)]
            [String]$Path ,
            [Parameter()]
            [ValidateSet("Linux","Windows")]
            [String]$OperatingSystems="Windows"
          )
    
    Begin {
        Write-Verbose "Begin Block"
        # Counter variable, database connection
        $CounterPassed =0
        $CounterFailed =0
    }

    Process{
        try {
                # Writing output for the parameter name
                Write-Verbose "Creating output for $Name with Version $Version"
                New-Item -Path "$Path" -Name "$($Name).cfg" -ItemType File -ErrorAction Stop
                $Version | Out-File -FilePath "$Path\$($Name).cfg" -Force
                $OperatingSystems | Out-File -FilePath "$Path\$($Name).cfg" -Append -Force
                $CounterPassed++
            }catch {
            <#Do this if a terminating exception happens#>
            Write-Verbose $_.Exception.Message
            $CounterFailed++
        }
        # running with these parameters to see what is failing
        Write-Debug "Configurations Created:$CounterPassed" 
        Write-Debug "Configurations Failed:$Counterfailed"
    }

    End {
        Write-Verbose "End Block"
        Write-Verbose "Configurations Created:  $CounterPassed , Configurations Failed: $CounterFailed"
        # displaying the total counters aka Finally Try>Catch>Finally
        # Leaving session like DB connections remote session
    }
}


# Names Array
$Names = @('TestingConfig1','TestConfig2','TestConfig3','Test4')

# Example running the command with -Verbose and -Debug
$Names | Create-Configuration -Path $configPath -Verbose -Debug











# file path
$configPath ="C:\Temp\PowerShell\Methods\Config"
function Create-Configuration {
    [CmdletBinding()]
    param (
          
            [Parameter(Mandatory,ValueFromPipeLine)]                      # Need to add valuefromPipeLine
            [string]$Name , # add another parameter with  ,
            [Parameter()]
            [String]$Version='1.0.0',
            [Parameter(Mandatory)]
            [String]$Path ,
            [Parameter()]
            [ValidateSet("Linux","Windows")]
            [String]$OperatingSystems="Windows"
          )
    
    Begin {
        Write-Output "Begin Block"
        # Counter variable, database connection
        $CounterPassed =0
        $CounterFailed =0
    }

    Process{
        try {
                # Writing output for the parameter name
                Write-Output "Creating output for $Name with Version $Version"
                New-Item -Path "$Path" -Name "$($Name).cfg" -ItemType File -ErrorAction Stop
                $Version | Out-File -FilePath "$Path\$($Name).cfg" -Force
                $OperatingSystems | Out-File -FilePath "$Path\$($Name).cfg" -Append -Force
                $CounterPassed++
            }catch {
            <#Do this if a terminating exception happens#>
            Write-Output $_.Exception.Message
            $CounterFailed++
        }

    }

    End {
        Write-Output "End Block"
        Write-Output "Configurations Created:  $CounterPassed , Configurations Failed: $CounterFailed"
        # displaying the total counters aka Finally Try>Catch>Finally
        # Leaving session like DB connections remote session
    }
}


# Names Array
$Names = @('TestingConfig1','TestConfig2','TestConfig3','Test4')

$Names | Create-Configuration -Path $configPath -Verbose









# Call function to write out to $Name and $Version
# Create-Configuration -Name "TestinConfig0"  -Version "2.0.0" -OperatingSystems "Windows" -Path $configPath 

# old way of writing code over and over

New-Item -Path $configPath -Name "TestingConfig.cfg" -ItemType File
New-Item -Path $configPath -Name "TestingConfig1.cfg" -ItemType File
New-Item -Path $configPath -Name "TestingConfig2.cfg" -ItemType File