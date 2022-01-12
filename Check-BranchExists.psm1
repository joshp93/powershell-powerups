function Check-BranchExists {
     Param(
     [parameter(Mandatory=$true)]
     [String] $BranchName
     )
    $Result = git branch -i -l $BranchName
    if ($Result) {
        return $true
    } else {
        return $false
    }
}

Export-ModuleMember -Function Check-BranchExists