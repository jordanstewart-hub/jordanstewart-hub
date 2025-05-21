PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures that the last logged-on user name is NOT displayed on the Windows logon screen.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-20
    Last Modified   : 2025-05-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000065

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run the script as Administrator.
    Example syntax:
    PS C:\> .\Remediate-WN10-CC-000065.ps1
#>

# Define registry path and property
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "DontDisplayLastUserName"
$propertyValue = 1

# Create the registry key if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DWORD value to disable display of last logged-on username
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null
