<?php
include("conexion.php");
include("l_auth.php");
//include("l_auth.php");
$fecha = date("Y-m-d");

if(isset($_POST["carnet"])){
    $carnteUn  = $_POST["carnet"];
    $restricc  = $_POST["restriccion"];
    $IdTest = $_POST["idTest"];
    $escuela ; //escuela 
    $EstadoPermiso ;
}


//VERFICAR SI EXISTE UN ULTIMO TEST
function VerfExistencTest(){
    $sql =  mysql_query("SELECT * from  `l-test` WHERE EstadoTest ='Habilitado'");
    $filas =  mysql_num_rows($sql);
    if($filas>0){
    return true;
    }else{
    return false;
    }
}
//OBTENER RESTRICCION DEL ULTIMO TEST
function getrestricion(){
    $sql = mysql_query("SELECT * from  `l-test` WHERE EstadoTest ='Habilitado' ORDER BY idTest DESC");
    $row = mysql_fetch_array($sql);
    $restriccion = $row["RestriccionTest"];
    return $restriccion;
}
//OBTENER ID ULTIMO TEST 
function getIdTest($restricc){
    $sql = mysql_query("SELECT * from  `l-test` WHERE EstadoTest ='Habilitado' AND RestriccionTest ='$restricc' ORDER BY idTest DESC");
    $row = mysql_fetch_array($sql);
    $idTest =  $row["idTest"];
    return $idTest;
}

//VERFICAR SI DIO EL TEST HABILITADO
function getVerfEstadoDetalleUser($carnteUn , $restricc){
        //OBTENER ULTIMO TEST 
        $idTest = getIdTest($restricc);
        $sql =  mysql_query("SELECT  * from  `l-test-detalle` WHERE codusuario = '$carnteUn' AND idTest = $idTest ORDER BY  idDetalleTest DESC");
        $row = mysql_num_rows($sql);
        if($row > 0){
            //TIENE REGISTRADO UN TEST
            return true;
        }else{
            //NO TIENE REGISTRADO UN TEST
            return false;
        }
    
    
}

//COMPROBAR SI DIO EL TEST EL USUARIO
function ComproultimoTestUser($carnteUn){
    $sql = mysql_query("SELECT * FROM `l-test-detalle` WHERE codusuario = '$carnteUn' ORDER BY  idDetalleTest DESC");
    $row =  mysql_num_rows($sql);
    if($row >0){
        return true;
    }else{
        return false;
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////777
/////////////////////////////INGRESAR DATOS DEL FORMULARIO////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////

if(isset($carnteUn)){
    //OBTNER ID DEL ULTIMO TEST QUE SERIA EL TEST QUE QUE ESTA HABILITADO
    if(getVerfEstadoDetalleUser($carnteUn,$restricc ) == false){
    //CREAR TEST PARA EL QUE ESTA HABILITADO EL USER 
        $sql ="insert into `l-test-detalle`(FechaRealizada, Estado ,codusuario ,idTest) values('$fecha','deshabilitado',$carnteUn,$IdTest)";
        if (!mysql_query($sql,$cn)) {
            echo "Error: ".mysql_error($cn);
            $EstadoPermiso ="Denegado";
            }else{
                $EstadoPermiso ="Aceptado";
            }

//EXTRAER ID DEL ULTIMO TESTDETALE RESGISTRADO
$sql = mysql_query("SELECT idDetalleTest FROM `l-test-detalle` WHERE codusuario = '$carnteUn' ORDER BY idDetalleTest desc");
$fila = mysql_num_rows($sql);
if ($fila >0) {
$row = mysql_fetch_array($sql);
$idtest  =  $row["idDetalleTest"];
    }else{
echo "Error: ".mysql_error($cn);
    }
//
//PERMISO PARA QUE  SE PUEDA  LLENAR EL FORMULARIO
if($EstadoPermiso=="Aceptado"){

for ($i=1; $i <= 77 ; $i++) { 
    ${"p". $i }=$_POST["preg$i"];
    //inserto el alternativa segun el idpregunta
    $sql = "insert into `l-pregunta-resultado`(alternativa,idPregunta,idDetalleTest) 
    values(".${"p".$i }.",$i,$idtest)";
    mysql_query($sql,$cn);
    
}
echo "Preguntas Registradas ";
}else{
    echo "Error al registra el test por lo tanto no se pudo introducir las claves de su respuesta";
}

}else{
    echo "SU TEST YA FUE REGISTRADO";
}

}
    



/*
echo "ACTITUD : "."<br>";
echo "MOTIVACION"."<br>";
echo "ADMINISTRACION DEL TIEMPO"."<br>";
echo "ANSIEDAD"."<br>";
echo "CONCENTRACION"."<br>";
echo "PROCESAMIENTO DE INFORMACION"."<br>";
echo "SELECCION DE IDEAS PRINCIPALES"."<br>";
echo "AUTOEVALUACION"."<br>";
echo "ESTRATEGIAS PARA EL EXAMEN"."<br>";
*/

?>