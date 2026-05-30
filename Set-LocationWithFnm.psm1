function Set-LocationWithFnm {
    param(
        [Parameter(Position = 0)]
        [string] $Path
    )

    Set-Location $Path

    if (Get-Command fnm -ErrorAction SilentlyContinue) {
        fnm use --silent-if-unchanged
    }
}

Export-ModuleMember -Function Set-LocationWithFnm
