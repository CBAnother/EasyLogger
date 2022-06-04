:: 输入格式
:: 	绝对路径, 例如: create_dir.bat D:\a\b\c
:: 	相对路径, 例如: create_dir.bat a\b\c
:: 注意:
::	千万不能出现 "" 冒号, 会出问题的……
@echo off

set /a num=-1
set dest_dir=%1
set tmp1=
set tmp2=

setlocal enabledelayedexpansion 

:next1
set /a num+=1
if not "%dest_dir%"=="" (
	goto split
) else ( 
	goto cont
)

:split
set ch=%dest_dir:~0,1%
set dest_dir=%dest_dir:~1%
if "%ch%"=="/" (
	goto to_dir
)
if "%ch%"=="\" (
	goto to_dir
)

set tmp2=%tmp2%%ch%
if "%ch%"==":" (
	goto to_disk
)

goto next1

:to_disk
%tmp2%
set tmp2=
cd /
goto next1

:to_dir
if "%tmp2%"=="" (
	goto next1
)

if not exist %tmp2% (
	md %tmp2%
)
cd %tmp2%
set tmp2=

goto next1

:cont
if "%tmp2%"=="" (
	goto end
)
if not exist %tmp2% (
	md %tmp2%
)
:end