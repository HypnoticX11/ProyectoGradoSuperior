<html>
  <title>Monitorización Equipos</title>

  <head>
    <link rel="icon" href="icono.png" type="image/png">
    <style>
		body{
			background: #0F2027;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to left, #2C5364, #203A43, #0F2027);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to left, #2C5364, #203A43, #0F2027); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		}
		
		table {
			border: 3px solid black;
			border-collapse: collapse;
			margin-top: 25px;
			margin-left: auto;
			margin-right: auto;
		}
		
		th, td {
			font-size: 20px;
			border: 3px solid black;
			padding 150px;
		}
		
		th {
			color: antiquewhite;
		}
		
		td {
			color: white;
		}
		
		table td {
			text-align: center;
		}
		
		h1 {
			font-size: 25px;
			color: antiquewhite;
			text-align: center;
			margin-top: 50px;
		}
    </style>
  </head>

  <body>
  
		<h1>Datos Servidores Windows</h1>
		<?php
			// Establecer conexión
			$conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_EQUIPOS");
			$query = "SELECT * FROM Datos_Equipos";
			$result = mysqli_query($conn, $query);
			
			echo "<table>";
			echo "<tr><th>IP</th><th>Capacidad Disco</th><th>Espacio Usado</th><th>Uso CPU</th><th>RAM Total</th><th>RAM USO</th></tr>";
			
			while ($row = mysqli_fetch_assoc($result)){
				echo "<tr><td>".$row["IP"]."</td><td>".$row["Capacidad_Disco"]."</td><td>".$row["Espacio_Usado_Disco"]."</td><td>".$row["Porcentaje_Uso_CPU"]."</td><td>".$row["RAM_Total"]."</td><td>".$row["RAM_Uso"]."</td></tr>";
			}
			
			echo "</table>";
			
			mysqli_close($conn);
		?>

		<h1>Equipos Encendidos</h1>
		<?php
			// Establecer conexión
			$conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_EQUIPOS");
			$query = "SELECT * FROM Equipos_Encendidos";
			$result = mysqli_query($conn, $query);
			
			echo "<table>";
			echo "<tr><th>IP</th><th>Nombre Equipo</th><th>SO</th><th>Encendido</th></tr>";
			
			while ($row = mysqli_fetch_assoc($result)){
				echo "<tr><td>".$row["IP"]."</td><td>".$row["NOMBRE_Equipo"]."</td><td>".$row["SO"]."</td><td>".$row["Encendido"]."</td></tr>";
			}
			
			echo "</table>";
			
			mysqli_close($conn);
		?>
  </body>
</html>