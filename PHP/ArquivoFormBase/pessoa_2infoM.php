<?php 

function sanitizar(string $valor): string{
    
    // trim : remove espaços em branco antes e depois do inicio e do fim 
    // strip_tags : remove qualquer tag html ou php exstente no texto
    // htmlspecialchars : converter características especiais em entidades html seguras

    return htmlspecialchars(strip_tags(trim($valor)), ENT_QUOTES, 'UTF-8');
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('location: pessoa2info.html');
    exit;
}

    $nome = sanitizar($_POST["fnome"]      ?? '');
    $end = sanitizar($_POST["fend"]   ?? '');
    $tel = sanitizar($_POST["ftel"]        ?? '');
    $rg = sanitizar($_POST["frg"]          ?? '');
    $cpf = sanitizar($_POST["fcpf"]        ?? '');
    $dtNasc = sanitizar($_POST["fdt_nasc"] ?? '');

// mb_strtoupper é usada para converter todos os caracteres alfabéticos de uma string para maiúsculas
$nome = mb_strtoupper($nome);
$end = mb_strtoupper($end);

    echo"Nome : $nome<br>";
    echo"Endereço : $end<br>";
    echo"Telefone : $tel<br>";
    echo"RG : $rg<br>";
    echo"CPF : $cpf<br>";
    echo"Data de nascimento : $dtNasc<br>";
   
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cadastro Realizado</title>
</head>
<body>

    <h1>Cadastro Realizado com Sucesso!</h1>
    <p>Confira os dados recebidos:</p>

    <table border="1" callpadding="6" callspacing="0">

    <tr>
        <th>Campo</th>
        <th>Valor</th>
    </tr>

    <tr>
        <td>Nome</td>
        <td> <?= htmlspecialchars($nome, ENT_QUOTES, 'UTF-8')?></td>
    </tr>

    <tr>
        <td>Endereço</td>
        <td> <?= htmlspecialchars($end, ENT_QUOTES, 'UTF-8')?></td>
    </tr>

    <tr>
        <td>Telefone</td>
        <td> <?= htmlspecialchars($tel, ENT_QUOTES, 'UTF-8')?></td>
    </tr>

    <tr>
        <td>RG</td>
        <td> <?= htmlspecialchars($rg, ENT_QUOTES, 'UTF-8')?></td>
    </tr>

    <tr>
        <td>CPF</td>
        <td> <?= htmlspecialchars($cpf, ENT_QUOTES, 'UTF-8')?></td>
    </tr>

    <tr>
        <td>Data de Nascimento</td>
        <td> <?= htmlspecialchars($dtNasc, ENT_QUOTES, 'UTF-8')?></td>
    </tr>

    </table>

    <br>

    <a href="pessoa2info.html"> <- Novo Cadastro

</body>
</html>