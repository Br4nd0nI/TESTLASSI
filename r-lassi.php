
<!DOCTYPE html>
<html>

<head>
    <meta charset="iso-8891-1">
    <title></title>
</head>

<body>
    <?php include("conexion.php"); ?>
    <fieldset>
    <?php for ($i=1; $i <= 77; $i++) { 
        $sql = "select idPregunta,ContPregunta from `l-pregunta` where idPregunta=$i";
        $preguntas = mysql_query($sql,$cn);
        $de= mysql_fetch_array($preguntas);
        echo $de["idPregunta"].".-".$de["ContPregunta"]."<br>"; ?>
        <input type="radio" name="preg<?php echo $de["idPregunta"] ; ?>" value="1">Siempre me pasa
	    <input type="radio" name="preg<?php echo $de["idPregunta"] ; ?>" value="2">Frecuentemente me pasa
        <input type="radio" name="preg<?php echo $de["idPregunta"] ; ?>" value="3" >A veces si, aveces no
        <input type="radio" name="preg<?php echo $de["idPregunta"] ; ?>" value="4" checked>Algunas veces me pasa
        <input type="radio" name="preg<?php echo $de["idPregunta"] ; ?>" value="5">Nunca me paso eso
        <br>
        <br>
    <?php } ?>
    </fieldset>

</body>
</html>