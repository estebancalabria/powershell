param (
    [Parameter(Mandatory=$true)]
    [Int] $Numero
)


    if ($Numero % 2 -eq 0){
        return $true
    }else{
        return $false
    }
    

#Get-EsPar -Numero $Numero