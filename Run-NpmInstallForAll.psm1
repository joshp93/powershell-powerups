function Run-NpmInstallForAll {
    $appPath = "C:\apps"
    Get-ChildItem $appPath | where { $_.mode -eq "d-----" -and $_.name -ne "~~personal" } |

    ForEach-Object {
        $nodeModulesPath = Join-Path -Path $_.FullName -ChildPath "node_modules"
        $gitPath = Join-Path -Path $_.FullName -ChildPath ".git"
        if ((Test-Path -Path $gitPath) -and (Test-Path -Path $nodeModulesPath)) {
            cd $_.FullName
            npm i
        }
        if($nodeModules) {
            
        }
    }
}

Export-ModuleMember -Function Run-NpmInstallForAll
