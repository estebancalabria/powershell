
param (
    [Parameter()]
    [String]
    $FileName
)

try {
    
    #Opciones
    #Get-Content $FileName
    #Get-Content $FileName -ErrorAction Stop #Para que lance la Excepcion
    #Get-Content $FileName  #Para que lance la Excepcion
    #Get-Content $FileName -ErrorAction Ignore #Controlamos nosotros la salida
    #De esta manera nos damos cuenta si el ultimo comando tiro un error
    #Esto sirve si no usamos -ErrorAction Stop
    #if (-not $?){  
    #    throw "No se pudo hacer el Get-Content"
    #}

    #Funciona con Strings
    #switch ("hola") {
    #    "hola" { Write-Host "Si" }
    #    Default {Write-Host "Ni"}
    #}

    #Lo hago aqui para no hacerlo aparte
    $nombre = Read-Host "Cual es su nombre"
    Write-Host ("Hola {0} su archivo es:" -f $nombre)

    #Para chequear si un archivo existe
    $directorioActual = (Get-Location).Path.ToString()
    $archivo = ($directorioActual + "\" + $FileName)
    if (Test-Path $archivo) {
        $lineas = [System.IO.File]::ReadAllLines($archivo) 
        $numeroLinea = 1;
        foreach ($linea in $lineas) {
            Write-Host ($numeroLinea.ToString() + ": ") -NoNewline

            switch ($numeroLinea % 3) {
                1 {  Write-Host ( $linea ) -ForegroundColor Blue }
                2 {  Write-Host ( $linea ) -ForegroundColor Yellow}
                Default { Write-Host ( $linea) `-ForegroundColor Green}
            }
            
            $numeroLinea++
        }
    }
    else {
        throw "El archivo {0} no existe" -f $archivo
    }

    
    #
}
catch {
    # Opciones
    # Write-Error $_
    #$_.InvocationInfo | Format-List
    #$_.ScriptStackTrace | Format-List
    Write-Error ("***ERROR CAPTURADO***:" + $_.Exception.Message)
}
