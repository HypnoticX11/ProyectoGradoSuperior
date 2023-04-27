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

    <div style="display: flex; width: 1500px; height: 30px; margin-left: 30.5%;">
      <p style="color: antiquewhite; font-size: 25px; margin-right: 435px;">Windows Server 1</p>
      <p style="color: antiquewhite; font-size: 25px;">Windows Server 2</p>
    </div><br><br>
    <div style="display: flex; width: 300px; height: 300px; margin-left: 29%;">
      <img src="Servidor.png" style="flex: 1; margin-right: 370px;">
      <img src="Servidor.png" style="flex: 1;">
    </div><br><br>

<div>
    <?php
      $sql = "SELECT * FROM Datos_Equipos Where IP='192.168.1.2'";
      $resultado = mysqli_query($conn, $sql);

      $resultado = mysqli_fetch_assoc($resultado);

      echo "<p class='Datos' style='margin-left: 715px; font-size: 18px;'> IP: " . $resultado["IP"] . "</p><br>";
      
      
      $Ram_total = $resultado["RAM_Total"];
      $Ram_USO = $resultado["RAM_Uso"];
      $Ram_total = str_replace(',', '.', $Ram_total );
      $Ram_USO = str_replace(',', '.', $Ram_USO );
      $porcentaje_RAM = floatval(($Ram_USO*100)/$Ram_total);
      if($porcentaje_RAM > 90){$Color_RAM = "red";}else{$Color_RAM = "#4CAF50";}
      
      $porcentaje_CPU = $resultado["Porcentaje_Uso_CPU"];
      $porcentaje_CPU = str_replace(',', '.', $porcentaje_CPU );
      $porcentaje_CPU = floatval($porcentaje_CPU);
      if($porcentaje_CPU > 90){$Color_CPU = "red";}else{$Color_CPU = "#4CAF50";}
      
      $Disco_total = $resultado["Capacidad_Disco"];
      $Disco_USO = $resultado["Espacio_Usado_Disco"];
      $Disco_total = str_replace(',', '.', $Disco_total );
      $Disco_USO = str_replace(',', '.', $Disco_USO );
      $porcentaje_Disco = floatval(($Disco_USO*100)/$Disco_total);
      if($porcentaje_Disco > 90){$Color_Disco = "red";}else{$Color_Disco = "#4CAF50";}
    ?>
    
    <div style="display: flex; width: 300px; height: 10px; margin-left: 715px; margin-top: -25px;">
      <?php
      	echo "<p class='Datos' style='font-size: 18px;'> Uso CPU: " . $resultado["Porcentaje_Uso_CPU"] . "%";
      ?>
    </div>
    
    <div class="barra" style="margin-left: 900px; margin-top: 7px;">
      <div class="relleno" style="width: <?php echo $porcentaje_CPU; ?>%; background-color: <?php echo $Color_CPU; ?>;"></div>
    </div><br><br>
    
    <div style="display: flex; width: 300px; height: 10px; margin-left: 715px; margin-top: -25px;">
      <?php
      	echo "<p class='Datos' style='font-size: 18px;'> Uso RAM: " . $resultado["RAM_Uso"] . "GB</p>";
      ?>
    </div>
    
    <div class="barra" style="margin-left: 900px; margin-top: 7px;">
      <div class="relleno" style="width: <?php echo $porcentaje_RAM; ?>%; background-color: <?php echo $Color_RAM; ?>;"></div>
    </div><br><br>
    
    <div style="display: flex; width: 300px; height: 10px; margin-left: 715px; margin-top: -25px;">
      <?php
      	echo "<p class='Datos' style='font-size: 18px;'> Uso disco: " . $resultado["Espacio_Usado_Disco"] . "GB";
      ?>
    </div>
    
    <div class="barra" style="margin-left: 900px; margin-top: 7px;">
      <div class="relleno" style="width: <?php echo $porcentaje_Disco; ?>%; background-color: <?php echo $Color_Disco; ?>;"></div>
    </div><br><br>

    <?php
      $sql = "SELECT * FROM Datos_Equipos Where IP='192.168.1.3'";
      $resultado = mysqli_query($conn, $sql);

      $resultado = mysqli_fetch_assoc($resultado);

      echo "<p class='Datos' style='margin-left: 1385px; margin-top: -209px; font-size: 18px;'> IP: " . $resultado["IP"] . "</p><br>";
      
      
      $Ram_total = $resultado["RAM_Total"];
      $Ram_USO = $resultado["RAM_Uso"];
      $Ram_total = str_replace(',', '.', $Ram_total );
      $Ram_USO = str_replace(',', '.', $Ram_USO );
      $porcentaje_RAM = floatval(($Ram_USO*100)/$Ram_total);
      if($porcentaje_RAM > 90){$Color_RAM = "red";}else{$Color_RAM = "#4CAF50";}
      
      $porcentaje_CPU = $resultado["Porcentaje_Uso_CPU"];
      $porcentaje_CPU = str_replace(',', '.', $porcentaje_CPU );
      $porcentaje_CPU = floatval($porcentaje_CPU);
      if($porcentaje_CPU > 90){$Color_CPU = "red";}else{$Color_CPU = "#4CAF50";}
      
      $Disco_total = $resultado["Capacidad_Disco"];
      $Disco_USO = $resultado["Espacio_Usado_Disco"];
      $Disco_total = str_replace(',', '.', $Disco_total );
      $Disco_USO = str_replace(',', '.', $Disco_USO );
      $porcentaje_Disco = floatval(($Disco_USO*100)/$Disco_total);
      if($porcentaje_Disco > 90){$Color_Disco = "red";}else{$Color_Disco = "#4CAF50";}
    ?>
    
    <div style="display: flex; width: 300px; height: 10px; margin-left: 1385px; margin-top: -25px;">
      <?php
      	echo "<p class='Datos' style='font-size: 18px;'> Uso CPU: " . $resultado["Porcentaje_Uso_CPU"] . "%";
      ?>
    </div>
    
    <div class="barra" style="margin-left: 1570px; margin-top: 7px;">
      <div class="relleno" style="width: <?php echo $porcentaje_CPU; ?>%; background-color: <?php echo $Color_CPU; ?>;"></div>
    </div><br><br>
    
    <div style="display: flex; width: 300px; height: 10px; margin-left: 1385px; margin-top: -25px;">
      <?php
      	echo "<p class='Datos' style='font-size: 18px;'> Uso RAM: " . $resultado["RAM_Uso"] . "GB</p>";
      ?>
    </div>
    
    <div class="barra" style="margin-left: 1570px; margin-top: 7px;">
      <div class="relleno" style="width: <?php echo $porcentaje_RAM; ?>%; background-color: <?php echo $Color_RAM; ?>;"></div>
    </div><br><br>
    
    <div style="display: flex; width: 300px; height: 10px; margin-left: 1385px; margin-top: -25px;">
      <?php
      	echo "<p class='Datos' style='font-size: 18px;'> Uso disco: " . $resultado["Espacio_Usado_Disco"] . "GB";
      ?>
    </div>
    
    <div class="barra" style="margin-left: 1570px; margin-top: 7px;">
      <div class="relleno" style="width: <?php echo $porcentaje_Disco; ?>%; background-color: <?php echo $Color_Disco; ?>;"></div>
    </div><br><br>
</div>

    <?php   
      // Cerrar conexión
      mysqli_close($conn);
    ?>

    <a href="Equipos.php">
    	<button class="boton" style="margin-left: 20%; margin-top: 2%">Equipos</button>
    </a>
    
    <a href="DHCP.php">
    	<button class="boton" style="margin-left: 2%; margin-top: 2%">DHCP</button>
    </a>
    
    <a href="DNS.php">
    	<button class="boton" style="margin-left: 2%; margin-top: 2%">DNS</button>
    </a>
    
    <a href="AD.php">
    	<button class="boton" style="margin-left: 2%; margin-top: 2%">AD</button>
    </a>
    
    <a href="Impresoras.php">
    	<button class="boton" style="margin-left: 2%; margin-top: 2%">Impresoras</button>
    </a>
    
    <a href="Carpetas.php">
    	<button class="boton" style="margin-left: 2%; margin-top: 2%">Carpetas</button>
    </a><br><br><br>

    <a href="ftp://192.168.1.4" style="margin-left: 47.5%; margin-top: 4%">
    	<button class="boton">Logs</button>
    </a>

    <p class="CP">@Copyright Diego 2023</p>
  </body>
</html>
