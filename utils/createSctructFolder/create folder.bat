@echo off
chcp 1251 
set "list=.\list.txt"      &rem файл с именами
set "dest=out"       	 &rem куда ложить
if not exist "%dest%" md "%dest%"
for /f "delims=" %%z in (%list%) do md "%dest%\%%z"
