<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 is configured to audit logoff events, as required by STIG ID WN10-SO-000130.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-19
    Last Modified   : 2025-05-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000130

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 Enterprise (22H2)
    PowerShell Ver. : 5.1+

.USAGE
    Run with administrative privileges.
    Example:
    PS C:\> .\WN10-SO-000130_AuditLogoffEvents.ps1
#>

# Define registry path and values
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$propertyName = "EnableLogoffEvents"
$desiredValue = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "STIG WN10-SO-000130 remediated: Audit Logoff Events is now enabled."
