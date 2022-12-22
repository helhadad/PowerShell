<#
Script  : FolderContent.ps1
By      : Hesham Elhadad
ID      : L00177542
Date    : 23-Nov-22
Purpose : This script demonstrates how variables and cmdlets can be used in powershell
          to perform multiple tasks  

Tested  : PowerShell 7.1
Rev     : 0
IDE     : Visual Studio Code
#>


# Define the script parameters and their defaults
Param(
    [string]$FolderPath
)

# Get the path to the folder you want to list the files for

#Check if there is at least one argument
if (!($PSBoundParameters.ContainsKey('FolderPath'))) {
    Write-Output "Please specify a folder path as an argument."
} else {
    if (!(Test-Path $FolderPath -PathType Container)){
        Write-Output "The Path you specify is not a Folder. please, review"
    }
    
    # Get a list of all the files in the folder
    $files = Get-ChildItem -Path $FolderPath

    # Display the list of files in a table format
$files | Sort-Object LastWriteTime | Format-Table Name, Length, LastWriteTime
}
