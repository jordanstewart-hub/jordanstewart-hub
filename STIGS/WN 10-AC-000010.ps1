PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script configures the account lockout threshold to 3 invalid logon attempts to meet STIG compliance.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-19
    Last Modified   : 2025-05-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1+

.USAGE
    Run the script as an administrator to ensure the account lockout threshold is set to 3.
    Example syntax:
    PS C:\> .\Remediate-WN10-AC-000010.ps1
#>

# Define the account lockout threshold
$lockoutThreshold = 3

# Apply the setting using the net accounts command
try {
    net accounts /lockoutthreshold:$lockoutThreshold
    Write-Host "Successfully set account lockout threshold to $lockoutThreshold invalid logon attempts."
} catch {
    Write-Error "Failed to set account lockout threshold: $_"
}
