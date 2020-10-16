<?php 
include("l_auth.php");
include("conexion.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	
	<style type="text/css">
		table{
			margin-right: auto;
			margin-left: auto;
			border: 1px solid black;
		}
		th, td{
			padding: 5px;
		}
		th{
			text-align: left;
		}
		tr{
			margin-left: auto;
		}
		input{
		background-position: left center;
			margin:auto;
			box-shadow: 0px 3px 3px;
		}
	</style>
</head>
<body>
<h1 align="center">BIENVENIDO <?php  echo $_SESSION["usuario"]; ?> </h1>
<br>
<table style="width: 60%">
	<tr><th>Información Personal</th></tr>
</table>
<br>

<TABLE style="width: 60%" >

		<tr>
			<?php
			$id=$_SESSION["usuario"];
			$sql="select * from alumno where codalumno='$id'";
			$fila=mysql_query($sql);
			$r=mysql_fetch_array($fila);
			?>
			<th>Numero de Carnet:</th>
			<td><?php echo $r["codalumno"]; ?></td>
		</tr>
		<tr>
			<th>Nombre:</th>
			<td><?php echo $r["nombre"]; ?></td>
		</tr>
		<tr>
			<th>Apellidos:</th>
			<td><?php echo $r["paterno"]." ".$r["materno"]; ?></td>
		</tr>
		<tr>
			<th>Escuela:</th>
			<td><?php echo $r["escuela"]; ?></td>
		</tr>
		<tr>
			<th>Aula:</th>
			<td><?php echo $r["aula"]; ?></td>
		</tr>

	</TABLE>

<br>
<br>
<div align="center">
	<form action="f-lassi.php" method="post">
<input align="" type="submit" value="INCIAR TEST">
</form>
<br>
<br>
<form action="l_principal.php" method="post">
<input align="" type="submit" value="Precedente">
<br>
</form>

<br>
<form action="l_auth.php" method="get">
	<input type="hidden" name="cerrar" value="cerrar">
	<input type="submit" value="Cerrar Sesion">
</form>
</div>


</body>
</html>