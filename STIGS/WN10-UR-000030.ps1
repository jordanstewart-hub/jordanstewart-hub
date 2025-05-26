PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script removes unauthorized accounts from having the "Back up files and directories" user right.

.NOTES
    Author          : Jordan Stewart
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/
    GitHub          : github.com/jordanstewart-hub
    Date Created    : 2025-05-26
    Last Modified   : 2025-05-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10 (22H2)
    PowerShell Ver. : 5.1+

.USAGE
    Run this script in an elevated PowerShell session.
    Requires ntrights.exe from the Windows Server 2003 Resource Kit.
    Example:
    PS C:\> .\Remediate-WN10-UR-000030.ps1
#>

# Define authorized users
$authorizedUsers = @("Administrators", "Backup Operators")

# Remove the privilege from 'Everyone' as an example of unauthorized user
Write-Output "Removing 'SeBackupPrivilege' from unauthorized accounts..."
ntrights -r SeBackupPrivilege -u "Everyone"

# Reapply the privilege to authorized groups
foreach ($user in $authorizedUsers) {
    Write-Output "Ensuring '$user' has 'SeBackupPrivilege'..."
    ntrights +r SeBackupPrivilege -u "$user"
}

Write-Output "Remediation complete: 'SeBackupPrivilege' assigned only to authorized groups."
