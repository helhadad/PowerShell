<#
Remote server setup script.
Does a recce on a remote servers disks
Run one line at a time, under supervision!
#>
$REMOTE_SERVER = 'server-1'

# Connect to server-1
Enter-PSSession $REMOTE_SERVER

Get-Disk | foreach { $_ | Get-StorageReliabilityCounter | Format-List }
Get-Disk | Get-StorageReliabilityCounter
Get-PhysicalDisk | sort DeviceID | ft DeviceID, FriendlyName, Model, Mediatype

Exit-PSSession
