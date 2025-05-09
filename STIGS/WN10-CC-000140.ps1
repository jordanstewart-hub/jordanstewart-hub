PS C:\Users\Juser1> <#
.SYNOPSIS
    This PowerShell script disables AutoPlay for all drives on Windows 10

.NOTES
    Author          : Jordan Stewart  
    LinkedIn        : linkedin.com/in/jordan-stewart-006379114/  
    GitHub          : github.com/jordanstewart-hub  
    Date Created    : 2025-05-08  
    Last Modified   : 2025-05-08  
    Version         : 1.0  
    CVEs            : N/A  
    Plugin IDs      : N/A  
    STIG-ID         : WN10-CC-000140

.TESTED ON
    Date(s) Tested  : 2025-05-08  
    Tested By       : Jordan Stewart  
    Systems Tested  : Windows 10 Pro (21H2)  
    PowerShell Ver. : 5.1

.USAGE
    Run the script as Administrator to enforce AutoPlay being disabled on all drives.
    Example syntax:
    PS C:\> .\remediate_WN10-CC-000140_DisableAutoPlay.ps1
#>

# Define the registry path and value
$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$propertyName = "NoDriveTypeAutoRun"
$propertyValue = 0xFF  # 255 in decimal, disables AutoPlay on all drives

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Create or update the NoDriveTypeAutoRun DWORD value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force

Write-Host "[+] STIG WN10-CC-000140 remediated: AutoPlay disabled on all drives." -ForegroundColor Green
