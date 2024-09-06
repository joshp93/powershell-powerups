function Get-Settings {
   try {
      return Get-Content 'C:\powershell-powerups\Settings.json' | Out-String | ConvertFrom-Json
   }
   catch {
      Write-Warning "Couldn't find settings file"
   }
}

Export-ModuleMember -Function Get-Settings