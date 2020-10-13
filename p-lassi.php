<?php
include("conexion.php");
$fecha = date("Y-m-d");
$carnteUn  = $_POST["carnet"]; 
$EstadoPermiso ;

//VERFICAR SI EXISTE UN TEST 
$sql =  mysql_query("SELECT  *  from  `l-test` WHERE CarnetUsuario = $carnteUn ORDER BY idDetalleTest DESC");
$filas =  mysql_num_rows($sql);
//
if ($filas >0) {
$row = mysql_fetch_array($sql);
$estado =  $row["Estado"];
$intento =  $row["Intentos"]+1;
}else{
    echo "Error: ".mysql_error($cn);
}
//Registrar test o nuevo test
//si ya dio el test
if($filas > 0){
//numero de intentos NUEVO INTENTO
    if($estado == "Habilitado"){
        $sql =  "insert into `l-test`(FechaRealizada, Estado , Intentos,CarnetUsuario) values('$fecha','deshabilitado','$intento',$carnteUn)";
        if (!mysql_query($sql,$cn)) {
            echo "Error: ".mysql_error($cn);
            }
        $EstadoPermiso ="Aceptado";
    }else{
        //PEDIR PERMISO PAPA
        echo "Solitar Permiso para poder volver a realizawr la encuesta";
        $EstadoPermiso = "Denegado";
    }
    
}else{
    $sql = "insert into `l-test`(FechaRealizada, Estado , Intentos,CarnetUsuario) values('$fecha','deshabilitado',1,$carnteUn)";
    if (!mysql_query($sql,$cn)) {
        echo "Error: ".mysql_error($cn);
        }
        $EstadoPermiso ="Aceptado";
}

$sql = mysql_query("SELECT idDetalleTest FROM `l-test` WHERE CarnetUsuario = '$carnteUn' ORDER BY idDetalleTest desc");
$fila = mysql_num_rows($sql);
if ($fila >0) {
$row = mysql_fetch_array($sql);
$idtest  =  $row["idDetalleTest"];
    }else{
echo "Error: ".mysql_error($cn);
    }

if($EstadoPermiso=="Aceptado"){

for ($i=1; $i <= 77 ; $i++) { 
    ${"p". $i }=$_POST["preg$i"];
    //inserto el alternativa segun el idpregunta
    $sql = "insert into `l-pregunta-resultado`(alternativa,idPregunta,idDetalleTest) 
    values(".${"p".$i }.",$i,$idtest)";
    mysql_query($sql,$cn);
    //
}
}





echo "ACTITUD : "."<br>";
echo "MOTIVACION"."<br>";
echo "ADMINISTRACION DEL TIEMPO"."<br>";
echo "ANSIEDAD"."<br>";
echo "CONCENTRACION"."<br>";
echo "PROCESAMIENTO DE INFORMACION"."<br>";
echo "SELECCION DE IDEAS PRINCIPALES"."<br>";
echo "AUTOEVALUACION"."<br>";
echo "ESTRATEGIAS PARA EL EXAMEN"."<br>";


?>