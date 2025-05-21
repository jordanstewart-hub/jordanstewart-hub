PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures Windows Error Reporting is disabled to comply with security guidelines.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-20
    Last Modified   : 2025-05-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000245

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 Pro/Enterprise
    PowerShell Ver. : 5.1+

.USAGE
    Run with administrative privileges to disable Windows Error Reporting.
    Example syntax:
    PS C:\> .\remediate-WN10-CC-000245.ps1
#>

# Disable Windows Error Reporting
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"
$propertyName = "Disabled"
$propertyValue = 1

# Create the registry key if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set or update the Disabled value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null
Write-Output "STIG WN10-CC-000245 remediated: Windows Error Reporting disabled."
