#Creamos una Funci�n para conectarnos a la base de datos
function Conect_database {
    #Almacenamos la contrasa�a que nos da el usuario en una variable
    $passwd = "Admin123."
    #Cargamos el m�dulo de MySql
    [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
    #Creamos un nuevo objeto con la conexi�n de MySql 
	$global:Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    #Creamos el texto que nos permite conectarnos a la base de datos
	$ConnectionString = "server=" + "192.168.1.4" + ";port=3306;uid=" + "Proyecto" + ";pwd=$passwd" + ";INFO_EQUIPOS"
	$Connection.ConnectionString = $ConnectionString
	#Abrimos la conexi�n
    $Connection.Open()
}

#COMPROBAR SI LOS SERVIDORES EST�N ENCENDIDOS
$tests = 2
$IP = "192.168.1."
Conect_database
While ($tests -ne 10){
    $PC = $IP + $tests
    $Encendido = Test-Connection $PC -Count 1 -Quiet

    if ($Encendido -eq "True"){
        $value = $True
        try {
            $Nombre = (Get-WmiObject -Class Win32_ComputerSystem -ComputerName $PC | Select-Object -ExpandProperty Name).Split('.')[0]
            $SO = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $PC | Select-Object Caption
        }
        catch {
            $username = "root"
            $password = ConvertTo-SecureString "Pollo135790" -AsPlainText -Force
            $cred = New-Object System.Management.Automation.PSCredential($username, $password)

            $value = $true
            $session = New-SSHSession -ComputerName $PC -Credential $cred
            $Nombre = Invoke-SSHCommand -SessionId $session.SessionId -Command "hostname" | Select-Object -ExpandProperty Output
            $SO = Invoke-SSHCommand -SessionId $session.SessionId -Command "lsb_release -ds | cut -f 2-" | Select-Object -ExpandProperty Output
            Remove-SSHSession -SessionId $session.SessionId
        }
        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Equipos_Encendidos VALUES (' + "'" + $PC + "'," + "'" + $Nombre + "'," + "'" + $SO + "'," + $value + ');'
        $sql.ExecuteNonQuery() | Out-Null
    } else {
        $value = $false

        $sql = New-Object MySql.Data.MySqlClient.MySqlCommand
        $sql.Connection = $Connection
        $sql.CommandText = 'INSERT INTO Equipos_Encendidos (IP,Encendido) VALUES (' + "'" + $PC + "'," + $value + ');'
        $sql.ExecuteNonQuery() | Out-Null
    }
    $tests = $tests + 1
}

$Connection.Close()