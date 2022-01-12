function Create-BugBranch {
     Param(
     [parameter(Mandatory=$true)]
     [String] $CardName
     )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = -join("fix/", $CardName)
        if (Check-BranchExists $BranchName) {
            Write-Host "Checking out existing BUG branch: ${BranchName}" -ForegroundColor DarkGreen
            git checkout $BranchName
        } else {
            Write-Host "Creating new BUG branch: ${BranchName}" -ForegroundColor DarkGreen
            git checkout -b $BranchName 
        }
    } else {
        return
    }
}

Export-ModuleMember -Function Create-BugBranch