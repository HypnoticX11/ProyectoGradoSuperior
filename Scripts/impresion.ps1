#Creamos una Funci�n para conectarnos a la base de datos
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

$Impresoras = Get-Printer -ComputerName 192.168.1.2
foreach ($Impresora in $Impresoras){
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Impresoras VALUES (' + "'" + $Impresora.Name + "'," + "'" + $Impresora.ComputerName + "'," + "'" + $Impresora.Type + "'," + $Impresora.DriverName + "'," + $Impresora.PortName + "'," + $Impresora.Shared + "'," + $Impresora.Published + "'," + ');'
    $sql.ExecuteNonQuery() | Out-Null
}



$Connection.Close()