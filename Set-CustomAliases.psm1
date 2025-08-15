set-alias -Name cbn -Value Get-CurrentBranchName
set-alias -Name pbu -Value Push-CurrentBranchUpstream
set-alias -Name cfb -Value Create-FeatureBranch
set-alias -Name cbb -Value Create-BugBranch
set-alias -Name mlr -Value Merge-LatestRootIntoThisBranch
set-alias -Name gacm -Value Git-AddCommitWithCardIdAndMessage
Set-Alias -Name cm -Value Git-CheckoutRoot
Set-Alias -Name nr -Value Npm-RunScript
Set-Alias -Name pr -Value Pnpm-RunScript
Set-Alias -Name go -Value Invoke-GoTo

function fmlrp { Merge-LatestRootIntoThisBranch $true }
set-alias -Name mlrp -Value fmlrp

function fcmp { Git-CheckoutRoot $true }
Set-Alias -Name cmp -Value fcmp

function fprbt { pnpm run build:test; pnpm run test }
Set-Alias -Name prbt -Value fprbt

function fnrbt { npm run build:test; npm run test }
Set-Alias -Name nrbt -Value fnrbt