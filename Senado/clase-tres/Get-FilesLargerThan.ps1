param (
    [Parameter(Mandatory=$true)]
    [Int]
    $Kb
)
 
Get-ChildItem | where Length -gt ($Kb*1024)