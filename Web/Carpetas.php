<html>
  <title>Monitorización Carpetas</title>

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
    <h1>Carpetas compartidas</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_CARPETAS_COMPARTIDAS");
      $query = "SELECT * FROM Carpetas_Compartidas";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>Nombre</th><th>Ruta</th><th>Descripción</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["Nombre"]."</td><td>".$row["Ruta"]."</td><td>".$row["Descripción"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>Permisos carpetas compartidas</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_CARPETAS_COMPARTIDAS");
      $query = "SELECT * FROM Permisos_Carpetas_Compartidas";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>Nombre</th><th>Usuario</th><th>Tipo Acceso</th><th>Permisos</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["Nombre"]."</td><td>".$row["Usuario"]."</td><td>".$row["Tipo_Acceso"]."</td><td>".$row["Permisos"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>Usuarios carpetas compartidas</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_CARPETAS_COMPARTIDAS");
      $query = "SELECT * FROM Usuarios_Carpetas_Compartidas";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>Nombre Usuario</th><th>IP Usuario</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["Nombre_Usuario"]."</td><td>".$row["IP_Usuario"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>
  </body>
</html>