<#
Remote server script.
Backsup VMs in Hyper-V by exporting
Run one line at a time, under supervision!
#>
$REMOTE_SERVER = 'server-1'

# Connect to server-1
Enter-PSSession $REMOTE_SERVER

# List disks and prepare
Get-Disk
Initialize-Disk 1
Initialize-Disk 2

# Partition the disks
New-Partition -DiskNumber 1 -AssignDriveLetter –UseMaximumSize
New-Partition -DiskNumber 2 -AssignDriveLetter –UseMaximumSize

# Format the disks
Format-Volume –DriveLetter D -FileSystem NTFS -NewFileSystemLabel SMB
Format-Volume –DriveLetter E -FileSystem NTFS -NewFileSystemLabel NFS
Format-Volume –DriveLetter F -FileSystem NTFS -NewFileSystemLabel M2SSD1

Exit-PSSession
