function Get-CurrentBranchName {
    $pathInfo = Get-Location
    $gitPath = Join-Path -Path $pathInfo.Path -ChildPath ".git"
    if (Test-Path -Path $gitPath) {
        return git branch --show-current
    } else {
        return ""
    }
}

Export-ModuleMember -Function Get-CurrentBranchName