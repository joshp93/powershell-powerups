function Check-LocationIsGitRepo {
    $pathInfo = Get-Location
    $gitPath = Join-Path -Path $pathInfo.Path -ChildPath ".git"
    if (Test-Path -Path $gitPath) {
        return $true
    } else {
        return $false
    }
}

Export-ModuleMember -Function Check-LocationIsGitRepo