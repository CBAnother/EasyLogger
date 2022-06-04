@if not exist .\out mkdir .\out
set output_path=%1
set ver=%2
set olevel=%3
set glevel=%4
gcc %ver% %dbg% -I "easylogger\inc" -I "..\..\..\easylogger\inc" %olevel% %glevel% -Wall -c "..\..\..\easylogger\src\elog.c" -o "%output_path%\elog.o" 
gcc %ver% %dbg% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -I "..\..\..\easylogger\plugins\file" %olevel% %glevel% -Wall -c "easylogger\port\elog_port.c" -o "%output_path%\elog_port.o"
gcc %ver% %dbg% -I "easylogger\inc" -I "..\..\..\easylogger\inc" %olevel% %glevel% -Wall -c  "..\..\..\easylogger\src\elog_utils.c" -o "%output_path%\elog_utils.o"
gcc %ver% %dbg% -I "easylogger\inc" -I "..\..\..\easylogger\inc" %olevel% %glevel% -Wall -c  "..\..\..\easylogger\plugins\file\elog_file.c" -o "%output_path%\elog_file.o"
gcc %ver% %dbg% -I "easylogger\inc" -I "..\..\..\easylogger\inc" -I "..\..\..\easylogger\plugins\file" %olevel% %glevel% -Wall -c  "..\..\..\easylogger\plugins\file\elog_file_port.c" -o "%output_path%\elog_file_port.o"
gcc -shared %ver% %dbg% -o "%output_path%/EasyLogger.dll" -Wl,--out-implib,"%output_path%/EasyLogger.lib" "%output_path%/*.o"
del "%output_path%\elog.o"
del "%output_path%\elog_port.o"
del "%output_path%\elog_utils.o"
del "%output_path%\elog_file_port.o"
del "%output_path%\elog_file.o"