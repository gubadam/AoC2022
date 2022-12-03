$rucksacks = (Get-Content -Path ".\input.txt")

$sumOfPriorities = 0

foreach ($rucksack in $rucksacks) {
    $firstCompartment = $rucksack.Substring(0, $rucksack.Length/2).ToCharArray()
    $secondCompartment = $rucksack.Substring($rucksack.Length/2).ToCharArray()

    $firstCompartment | Select -Unique | % {
        if ($_ -cin ($secondCompartment | Select -Unique)) {
            # Write-Host "Item: $_ | Rucksack: $rucksack"
            $charValue = [int][char]$_
            if ($charValue -ge 97) {
                $sumOfPriorities += $charValue - 96
            } else {
                $sumOfPriorities += $charValue - 38
            }
        }
    }
}

$sumOfPriorities

# Task 2
$sumOfPriorities2
for ($i = 0; $i -lt $rucksacks.Length; $i += 3) {
    $rucksacks[$i].ToCharArray() | Select -Unique | % {
        if ($_ -cin ($rucksacks[$i+1].ToCharArray() | Select -Unique) `
        -and $_ -cin ($rucksacks[$i+2].ToCharArray() | Select -Unique)) {
            $charValue = [int][char]$_
            if ($charValue -ge 97) {
                $sumOfPriorities2 += $charValue - 96
            } else {
                $sumOfPriorities2 += $charValue - 38
            }
        }
    }
}

$sumOfPriorities2