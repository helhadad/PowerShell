<#
Remote server script.
Backsup VMs in Hyper-V by exporting
Run one line at a time, under supervision!
#>
$REMOTE_SERVER = 'server-1'

# Connect to server-1
Enter-PSSession $REMOTE_SERVER

Get-VM
$DATE = Get-Date
$DIRECTORY = $DATE.ToString('dd-MM-yyyy')

# Backup VMs
$EXPORT_PATH = Join-Path -Path "K:\" -ChildPath $DIRECTORY

if(!(Test-Path $EXPORT_PATH))
{
    New-Item -ItemType Directory -Path $EXPORT_PATH
}

Export-VM -Name W10-JOR1 -Path $EXPORT_PATH

Exit-PSSession
