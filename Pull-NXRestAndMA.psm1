function Pull-NXRestAndMA {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        Write-Host "Pulling latest nx-rest" -ForegroundColor DarkGreen
        cd C:\apps\nx-rest-api
        git ch master
        git pull

        Write-Host "Pulling latest ma" -ForegroundColor DarkGreen
        cd C:\apps\nx-my-account-api
        git ch master
        git pull
    } else {
        return
    }
}

Export-ModuleMember -Function Pull-NXRestAndMA