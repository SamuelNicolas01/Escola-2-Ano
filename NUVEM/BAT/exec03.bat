@echo off
chcp 65001 >null
title exercício 3

echo Olá, você deseja copiar o arquivo word para a pasta Nuvem?
choice /c SNC /m "pressione: [S]im, [N]ão ou [C]ancelar"

if errorlevel=3 goto exit
if errorlevel=2 goto nao
if errorlevel=1 goto sim

:sim
 	echo Arquivo foi copiado
 	copy C:\Users\Etec\Desktop\Atividade\atividade.docx C:\Etec\Morato\INFO\Nuvem
	pause
	goto cancelar
:nao
   echo Arquivo não foi copiado e todos arquivos foram renomeados
   renames *.* *.exe
   pause
   goto cancelar
:cancelar
	echo Você escolheu sair
	pause
	exit

pause