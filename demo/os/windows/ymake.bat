@if not exist .\out mkdir .\out

:: config
:: °´ unicode ±àÂë
set utf8=1

set root=%~dp0
set root=%root:~0,-1%

call "./bat/create_dir.bat" export/inc
call "./bat/create_dir.bat" export/x64/Debug
call "./bat/create_dir.bat" export/x64/Release
call "./bat/create_dir.bat" export/x86/Debug
call "./bat/create_dir.bat" export/x86/Release

xcopy "..\..\..\easylogger\inc\" "export\inc\" /s /q /y
call %root%/ymake_item.bat export/x86/Debug -m32 1 %utf8%
call %root%/ymake_item.bat export/x64/Debug -m64 1 %utf8%
call %root%/ymake_item.bat export/x86/Release -m32 0 %utf8%
call %root%/ymake_item.bat export/x64/Release -m64 0 %utf8%
pause