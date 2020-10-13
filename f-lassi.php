<!DOCTYPE html>
<html>

<head>
    <meta charset="iso-8891-1">
    <title></title>
</head>
 
<body>
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
    <input type="submit" name="btnresult" value="..terminar.." placeholder="terminar">
    
    <?php  ?>
</form>
    
</body>
</html>