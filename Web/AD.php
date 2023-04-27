<html>
  <title>Monitorización AD</title>

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
  
    <h1>Usuarios directorio Activo (AD)</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_AD");
      $query = "SELECT * FROM Usuarios_AD";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>Nombre Distinguido</th><th>Nombre</th><th>Nombre Principal</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["Nombre_Distinguido"]."</td><td>".$row["Nombre"]."</td><td>".$row["Nombre_Principal"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>Grupos directorio Activo (AD)</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_AD");
      $query = "SELECT * FROM Grupos_AD";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>Nombre_Distinguido</th><th>Nombre</th><th>Categoria</th><th>Alcance</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["Nombre_Distinguido"]."</td><td>".$row["Nombre"]."</td><td>".$row["Categoria"]."</td><td>".$row["Alcance"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>

    <h1>Equipos directorio Activo (AD)</h1>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_AD");
      $query = "SELECT * FROM Equipos_AD";
      $result = mysqli_query($conn, $query);
          
      echo "<table>";
      echo "<tr><th>Nombre_Distinguido</th><th>Nombre Equipo</th><th>Nombre</th></tr>";
          
      while ($row = mysqli_fetch_assoc($result)){
        echo "<tr><td>".$row["Nombre_Distinguido"]."</td><td>".$row["Nombre_DNS"]."</td><td>".$row["Nombre"]."</td></tr>";
      }
      
      echo "</table>";
          
      mysqli_close($conn);
    ?>
  </body>
</html>