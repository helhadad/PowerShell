<#
Script  : FolderContent.ps1
By      : Hesham Elhadad
ID      : L00177542
Date    : 24-Nov-22
Purpose : This script demonstrates how variables and cmdlets can be used in powershell
          to perform multiple tasks and use Even log provider 

Tested  : PowerShell 7.1
Rev     : 0
IDE     : Visual Studio Code
#>

# Import the necessary modules
Import-Module -Name "Microsoft.PowerShell.Diagnostics"

# Get the critical and error events from the Windows Event Log
$events = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2}

# Iterate through the events and display the event details
foreach ($event in $events) {
  Write-Host "Timestamp: $(Get-Date -Date $event.TimeCreated -Format s)"
  Write-Host "Event ID: $($event.Id)"
  Write-Host "Level: $($event.LevelDisplayName)"
  Write-Host "Message: $($event.Message)"
  Write-Host ""
}
