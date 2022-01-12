function Pull-AllGitRepos {
    $appPath = "C:\apps"
    Get-ChildItem $appPath | where { $_.mode -eq "d-----" -and $_.name -ne "~~personal" } |

    ForEach-Object {
        $gitPath = Join-Path -Path $_.FullName -ChildPath ".git"
        if (Test-Path -Path $gitPath) {
            cd $_.FullName
            $branch = Get-CurrentBranchName;
            if ($branch -ne "master") {
                git checkout master
            }
            git pull
        }
    }
}

Export-ModuleMember -Function Pull-AllGitRepos