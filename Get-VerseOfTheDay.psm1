function Get-VerseOfTheDay {
    $ApiUrl = "https://labs.bible.org/api/?passage=votd&formatting=plain"
    $ApiAnswer = Invoke-WebRequest $ApiUrl
    return $ApiAnswer
}

Export-ModuleMember -Function Get-VerseOfTheDay