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

Conect_database

$Carpetas = Get-SmbShare
foreach ($Carpeta in $Carpetas){
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Carpetas_Compartidas VALUES (' + "'" + $Carpeta.Path + "'," + "'" + $Carpeta.Description + "'," + "'" + $Carpeta.PrinterName + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null

    $Permisos = Get-SmbShareAccess -Name $Carpeta.Name
    foreach ($Permiso in $Permisos) {
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Carpetas_Compartidas VALUES (' + "'" + $Permiso.Name + "'," + "'" + $Permiso.AccountName + "'," + "'" + $Permiso.AccessControlType + "'," + "'" + $Permiso.AccessRight + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }  
}

$Usuarios_Conectados = Get-SmbSession
foreach ($Usuario in $Usuarios_Conectados) {
    $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
    $sql.Connection = $Connection
    $sql.CommandText = 'INSERT INTO Usuarios_Carpetas_Compartidas VALUES (' + "'" + $Usuario.ClientUserName + "'," + "'" + $Usuario.ClientComputerName + "'" + ');'
    $sql.ExecuteNonQuery() | Out-Null
}

$Connection.Close()