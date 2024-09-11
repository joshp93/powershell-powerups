function Set-Settings {
   Param(
      [parameter(Mandatory = $true)]
      [bool] $EnforceAngularConventionalCommit
   )
   $FilePath = "C:\powershell-powerups\Settings.json"
   if (-Not (Test-Path -Path $FilePath)) {
      New-Item -Path $FilePath -ItemType File
      Write-Output "${FilePath} created"
      $Settings = New-Object PSObject -Property @{
         enforceAngularConventionalCommit = $EnforceAngularConventionalCommit
      }
   }
   else {
      $Settings = Get-Settings
      $Settings.enforceAngularConventionalCommit = $EnforceAngularConventionalCommit
   }

   $Json = ConvertTo-Json -InputObject $Settings
   Set-Content $FilePath -Value $Json
}

Export-ModuleMember -Function Set-Settings