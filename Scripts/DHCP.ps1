function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database=BBDD_infoSistems"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

Conect_database

$Ambitos = Get-DHCPServerv4Scope
foreach ($Ambito in $Ambitos) {
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Ambitos VALUES (' + "'" + $Ambito.ScopeID + "'," + "'" + $Ambito.Name + "'," + "'" + $Ambito.State + "'" + "'" + $Ambito.StartRange + "'," + "'" + $Ambito.EndRange + "'," + "'" + $Ambito.LeaseDuration + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null

    $Opciones = Get-ShcpServerv4OptionValue -ComputerName 192.168.1.2 -ScopeID $Ambito.ScopeId
    foreach ($Opcion in $Opciones) {
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Opciones_Ambitos VALUES (' + "'" + $Opcion.OptionID + "'," + "'" + $Ambito.ScopeID + "'," + "'" + $Opcion.Name + "'" + "'" + $Opcion.Type + "'," + "'" + $Opcion.Value + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }

    $Reservas =  Get-ShcpServerv4Reservation -ComputerName 192.168.1.2 -ScopeID $Ambito.ScopeId
    foreach ($Reserva in $Reservas) {
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Reservas_Ambitos VALUES (' + "'" + $Reserva.IPAddress + "'," + "'" + $Reserva.ScopeID + "'," + "'" + $Reserva.ClientId + "'" + "'" + $Reserva.Name + "'," + "'" + $Reserva.Type + "'," + "'" + $Reserva.Description + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }

    $Estadisticas_Ambitos = Get-DHCPServerv4ScopeStatistics -ComputerName 192.168.1.2
    foreach ($Estadisticas_Ambito in $Estadisticas_Ambitos) {
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Estadísticas_Ambitos VALUES (' + "'" + $Estadisticas_Ambito.ScopeID + "'," + "'" + $Estadisticas_Ambito.Free + "'," + "'" + $Estadisticas_Ambito.InUse + "'" + "'" + $Estadisticas_Ambito.Reserved + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }
}

$Connection.Close()