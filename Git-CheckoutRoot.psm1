function Git-CheckoutRoot {
    Param(
     [parameter(Mandatory=$false)]
     [Boolean] $PullChanges
     )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $RootBranchName = Get-RootBranchName
        git checkout $RootBranchName
        if ($PullChanges) {
            git pull
        }
    } else {
        return
    }
}

Export-ModuleMember -Function Git-CheckoutRoot