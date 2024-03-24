

##########################################################
# ForEach and ForEach-Object not the same this is FOR EACH  /// Recommend standard
ForEach($name in $FolderName){
    if((Test-Path -Path "$folderpath\$($Name)") -eq $false){
        New-Item -Path $folderPath -Name $name -ItemType Directory  # create new folder and with type Directory
    }else {
        Write-Output "Folder Exists"
    }
    
}

###########################################################
# Foreach-Object method.. when using ForEachObject you will need to use the $_ $_
###########################################################
$FolderName | ForEach-Object -Process{

}


$FolderName | ForEach-Object -Process{
    Write-Output $_
}


#########################################################################
# Last method for each using the dot notations shorter... method keep the $_
#########################################################################

$FolderName.ForEach(
    {
        if((Test-Path -Path "$folderpath\$_") -eq $false){
            New-Item -Path $folderPath -Name $_ -ItemType Directory  # create new folder and with type Directory
                }else {
                    Write-Output "Folder Exists"
                }
    }
)




###########################################################
if((Test-Path -Path "$folderpath\$($FolderName[0...5])") -eq $false){
    New-Item -Path $folderPath -Name $FolderName[0...5] -ItemType Directory
}else {
    Write-Output "Folder Exists"
}


<#
New-Item -Path $folderPath -Name $FolderName[1] -ItemType Directory
New-Item -Path $folderPath -Name $FolderName[2] -ItemType Directory
New-Item -Path $folderPath -Name $FolderName[3] -ItemType Directory
New-Item -Path $folderPath -Name $FolderName[4] -ItemType Directory
New-Item -Path $folderPath -Name $FolderName[5] -ItemType Directory
#>
