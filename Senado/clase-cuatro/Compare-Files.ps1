param (
    [Parameter()]
    [String]
    $ThisFile,

    [Parameter()]
    [String]
    $WithThisFile
)

if (-not (Test-Path $ThisFile)){
    throw "El archivo Origen no Exite"
}

if (-not (Test-Path $WithThisFile)){
    throw "El archivo Destino no Exite"
}

$dif = Compare-Object -ReferenceObject (Get-Content $ThisFile) -DifferenceObject (Get-Content $WithThisFile)

if ($dif) { 
    return $false;
}

return $true;