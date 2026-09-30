<?php

function sanitizar(string $valor): string
{
    return htmlspecialchars(strip_tags(trim($valor)), ENT_QUOTES, 'UTF-8');
}

function validaCPF($cpf)
{
    $cpf = preg_replace('/[^0-9]/is', '', $cpf);

    if (strlen($cpf) != 11) {
        return false;
    }


    if (preg_match('/(\d)\1{10}/', $cpf)) {
        return false;
    }

    // Faz o calculo para validar o CPF
    for ($t = 9; $t < 11; $t++) {
        for ($d = 0, $c = 0; $c < $t; $c++) {
            $d += $cpf[$c] * (($t + 1) - $c);
        }
        $d = ((10 * $d) % 11) % 10;
        if ($cpf[$c] != $d) {
            return false;
        }
    }
    return true;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {

    header('location: index.html');
    exit;
}
$nome = sanitizar($_POST['fnome'] ?? '');
$end = sanitizar($_POST['fend'] ?? '');
$tel = sanitizar($_POST['ftel'] ?? '');
$rg = sanitizar($_POST['frg'] ?? '');
$cpf = sanitizar($_POST['fcpf'] ?? '');
$dt_nasc = sanitizar($_POST['fdt_nasc'] ?? '');
$dt_hr_visita = sanitizar($_POST['fdt_hr_visita'] ?? '');

if (!empty($cpf) && !validaCPF($cpf)) {
    header('location: index.html?erro=cpf_invalido&cpf=' . urlencode($cpf));
    exit;
}

$nome = mb_strtoupper($nome);
$end = mb_strtolower($end);

require "conexao.php";

$sql = 'INSERT INTO cliente(nome, endereco, tel, data_nasc, rg, cpf, visita)
        VALUES (?, ?, ?, ?, ?, ?, ?)';

$stmt = $conexao->prepare($sql);
$stmt->bind_param("sssssss", $nome, $end, $tel, $dt_nasc, $rg, $cpf, $dt_hr_visita);

if($stmt->execute()){
    echo('cadastro realizado com sucesso');
}else{
    echo("erro"). $stmt->error;
}

$stmt->close();
$conexao->close(); 

?>