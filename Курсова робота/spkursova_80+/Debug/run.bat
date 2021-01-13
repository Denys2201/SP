@echo off

if exist prog1.obj del prog1.obj

D:\masm32\bin\ml /c /coff prog1.asm

D:\masm32\bin\Link /SUBSYSTEM:WINDOWS prog1.obj

pause
