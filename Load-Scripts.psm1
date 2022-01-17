Import-Module posh-git
Import-Module C:\PowerShell\Check-LocationIsGitRepo.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Get-CurrentBranchName.psm1
Import-Module C:\PowerShell\Check-BranchExists.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Push-CurrentBranchUpstream.psm1
Import-Module C:\PowerShell\Create-FeatureBranch.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Create-BugBranch.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Pull-AllGitRepos.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Run-NpmInstallForAll.psm1  -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Convert-JavaToJS.psm1  -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Merge-LatestMasterIntoThisBranch.psm1  -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Pull-NXRestAndMA.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Get-VerseOfTheDay.psm1 -WarningAction SilentlyContinue
Import-Module C:\PowerShell\Git-AddCommitWithCardIdAndMessage.psm1 -WarningAction SilentlyContinue

set-alias -Name cbn -Value Get-CurrentBranchName
set-alias -Name pbu -Value Push-CurrentBranchUpstream
set-alias -Name cfb -Value Create-FeatureBranch
set-alias -Name cbb -Value Create-BugBranch
set-alias -Name mlm -Value Merge-LatestMasterIntoThisBranch
Set-Alias -Name manx -Value Pull-NXRestAndMA
set-alias -Name gacm -Value Git-AddCommitWithCardIdAndMessage

$VerseOfTheDay = Get-VerseOfTheDay
if ($VerseOfTheDay) {
    Write-Host $VerseOfTheDay -ForegroundColor DarkGreen
} else {
    Write-Host "Howdy, Kemosabe" -ForegroundColor DarkGreen
}