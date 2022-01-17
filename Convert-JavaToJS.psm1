function convert-JavaToJS {
     Param(
     [parameter(Mandatory=$true)]
     [String] $filePath
     )
    $data = Get-Content $filePath
    $js = $data
    $js = $js -creplace ";", ""
    $js = $js -creplace "DTO", ""
    $js = $js -creplace "String ", "string "
    $js = $js -creplace "Integer ", "number "
    $js = $js -creplace "int ", "number "
    $js = $js -creplace "Boolean ", "boolean "

    $newJs = ""
    foreach($line in $js) {
        if($line -like "*private * *") {
            $lineArray = $line.Trim() -split ' '
            $newJs += "$($lineArray[2]): $($lineArray[1]);`n"
        }
    }

    $newJs
    Set-Clipboard $newJs
    Write-Output "`n`nCopied to clipboard"
}

Export-ModuleMember -Function convert-JavaToJS 
