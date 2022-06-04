:: 输入参数
::	1		输出路径, 例如 debug\x64
::
::	2		-m32 	32 位
::			-m64 	64 位
::
::	3		1		debug
::			0		release
::
::	4		1		UTF8
::			0		普通

@if not exist .\out mkdir .\out
set output_path=%1
set ver=%2
set is_debug=%3
set utf8=%4
if "%utf8%"=="1" (
	set charset=-finput-charset=UTF-8
) else (
	set charset=
)

if "%is_debug%"=="1" (
	set dbg_release=-g3 -O0
) else (
	set dbg_release=-s
)


gcc %ver% %dbg% %charset% %dbg_release% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -Wall -c "..\..\..\easylogger\src\elog.c" -o "%output_path%\elog.o" 
gcc %ver% %dbg% %charset% %dbg_release% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -I "..\..\..\easylogger\plugins\file" -Wall -c "easylogger\port\elog_port.c" -o "%output_path%\elog_port.o"
gcc %ver% %dbg% %charset% %dbg_release% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -Wall -c  "..\..\..\easylogger\src\elog_utils.c" -o "%output_path%\elog_utils.o"
gcc %ver% %dbg% %charset% %dbg_release% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -Wall -c  "..\..\..\easylogger\plugins\file\elog_file.c" -o "%output_path%\elog_file.o"
gcc %ver% %dbg% %charset% %dbg_release% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -I "..\..\..\easylogger\plugins\file" -Wall -c  "..\..\..\easylogger\plugins\file\elog_file_port.c" -o "%output_path%\elog_file_port.o"
gcc -shared %ver% %dbg% -o "%output_path%/EasyLogger.dll" -Wl,--out-implib,"%output_path%/EasyLogger.lib" "%output_path%/*.o"
del "%output_path%\elog.o"
del "%output_path%\elog_port.o"
del "%output_path%\elog_utils.o"
del "%output_path%\elog_file_port.o"
del "%output_path%\elog_file.o"