function Get-VerseOfTheDay {
    $ApiUrl = "https://labs.bible.org/api/?passage=votd&formatting=plain"
    $ApiAnswer = Invoke-WebRequest $ApiUrl
    
    #output quote if we have one :)
    Write-Host $ApiAnswer -ForegroundColor Green
}

Export-ModuleMember -Function Get-VerseOfTheDay