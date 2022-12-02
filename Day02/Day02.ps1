$scoreMap = @{
    'X' = 1
    'Y' = 2
    'Z' = 3
    'A' = 1
    'B' = 2
    'C' = 3
}

$rounds = (Get-Content -Path ".\input.txt")
$puzzleOnePoints = 0
foreach ($round in $rounds) {
    $opponentsMove, $yourMove = $round.Split(" ")

    $matchScore = $scoreMap[$yourMove] - $scoreMap[$opponentsMove]
    if ($matchScore -in @(1,-2)) {
        $puzzleOnePoints += 6
    } elseif ($matchScore -eq 0) {
        $puzzleOnePoints += 3
    }
    $puzzleOnePoints += $scoreMap[$yourMove]
}

Write-Host "Puzzle 1 answear: $puzzleOnePoints"

$resultScoreMap = @{
    'X' = 0
    'Y' = 3
    'Z' = 6
}
$puzzleTwoPoints = 0
foreach ($round in $rounds) {
    $opponentsMove, $roundResult = $round.Split(" ")

    $roundScore = $resultScoreMap[$roundResult]
    $opponentsMoveScore = $scoreMap[$opponentsMove]

    if ($roundScore -eq 0) {
        $puzzleTwoPoints += $opponentsMoveScore + $(if ($opponentsMoveScore -gt 1) {-1} else {+2})
    } elseif ($roundScore -eq 3) {
        $puzzleTwoPoints += $opponentsMoveScore
    } else {
        $puzzleTwoPoints += $opponentsMoveScore + $(if ($opponentsMoveScore -eq 3) {-2} else {+1})
    }
    $puzzleTwoPoints += $roundScore
}

Write-Host "Puzzle 2 answear: $puzzleTwoPoints"
