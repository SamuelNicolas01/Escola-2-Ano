@echo off
chcp 65001 >nul
set /p nome=Digite seu nome:
echo Ola %nome%
set /p disciplina=Digite sua disciplina:
echo A sua disciplina é %disciplina%
echo %disciplina%: Exercícios de arquivos em lote desenvolvidos pelo aluno xxxxxxxx”
pause
call 1_1at.bat