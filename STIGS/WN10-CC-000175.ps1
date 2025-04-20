PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures that users are prevented from sharing files within their profiles.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-19-04
    Last Modified   : 2025-19-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (21H2 and above)
    PowerShell Ver. : 5.1+

.USAGE
    Run this script in an elevated PowerShell session.
    Example:
    PS C:\> .\Remediate-WN10-CC-000175.ps1
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetCache"
$propertyName = "NoProfileSharing"
$propertyValue = 1  # Enables the setting to prevent profile sharing

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Create or update the NoProfileSharing DWORD value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null

Write-Output "STIG WN10-CC-000175 remediated: User profile sharing has been disabled."
