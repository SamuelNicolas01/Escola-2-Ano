<?php

    $n1 = $_GET["n1"];
    $i = $n1;
    $resul=$n1;

    echo"$n1!=";
    for($i = $n1; $i > 1; $i--){
        echo"$i*";
        if($i == $n1){
            $resul = $n1*($i-1);
    }
    else{
        $resul = $resul*($i-1);
    }
}
    echo" $i<br> ";
    echo"é igual a $resul";

?>