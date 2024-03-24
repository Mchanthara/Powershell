1 -eq 1 # Equals
1 -ne 2 # not equal
1 -lt 2 # less than
3 -le 2 # Less or equal to
2 -gt 2 # greater than
2 -ge 2 # greter than or equal

@(1,2,3) -contains 4
@('test','test') -contains 'TEST'
@('test','test') -ccontains 'TEST'
'Test' -eq 'TEST'  # no c is non-case sensitive
'Test' -ceq 'TEST'  # adding c in front is case sensitive

$filepath = "C:\Temp\Switch\Users.txt"

#Get-Content -Path $filepath

if((Test-Path -Path $filepath)-eq $true){
    Write-Host "File Exists $filepath" -ForegroundColor Green
    $data=Get-Content -Path $filepath
    if($data.count -lt 2){
            Write-Output "This file has less than 2 lines"
        }elseif ($data.count -lt 12) {
            Write-Output "This file has than 12, but at least 2"
        }else {
            Write-Output "This line has more than 13 lines"
        }
        Write-Output "this is after the IFElse statement"

}else{

    Write-Output "File `"$filepath`" does not exist!" 
}