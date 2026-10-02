@echo off
chcp 65001 >nul
title EXERCICIO02

cd\
md Etec
cd Etec
md Morato
cd Morato
md INFO
cd INFO
md Nuvem
copy C:\Users\Etec\Desktop\Atividade\atividade.docx C:\Etec\Morato\INFO\Nuvem
taskkill /im winword.exe

pause