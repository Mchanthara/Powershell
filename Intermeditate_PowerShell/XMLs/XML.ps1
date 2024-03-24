$xmlFilePath="C:\Temp\Intermeditate_PowerShell\XMLs\Employees.xml"
# JSON and XML files are more useful
# Create the varible type with XML
[xml]$xmlData=Get-Content $xmlFilePath

# Converting xml data into a variable and using Foreach loop 
$EmployeeData=$xmlData.employees.employee

foreach($Employee in $EmployeeData){
        Write-Output "Employee: $($Employee.name), has title of: $($Employee.Position)"

    }


#### Importing CLI data  Import-Clixml

$cliData = Import-Clixml -Path $xmlFilePath
<#
PS C:\Temp\Intermeditate_PowerShell\XMLs> $cliData = Import-Clixml -Path $xmlFilePath
Import-Clixml: Element 'Objs' with namespace name 'http://schemas.microsoft.com/powershell/2004/04' was not found. Line 2, position 2.
#>

### How to Export stuff to XML file

Get-Service | Export-Clixml -Path "C:\Temp\Intermeditate_PowerShell\XMLs\ExportedXML.xml"

Get-Service | Get-Member

# XML can do more than CSV files store secure strings / strore passwords etc  - also look into secret vault
$cliServiceData = Import-Clixml -Path "C:\Temp\Intermeditate_PowerShell\XMLs\ExportedXML.xml"
$cliServiceData | Get-Member