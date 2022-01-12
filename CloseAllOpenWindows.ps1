Start-Process C:\PowerShell\nircmd.exe -ArgumentList 'win close class "CabinetWClass"'
Get-Process | ? { $_.MainWindowTitle -ne "" -and ($_.ProcessName -ne "powershell" -and $_.ProcessName -ne "powershell_ise" -and $_.ProcessName -ne "WindowsInternal.ComposableShell.Experiences.TextInput.InputApp") } | Foreach-Object { $_.CloseMainWindow() | Out-Null }
Get-Process | ? { $_.MainWindowTitle -ne "" -and ($_.ProcessName -ne "powershell" -and $_.ProcessName -ne "powershell_ise" -and $_.ProcessName -ne "WindowsInternal.ComposableShell.Experiences.TextInput.InputApp") } | Foreach-Object { $_.CloseMainWindow() | Out-Null }

$action = Read-Host "What do you want to do? Shutdown (s) | Restart (r) | Nothing (n - default)"

if ($action -eq "s") {
    shutdown /p
} elseif ($action -eq "r") {
    Restart-Computer
}