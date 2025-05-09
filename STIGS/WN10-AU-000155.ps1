PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script configures Windows Audit Policy to enable failure auditing for System Integrity.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-28-04
    Last Modified   : 2025-28-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000155

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in an elevated PowerShell session.
    Example:
    PS C:\> .\Remediate-WN10-AU-000155.ps1
#>

# Check current setting for System Integrity
$currentSetting = (AuditPol /get /subcategory:"System Integrity") | Select-String -Pattern "Failure"

# If "Failure" is not enabled, set it
if ($currentSetting -notmatch "Enabled") {
    Write-Output "Applying audit policy: Enabling Failure auditing for System Integrity..."
    AuditPol /set /subcategory:"System Integrity" /failure:enable
    Write-Output " Remediation complete: System Integrity - Failure auditing enabled."
}
else {
    Write-Output " No action needed: System Integrity - Failure auditing already enabled."
}
