<?php 
session_start();
if(isset($_GET["cerrar"])){
$cerrar = $_GET["cerrar"];
}
if(isset($cerrar)){
session_destroy();
header('location:l_index.html');
}
if ($_SESSION["l_auth"]!="1" || !isset($_SESSION["l_auth"])) {
		header('location:l_index.html');
		exit();
}



?>