$rawInput = Get-Content -Path ".\input.txt" -Raw
$elfBags = $rawInput -split "`r`n`r`n"
$elves = @()
foreach ($bag in $elfBags) {
    $caloriesInABag = 0
    $bag -split "`r`n" | %{
        $caloriesInABag += $_
    }
    $elves += $caloriesInABag
}
Write-Host "Puzzle 1 answear: $($elves | Sort-Object -Descending | Select -First 1)"

$topThree = $elves | Sort-Object -Descending | Select -First 3
Write-Host "Puzzle 2 answear: $(($topThree | Measure-Object -Sum).Sum)"