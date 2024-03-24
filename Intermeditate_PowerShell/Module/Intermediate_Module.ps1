# Microsoft Best practice 
# Create module manifest
 $ModulePath ="C:\Temp\PowerShell\Module\Configurations\Configurations.psd1"
New-ModuleManifest -Path $ModulePath -Author "Mike Chanthara" -Description "This is the Configuration Module" -ModuleVersion "1.0.1" -RootModule "Configurations.psm1"

$($env:PSModulePath).split(';')  # if you put in any path here.. powershell will LOAD you module automatically
<#
PS C:\Temp\PowerShell\Module> $($env:PSModulePath).split(';')
C:\Users\Xexacute01\OneDrive\Documents\PowerShell\Modules
C:\Program Files\PowerShell\Modules
c:\program files\powershell\7\Modules
C:\Program Files\WindowsPowerShell\Modules
C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
c:\Users\Xexacute01\.vscode\extensions\ms-vscode.powershell-2024.0.0\modules
PS C:\Temp\PowerShell\Module> 
#>

# Importing the Module manually
Import-Module "C:\Temp\PowerShell\Module\Configurations" -Force   # Make sure use Force to reload new Version of this module -Force good practice
Get-Module Configurations

Get-Command -Module Configurations 
<#
PS C:\Temp\PowerShell\Module> Get-Command -Module Configurations
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-Configurations                                 1.0.1      Configurations
Function        Set-Configurations                                 1.0.1      Configurations
#>

Get-Help Get-Configurations -Full













Remove-Module Configurations
