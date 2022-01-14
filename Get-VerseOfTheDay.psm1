function Get-VerseOfTheDay {
    $ApiUrl = "https://labs.bible.org/api/?passage=votd&formatting=plain"
    try {
        $ApiAnswer = Invoke-WebRequest $ApiUrl
        return $ApiAnswer
    } catch {
        
    }
}

Export-ModuleMember -Function Get-VerseOfTheDay