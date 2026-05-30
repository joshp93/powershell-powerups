oh-my-posh init pwsh --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/patriksvensson.omp.json | Invoke-Expression

if (Get-Command fnm -ErrorAction SilentlyContinue) {
    Write-Host "Loading fnm..." -ForegroundColor Green
    fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
}

Write-Host "Loading PowerShell Powerup modules..." -ForegroundColor Green

Import-Module posh-git
Import-Module $PSScriptRoot\Check-LocationIsGitRepo.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Get-CurrentBranchName.psm1
Import-Module $PSScriptRoot\Check-BranchExists.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Push-CurrentBranchUpstream.psm1
Import-Module $PSScriptRoot\Create-FeatureBranch.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Create-BugBranch.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Pull-AllGitRepos.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Run-NpmInstallForAll.psm1  -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Convert-JavaToTS.psm1  -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Merge-LatestRootIntoThisBranch.psm1  -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Get-VerseOfTheDay.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Git-AddCommitWithCardIdAndMessage.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Get-RootBranchName.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Git-CheckoutRoot.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Remove-OldLocalBranches.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Get-Settings.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Set-Settings.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Npm-RunScript.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Pnpm-RunScript.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Set-LocationWithFnm.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Invoke-GoTo.psm1 -WarningAction SilentlyContinue
Import-Module $PSScriptRoot\Set-CustomReadLineBehaviours.psm1 -WarningAction SilentlyContinue

Import-Module $PSScriptRoot\Set-CustomAliases.psm1