function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database=INFO_EQUIPOS"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

Conect_database

$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql.CommandText = 'Log_Recursos_Sistema()'
$sql.ExecuteNonQuery() | Out-Null

$IP = "192.168.1.2"

$Disco = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DeviceID -eq "C:"} | Select-Object -Property DeviceID, @{Name="Capacity";Expression={"{0:N2}" -f($_.Size/1GB)}}, @{Name="FreeSpace";Expression={"{0:N2}" -F($_.FreeSpace/1GB)}}
$Capacidad_Disco = $Disco.Capacity
$Espacio_Usado_Disco = $Disco.FreeSpace

$CPU = Get-Counter '\VM Processor(_Total)\% Processor Time' -SampleInterval 2 | Select-Object -ExpandProperty CounterSamples | Select-Object -Property Path, @{Name='CookedValue';Expression={$_.CookedValue.ToString("0.00")}}
$Porcentaje_Uso_CPU = $CPU.CookedValue

$RAM_Total = (Get-CimInstance -ClassName CIM_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
$RAM_Total = "{0:N2}" -f $RAM_Total
$RAM_Uso = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory | ForEach-Object {($_.TotalVisibleMemorySize - $_.FreePhysicalMemory) / 1MB}

$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql.CommandText = 'INSERT INTO Datos_Equipos VALUES (' + "'" + $IP + "','" + $Capacidad_Disco + "','" + $Espacio_Usado_Disco + "','"  + $Porcentaje_Uso_CPU + "','" + $RAM_Total + "','" + $RAM_Uso.ToString("F2") + "'" + ');'
$sql.ExecuteNonQuery() | Out-Null

$Connection.Close()