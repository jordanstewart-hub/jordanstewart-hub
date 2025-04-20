PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures that Microsoft account optional sign-in is disabled on Windows 10, in compliance with STIG ID WN10-CC-000170.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-19-04
    Last Modified   : 2025-19-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000170

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 Pro/Enterprise (non-LTSC)
    PowerShell Ver. : 5.1+

.USAGE
    Run this script in an elevated PowerShell session.
    Example:
    PS C:\> .\Remediate-WN10-CC-000170.ps1

.NOTES
    Note: This setting is Not Applicable (NA) on Windows 10 LTSC/B editions.
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "MSAOptional"
$propertyValue = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Create or update the MSAOptional DWORD value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null

Write-Output "STIG WN10-CC-000170 remediated: Microsoft account optional sign-in disabled."
