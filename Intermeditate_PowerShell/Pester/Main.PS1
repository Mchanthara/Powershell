
Invoke-Pester -Script (.\PesterTest.ps1 -Computername '192.168.1.9') -OutputFile "C:\Temp\Intermeditate_PowerShell\Pester\Output.xml" -OutputFormat NUnitXml


# Using the script parameters
# Hashtable =@{}
$ScriptParameters=@{
        Path="C:\Temp\Intermeditate_PowerShell\Pester\PesterTest.ps1"
        Parameters=@{
                ComputerName='192.168.1.9'
                Credentials=Get-Credential
        }

}

Invoke-Pester -Script $ScriptParameters -OutputFile "C:\Temp\Intermeditate_PowerShell\Pester\Output.xml" -OutputFormat NUnitXml

# Test servers for running services
# Testing APIs
# Coming up with the test before writing code