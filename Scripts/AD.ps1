function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database=INFO_AD"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

Conect_database

$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql.CommandText = 'Log_AD()'
$sql.ExecuteNonQuery() | Out-Null

$Usuarios = Get-AdUser -Filter *
foreach ($Usuario in $Usuarios) {
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Usuarios_AD VALUES (' + "'" + $Usuario.DistinguishedName + "'," + "'" + $Usuario.Name + "'," + "'" + $Usuario.UserPrincipalName + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}  

$Grupos = Get-AdGroup -Filter *
foreach ($Grupo in $Grupos) {
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Grupos_AD VALUES (' + "'" + $Grupo.DistinguishedName + "'," + "'" + $Grupo.Name + "'," + "'" + $Grupo.GroupCategory + "'," + "'" + $Grupo.GroupScope + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}  

$Equipos = Get-AdComputer -Filter *
foreach ($Equipo in $Equipos) {
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Equipos_AD VALUES (' + "'" + $Equipo.DistinguishedName + "'," + "'" + $Equipo.DNSHostName + "'," + "'" + $Equipo.Name + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}  

$Connection.Close()