function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database=INFO_DHCP"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

Conect_database

$Ambitos = Get-DHCPServerv4Scope -ComputerName 192.168.1.2
foreach ($Ambito in $Ambitos) {
    $Asignaciones = Get-DHCPServerv4Lease -ComputerName 192.168.1.2 -ScopeId $Ambito.ScopeId
    foreach ($Asignacion in $Asignaciones) {
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO IP_Asignadas VALUES (' + "'" + $Ambito.ScopeId + "'," + "'" + $Asignacion.IPAddress + "'," + "'" + $Asignacion.ClientId + "'," + "'" + $Asignacion.HostName + "'," + "'" + $Asignacion.AddressState + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }
}

$Connection.Close()