[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [Int]
    $Id
)

Invoke-RestMethod -Uri ("https://rickandmortyapi.com/api/character/" + $Id)
| ConvertTo-Json