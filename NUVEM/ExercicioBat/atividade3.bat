@echo off
chcp 65001 >nul
title EXERCICIO03

echo Você deseja copiar o arquivo word para pasta Nuvem?
choice /c SNC /m "Pressione: [S]IM, [N]AO ou [C]ANCELAR"


if errorlevel=3 goto exit
if errorlevel=2 goto nao
if errorlevel=1 goto sim

:sim
	echo Arquivo foi copiado.
	copy C:\Users\Etec\Desktop\atividade.docx C:\ETEC\Morato\Info\Nuvem
	pause
	goto cancelar
:nao
	echo todos arquivos foram renomeados.
	rename *.* *.exe
	pause
	goto cancelar
:cancelar
	echo  sair
	pause
	exit

pause