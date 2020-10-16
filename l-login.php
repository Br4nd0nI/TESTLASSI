<?php 

session_start();
include("conexion.php");

$usu=$_POST["txtusu"];
$pass=$_POST["txtpass"];

$sql="select * from usuario where codusuario ='$usu' and password='$pass'";

$fila=mysql_query($sql);
$r=mysql_fetch_array($fila);

$valor=$r["codusuario"]; 


if ($valor==null) {	
header('location:l_index.html');
}else{

$_SESSION["usuario"]=$valor;
$_SESSION["l_auth"]=1;

header('location:l-inicio.php');
}
?>