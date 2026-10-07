<?php

require 'conexao.php';

function limpar(string $valor): string {
	return trim(strip_tags($valor));
}

function e(string $v): string {
	return htmlspecialchars($v, ENT_QUOTES, 'UTF-8');
}

function formatarCpf(string $cpf): string {
	return preg_replace('/(\d{3})(\d{3})(\d{3})(\d{2})/', '$1.$2.$3-$4', $cpf);
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
	header('Location: pessoa_2infoM.html');
	exit;
}

$nome    = mb_strtoupper(limpar($_POST['fnome']    ?? ''));
$end     = mb_strtoupper(limpar($_POST['fend']     ?? ''));
$tel     = limpar($_POST['ftel']     ?? '');
$rg      = limpar($_POST['frg']      ?? '');
$cpf     = limpar($_POST['fcpf']     ?? '');
$dt_nasc = limpar($_POST['fdt_nasc'] ?? '');

$cpf = preg_replace('/\D/', '', $cpf);

$erro = '';

if ($nome === '' || $end === '' || $tel === '' || $rg === '' || $cpf === '' || $dt_nasc === '') {
	$erro = 'Preencha todos os campos.';
}
elseif (mb_strlen($nome) > 100 || mb_strlen($end) > 100) {
	$erro = 'Nome e endereço aceitam no máximo 100 caracteres.';
}
elseif (mb_strlen($tel) > 15 || mb_strlen($rg) > 12) {
	$erro = 'Telefone ou RG excedem o tamanho permitido.';
}
elseif (strlen($cpf) !== 11) {
	$erro = 'CPF inválido. Digite os 11 números.';
}
elseif (!($d = DateTime::createFromFormat('Y-m-d', $dt_nasc)) || $d->format('Y-m-d') !== $dt_nasc) {
	$erro = 'Data de nascimento inválida.';
}

if ($erro === '') {
	try {
		$sql = "INSERT INTO cliente (nome, endereco, tel, data_nasc, rg, cpf)
		        VALUES (:nome, :endereco, :tel, :data_nasc, :rg, :cpf)";

		$stmt = $pdo->prepare($sql);
		$stmt->execute([
			':nome'      => $nome,
			':endereco'  => $end,
			':tel'       => $tel,
			':data_nasc' => $dt_nasc,
			':rg'        => $rg,
			':cpf'       => $cpf,
		]);

		$idNovo = $pdo->lastInsertId();
	} catch (PDOException $e) {
		if ($e->getCode() == 23000) {
			$erro = 'CPF já cadastrado ou RG.';
		} else {
			error_log($e->getMessage());
			$erro = 'Não foi possível salvar o cadastro.';
		}
	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cadastro</title>
</head>
<body>

<?php if ($erro !== ''): ?>

	<h1>Erro</h1>
	<p><?= e($erro) ?></p>

<?php else: ?>

	<h1>Cadastro Realizado com Sucesso!</h1>
	<p>Código do cliente: <?= e((string) $idNovo) ?></p>

	<table border="1" cellpadding="6" cellspacing="0">
		<tr><th>Campo</th><th>Valor</th></tr>
		<tr><td>Nome</td><td><?= e($nome) ?></td></tr>
		<tr><td>Endereço</td><td><?= e($end) ?></td></tr>
		<tr><td>Telefone</td><td><?= e($tel) ?></td></tr>
		<tr><td>RG</td><td><?= e($rg) ?></td></tr>
		<tr><td>CPF</td><td><?= e(formatarCpf($cpf)) ?></td></tr>
		<tr><td>Data de Nascimento</td><td><?= e($dt_nasc) ?></td></tr>
	</table>

<?php endif; ?>

	<br>
	<a href="pessoa_2infoM.html">&larr; Novo Cadastro</a>

</body>
</html>