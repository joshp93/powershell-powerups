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
Import-Module C:\powershell-powerups\Pull-NXRestAndMA.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-VerseOfTheDay.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Git-AddCommitWithCardIdAndMessage.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-RootBranchName.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Git-CheckoutRoot.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Remove-OldLocalBranches.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Get-Settings.psm1 -WarningAction SilentlyContinue
Import-Module C:\powershell-powerups\Set-Settings.psm1 -WarningAction SilentlyContinue

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