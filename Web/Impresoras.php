<html>
  <title>Monitorización Impresoras</title>

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
  
  <h1>IMPRESORAS</h1>
<?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_IMPRESORAS");
      $query = "SELECT * FROM Impresoras";
      $result = mysqli_query($conn, $query);
      
      echo "<table>";
      echo "<tr><th>Nombre</th><th>IP Equipo</th><th>Tipo</th><th>Driver</th><th>Puerto</th><th>Compartida</th><th>Publicada</th></tr>";
      
      while ($row = mysqli_fetch_assoc($result)){
 	echo "<tr><td>".$row["Nombre"]."</td><td>".$row["NOMBRE_Equipo"]."</td><td>".$row["Tipo"]."</td><td>".$row["Driver"]."</td><td>".$row["Puerto"]."</td><td>".$row["Compartida"]."</td><td>".$row["Publicada"]."</td></tr>";
      }
	
      echo "</table>";
      
      mysqli_close($conn);
?>

 <h1>Drivers Impresoras</h1>
<?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_IMPRESORAS");
      $query = "SELECT * FROM Drivers_Impresoras";
      $result = mysqli_query($conn, $query);
      
      echo "<table>";
      echo "<tr><th>Nombre</th><th>Entorno</th><th>Versión Driver</th><th>Fabricante</th></tr>";
      
      while ($row = mysqli_fetch_assoc($result)){
 	echo "<tr><td>".$row["Nombre"]."</td><td>".$row["Entorno"]."</td><td>".$row["Version_Driver"]."</td><td>".$row["Fabricante"]."</td></tr>";
      }
	
      echo "</table>";
      
      mysqli_close($conn);
?>


  <h1>Puertos Impresoras</h1>
<?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_IMPRESORAS");
      $query = "SELECT * FROM Puertos_Impresoras";
      $result = mysqli_query($conn, $query);
      
      echo "<table>";
      echo "<tr><th>ID</th><th>Nombre</th><th>Nombre Equipo</th><th>Descripción</th><th>Tipo monitor</th></tr>";
      
      while ($row = mysqli_fetch_assoc($result)){
 	echo "<tr><td>".$row["ID"]."</td><td>".$row["Nombre"]."</td><td>".$row["Nombre_Equipo"]."</td><td>".$row["Descripción"]."</td><td>".$row["Tipo_monitor"]."</td></tr>";
      }
	
      echo "</table>";
      
      mysqli_close($conn);
?>


<h1>Cola Impresión</h1>
<?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_IMPRESORAS");
      $query = "SELECT * FROM Cola_Impresión";
      $result = mysqli_query($conn, $query);
      
      echo "<table>";
      echo "<tr><th>ID</th><th>Nombre Equipo</th><th>Nombre Impresora</th><th>Nombre Documento</th><th>Fecha</th><th>Estado</th></tr>";
      
      while ($row = mysqli_fetch_assoc($result)){
 	echo "<tr><td>".$row["ID"]."</td><td>".$row["Nombre_Equipo"]."</td><td>".$row["Nombre_Impresora"]."</td><td>".$row["Nombre_Documento"]."</td><td>".$row["Fecha"]."</td><td>".$row["Estado"]."</td></tr>";
      }
	
      echo "</table>";
      
      mysqli_close($conn);
?>
  </body>
</html>