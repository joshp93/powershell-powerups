function Get-RootBranchName {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $RootBranchName = git remote show origin | Select-String -Pattern "HEAD branch:"
        return ($RootBranchName -split ":")[1].Trim()
    }
}

Export-ModuleMember -Function Get-RootBranchName