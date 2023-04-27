<html>
  <title>Monitorización DHCP</title>

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
  
    <h1>Ambitos</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DHCP");
      $query = "SELECT * FROM Ambitos";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>ID</th><th>Nombre Ambito</th><th>Estado</th><th>IP Inicio</th><th>IP Final</th><th>Tiempo Concesión</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["ID"]."</td><td>".$row["NOMBRE_Ambito"]."</td><td>".$row["Estado"]."</td><td>".$row["IP_Inicio"]."</td><td>".$row["IP_Final"]."</td><td>".$row["Tiempo_Concesión"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

      
    <h1>Opciones Ambitos</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DHCP");
      $query = "SELECT * FROM Opciones_Ambitos";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>ID Opcion</th><th>ID Ambito</th><th>Nombre</th><th>Tipo</th><th>Valor</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["ID_OPCION"]."</td><td>".$row["ID_Ambito"]."</td><td>".$row["NOMBRE"]."</td><td>".$row["Tipo"]."</td><td>".$row["Valor"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>Reservas Ambitos</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DHCP");
      $query = "SELECT * FROM Reservas_Ambitos";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>IP</th><th>ID Ambito</th><th>ID Cliente</th><th>Nombre</th><th>Tipo</th><th>Descripción</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["IP"]."</td><td>".$row["ID_Ambito"]."</td><td>".$row["ID_Cliente"]."</td><td>".$row["Nombre"]."</td><td>".$row["Tipo"]."</td><td>".$row["Descripcion"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>Estadísticas Ambitos</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DHCP");
      $query = "SELECT * FROM Estadísticas_Ambitos";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>ID Ambito</th><th>IP Libres</th><th>IP Uso</th><th>Reservadas</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["ID_Ambito"]."</td><td>".$row["IP_Libres"]."</td><td>".$row["IP_Uso"]."</td><td>".$row["Reservadas"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>IP Asignadas</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_DHCP");
      $query = "SELECT * FROM IP_Asignadas";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>ID Ambito</th><th>IP Cliente</th><th>ID Cliente</th><th>Nombre</th><th>Estado</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["ID_Ambito"]."</td><td>".$row["IP_Cliente"]."</td><td>".$row["ID_Cliente"]."</td><td>".$row["Nombre"]."</td><td>".$row["Estado"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>
  </body>
</html>