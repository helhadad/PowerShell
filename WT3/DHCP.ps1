<#
Remote server setup script.
Run one line at a time, under supervision!
#>
$REMOTE_SERVER = 'server-1'

# Connect to server-1
Enter-PSSession $REMOTE_SERVER

$ServerName = "dc1.ads.solarsubmarines.ie"
$ServerIPv4 = "172.28.76.1"

# Install feature and configure
Install-WindowsFeature DHCP -IncludeManagementTools
Add-DhcpServerInDC -DnsName $ServerName -IPAddress 172.28.76.1

# Set up a single scope
Add-DhcpServerv4Scope -name "ISP" -StartRange 10.1.1.100 -EndRange 10.1.1.254 -SubnetMask 255.255.255.0 -State Active
Add-DhcpServerv4ExclusionRange -ScopeID 10.1.1.0 -StartRange 10.1.1.200 -EndRange 10.1.1.254
Set-DhcpServerv4OptionValue -OptionID 3 -Value 10.1.1.1 -ScopeID 10.1.1.0 -ComputerName $ServerName

Exit-PSSession
