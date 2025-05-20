PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script sets the screen saver timeout to 900 seconds (15 minutes) in accordance with STIG requirements.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-19
    Last Modified   : 2025-05-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000160

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run this script as the user whose screen saver settings need to be configured.
    Example syntax:
    PS C:\> .\WN10-SO-000160_ScreenSaverTimeout.ps1
#>

# Define the registry path and properties
$regPath = "HKCU:\Control Panel\Desktop"
$timeoutValueName = "ScreenSaveTimeOut"
$timeoutValueData = "900"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the screen saver timeout to 900 seconds
Set-ItemProperty -Path $regPath -Name $timeoutValueName -Value $timeoutValueData -Force

Write-Host "Screen saver timeout has been set to 900 seconds as per STIG WN10-SO-000160."
