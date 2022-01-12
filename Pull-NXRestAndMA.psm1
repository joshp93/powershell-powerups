function Pull-NXRestAndMA {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        Write-Host "Pulling latest nx-rest" -ForegroundColor DarkGreen
        cd C:\apps\nx-rest-api
        git pull

        Write-Host "Pulling latest ma" -ForegroundColor DarkGreen
        cd C:\apps\nx-my-account-api
        git pull;
    } else {
        return
    }
}

Export-ModuleMember -Function Pull-NXRestAndMA