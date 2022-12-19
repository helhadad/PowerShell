<#
Remote server setup script.
Run one line at a time, under supervision!
#>

$REMOTE_SERVER = 'server-1'
# Set the domain name
$FOREST = 'ads.solarsubmaines.com'

# Connect to server-1
Enter-PSSession $REMOTE_SERVER

# Install the required features
Install-WindowsFeature -name AD-Domain-Services 
# Add a new doamin controller

Install-ADDSDomainController -DomainName $FOREST -InstallDns:$true -Credential (Get-Credential "ads\administrator")
# Make sure DNS was installed
Get-WindowsFeature | where {($_.name -like "DNS")}
# Install DHCP 
Install-WindowsFeature DHCP -IncludeManagementTools

Exit-PSSession
