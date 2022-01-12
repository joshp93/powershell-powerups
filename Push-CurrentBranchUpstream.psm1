function Push-CurrentBranchUpstream {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $branchName = Get-CurrentBranchName
        git push -u origin $branchName
    } else {
        return
    }
}

Export-ModuleMember -Function Push-CurrentBranchUpstream