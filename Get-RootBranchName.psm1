function Get-RootBranchName {
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $Settings = Get-Settings
        $Location = Get-Location
        $IsMA = $Location.Path -like "*nx-my-account*"
        if ($Settings.loyaltyMode -and $IsMA -eq $true) {
            return "loyalty-master"
        }
        $RootBranchName = git remote show origin | Select-String -Pattern "HEAD branch:"
        return ($RootBranchName -split ":")[1].Trim()
    }
}

Export-ModuleMember -Function Get-RootBranchName