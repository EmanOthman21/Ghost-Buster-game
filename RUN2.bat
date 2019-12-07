@echo off
set arg1=%1.asm
set arg2=%2,asm
If not exist %1.asm echo File Does Not Exist
If not exist %1.asm goto end

If not exist %2.asm echo File Does Not Exist
If not exist %2.asm goto end

If exist %1.obj erase %1.obj
If exist %1.exe erase %1.exe

If exist %2.obj erase %2.obj
If exist %2.exe erase %2.exe



masm %2,%2,%2 ;
If not exist %2.obj goto end



masm %1,%1,%1 ;
If not exist %1.obj goto end


link  %1.obj + %2.obj,lol ;

lol.exe


:end