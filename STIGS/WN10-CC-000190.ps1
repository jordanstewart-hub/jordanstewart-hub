PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Store application is disabled, as required by STIG WN10-CC-000190.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-20
    Last Modified   : 2025-05-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 Pro/Enterprise
    PowerShell Ver. : 5.1+

.USAGE
    Run with administrative privileges to disable the Windows Store.
    Example:
    PS C:\> .\remediate-WN10-CC-000190.ps1
#>

# Define the registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"
$propertyName = "RemoveWindowsStore"
$propertyValue = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set or update the registry value to disable Windows Store
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null

Write-Output "STIG WN10-CC-000190 remediated: Windows Store has been disabled."
