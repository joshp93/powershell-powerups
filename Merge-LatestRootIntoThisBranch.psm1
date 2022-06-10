function Merge-LatestRootBranchIntoThisBranch {
    Param(
     [parameter(Mandatory=$false)]
     [boolean] $PushChanges
     )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = Get-CurrentBranchName
        $RootBranchName = Get-RootBranchName
        $WithOrWithoutYou = ('without', 'AND')[($PushChanges -eq $true)]
        Write-Host "Merging latest ${RootBranchName} into ${BranchName} ${WithOrWithoutYou} pushing changes" -ForegroundColor DarkGreen
        Git-CheckoutRoot
        git pull
        git checkout $BranchName
        git merge $RootBranchName
        if ($PushChanges) {
            git push
        }
    } else {
        return
    }
}

Export-ModuleMember -Function Merge-LatestRootBranchIntoThisBranch