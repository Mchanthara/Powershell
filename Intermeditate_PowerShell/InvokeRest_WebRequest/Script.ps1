### API call working with Invoke-RestMethod and Invoke-WebRequest ( Calling REST APIs)
$uri = "Http://randomuser.me/api"

##### Invoke-RestMethod

Invoke-RestMethod -Uri $uri -Method Get

$Restmethod = Invoke-RestMethod -Uri $uri -Method Get

## Getting back PowerShell Objects
$Restmethod.results




## Invoke Web Request

$Webrequest = Invoke-WebRequest -Uri $uri -Method Get

# Invoke Web method you will have to JSon from $result.content
$Result=$Webrequest.Content | ConvertFrom-Json

$Result.results




# ---------------------------------------------------------------------------------#
# testing other websites
$google = "https://www.mockapi.io/"
#$GoogleRequest = Invoke-WebRequest -Uri $google -Method Get
$Restmethod = Invoke-RestMethod -Uri $uri -Method Get

$GoogleResult=$GoogleRequest.RawContent
$GoogleResult