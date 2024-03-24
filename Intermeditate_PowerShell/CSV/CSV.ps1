
### Importing comma seperated value CSV
$csvFilePath="C:\Temp\Intermeditate_PowerShell\CSV\Comatest.csv"


$employeeData= Import-Csv -path $csvFilePath  -Delimiter ','

Foreach($Employee in $employeeData){
                  Write-Output "Employee $($Employee.Name) is a $($Employee.Title) from $($Employee.Country)"
            }

$employeeData.GetType()

#################################
# Exporting CSV
# if you want to add more using the @{Hashtable Expression} ie.@{Name="Time";Expression={Get-Date -Format "MM-dd-yyyy hh:mm:ss"}} 
Get-Service | Select-Object -Property Name,Status,StartType, @{Name="Time";Expression={Get-Date -Format "MM-dd-yyyy hh:mm:ss"}} | 
         Export-Csv -Path "C:\Temp\Intermeditate_PowerShell\CSV\TestExport.csv" -Delimiter ',' -NoTypeInformation





##### IMPORTING via SemiColon ;
$csvFilePath="C:\Temp\Intermeditate_PowerShell\CSV\Semitest.csv"

$employeeData= Import-Csv -path $csvFilePath -Delimiter ';'   ## Specify your delimiter here

Foreach($Employee in $employeeData){
    
    Write-Output "Employee $($Employee.Name) is a $($Employee.Title) from $($Employee.Country)"
       }

$content= Get-Content $csvFilePath # Not as good as Import-CSV