function Pull-NXRestAndMA {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        Write-Host "Pulling latest nx-rest" -ForegroundColor DarkGreen
        cd C:\apps\nx-rest-api
        $RootBranchName = Get-RootBranchName
        git ch $RootBranchName
        git pull

        Write-Host "Pulling latest ma" -ForegroundColor DarkGreen
        cd C:\apps\nx-my-account-api
        $RootBranchName = Get-RootBranchName
        git ch $RootBranchName
        git pull
    } else {
        return
    }
}

Export-ModuleMember -Function Pull-NXRestAndMA