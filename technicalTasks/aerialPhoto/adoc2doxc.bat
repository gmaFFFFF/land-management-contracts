Setlocal EnableDelayedExpansion
@echo off
rem Разрешить изменение переменных в цикле
chcp 65001
echo =======================================================================
echo Автоматически конвертирует документ asciidoctor в формат docx
echo На компьютере должен стоять asciidoctorj и pandoc
echo Название конвертируемого файла должно начинаться на подчеркивание (_)
echo =======================================================================
echo.
rem for %%i in (_*.adoc) do (    
rem for /f "delims=" %%i in (`dir /b _*.adoc`) do (
for %%i in (_*.adoc) do (  
    set file=%%i
    set newfile=%%~ni%.docx
    set newfile=!newfile:~1!
    set tempfile=%%i%.temp.xml

    echo. 
    echo Обнаружен файл "!file!"
    echo.
    echo Конвертируем adoc во временный файл в формате Docbook с помощью asciidoctorj
    echo.
    asciidoctorj --backend docbook --out-file "!tempfile!" "!file!"
    echo.
    echo Коневертируем временный Docbook в формат docx с помощью pandoc
    echo.
    pandoc --from docbook --to docx --output "!newfile!":~1 "!tempfile!"
    echo Очищаем мусор
    del "!tempfile!"
    echo.
)

pause