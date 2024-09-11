function Npm-RunScript {
    Param(
        [parameter(Mandatory = $true)]
        [string] $ScriptName
    )
    npm run $ScriptName
}

Export-ModuleMember -Function Npm-RunScript