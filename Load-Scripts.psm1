Import-Module posh-git
Import-Module C:\powershell-powerups\Check-LocationIsGitRepo.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-CurrentBranchName.psm1
Import-Module C:\powershell-powerups\Check-BranchExists.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Push-CurrentBranchUpstream.psm1
Import-Module C:\powershell-powerups\Create-FeatureBranch.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Create-BugBranch.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Pull-AllGitRepos.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Run-NpmInstallForAll.psm1  -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Convert-JavaToTS.psm1  -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Merge-LatestRootIntoThisBranch.psm1  -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-VerseOfTheDay.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Git-AddCommitWithCardIdAndMessage.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-RootBranchName.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Git-CheckoutRoot.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Remove-OldLocalBranches.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-Settings.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Set-Settings.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Npm-RunScript.psm1 -WarningAction SilentlyContinue

set-alias -Name cbn -Value Get-CurrentBranchName
set-alias -Name pbu -Value Push-CurrentBranchUpstream
set-alias -Name cfb -Value Create-FeatureBranch
set-alias -Name cbb -Value Create-BugBranch
set-alias -Name mlr -Value Merge-LatestRootIntoThisBranch
set-alias -Name gacm -Value Git-AddCommitWithCardIdAndMessage
Set-Alias -Name cm -Value Git-CheckoutRoot
Set-Alias -Name nr -Value Npm-RunScript
Set-Alias -Name sbc -Value Start-BuyerContentMainAndStartThis

function Build-QwikClientServer { npm run build.client; npm run build.ssr }
Set-Alias -Name qbcs -Value Build-QwikClientServer

function Build-QwikClientOnly { npm run build.client }
Set-Alias -Name qbc -Value Build-QwikClientOnly

function Build-QwikServerOnly { npm run build.ssr }
Set-Alias -Name qbs -Value Build-QwikServerOnly

function Build-QwikBuildAndTest { npm run build.client; npm run build.ssr; npm test }
Set-Alias -Name qbt -Value Build-QwikBuildAndTest

function fmlrp { Merge-LatestRootIntoThisBranch $true }
set-alias -Name mlrp -Value fmlrp

function fcmp { Git-CheckoutRoot $true }
Set-Alias -Name cmp -Value fcmp