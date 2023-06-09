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
$sql.CommandText = 'Log_jobs_Impresion()'
$sql.ExecuteNonQuery() | Out-Null

$Impresoras = Get-Printer -ComputerName 192.168.1.2
foreach ($Impresora in $Impresoras){
    $Trabajos = Get-Printjob -ComputerName 192.168.1.2 -PrinterName $Impresora.Name
    foreach ($Trabajo in $Trabajos){
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Cola_Impresión VALUES (' + "'" + $Trabajo.Id + "'," + "'" + $Trabajo.ComputerName + "'," + "'" + $Trabajo.PrinterName + "'," + "'" + $Trabajo.DocumentName + "'," + "'" + $Trabajo.SubmittedTime + "'," + "'" + $Trabajo.JobStatus + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }
}

$Connection.Close()