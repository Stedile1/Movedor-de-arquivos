@echo off
setlocal enabledelayedexpansion

rem Caminho da pasta de origem
set "source_folder=C:\ORIGEM"

rem Caminho da pasta de destino base
set "destination_base_folder=C:\DESTINO"

rem Verifica se a pasta de origem existe
if not exist "%source_folder%" (
    echo A pasta de origem nao existe: %source_folder%
    pause
    exit /b
)

rem Verifica se a pasta de destino base existe, se não, cria
if not exist "%destination_base_folder%" (
    mkdir "%destination_base_folder%"
)

rem Mude para a pasta de origem
cd /d "%source_folder%"

rem Para cada arquivo .mp4 na pasta de origem
for %%f in (*.mp4) do (
    rem Extraia o nome do arquivo sem a extensão
    set "filename=%%~nf"
    
    rem Crie a nova pasta com o nome do arquivo na pasta de destino base
    mkdir "%destination_base_folder%\!filename!"
    
    rem Crie a subpasta pt-br dentro da pasta do arquivo
    mkdir "%destination_base_folder%\!filename!\pt-br"
    
    rem Mova o arquivo para a nova subpasta
    move "%%f" "%destination_base_folder%\!filename!\pt-br\"
)

echo Operacao concluida.
pause
