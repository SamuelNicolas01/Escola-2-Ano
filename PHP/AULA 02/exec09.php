<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>TIPOS DE SAIDA</title>
</head>
<body>
	<h2>Exemplo 3 - Tipos de Saidas</h2>

	<h3>Escrevendo em um elemento</h3>

	<button  type="button"onclick="document.getElementById('conteudo').innerHTML = 'Olá querido aluno!'">
		Clique aqui para ver a saida
	</button>

	<p id="conteudo">A saida será exibida aqui</p>

	<hr/>

	<h3>Escrita direto na página </h3>

	<p>Vai sobrescrever toda a pagina </p>

	<button type="button" onclick="document.write('olá meus queridos alunos!