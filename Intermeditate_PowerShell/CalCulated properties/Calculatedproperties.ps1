
$csvFilepath="C:\Temp\Intermeditate_PowerShell\CalCulated properties\Users.csv"

$csvData=Import-Csv $csvFilepath -Delimiter ','
$csvData.GetType()

$csvData | Select-Object ID,Name,Title
<#
ID   Name  Title
--   ----  -----
1001 Mike  Programmer
1002 Doran SCCM
1003 Sam   SCCM
1004 Mark  Programmer
#>

# to perform a calculated property @{}
# Expression name adding a property
$csvData | Select-Object *,@{Name="FullName";Expression={"$($_.Name) $($_.Title) $($_.ID)"}}

$csvData | Select-Object *,@{Name="Type";Expression={"$($_.age)"}}

## Group-Object -Property parameter


$csvFilepath="C:\Temp\Intermeditate_PowerShell\CalCulated properties\Users.csv"

$csvData=Import-Csv $csvFilepath -Delimiter ','

# make sure it is $CSVData
$csvData | Group-Object -Property @{Expression={
        If($_.age -lt 50){
            'Retirement far away' # can put in a string here, grouping groups
        }else{
            'Retirement may come soon'
        }

    }}

$csvData | Sort-Object Age,Salary -Descending

# if you want BOTH sort objects to be descending you need to add an expression

$csvData | Sort-Object Age,@{Expression={($_.Salary)};Descending=$true} -Descending

$csvData | Sort-Object @{Expression={($_.Age)};Ascending=$false},@{Expression={($_.Salary)};Descending=$false} -Descending


#### Switch statement
## grouping and sorting files
## writing a report from the directory example
Get-ChildItem -Path "C:\Temp\Intermeditate_PowerShell\CalCulated properties" | Get-Member

Get-ChildItem -Path "C:\Temp\Intermeditate_PowerShell\CalCulated properties" | Group-Object -Property @{Expression={
                    switch ($_.Extension) {
                       '.ps1' {'Automation'}
                       '.exe'{'Executbale'}
                       '.csv'{'Data files'}
                       {@('.cfg','.xml','.json') -contains $_}{'configuration files'}
                       Default {'Not relevant'}

                    }
            }}


