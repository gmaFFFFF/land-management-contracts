@echo off
chcp 1251 
set "list=.\list.txt"      &rem ���� � �������
set "dest=out"       	 &rem ���� ������
if not exist "%dest%" md "%dest%"
for /f "delims=" %%z in (%list%) do md "%dest%\%%z"
