@echo off
If not exist main.asm echo File Does Not Exist
If not exist main.asm goto end

If exist main.obj erase main.obj
If exist main.exe erase main.exe
If exist main.lst erase main.lst

If exist MDAT.obj erase MDAT.obj
If exist MDAT.exe erase MDAT.exe
If exist MDAT.exe erase MDAT.exe



masm MDAT,MDAT,MDAT ;
If not exist MDAT.obj goto end



masm main,main,main ;
If not exist main.obj goto end


link  main.obj + mdat.obj, game, nul, nul, nul;
If not exist game.exe goto end

game.exe


:end