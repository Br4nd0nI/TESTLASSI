<?php 
session_start();

if ($_SESSION["l_auth"]!="1") {
		
		header('location: l_index.html');
		exit();

}

?>