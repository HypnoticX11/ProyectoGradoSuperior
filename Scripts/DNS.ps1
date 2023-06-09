function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database=INFO_DNS"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

Conect_database

$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql.CommandText = 'Log_DNS()'
$sql.ExecuteNonQuery() | Out-Null

$Zonas = Get-DnsServerZone -ComputerName 192.168.1.3
foreach ($Zona in $Zonas) {
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Zonas_DNS VALUES (' + "'" + $Zona.ZoneName + "'," + "'" + $Zona.ZoneType + "'," + "'" + $Zona.IsSigned + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null

    $Registros = Get-DnsServerResourceRecord -ZoneName $Zona.ZoneName
    foreach ($Registro in $Registros) {
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Registros_Zonas_DNS VALUES (' + "'" + $Registro.HostName + "'," + "'" + $Registro.RecordType + "'," + "'" + $Registro.Timestamp + "'," + "'" + $Registro.TimeToLive + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }
}

$Connection.Close()