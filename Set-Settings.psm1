function Set-Settings {
   Param(
      [parameter(Mandatory = $true)]
      [String] $LoyaltyMode
   )
   $Settings = Get-Settings
   $Settings.loyaltyMode = $LoyaltyMode
   $Json = ConvertTo-Json -InputObject $Settings
   Set-Content './Settings.json' -Value $Json
}

Export-ModuleMember -Function Set-Settings