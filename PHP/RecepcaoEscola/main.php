<?php

function sanitizar(string $valor){
    return htmlspecialchars(strip_tags(trim($valor)), ENT_QUOTES, 'UTF-8');
}

function validaCPF($cpf) {
    $cpf = preg_replace('/\D/', '', $cpf);

    // CPF precisa ter 11 dígitos
    if (strlen($cpf) != 11) {
        return false;
    }

    // Rejeita CPFs com todos os dígitos iguais (ex: 00000000000, 11111111111)
    if (preg_match('/^(\d)\1{10}$/', $cpf)) {
        return false;
    }

    // Calcula o primeiro dígito verificador
    $soma = 0;
    for ($i = 0; $i < 9; $i++) {
        $soma += (int)$cpf[$i] * (10 - $i);
    }
    $resto   = $soma % 11;
    $digito1 = ($resto < 2) ? 0 : 11 - $resto;

    if ((int)$cpf[9] !== $digito1) {
        return false;
    }

    // Calcula o segundo dígito verificador
    $soma = 0;
    for ($i = 0; $i < 10; $i++) {
        $soma += (int)$cpf[$i] * (11 - $i);
    }
    $resto   = $soma % 11;
    $digito2 = ($resto < 2) ? 0 : 11 - $resto;

    if ((int)$cpf[10] !== $digito2) {
        return false;
    }

    return true;
}

function mascaraCPF($cpf) {
    $cpf = preg_replace('/\D/', '', $cpf);

    if (strlen($cpf) == 11) {
        return preg_replace(
        "/(\d{3})(\d{3})(\d{3})(\d{2})/",
        "$1.$2.$3-$4",
        $cpf
        );
    }

    return $cpf;
}

function mascaraTelefone($tel) {
    $tel = preg_replace('/\D/', '', $tel);

    if (strlen($tel) == 11) {
        return preg_replace(
        "/(\d{2})(\d{5})(\d{4})/",
        "($1) $2-$3",
        $tel
        );
    }

    if (strlen($tel) == 10) {
        return preg_replace(
        "/(\d{2})(\d{4})(\d{4})/",
        "($1) $2-$3",
        $tel
        );
    }

    return $tel;
}

function mascaraRG($rg) {
    $rg = preg_replace('/\D/', '', $rg);

    if (strlen($rg) == 9) {
        return preg_replace(
        "/(\d{2})(\d{3})(\d{3})(\d{1})/",
        "$1.$2.$3-$4",
        $rg
        );
    }

    return $rg;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: index.html');
    exit;
}

$nome    = sanitizar($_POST["fnome"] ?? "");
$end     = sanitizar($_POST["fend"] ?? "");
$tel     = sanitizar($_POST["ftel"] ?? "");
$rg      = sanitizar($_POST["frg"] ?? "");
$cpf     = sanitizar($_POST["fcpf"] ?? "");
$dt_nasc = sanitizar($_POST["fdt_nasc"] ?? "");

// Valida o CPF antes de prosseguir
if (!validaCPF($cpf)) {
    die("CPF inválido. <a href='index.html'>Voltar</a>");
}

$dt_nasc = date("d/m/Y", strtotime($dt_nasc));

// Coloca nome e endereço em maiúsculo
$nome = mb_strtoupper($nome);
$end  = mb_strtoupper($end);

echo "Nome $nome <br>";
echo "Endereço $end <br>";
echo"Telefone $tel<br>";
echo"RG $rg<br>";
echo"CPF $cpf<br>";
echo"Data $dt_nasc<br>";

// Aplica as máscaras
$cpf = mascaraCPF($cpf);
$tel = mascaraTelefone($tel);
$rg  = mascaraRG($rg);
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
                <td> <?= htmlspecialchars($nome, ENT_QUOTES, 'UTF-8') ?></td>
            </tr>

            <tr>
                <td>Endereço</td>
                <td> <?= htmlspecialchars($end, ENT_QUOTES, 'UTF-8') ?></td>
            </tr>

            <tr>
                <td>Telefone</td>
                <td> <?= htmlspecialchars($tel, ENT_QUOTES, 'UTF-8') ?></td>
            </tr>

            <tr>
                <td>RG</td>
                <td> <?= htmlspecialchars($rg, ENT_QUOTES, 'UTF-8') ?></td>
            </tr>

            <tr>
                <td>CPF</td>
                <td> <?= htmlspecialchars($cpf, ENT_QUOTES, 'UTF-8') ?></td>
            </tr>

            <tr>
                <td>Data de Nascimento</td>
                <td> <?= htmlspecialchars($dt_nasc, ENT_QUOTES, 'UTF-8') ?></td>
            </tr>

        </table>

        <br>

        <a href="index.html">
            <- Novo Cadastro

        </body>
    </html>
