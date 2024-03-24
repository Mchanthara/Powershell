# JSon File similar to CSV files
# creating JSon custom objects 2 ways


$JSonFilePath="C:\Temp\Intermeditate_PowerShell\JSon\Employees.json"

#Get-Content -Path $JSonFilePath | ConvertFrom-Json 

$jsonData=Get-Content -Path $JSonFilePath | ConvertFrom-Json 

$employeeData=$jsonData.Employees

$employeeData | Where-Object position -eq "Graphic Designer"


$csvFilePath="C:\Temp\Intermeditate_PowerShell\JSon\Employees.csv"

$csvData=Import-Csv -Path $csvFilePath

$csvData | ConvertTo-Json | Out-File -FilePath "C:\Temp\Intermeditate_PowerShell\JSon\ExportJson.json"


############# Most useful part of JSON files is for configuration files or XML files working with APIs
# Rest API getting information from the URL and parsing the data into JSON and something more usable
$uri="https://restcountries.com/v2/all"


### MAIN PART OF API request check documentation might require a -body
$webRequest=Invoke-WebRequest -Uri $uri -Method Get

$countryData=$webRequest.Content | ConvertFrom-Json

$countryData | Where-Object name -EQ "Canada"
$countryData | Where-Object name -EQ "United States of America"
#United States of America
$countryData | Where-Object name -like "United*"

### Body with API working with Elastic ... put or post put in a body
## JSon Body Variable

$jsonBody=@"
{
    "EmployeeID": "1005",
    "Name": "Mike Chanthara",
    "Title": "CEO"

}
"@

$jsonBody | ConvertFrom-Json

## 2nd way Create a PowerShell object and convert it to JSON in an API call

$testObject=New-Object -TypeName PSCustomObject
    Add-Member -InputObject $testObject -MemberType NoteProperty -Name "EmployeedID" -Value "1001"
    Add-Member -InputObject $testObject -MemberType NoteProperty -Name "Name" -Value "Mike Chanthara"
    Add-Member -InputObject $testObject -MemberType NoteProperty -Name "Title" -Value "CEO"

$body= $testObject | ConvertTo-Json
$body