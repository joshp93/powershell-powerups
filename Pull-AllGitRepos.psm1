function Pull-AllGitRepos {
    $appPath = "C:\apps"
    Get-ChildItem $appPath | where { $_.mode -eq "d-----" -and $_.name -ne "~~personal" } |

    ForEach-Object {
        $gitPath = Join-Path -Path $_.FullName -ChildPath ".git"
        if (Test-Path -Path $gitPath) {
            cd $_.FullName
            $branch = Get-CurrentBranchName
            $RootBranchName = Get-RootBranchName
            if ($branch -ne $RootBranchName) {
                git checkout $RootBranchName
            }
            git pull
        }
    }
}

Export-ModuleMember -Function Pull-AllGitRepos