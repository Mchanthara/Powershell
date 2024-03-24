$ServiceName="Spooler"

Get-Service -Name $ServiceName

Get-Help Stop-Service -Full                     # Look into syntax and look in Name ServiceController

(Get-Service -Name $ServiceName).GetType()              # looking for name: type is ServiceController

Get-Service -Name $ServiceName | Stop-Service

Get-Service -Name $ServiceName | Start-Service

Get-Help Get-Service -Full                   # Look into syntax and look in Name

$ServiceName | Get-Service | Start-Service


$Services =New-Object -TypeName System.Collections.ArrayList
$Services.AddRange(@('Spooler','w32time','wuauserv'))          # add an array of services

$Services | Get-Service

####################################
# Get services and pipe to get services for each object display the service name and current status
# Write to the screen.. $($_.) dot notation, wrap the variable in a variable wrapper $(variable)

$Services | Get-Service | ForEach-Object{Write-Output "Service : $($_.DisplayName) is currently $($_.Status)"}