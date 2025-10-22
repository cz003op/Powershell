# PowerShell Special Characters, Operators, and Punctuation Reference

This is a reference that lists PowerShell's key punctuators and operator tokens as described in the [PowerShell Language Specification](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-02?view=powershell-7.5).

Each section includes:
- A brief **description**
- A **simple example**
- A more complete **"all-options" example**


## Brackets and Block Delimiters

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `{ }` | Script or statement block | `{ Write-Host "Hello" }` | `Invoke-Command -ScriptBlock { Get-Process | Where { $_.CPU -gt 100 } }` |
| `[ ]` | Type cast, indexing, generic types | `[int]$x = 5` | `[List[string]]$l = [List[string]]::new(); $l.Add("a")` |
| `( )` | Grouping or method invocation | `($a + $b)` | `($dt = Get-Date).AddDays(10).ToString("yyyy-MM-dd")` |
| `@()` | Array literal | `@("a", "b")` | `$arr = @(1,2,3); foreach ($i in $arr) { Write-Host $i }` |
| `@{}` | Hashtable literal | `@{Name="Bob"}` | `$user = @{ Name="Bob"; Age=40; Skills=@("PS", "C#") }` |
| `$()` | Subexpression (e.g. inside strings) | `"Time: $(Get-Date)"` | `"User: $($name.ToUpper()) at $(Get-Date -Format T)"` |



## Pipelines, Redirection, and Execution

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `|` | Pipeline operator | `Get-Process | Where { $_.CPU -gt 50 }` | `Get-ChildItem | Sort Length -Descending | Select -First 5` |
| `&` | Call operator (invoke command/scriptblock) | `& { "Hello" }` | `$code = { param($x) $x*2 }; & $code 5` |
| `;` | Statement separator | `Write-Host "A"; Write-Host "B"` | `if ($a) { "Yes" } else { "No" }; "Done"` |



## Logic and Control Operators

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `-and` | Logical AND | `$x -gt 0 -and $x -lt 10` | `if ($a -gt 0 -and $b -gt 0) { "OK" }` |
| `-or` | Logical OR | `$x -lt 0 -or $x -gt 100` | `if ($error -or $status -eq "fail") { "Retry" }` |
| `-not` / `!` | Logical NOT | `-not $exists` | `if (!(Test-Path $file)) { "Missing" }` |
| `-xor` | Logical XOR | `$a -xor $b` | `if ($a -xor $b) { "Only one is true" }` |


## Arithmetic Operators

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `+`, `-`, `*`, `/`, `%` | Add, Subtract, Multiply, Divide, Modulo | `5 + 3` | `$sum = ($x + $y) * 2` |
| `++`, `--` | Increment, Decrement | `$i++` | `while ($i-- -gt 0) { $i }` |
| `..` | Range | `1..5` | `foreach ($i in 10..1) { $i }` |



## Assignment and Compound Assignment

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `=` | Assignment | `$x = 10` | `$x = 5; $y = $x * 2` |
| `+=`, `-=`, `*=`, `/=`, `%=`, `++`, `--` | Compound assignments | `$x += 2` | `$total = 0; foreach ($i in 1..5) { $total += $i }` |



## Bitwise Operators

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `-band` | Bitwise AND | `5 -band 3` | `($flags -band 0x04) -ne 0` |
| `-bor` | Bitwise OR | `5 -bor 2` | `$flags = $flags -bor 0x08` |
| `-bxor` | Bitwise XOR | `5 -bxor 3` | `if (($x -bxor $y) -ne 0) { "Differs" }` |
| `-bnot` | Bitwise NOT | `-bnot 0x0F` | `$mask = -bnot $value` |



## Comparison Operators

| Token | Description | Example |
|-------|-------------|---------|
| `-eq`, `-ne`, `-gt`, `-ge`, `-lt`, `-le` | Numeric comparison | `$x -eq 5`, `$x -lt 10` |
| `-like`, `-notlike` | Wildcard matching | `$name -like "A*"` |
| `-match`, `-notmatch` | Regex match | `$text -match "\d+"` |
| `-contains`, `-notcontains` | Collection contains | `$arr -contains 5` |
| `-in`, `-notin` | Value in collection | `3 -in 1..5` |
| `-replace` | Regex replace | `$s -replace "\s", "_"` |
| `-split` | String split | `"a,b,c" -split ","` |



## Redirection Operators

| Token | Description | Example |
|-------|-------------|---------|
| `>` | Redirect stdout (overwrite) | `command > output.txt` |
| `>>` | Redirect stdout (append) | `command >> log.txt` |
| `2>`, `2>>` | Redirect stderr | `command 2> err.txt` |
| `*>`, `*>>` | Redirect all output streams | `command *> all.txt` |



## Type and Casting

| Token | Description | Simple Example | Extended Example |
|-------|-------------|----------------|------------------|
| `-as` | Safe cast | `$obj -as [string]` | `if (($x -as [int]) -ne $null) { ... }` |
| `-is`, `-isnot` | Type check | `$x -is [int]` | `if ($item -isnot [DateTime]) { "Invalid" }` |
| `[type]` | Hard cast | `[int]"5"` | `[datetime]"2025-10-01"` |



## Special Constructs

| Token | Description | Example |
|-------|-------------|---------|
| `@"" ... "@` | Here-string (expanding) | `` $text = @"`nLine1`nLine2`n"@ `` |
| `@' ... '@` | Here-string (literal) | `` $raw = @'`nNo parsing here $var`n'@ `` |
| `::` | Static member access | `[Math]::Sqrt(16)` |
| `.` | Instance member access or dot-sourcing | `"abc".Length` or `. .\script.ps1` |



## Logical Chaining (PowerShell 7+)

| Token | Description | Example |
|-------|-------------|---------|
| `&&` | Run next if previous succeeds | `Test-Path file.txt && Write-Host "Found"` |
| `||` | Run next if previous fails | `Test-Path missing.txt || New-Item missing.txt` |


