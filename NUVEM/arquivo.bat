@echo off
chcp 65001 >nul
title EXERCICIO04

cd C:\Etec\Morato\INFO\Nuvem
echo Verificando se o arquivo existe...

if exist %atividade.xlsx (
	echo O arquivo já existe
) else (
	echo Arquivo não encontrado. Executando ex