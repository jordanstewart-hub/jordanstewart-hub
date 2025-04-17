PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-17-04
    Last Modified   : 2025-17-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$propertyName = "MaxSize"
$propertyValue = 0x8000  # 32768 bytes

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Create or update the MaxSize DWORD value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force
