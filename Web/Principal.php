<html>
  <title>Monitorización Sistema</title>

  <head>
      <link rel="icon" href="icono.png" type="image/png">
      <link rel="stylesheet" type="text/css" href="Estilos.css">
  </head>

  <body>
    <h1>Sistema de Monitorización de Equipos y servicios</h1> <br><br>

    <div style="display: flex; width: 300px; height: 300px; margin-left: 35%;">
      <img src="Servidor.png" style="flex: 1; margin-right: 165px;">
      <img src="Servidor.png" style="flex: 1;">
    </div>

    

    <br><br><br><br><br><br><br><br><br><br><br>
    <div class="barra">
      <div class="relleno"></div>
    </div>

    <?php
      // Establecer conexión
      $conn = mysqli_connect("192.168.1.1", "Proyecto", "Admin123.", "INFO_EQUIPOS");

      // Ejecutar consulta
      $sql = "SELECT * FROM Datos_Equipos";
      $resultado = mysqli_query($conn, $sql);
      echo $resultado;

      // Cerrar conexión
      mysqli_close($conn);
    ?>

    <p class="CP">@Copyright Diego 2023</p>
  </body>
</html>


