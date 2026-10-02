@echo off
chcp 65001 >nul
title EXECUTAVEIS

echo Abrir Edge, Calculadora, Word e Excel
pause
start msedge www.etecfranciscomorato.com.br
call calc.exe
start atividade.docx
start atividade.xlsx

pause