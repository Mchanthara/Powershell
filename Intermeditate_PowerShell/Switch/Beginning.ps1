#Set-StrictMode -Off
# Set-StrictMode -Version latest

$mayvalue1 = 1.3
[int]$mayvalue1 = 1.3
$mayvalue1

$mayvalue5 = 5
$mayvalue5 = 5
$mayvalue10 = -10

($mayvalue1 -eq $mayvalue10).GetType()

($myresult2 -eq $NULL).GetType()

$mystatement =$true
$mystatement.GetType()

$today = Get-Date
$today