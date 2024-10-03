function Pnpm-RunScript {
    Param(
        [parameter(Mandatory = $true)]
        [string] $ScriptName
    )
    pnpm run $ScriptName
}

Export-ModuleMember -Function Pnpm-RunScript