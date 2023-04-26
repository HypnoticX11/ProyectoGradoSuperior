<html>
  <title>Monitorización Sistema</title>

  <head>
      <link rel="icon" href="icono.png" type="image/png">
      <link rel="stylesheet" type="text/css" href="Estilos.css">
  </head>

  <body>
    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.4", "Proyecto", "Admin123.", "INFO_EQUIPOS");
    ?>

    <h1>Sistema de Monitorización de Equipos y servicios</h1> <br><br>

    <p>Windows Server 1</p>
    <div style="display: flex; width: 300px; height: 300px; margin-left: 35%;">
      <img src="Servidor.png" style="flex: 1; margin-right: 165px;">
      <img src="Servidor.png" style="flex: 1;">
    </div><br><br>

    <?php
      $sql = "SELECT * FROM Datos_Equipos Where IP='192.168.1.2'";
      $resultado = mysqli_query($conn, $sql);

      $resultado = mysqli_fetch_assoc($resultado)

      $Ram_total = $resultado["RAM_Total"];
      $Ram_USO = $resultado["RAM_Uso"];
      $Ram_total = str_replace(',', '.', $Ram_total );
      $Ram_USO = str_replace(',', '.', $Ram_USO );
      $porcentaje = floatval(($Ram_USO*100)/$Ram_total);
      echo $porcentaje;
    ?>
    
    <div class="barra">
      <div class="relleno" style="width: <?php echo $porcentaje; ?>%;"></div>
    </div>

    <?php
      // Ejecutar consulta
      $sql = "SELECT * FROM Datos_Equipos";
      $resultado = mysqli_query($conn, $sql);

      // Mostrar resultados
      while ($fila = mysqli_fetch_assoc($resultado)) {
        echo "IP: " . $fila["IP"] . "<br>";
        echo "Uso_CPU: " . $fila["Espacio_Usado_Disco"] . "%<br>";
        echo "<br>";
      }

      // Cerrar conexión
      mysqli_close($conn);
    ?>

    <p class="CP">@Copyright Diego 2023</p>
  </body>
</html>