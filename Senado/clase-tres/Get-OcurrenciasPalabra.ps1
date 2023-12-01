param (
    [Parameter(Mandatory=$true)]
    [String]
    $Palabra,

    [Parameter(Mandatory=$true)]
    [String]
    $Texto
)

$Palabras = $Texto.Split(" ");
$ContadorPalabras = @{};

foreach ($PalabraActual in $Palabras) {
    if ($ContadorPalabras.ContainsKey($PalabraActual))
    {
        $ContadorPalabras[$PalabraActual] = $ContadorPalabras[$PalabraActual] + 1;
    } 
    else 
    {
        $ContadorPalabras[$PalabraActual] = 1;
    }
} 

if (-not $ContadorPalabras.ContainsKey($Palabra)){
    return 0;
}else{
    return $ContadorPalabras[$Palabra];
}
