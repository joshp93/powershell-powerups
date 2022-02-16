function Git-AddCommitWithCardIdAndMessage {
    Param(
        [parameter(Mandatory = $true)]
        [string] $Message
    )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = Get-CurrentBranchName
        if ($BranchName -eq "master") {
            Write-Host "You are on the master you berk" -ForegroundColor Red
            Write-Host "Let's create a new branch together..." -ForegroundColor DarkGreen
            $BranchType = Read-Host "Is it a feature or a bug? [f] feature | [b] bug | [default/other] something else"
            if ($BranchType -eq "f" -or $BranchType -eq "b") {
                $CardName = Read-Host "What's the card name"
                if ($BranchType -eq "f") {
                    $BranchName = "feature/${CardName}"
                    if (Check-BranchExists $BranchName) {
                        Write-Host "That branch already exists, you'd better check it manually." -ForegroundColor Red
                        return
                    }
                    cfb $CardName
                } else {
                    $BranchName = "fix/${CardName}"
                    if (Check-BranchExists $BranchName) {
                        Write-Host "That branch already exists, you'd better check it manually." -ForegroundColor Red
                        return
                    }
                    cbb $CardName
                }
                
            } else {
                throw "Whoops, try again..."
            }
        }
        $CardName = $BranchName.Split('/')[1].ToUpper()
        $Message = "${CardName} ${Message}"
        Write-Host "Committing to ${BranchName} with message: ${Message}" -ForegroundColor DarkGreen
        git ac -m $Message
    } else {
        return
    }
}

Export-ModuleMember -Function Git-AddCommitWithCardIdAndMessage