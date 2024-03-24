# Specify the directory path where you want to rename the files
$directoryPath = "C:\Temp\PowerShell"

# Get all files with the .ps1 extension recursively within the directory
$files = Get-ChildItem -Path $directoryPath -Filter *.ps1 -Recurse

# Iterate through each file and rename it
foreach ($file in $files) {
    # Construct the new file name by replacing the extension
    $newFileName = $file.FullName -replace '\.ps1$', '.bak'
    
    # Rename the file
    Rename-Item -Path $file.FullName -NewName $newFileName
}
