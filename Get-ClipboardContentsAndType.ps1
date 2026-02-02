Add-Type -AssemblyName System.Windows.Forms
$clip = [System.Windows.Forms.Clipboard]::GetText()
$shell = New-Object -ComObject WScript.Shell
foreach ($char in $clip.ToCharArray()) {
  $shell.SendKeys($char)
  Start-Sleep -Milliseconds 10   # adjust typing speed here
}