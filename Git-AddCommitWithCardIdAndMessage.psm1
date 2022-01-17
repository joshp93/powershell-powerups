function Git-AddCommitWithCardIdAndMessage {
    Param(
     [parameter(Mandatory=$true)]
     [string] $Message
     )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = Get-CurrentBranchName
        $CardName = $BranchName.Split('/')[1].ToUpper()
        $Message = "${CardName} ${Message}"
        Write-Host "Committing to ${BranchName} with message: ${Message}" -ForegroundColor DarkGreen
        git ac -m $Message
    } else {
        return
    }
}

Export-ModuleMember -Function Git-AddCommitWithCardIdAndMessage