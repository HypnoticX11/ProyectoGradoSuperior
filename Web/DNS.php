<html>
  <title>Monitorización DNS</title>

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
		<h1>Zonas_DNS</h1>
		<?php
			// Establecer conexión
			$conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DNS");
			$query = "SELECT * FROM Zonas_DNS";
			$result = mysqli_query($conn, $query);
			
			echo "<table>";
			echo "<tr><th>Nombre Zona</th><th>tipo</th><th>Firmada</th></tr>";
			
			while ($row = mysqli_fetch_assoc($result)){
				echo "<tr><td>".$row["Nombre_Zona"]."</td><td>".$row["Tipo"]."</td><td>".$row["Firmada"]."</td></tr>";
			}
			
			echo "</table>";
			
			mysqli_close($conn);
		?>

		<h1>Equipos Encendidos</h1>
		<?php
			// Establecer conexión
			$conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DNS");
			$query = "SELECT * FROM Registros_Zonas_DNS";
			$result = mysqli_query($conn, $query);
			
			echo "<table>";
			echo "<tr><th>Nombre host</th><th>Tipo</th><th>Fecha</th><th>TTL</th></tr>";
			
			while ($row = mysqli_fetch_assoc($result)){
				echo "<tr><td>".$row["Nombre_Host"]."</td><td>".$row["Tipo"]."</td><td>".$row["Fecha"]."</td><td>".$row["TTL"]."</td></tr>";
			}
			
			echo "</table>";
			
			mysqli_close($conn);
		?>
  </body>
</html>