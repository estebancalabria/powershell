
param (
    #[Parameter(Mandatory=$true)]
    [String]
    $Hostname = "localhost\SQLEXPRESS",
    [Parameter(Mandatory=$true)]
    [String]
    $DatabaseName,
    [String]
    $UserName,
    [String]
    $Password,
    [Parameter(Mandatory=$true)]
    [String]
    $TableName,
    [Parameter(Mandatory=$true)]
    [String[]]
    $Campos
)

if ($UserName.Length -gt 0){
    $connectionString  = "Server={0};Database={1};User Id={2};Password={3};" `
                          -f $Hostname,$DatabaseName,$UserName,$Password
}
else{
    #Yo (el profe) uso...
    $connectionString = "Server={0};Database={1};Trusted_Connection=True" `
                        -f $Hostname,$DatabaseName
}

$query = "select {0} from {1}" -f [String]::Join(",",$Campos) ,$TableName;                    

[System.Collections.ArrayList]$result = [System.Collections.ArrayList]::New()
$cmd = New-Object -TypeName System.Data.SqlClient.SqlCommand -ArgumentList $query,$connectionString
try {
    $cmd.Connection.Open();
    $reader = $cmd.ExecuteReader();    
    while ($reader.Read()) {
        $registro = @{}
        
        foreach ($campo in $campos) {
            #Write-Host ("{0}: {1}" -f $campo, $reader.GetValue(( $reader.GetOrdinal($campo)).ToString()) )
            $registro[$campo] = $reader.GetValue( $reader.GetOrdinal($campo))
        }

        [void]$result.Add($registro) 
    }

    return $result;
}
finally {
    $cmd.Connection.Close();
}


                    