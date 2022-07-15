Import-Module posh-git
Import-Module C:\PowerShell\Check-LocationIsGitRepo.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Get-CurrentBranchName.psm1
Import-Module C:\PowerShell\Check-BranchExists.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Push-CurrentBranchUpstream.psm1
Import-Module C:\PowerShell\Create-FeatureBranch.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Create-BugBranch.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Pull-AllGitRepos.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Run-NpmInstallForAll.psm1  -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Convert-JavaToTS.psm1  -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Merge-LatestRootIntoThisBranch.psm1  -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Pull-NXRestAndMA.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Get-VerseOfTheDay.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Git-AddCommitWithCardIdAndMessage.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Get-RootBranchName.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Git-CheckoutRoot.psm1 -WarningAction SilentlyContinue

set-alias -Name cbn -Value Get-CurrentBranchName
set-alias -Name pbu -Value Push-CurrentBranchUpstream
set-alias -Name cfb -Value Create-FeatureBranch
set-alias -Name cbb -Value Create-BugBranch
set-alias -Name mlr -Value Merge-LatestRootIntoThisBranch
Set-Alias -Name manx -Value Pull-NXRestAndMA
set-alias -Name gacm -Value Git-AddCommitWithCardIdAndMessage
Set-Alias -Name cm -Value Git-CheckoutRoot
function fmlrp { Merge-LatestRootIntoThisBranch $true }
set-alias -Name mlrp -Value fmlrp

function fcmp { Git-CheckoutRoot $true }
Set-Alias -Name cmp -Value fcmp

$VerseOfTheDay = Get-VerseOfTheDay
if ($VerseOfTheDay) {
    Write-Host $VerseOfTheDay -ForegroundColor DarkGreen
} else {
    Write-Host "Howdy, Kemosabe" -ForegroundColor DarkGreen
}