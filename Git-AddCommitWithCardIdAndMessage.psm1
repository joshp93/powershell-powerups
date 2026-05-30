function Test-ConventionalCommit {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [Parameter(Mandatory = $true)]
        [string]$Prefixes
    )
    $Pattern = "^(?:$Prefixes)"
    return ($Message -match $Pattern)
}

function Check-ConventionalCommit {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [Parameter(Mandatory = $true)]
        [string]$Prefixes
    )
    if (Test-ConventionalCommit -Message $Message -Prefixes $Prefixes) {
        return "${Message.Split(":")[0]}: "   
    }
    else {
        Write-Host "Foolish hobbit! Your commit doesn't follow conventional commit standards" -ForegroundColor Red
        $Prefix = (Read-Host "Please specify what this is (${Prefixes})").Trim().Replace(":", "")
        $NewMessage = "${Prefix}: $Message"
        if (Test-ConventionalCommit -Message $NewMessage -Prefixes $Prefixes) {
            return "${Prefix}: "
        }
        else {
            return Check-ConventionalCommit $Message
        }
    }
}

function Git-AddCommitWithCardIdAndMessage {
    Param(
        [parameter(Mandatory = $true)]
        [string] $Message
    )
    $IsGitRepo = Check-LocationIsGitRepo
    if ($IsGitRepo) {
        $BranchName = Get-CurrentBranchName
        $RootBranchName = Get-RootBranchName
        if ($BranchName -eq $RootBranchName) {
            Write-Host "You are on the ${RootBranchName} you berk" -ForegroundColor Red
            Write-Host "Let's create a new branch together..." -ForegroundColor DarkGreen
            $BranchType = Read-Host "Is it a feature or a bug? [f] feature | [b] bug | [default/other] something else"
            if ($BranchType -eq "f" -or $BranchType -eq "b") {
                $CardName = Read-Host "What's the card name"
                if ($BranchType -eq "f") {
                    $BranchName = "feature/${CardName}"
                    if (Check-BranchExists $BranchName) {
                        Write-Host "That branch already exists, you'd better check it manually." -ForegroundColor Red
                        return
                    }
                    cfb $CardName
                }
                else {
                    $BranchName = "fix/${CardName}"
                    if (Check-BranchExists $BranchName) {
                        Write-Host "That branch already exists, you'd better check it manually." -ForegroundColor Red
                        return
                    }
                    cbb $CardName
                }
                
            }
            else {
                throw "Whoops, try again..."
            }
        }
        $CardName = $BranchName.Split('/')[1].ToUpper()
        $Prefix = ""
        $Settings = Get-Settings
        if ($Settings -and $Settings.enforceAngularConventionalCommit) {
            $Prefixes = "build:|chore:|ci:|docs:|feat:|fix:|perf:|refactor:|style:|test:"
            $Result = Test-ConventionalCommit -Message $Message -Prefixes $Prefixes
            if ($Result -ne $true) {
                $Prefix = Check-ConventionalCommit $Message -Prefixes $Prefixes
            }
            else {
                $PrefixAndMessage = $Message.Split(":")
                $Prefix = $PrefixAndMessage[0].Trim() + ": "
                $Message = $PrefixAndMessage[1].Trim()
            }
        }
        $Message = "${Prefix}${CardName} ${Message}"
        Write-Host "Committing to ${BranchName} with message - '${Message}'" -ForegroundColor DarkGreen
        git ac -m $Message
    }
    else {
        return
    }
}

Export-ModuleMember -Function Git-AddCommitWithCardIdAndMessage