<?php
include("conexion.php");


for ($i=1; $i <= 4 ; $i++) { 
    ${"p" . $i }=$_POST["preg$i"];
    //llamo a la escala segun el idpregunta
    $consulta= "select e.idEscala from `l-escala` e,`l-pregunta` p where e.idEscala=p.idEscala and
    p.idPregunta=$i";
    $ej_c=mysql_query($consulta,$cn);
    $ar= mysql_fetch_array($ej_c);
    $escala =  $ar["idEscala"];
    //inserto el alternativa segun el idpregunta
    $sql = "insert into `l-pregunta-resultado`(alternativa,valor,idTest,idPregunta,idEscala) 
    values(".${"p".$i }.",    ,1,$i,$escala)";
    mysql_query($sql,$cn);
    //
}

//$p_act = $p5+$p14+$p18+$p29+$p38+$p45+$p51+$p69;
//$p_mot = ;
//$p_adt = ;
//$p_ans = ;
//$p_con = ;
//$p_pdi = ;
//$p_sdip = ;
//$p_ape =;
//$p_auto = ;
//$p_epe = ;

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