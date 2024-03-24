### Error handling
$ErrorActionPreference='Stop'

try {
    $filePath="C:\Temp\TryCatch"
$files =Get-ChildItem -Path $filePath # -ErrorAction Stop

$files.foreach({
    Write-Output $_.Name
})
Write-Output "This is after the error"
}
catch{
    Write-Output "##### Caught Error #######"  
    $_.Exception.Message 
}finally{
    Write-Output "Finally,This always runs no matter what!"
    # i.e. closes out of your SQL database connection
    # API connections
    # remote connections close any remote collections 
    # clean up any settings
}




$Error      # Error array into a log file

