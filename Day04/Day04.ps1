$rawInput = Get-Content -Path "input.txt"
$countFullOverlap = 0
$countPartialOverlap = 0
foreach ($pair in $rawInput) {
    $first, $second = $pair.Split(",")
    [int]$l1, [int]$r1 = $first.Split("-")
    [int]$l2, [int]$r2 = $second.Split("-")

    if ( ($l1 -le $l2 -and $r1 -ge $r2) -or ($l1 -ge $l2 -and $r1 -le $r2) ) {
        $countFullOverlap++
    }

    [int[]]$1 = $l1..$r1
    [int[]]$2 = $l2..$r2    
    [int[]]$intersection = $1 | ? {$2 -contains $_}
    if ( $intersection.Count -gt 0 ) {
        $countPartialOverlap++
    }
}
Write-Host "Puzzle 1 answear: $countFullOverlap" # 485
Write-Host "Puzzle 2 answear: $countPartialOverlap"