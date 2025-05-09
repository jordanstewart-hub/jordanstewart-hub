PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script configures Windows Security Option to enforce subcategory audit settings.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-28-04
    Last Modified   : 2025-28-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in an elevated PowerShell session.
    Example:
    PS C:\> .\Remediate-WN10-SO-000030.ps1
#>

# Define registry path and setting
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$propertyName = "SCENoApplyLegacyAuditPolicy"
$propertyValue = 1

# Create or update the registry value
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null

Write-Output "Remediation complete: Audit subcategory settings will override category settings (STIG WN10-SO-000030)."
