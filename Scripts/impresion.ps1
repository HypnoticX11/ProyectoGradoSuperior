#Creamos una Funci�n para conectarnos a la base de datos
function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database=INFO_IMPRESORAS"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

Conect_database

$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql.CommandText = 'Log_Impresion()'
$sql.ExecuteNonQuery() | Out-Null

$Puertos = Get-PrinterPort -ComputerName 192.168.1.2
foreach ($Puerto in $Puertos){
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Puertos_Impresoras (Nombre,Nombre_Equipo,Descripción,Tipo_monitor) VALUES (' + "'" + $Puerto.Name + "'," + "'" + $Puerto.ComputerName + "'," + "'" + $Puerto.Description + "'," + "'" + $Puerto.PortMonitor + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}

$Drivers = Get-PrinterDriver -ComputerName 192.168.1.2
foreach ($Driver in $Drivers){
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Drivers_Impresoras (Nombre,Entorno,Version_Driver,Fabricante) VALUES (' + "'" + $Driver.Name + "'," + "'" + $Driver.PrinterEnvironment + "'," + "'" + $Driver.MajorVersion + "'," + "'" + $Driver.Manufacturer + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}

$Impresoras = Get-Printer -ComputerName 192.168.1.2
foreach ($Impresora in $Impresoras){
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Impresoras VALUES (' + "'" + $Impresora.Name + "'," + "'" + $Impresora.ComputerName + "'," + "'" + $Impresora.Type + "'," + "'" + $Impresora.DriverName + "','" + $Impresora.PortName + "','" + $Impresora.Shared + "','" + $Impresora.Published + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}

$Connection.Close()