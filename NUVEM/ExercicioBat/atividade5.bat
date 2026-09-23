@echo off
chcp 65001 >nul
title EXERCICIO05

echo Apagando os arquivo em...
for /l %%i in (10,-1,0) do (
echo %%i
timeout /t 1 >nul
)

echo Ocultando arquivos na pasta Documentos...

cd C:\Users\Etec\Documents
attrib +h *.*

echo Finalizado!!!

pause