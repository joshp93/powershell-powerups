function Get-Settings {
   return Get-Content 'C:\PowerShell\Settings.json' | Out-String | ConvertFrom-Json
}

Export-ModuleMember -Function Get-Settings