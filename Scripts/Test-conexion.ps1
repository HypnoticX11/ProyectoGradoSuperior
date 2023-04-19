#Creamos una Función para conectarnos a la base de datos
function Conect_database {
    #Almacenamos la contrasaña que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el módulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexión de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";database="+"BBDD_infoSistemas"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexión
    $Connection.Open()
}

#COMPROBAR SI LOS SERVIDORES ESTÁN ENCENDIDOS
$tests = 2
$IP = "192.168.1."
Conect_database
While ($tests -ne 10){
    $PC = $IP + $tests
    $Encendido = Test-Connection $PC -Count 1 -Quiet

    if ($Encendido -eq "True"){
        try {
            $Nombre = (Get-WmiObject -Class Win32_ComputerSystem -ComputerName $PC | Select-Object -ExpandProperty Name).Split('.')[0]
            $SO = Get-WmiObject -Class Win32_OperatingSystem -ComputerName IP_ADDRESS | Select-Object Caption
        }
        catch {
            $username = "Diego"
            $password = ConvertTo-SecureString "123" -AsPlainText -Force
            $cred = New-Object System.Management.Automation.PSCredential($username, $password)

            $value = $true
            $session = New-SSHSession -ComputerName $PC -Credential $cred
            $Nombre = Invoke-SSHCommand -SessionId $session.SessionId -Command "hostname"
            $SO = Invoke-SSHCommand -SessionId $session.SessionId -Command "lsb_release -a | grep 'Description:' | awk -F ':\t' '{print $2}'"
            Remove-SSHSession -SessionId $session.SessionId
        }
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Equipos_Encendidos VALUES (' + "'" + $PC + "'" + "'" + $Nombre + "'" + "'" + $SO + "'" + "'" + $value + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    } else {
        $value = $false

        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Equipos_Encendidos VALUES (' + "'" + $PC + "'" + $value + "'" + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }
    $tests = $tests + 1
}

$Connection.Close()

#######################################################################
Test-Connection 192.168.1.1 -Quiet

#Install-Module Posh-SSH
#os linux
$cred = Get-Credential
$session = New-SSHSession -ComputerName REMOTE_COMPUTER_NAME -Credential $cred
Invoke-SSHCommand -SessionId $session.SessionId -Command "lsb_release -a"
Remove-SSHSession -SessionId $session.SessionId

#os windows
Get-CimInstance Win32_OperatingSystem | Select-Object Caption



#Creamos objeto de ejecución de comandos
$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
#Usamos la variable con la string de conexión para este nuevo objeto
$sql.Connection = $Connection
$sql.CommandText = 'INSERT INTO Empleados VALUES (' + "'" + $Usuario.DNI + "'" + "," + "'" + $Usuario.Nombre + "'" + "," + "'" +  $Usuario.Apellido + "'" + "," + "'" + $Usuario.Cargo + "'" + "," + $Usuario.Salario + "," + "'" + $Usuario.Departamento + "'" + ');'
#Ejecutamos la query
$sql.ExecuteNonQuery() | Out-Null