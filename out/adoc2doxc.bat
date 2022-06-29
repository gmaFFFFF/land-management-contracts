@echo off
rem Разрешить изменение переменных в цикле
Setlocal EnableDelayedExpansion

rem Установить кодировку utf-8
chcp 65001
echo =======================================================================
echo Автоматически конвертирует документ asciidoctor в формат docx
echo На компьютере должен стоять asciidoctorj и pandoc
echo Название конвертируемого файла должно начинаться на подчеркивание (_)
echo =======================================================================
echo.

set stylefile=%~pd0adoc2docx_style.docx

for /R .\..\ %%i in (_*.adoc) do (  
    set file=%%i
    set newfile=%%~ni%.docx
    set newfile=!newfile:~1!
    set tempfile=%%~ni%.temp.xml

    echo !file!
    echo !newfile!
    echo !tempfile!

    echo. 
    echo Обнаружен файл "!file!"
    echo.
    echo Конвертируем adoc во временный файл в формате Docbook с помощью asciidoctorj
    echo.
    asciidoctorj --backend docbook --out-file "!tempfile!" "!file!" --section-numbers
    echo.
    echo Коневертируем временный Docbook в формат docx с помощью pandoc
    echo.
    pandoc --from docbook --to docx --output "!newfile!" "!tempfile!" --reference-doc=%stylefile%
    echo. Очищаем мусор
    del "!tempfile!"
    echo.
)

pause