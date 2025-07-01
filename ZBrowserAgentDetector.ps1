# Prompt the user for the path to the log file
$logPath = Read-Host "Enter the path to the log file"

# Check if file exists
if (-Not (Test-Path $logPath)) {
    Write-Error "!!! File not found: $logPath"
    exit
}

# Initialize Browser Match Containers 
$counts = @{
    Chrome  = 0
    Firefox = 0
    Safari  = 0
    Edge    = 0
    Unknown = 0
}

$matchedLines = @{
    Chrome  = @()
    Firefox = @()
    Safari  = @()
    Edge    = @()
    Unknown = @()
}

# Process File Line-by-Line with Line Numbers
Get-Content $logPath | ForEach-Object -Begin { $lineNum = 0 } -Process {
    $lineNum++
    $line = $_
    # Store only the line number now
    $taggedLine = $lineNum

    switch -Wildcard ($line) {
        "*Chrome*" {
            $counts.Chrome++
            $matchedLines.Chrome += $taggedLine
            break
        }
        "*Firefox*" {
            $counts.Firefox++
            $matchedLines.Firefox += $taggedLine
            break
        }
        "*Safari*" {
            $counts.Safari++
            $matchedLines.Safari += $taggedLine
            break
        }
        "*Edge*" {
            $counts.Edge++
            $matchedLines.Edge += $taggedLine
            break
        }
        default {
            $counts.Unknown++
            $matchedLines.Unknown += $taggedLine
        }
    }
}

# Display Summary Report 
Write-Host "`n===  Browser Match Summary ===" -ForegroundColor Cyan
$counts.GetEnumerator() | Sort-Object Name | ForEach-Object {
    "{0,-8}: {1}" -f $_.Key, $_.Value
}

# Display Line Numbers Only
Write-Host "`n===  Matched Line Numbers by Browser Type ===" -ForegroundColor Cyan
$matchedLines.GetEnumerator() | Sort-Object Name | ForEach-Object {
    if ($_.Value.Count -gt 0) {
        Write-Host "`n$($_.Key):" -ForegroundColor Yellow
        $_.Value | ForEach-Object { "  Line $_" }
    }
}
