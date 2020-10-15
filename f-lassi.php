<!DOCTYPE html>
<html>
<?php
include("p-lassi.php");
?>

<head>
    <meta charset="iso-8891-1">
    <title></title>
</head>

<body>
<h1>  TEST DE LASSI</h1>
<br>
<?php


//Escuela = $_SESSION["ESCUELA];
//Carnt  = 
$carnteUn = $_SESSION["usuario"];
$restricc ;
$permiso;
$idtest;
if(VerfExistencTest() == true){
    if(getrestricion() == "Individual"){
    echo "TEST LASSI INIVIDUAL";
    $restricc = "individual";
    if(getVerfEstadoDetalleUser($carnteUn , $restricc)==true){
        echo"Usted ya Realizo el test";
        $permiso = "denegado";
    }else{
        $idtest = getIdTest($restricc);
        $permiso = "aceptado";
        echo"Bienvenido Puede comenzar Con El Test";
    }

    }elseif(getrestricion()=="General"){
        echo" TEST LASSI GENERAL\n";  
        $restricc = "General";
        if(getVerfEstadoDetalleUser($carnteUn , $restricc)== true){
            echo"Usted ya Realizo el test";
            $permiso = "denegado";
        }else{
            $idtest = getIdTest($restricc);
            $permiso = "aceptado";
        echo"Bienvenido Puede comenzar Con El Test";
        }
    }elseif(getrestricion()=="Escuela"){
    echo "TEST LASSI DE ESCUELA";
    $restricc = "Escuela";
    if(getVerfEstadoDetalleUser($carnteUn , $restricc)==true){
        echo"Usted ya Realizo el test";
        $permiso = "denegado";
        
    }else{
        $idtest = getIdTest($restricc);
        $permiso = "aceptado";
        echo"Bienvenido Puede comenzar Con El Test";
    }
    }
    if($permiso == "aceptado"){
        if(isset($idtest)){
?>

<form action="p-lassi.php" method="post">
    <input type="text" name="carnet" id="">
    <?php include("conexion.php"); 
    $sql = "select idPregunta,ContPregunta from `l-pregunta`  ";
    $preguntas = mysql_query($sql,$cn);
    
    while ($imp = mysql_fetch_array($preguntas)){
    ?>
    <h5><?php echo $imp["idPregunta"]; ?>.-<?php echo $imp["ContPregunta"]; ?></h5>
    <input type="radio" name="preg<?php echo $imp["idPregunta"] ; ?>" value="1">Siempre me pasa
	<input type="radio" name="preg<?php echo $imp["idPregunta"] ; ?>" value="2">Frecuentemente me pasa
    <input type="radio" name="preg<?php echo $imp["idPregunta"] ; ?>" value="3" >A veces si, aveces no
    <input type="radio" name="preg<?php echo $imp["idPregunta"] ; ?>" value="4" checked>Algunas veces me pasa
    <input type="radio" name="preg<?php echo $imp["idPregunta"] ; ?>" value="5">Nunca me paso eso
    <?php }
        ?>
    <br>
    <input type="hidden" name="idTest" value="<?php echo $idtest;  ?>">
    <input type="hidden" name="restriccion" value="<?php echo $restricc;  ?>">
    <input type="submit" name="btnresult" value="..terminar.." placeholder="terminar">
    
    <?php  ?>
</form>


    <?php 
            }
        } 
}else{
    echo "NO HAY TEST DISPONIBLES PARA USTED ";
}



?>


    
</body>
</html>