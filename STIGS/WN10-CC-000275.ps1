<#
.SYNOPSIS
    This PowerShell script configures Windows to prevent local drives from being shared in Remote Desktop sessions.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-26
    Last Modified   : 2025-05-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000275

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in an elevated PowerShell session.
    Example:
    PS C:\> .\Remediate-WN10-CC-000275.ps1
#>

# Define the registry path and value to prevent drive sharing
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services"
$valueName = "fDisableCdm"
$desiredValue = 1

# Create the key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Check and set the registry value
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue -or $currentValue.$valueName -ne $desiredValue) {
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Output "Remediation complete: Local drives will not be shared with Remote Desktop Session Hosts."
} else {
    Write-Output "No action needed: Drive redirection is already disabled for Remote Desktop."
}
