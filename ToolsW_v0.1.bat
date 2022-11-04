REM ~ Trabajo realizado por Joaquín Verde y Diego Breeze ~
REM ~ Proyecto final de Sistemas Operativos 1°año ~

@echo off

SetLocal EnableDelayedExpansion

title [# Tools para Windows, v0.1 #]
:menu
prompt ToolsW v0.1: 
cls
color b

REM  << Chequeo de permisos >>
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
    >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
   >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM << Si sale error, entraste en modo no-Administrador >>
if '%errorlevel%' NEQ '0' (
    echo ~ Debes ejecutar el programa en modo administrador.
    pause>nul
    exit
)
REM << Menu principal. >>
echo #######                            #     #          ###         #   
echo   #     ####   ####  #       ####  #  #  # #    #  #   #       ##   
echo   #    #    # #    # #      #      #  #  # #    # #     #     # #   
echo   #    #    # #    # #       ####  #  #  # #    # #     #       #   
echo   #    #    # #    # #           # #  #  # #    # #     # ###   #   
echo   #    #    # #    # #      #    # #  #  #  #  #   #   #  ###   #   
echo   #     ####   ####  ######  ####   ## ##    ##     ###   ### #####
echo.
echo.
echo ****** MENU PRINCIPAL **************
echo [1]: Herramientas para el sistema.
echo [2]: Herramientas para redes.
echo [3]: Carpetas y archivos.
echo [4]: Discos y volumenes.
echo [5]: Creditos del programa.
echo [6]: Manual del script. (help)
echo [7]: Acceder a la terminal personalizada (ver help).
echo [8]: Salir del programa.
echo ************************************
echo.
echo ~ Ruta actual: %cd%
echo.
echo ~ Seleccione/digite una opcion: 
set /P "opcion="

REM << Chequeo de errores, si opcion es mayor que 8 entonces volver al menu. >>
if %opcion% GTR 8 (
    cls
    echo ~ Has introducido un numero mayor a 6!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :menu
)

REM << Chequeo de errores, si opcion es menor a 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    cls
    echo ~ Has introducido un numero menor a 1!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto:menu
)

REM << Sentencias IF >>
if %opcion%==1 goto :herramienta_sistemas
if %opcion%==2 goto :herramienta_redes
if %opcion%==3 goto :carpetas_y_archivos
if %opcion%==4 goto :discos_y_volumenes
if %opcion%==5 goto :creditos
if %opcion%==6 goto :help
if %opcion%==7 goto :herramientaTerminal
if %opcion%==8 goto :salir

:help 
color c 
cls 
echo # Bienvenido al manual/guia del ToolsW v0.1 
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo # Comandos de la terminal personalizada:
echo xsdir -name "Carpeta A : CarpetaB" -path "c:/" - Para crear carpetas
echo ver o v - Para ver la version de la Consola.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.image.png
echo # Comandos de la terminal normal:
echo systeminfo - Visualiza toda la informacion del sistema.
echo sfc /scannow - Escanea los posibles problemas del sistema.
echo tasklist - Muestra todos los procesos actuales.
echo ipconfig - Muestra todas las direcciones IP's que hay en el sistema.
echo netstat - Muestra el estado de red y los protocolos.
echo nbtstat /n - Muestra los nodos de la IPV4 
echo getmac - Muestra todas las direcciones MAC que hay en la red.
echo netsh int ip reset - Resetea la direccion IPV4.
echo move - Mueve una carpeta de una ruta a otra.
echo rmdir - Borra un directorio.
echo rename - Renombra el nombre de una carpeta.
echo chkdsk - Escanea y analiza el estado del disco.
echo format - Formatea una unidad/volumen.
echo defrag - Desfragmenta una unidad/volumen.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo ~ Presione cualquier tecla para volver al menu principal.
pause>nul
goto :menu 

:herramienta_sistemas
color c
cls
REM << Menu de herramientas para el sistema >>
echo ****** HERRAMIENTAS PARA EL SISTEMA ******
echo [1] Ver version de Windows.
echo [2] Ver version de la consola.
echo [3] Mostrar informacion del sistema.
echo [4] Analisis del sistema.
echo [5] Mostrar la lista de procesos actuales.
echo [6] Volver al menu principal.
echo ******************************************
echo.
echo ~ Seleccione/digite una opcion:
set /P "opcion="

REM << Chequeo de errores, si opcion es mayor que 6 entonces volver al menu. >>
if %opcion% GTR 6 (
    echo ~ Has introducido un numero mayor a 6!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :herramienta_sistemas
)

REM << Chequeo de errores, si opcion es menor a 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    echo ~ Has introducido un numero menor a 1!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto:herramienta_sistemas
)

if %opcion%==1 goto :versionSistema
if %opcion%==2 goto :version_consola
if %opcion%==3 goto :info_sys
if %opcion%==4 goto :analisis_sys
if %opcion%==5 goto :procesos_tareas
if %opcion%==6 goto :menu

:versionSistema
set salida=
call :terminal "ver", salida
echo.
echo # Version del Sistema Windows
echo.
echo !salida!
echo.
pause>nul
goto :menu

:version_consola
cls
echo ~ Accediendo a la version de la cosola...
ver
echo.
echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :herramienta_sistemas

:info_sys
cls
echo ~ Accediendo a la informacion del sistema...
systeminfo
echo.
echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :herramienta_sistemas

:analisis_sys
cls
echo ~ Analizando el sistema...
sfc /scannow
echo.
echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :herramienta_sistemas

:procesos_tareas
cls
echo ~ Accediendo a los procesos del admininstrador de tareas...
tasklist
echo.
echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :herramienta_sistemas

:herramienta_redes
color c
cls
echo ****** HERRAMIENTAS PARA REDES ******
REM << Menu para las herramientas de redes >>
echo [1] Mostrar direcciones IP's
echo [2] Ver el estado de red y protocolo.
echo [3] Ver el nodo de la IPV4.
echo [4] Ver direcciones MAC de los dispositivos conectados en la red.
echo [5] Reinstalacion protoclo TCP/IPV4.
echo [6] Volver al menu principal.
echo **************************************
echo.
echo ~ Seleccione/digite una opcion: 
set /P "opcion="

REM << Chequeo de errores, si opcion es mayor que 6 entonces volver al menu. >>
if %opcion% GTR 6 (
    echo ~ Has introducido un numero mayor a 6!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :herramienta_redes
)

REM << Chequeo de errores, si opcion es menor a 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    echo ~ Has introducido un numero menor a 1!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto:herramienta_redes
)

if %opcion%==1 goto :ips
if %opcion%==2 goto :estado_red
if %opcion%==3 goto :nodo_ipv4
if %opcion%==4 goto :direcciones_mac
if %opcion%==5 goto :reinstalar_ipv4
if %opcion%==6 goto :menu

:ips
cls
echo ~ Accediendo a las direcciones ip de la red.
ipconfig
echo.
echo ~ Presione cualquier tecla para continuar...
pause>nul
goto :herramienta_redes

:estado_red
cls
echo ~ Accediendo al estado de la red y los protocolos.
netstat
echo.
echo ~ Presione cualquier tecla para continuar...
pause>nul
goto :herramienta_redes

:nodo_ipv4
cls
echo ~ Accediendo al nodo de la red.
nbtstat /n
echo.
echo ~ Presione cualquier tecla para continuar...
pause>nul
goto :herramienta_redes

:direcciones_mac
cls
echo ~ Accediendo a las direcciones MAC de la red.
getmac
echo.
echo ~ Presione cualquier tecla para continuar...
pause>nul
goto :herramienta_redes

:reinstalar_ipv4
cls
echo ~ Reinstalando protocolo TCP (ipv4)
netsh int ip reset
echo.
echo ~ Presione cualquier tecla para continuar...
pause>nul
goto :herramienta_redes

:carpetas_y_archivos
color c
cls
REM << Menu para carpetas y archivos >>
echo ~ Ruta actual: %cd%
echo.
echo ****** CARPETAS Y ARCHIVOS ******
echo. [1] - Crear carpetas y/o subcarpetas.
echo. [2] - Mover carpetas.
echo. [3] - Eliminar carpetas.
echo. [4] - Copiar archivos y carpetas.
echo. [5] - Modificar nombre de una carpeta.
echo. [6] - Volver al menu principal.
echo *********************************
echo.
echo ~ Seleccione/digite una opcion:
set /P "opcion="

REM << Chequeo de errores, si opcion es mayor que 6 entonces volver al menu. >>
if %opcion% GTR 6 (
    echo ~ Has introducido un numero mayor a 6!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :carpetas_y_archivos
)

REM << Chequeo de errores, si opcion es menor a 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    echo ~ Has introducido un numero menor a 1!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto:carpetas_y_archivos
)

if %opcion%==1 goto :crear_carpetas
if %opcion%==2 goto :mover_carpetas
if %opcion%==3 goto :eliminar_carpetas
if %opcion%==4 goto :copiar_carpetas
if %opcion%==5 goto :modificar_carpetas
if %opcion%==6 goto :menu

:crear_carpetas
cls
echo ~ Bienvenido a la creacion de carpetas y subcarpetas.
echo ~ Ingresa la ruta donde deseas crear las carpetas:
set /P rutaRoot=

if not exist !rutaRoot! (
    echo.
    echo No existe la [Carpeta Raiz] donde quiere crear sus [Subcarpetas]
    pause
    goto :crear_carpetas
)

echo ~ Ingrese cuantas carpetas desea crear:
set /P cantidad=

set /a k=1

:ciclo_nombre_carpetas
    if !k! leq !cantidad! (
        echo Ingrese nombre de [carpeta !k!]:
        set /P nombre_carpeta=

        cd "!rutaRoot!" & mkdir "!nombre_carpeta!"

        set /a k = k + 1
        goto :ciclo_nombre_carpetas
    )
pause

:mover_carpetas
cls
echo ~ Bienvenido al sistema de mover carpetas.

:moverFromX1
echo ~ Ingrese la ruta de la carpeta a mover:
set /P moverFrom=

if not exist !moverFrom! (
    echo ~ La ruta ingresada no existe, porfavor, intente nuevamente con una nueva ruta:
    goto :moverFromX1
)

:moverToX1

echo ~ Ingrese la ruta hacia donde se debe mover la carpeta:
set /P moverTo=

if not exist !moverTo! (
    echo ~ La ruta hacia donde se debe mover la carpeta no existe.
    goto :moverToX1
)

echo ~ Su carpeta se ha movido de "!moverFrom!" hasta "!moverTo!"

move "!moverFrom!" "!moverTo!"
echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :carpetas_y_archivos

:eliminar_carpetas
cls 
echo ~ Bienvenido al sistema de eliminar carpetas.
echo ~ Porfavor, introduzca la ruta de la carpeta a eliminar:

set /P opcion= 

echo Ruta ingresada: "!opcion!"

if not exist !opcion! (
    echo ~ La carpeta ingresada no existe, porfavor, intente nuevamente.
    pause>nul
    goto :eliminar_carpetas
)

rmdir "!opcion!"

echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :carpetas_y_archivos

:copiar_carpetas
cls 
echo ~ Bienvenido al sistema de copiar carpetas (backup)
echo ~ Porfavor, introduzca la ruta de la carpeta a copiar/respaldar:

set /P copy= 

if not exist !copy! (
    echo ~ La carpeta ingresada no existe, porfavor, intente nuevamente.
    pause>nul
    goto :copiar_carpetas
)

echo ~ Introduzca la ruta de la carpeta a usar como respaldo:

set /P paste=

if not exist !paste! (
    echo ~ La carpeta ingresada no existe, porfavor, intente nuevamente.
    pause>nul
    goto :copiar_carpetas
)

xcopy /E /Q "!copy!" "!paste!"

:modificar_carpetas
cls 
echo ~ Bienvenido al sistema para modificar el nombre a una carpeta.
echo ~ Ingrese la ruta de la carpeta a renombrar:

set /P opcion=

if not exist !opcion! (
     echo ~ La carpeta ingresada no existe, porfavor, intente nuevamente.
    pause>nul
    goto :modificar_carpetas
)

echo ~ Ingrese el nuevo nombre de la carpeta:

set /P nombre= 

rename "!opcion!" "!nombre!"

echo ~ Carpeta a renombrar: "!opcion!"
echo ~ Nuevo nombre de la carpeta: "!nombre!"

echo ~ Presione cualquier tecla para volver al menu.
pause>nul
goto :carpetas_y_archivos

:discos_y_volumenes
color c
cls
REM << Menu para discos y volumenes >>
echo ****** DISCOS Y VOLUMENES *********************
echo [1] - Chequear y reparar fallos en el disco.
echo [2] - Desfragmentar unidades/volumenes (C, D, E).
echo [3] - Formatear una unidad (D, E).
echo [4] - Volver al menu principal
echo ***********************************************
echo.
echo ~ Seleccione/digite una opcion:
set /P "opcion="

REM << Chequeo de errores, si opcion es mayor que 6 entonces volver al menu. >>
if %opcion% GTR 4 (
    echo ~ Has introducido un numero mayor a 4!
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :discos_y_volumenes
)

REM << Chequeo de errores, si opcion es menor a 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    echo ~ Has introducido un numero menor a 1!
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto:menu
)

if %opcion%==1 goto :checkdisc
if %opcion%==2 goto :desfragmentar
if %opcion%==3 goto :formatear
if %opcion%==4 goto :menu

:checkdisc
cls
echo ~ Accediendo, chequeando y reparando fallos en el disco..
echo ~ Iniciando analisis.
chkdsk /F
echo.
echo ~ Pesione cualquier tecla para volver al menu principal...
pause>nul
goto :discos_y_volumenes

:formatear
echo ~~ ADVERTENCIA: Esta seccion puede ser peligrosa, usar con precacuion. ~~
echo ~~ Presione cualquier telca para continuar.. ~~
pause>nul
echo ~ ¿Que unidad desea formatear? ~
echo ~ 1: D 
echo ~ 2: E
set /P opcion=

REM << Chequeo de errores, si opcion es mayor que 6 entonces volver al menu. >>
if %opcion% GTR 2 (
    echo ~ Has introducido un numero mayor a 2!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :discos_y_volumenes
)

REM << Chequeo de errores, si opcion es menor a 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    echo ~ Has introducido un numero menor a 1!
    echo.
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto:discos_y_volumenes
)

if %opcion%==1 goto :formatear_d
if %opcion%==2 goto :formatear_e

:formatear_d
cls
echo ~ Accediendo a la unidad D...
echo ~ Formateando la unidad...
format D: /Q
echo.
echo ~ Formateado con exito.
echo ~ Presione cualquier tecla para volver al menu principal.
pause>nul
goto :discos_y_volumenes

:formatear_e
cls
echo ~ Accediendo a la unidad E...
echo ~ Formateando la unidad...
format E: /Q
echo.
echo ~ Formateado con exito.
echo ~ Presione cualquier tecla para volver al menu principal.
pause>nul
goto :discos_y_volumenes

:desfragmentar
cls 
echo ~ Bienvenido al sistema de desfragmentacion de su disco.
echo ~ Que unidad desea desfragmentar?: 
echo C: (N: 1)
echo E: (N: 2)
echo D: (N: 3)
echo ~ Seleccione una unidad:
set /P opcion=

REM << Chequeo de errores, si opcion es mayor que 3 entonces volver al menu. >>
if %opcion% GTR 3 (
    echo ~ Has introducido un numero mayor a 3!
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :discos_y_volumenes
)

REM << Chequeo de errores, si opcion es menor que 1 entonces volver al menu. >>
if %opcion% LSS 1 (
    echo ~ Has introducido un numero mayor a 1!
    echo ~ Volviendo al menu, presione una tecla...
    pause>nul
    goto :discos_y_volumenes
)

if %opcion%==1 goto :desfragmentar_c 
if %opcion%==2 goto :desfragmentar_e
if %opcion%==3 goto :desfragmentar_d

:desfragmentar_c
cls
echo ~ Accediendo al disco C.
echo ~ Iniciando desfragmentacion..
defrag C: /U /D /V
echo ~ Presione cualquier tecla para volver al menu principal...
pause>nul
goto:discos_y_volumenes

:desfragmentar_d
cls
echo ~ Accediendo al disco D.
echo ~ Iniciando desfragmentacion..
defrag D: /U /D /V
echo ~ Presione cualquier tecla para volver al menu principal...
pause>nul
goto:discos_y_volumenes

:desfragmentar_e
cls
echo ~ Accediendo al disco C.
echo ~ Iniciando desfragmentacion..
defrag E: /U /D /V
echo ~ Presione cualquier tecla para volver al menu principal...
pause>nul
goto:discos_y_volumenes

:creditos
color c
cls
REM << Repositoro de GitHub >>
start https://github.com/diegobreeze
REM << Menu para los creditos del programa >>
echo ###### CREDITOS DEL PROGRAMA ##########################
echo # Trabajo realizado por Joaquin Verde y Diego Breeze. #
echo #######################################################
echo.
echo ~ Presione enter para volver al menu principal.
pause>nul
goto :menu 

:salir
color d
REM << Finalizacion del programa. >>
cls
echo ======================================================================="
echo ~~ Gracias por utilizar ToolsW v0.1 ~~                                 "
echo ~~ Elaboradores: Joaquin Verde y Diego Breeze ~~                       "
echo ~~ Presione enter para finalizar el programa ~~                        "
echo.                                                                       "
echo :'######:::'########:::::'###:::::'######::'####::::'###:::::'######:: "
echo '##... ##:: ##.... ##:::'## ##:::'##... ##:. ##::::'## ##:::'##... ##: "
echo  ##:::..::: ##:::: ##::'##:. ##:: ##:::..::: ##:::'##:. ##:: ##:::..:: "
echo  ##::'####: ########::'##:::. ##: ##:::::::: ##::'##:::. ##:. ######:: "
echo  ##::: ##:: ##.. ##::: #########: ##:::::::: ##:: #########::..... ##: "
echo  ##::: ##:: ##::. ##:: ##.... ##: ##::: ##:: ##:: ##.... ##:'##::: ##: "
echo . ######::: ##:::. ##: ##:::: ##:. ######::'####: ##:::: ##:. ######:: "
echo :......::::..:::::..::..:::::..:::......:::....::..:::::..:::......::: "
echo =========================================================================
pause>nul
exit

:herramientaTerminal
set super=0
set bandera=0
set comandoSuper=
set rutaRoot=
set xcarpetas=
set comando=

echo.
echo # Terminal
set /p comando=~ 

for %%l in (!comando!) do (
    
    if !super!==0 (
        if /i %%l==xsdir (
            set super=1
        ) else (
            if /i %%l==ver (
                set super=1
            ) else (
                if /i %%l==v (
                    set super=1
                )
            )
        )
    )
    
    if !super!==1 (
        set comandoSuper=%%l
        set super=2
    ) else (

        if !bandera!==p (
            set rutaRoot=%%~l
            set bandera=0
        ) else (
            if !bandera!==f (
                set xcarpetas=%%~nl
                set bandera=0
            )
        )

        if !bandera!==0 (
            if /i %%l==-path (
                call :ejecutar_path
            ) else (
                if /i %%l==-name call :ejecutar_name
            )
        )
    )
    
)


if [!comandoSuper!]==[] (
    echo.
    echo ~ Debe colocar un [comando especial]
    pause
    goto :menu
)


if !comandoSuper!==xsdir (
    if [!rutaRoot!]==[] (
        set salida=
        call :terminal "echo %cd%", salida
        set rutaRoot=!salida!
    )

    if not exist !rutaRoot! (
        echo.
        echo ~ No existe la [Carpeta Raiz] donde quiere crear sus [Subcarpetas]
        pause
        goto :menu
    )

    if [!xcarpetas!]==[] (
        echo.
        echo ~ Debe colocar los nombres de sus carpetas con el comando [xsdir -name "Mi Carpeta A : Mi Carpeta B"]
        pause
        goto :menu
    )

    echo.
    echo # CREANDO CARPETA/S
    echo ~ Ruta raiz: "!rutaRoot!" & echo.

    echo # Lista / Carpetas Creadas
    echo "*********************************"
    set splitCarpetas=!xcarpetas::=,!

    :iterar
    for /f "tokens=1* delims=," %%G in ("!splitCarpetas!") do (
        set nombreSubcarpeta=%%~G
        call :trim nombreSubcarpeta
        
        echo !nombreSubcarpeta!

        cd !rutaRoot! & mkdir "!nombreSubcarpeta!"

        set "splitCarpetas=%%H"
        if defined splitCarpetas (goto :iterar)
    )
    echo "*********************************"
) else (
    if !comandoSuper!==ver (
        call :versionSistema
    ) else (
        if !comandoSuper!==v (
            call :versionSistema
        )
    )
)

pause
goto :menu
goto :eof

:versionSistema
set salida=
call :terminal "ver", salida
echo.
echo # Version del Sistema Windows
echo.
echo !salida!
echo.
goto :eof

:ejecutar_path
set bandera=p
goto :eof

:ejecutar_name
set bandera=f
goto :eof

:terminal
set out=
for /f "tokens=*" %%I in ('%~1') do (
    set out=%%I
)
set %~2=%out%
goto :eof

:trim
setlocal EnableDelayedExpansion
call :trimsub %%%1%%
endlocal & set %1=%tempvar%
goto :eof

:trimsub
set tempvar=%*
goto :eof