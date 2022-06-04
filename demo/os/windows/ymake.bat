@if not exist .\out mkdir .\out

set root=%~dp0
set root=%root:~0,-1%

mkdir "export"
mkdir "export/inc"
mkdir "export/x64"
mkdir "export/x64/Debug"
mkdir "export/x64/Release"
mkdir "export/x86"
mkdir "export/x86/Debug"
mkdir "export/x86/Release"


xcopy "..\..\..\easylogger\inc\" "export\inc\" /s

call %root%/ymake_item.bat export/x86/Debug -m32 -O0 -g3
call %root%/ymake_item.bat export/x64/Debug -m64 -O0 -g3
call %root%/ymake_item.bat export/x86/Release -m32 -O3 -g0
call %root%/ymake_item.bat export/x64/Release -m64 -O3 -g0
::pause