function Remove-OldLocalBranches {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $RootBranchName = Get-RootBranchName
        git checkout $RootBranchName
        $mergedBranches = git branch --merged
        foreach ($branch in $mergedBranches) {
            $branch = $branch.trim()
            if ($branch -ne "* ${RootBranchName}") {   
                Write-Host "Deleting branch: '${branch}'" -ForegroundColor Red
                git branch -d $branch
            } else {
                Write-Host "Skipping master branch" -ForegroundColor DarkGreen
            }
        }
    }
    else {
        return
    }
}

Export-ModuleMember -Function Remove-OldLocalBranches