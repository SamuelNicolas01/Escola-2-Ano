@echo off
chcp 65001 >nul
title EXERCICIO01

echo Olá, seja bem vindo ao CMD
set /p nome=Qual o seu nome? 
set /p disciplina=Qual o nome da disciplina? 
echo Aula de %disciplina%: Exercícios de arquivos em lote desenvolvidos pelo aluno %nome%
call exercicio01_01.bat

pause