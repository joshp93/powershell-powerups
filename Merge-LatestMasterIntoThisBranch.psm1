function Merge-LatestMasterIntoThisBranch {
    Param(
     [parameter(Mandatory=$false)]
     [boolean] $PushChanges
     )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = Get-CurrentBranchName
        $WithOrWithoutYou = ('without', 'AND')[($PushChanges -eq $true)]
        Write-Host "Merging latest master into ${BranchName} ${WithOrWithoutYou} pushing changes" -ForegroundColor DarkGreen
        git checkout master
        git pull
        git checkout $BranchName
        git merge master
        if ($PushChanges) {
            git push
        }
    } else {
        return
    }
}

Export-ModuleMember -Function Merge-LatestMasterIntoThisBranch