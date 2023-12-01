
param (
    [Parameter(Mandatory=$true)]
    [Int]
    $Numero
)

if ($Numero % 2 -eq 0){
    Write-Host "Es Par"
} else {
    Write-Host "Es Impar"
}