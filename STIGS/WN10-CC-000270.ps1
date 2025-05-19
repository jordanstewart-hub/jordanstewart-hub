PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script ensures that the Windows "Accounts: Block Microsoft accounts" setting is configured to "Users can't add Microsoft accounts".

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-19
    Last Modified   : 2025-05-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000270

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1+

.USAGE
    Run this script as an administrator to apply the Group Policy setting that blocks users from adding Microsoft accounts.
    Example syntax:
    PS C:\> .\Remediate-WN10-CC-000270.ps1
#>

# Define registry path and value
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "NoConnectedUser"
$propertyValue = 3  # 3 = Users can't add Microsoft accounts

# Create the registry key if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force | Out-Null
Write-Host "STIG WN10-CC-000270 remediated: Microsoft account additions blocked (NoConnectedUser = 3)."
