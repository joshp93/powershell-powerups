function Invoke-GoTo {
  param (
    [string] $Path
  )

  if (-not $Path) {
    # No argument: just list top-level directories
    Get-ChildItem -Directory
    return
  }

  # Get all immediate subdirectories
  $allDirectories = Get-ChildItem -Directory

  # Check for exact match first
  $exactMatch = $allDirectories | Where-Object { $_.Name -eq $Path }
  if ($exactMatch) {
    Set-Location $exactMatch.FullName
    Get-ChildItem
    return
  }

  # Look for partial matches
  $partialMatches = $allDirectories | Where-Object {
    $_.Name -like "*$Path*"
  }

  if ($partialMatches.Count -eq 0) {
    # No matches found, try literal path as fallback
    try {
      Set-Location $Path
      Get-ChildItem
    }
    catch {
      Write-Host "Path not found: $Path" -ForegroundColor Red
    }
  }
  elseif ($partialMatches.Count -eq 1) {
    # Single partial match - go to it directly
    Set-Location $partialMatches[0].FullName
    Get-ChildItem
  }
  else {
    # Multiple partial matches - show interactive selection
    Write-Host "Multiple matches found for '$Path':" -ForegroundColor Yellow

    for ($i = 0; $i -lt $partialMatches.Count; $i++) {
      Write-Host "[$($i + 1)] " -ForegroundColor Green -NoNewline
      Write-Host $partialMatches[$i].Name -ForegroundColor Cyan
    }

    Write-Host ""
    $selection = Read-Host "Enter number (1-$($partialMatches.Count)) or press Enter to cancel"

    if ([string]::IsNullOrWhiteSpace($selection)) {
      Write-Host "Cancelled." -ForegroundColor Yellow
      return
    }

    try {
      $index = [int]$selection - 1
      if ($index -ge 0 -and $index -lt $partialMatches.Count) {
        Set-Location $partialMatches[$index].FullName
        Get-ChildItem
      }
      else {
        Write-Host "Invalid selection. Please enter a number between 1 and $($partialMatches.Count)." -ForegroundColor Red
      }
    }
    catch {
      Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
    }
  }
}

Export-ModuleMember -Function Invoke-GoTo