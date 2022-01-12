function Create-FeatureBranch {
     Param(
     [parameter(Mandatory=$true)]
     [String] $CardName
     )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = -join("feature/", $CardName)
        if (Check-BranchExists $BranchName) {
            Write-Host "Checking out existing FEATURE branch ${BranchName}" -ForegroundColor DarkGreen
            git checkout $BranchName
        } else {
            Write-Host "Creating new FEATURE branch ${BranchName}" -ForegroundColor DarkGreen
            git checkout -b $BranchName
        }
    } else {
        return
    }
}

Export-ModuleMember -Function Create-FeatureBranch