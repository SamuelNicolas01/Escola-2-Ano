<?php

$a = 10;
$b = 2;
$c = 10;
$d = 10;

$soma = $a + $c;
$mult = $b * $d;

echo "o resultado da soma é $soma <br> o resultado da multiplicação é $mult<br>";

if($soma > $mult){
    echo "O resultado da SOMA é MAIOR que o resultado da MULTIPLICAÇÃO";
}elseif($soma < $mult){
    echo "O resultado da MULTIPLICAÇÃO é MAIOR que o resultado da SOMA";
}else{
    echo "É tudo IGUAL";
}
?>
