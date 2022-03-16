function convert-JavaToTS {
    Param(
    [parameter(Mandatory=$true)]
    [String] $filePath
    )
   $data = Get-Content $filePath
   $ts = $data
   $ts = $ts -creplace ";", ""
   $ts = $ts -creplace "DTO", ""
   $ts = $ts -creplace "String ", "string "
   $ts = $ts -creplace "Integer ", "number "
   $ts = $ts -creplace "int ", "number "
   $ts = $ts -creplace "Boolean ", "boolean "

   $newTs = ""
   foreach($line in $ts) {
       if($line -like "*private * *") {
           $modifyLine = $line
           if($modifyLine -like "*List<*>*") {
               $modifyLine = $modifyLine -creplace "List", "Array"
           }
           
           $lineArray = $modifyLine.Trim() -split ' '
           $newTs += "$($lineArray[2]): $($lineArray[1]);`n"
       }
   }

   $newTs
   Set-Clipboard $newTs
   Write-Output "`n`nCopied to clipboard"
}

Export-ModuleMember -Function convert-JavaToTS 