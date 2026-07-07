function Open-CodeWithUpdate {
  [CmdletBinding()]
  param()

  $vsCodeId = "Microsoft.VisualStudioCode"

  try {
    if (Get-Command winget -ErrorAction SilentlyContinue) {

      $upgradeInfo = winget upgrade --id $vsCodeId --accept-source-agreements 2>$null

      if ($upgradeInfo -match $vsCodeId) {
        Write-Host "VS Code update available. Updating..." -ForegroundColor DarkGreen

        winget upgrade `
          --id $vsCodeId `
          --silent `
          --accept-package-agreements `
          --accept-source-agreements

        Write-Host "VS Code updated." -ForegroundColor Green
      }
    }
    else {
      Write-Warning "winget not found. Skipping update check."
    }

    Write-Host "Opening VS Code..." -ForegroundColor DarkGreen
    code .
  }
  catch {
    Write-Error $_
  }
}

Export-ModuleMember -Function Open-CodeWithUpdate