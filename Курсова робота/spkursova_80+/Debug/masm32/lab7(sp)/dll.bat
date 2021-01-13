@echo off

if exist lab7dll_20.obj del lab7dll_20.obj
if exist lab7dll_20.dll del lab7dll_20.dll

\masm32\bin\ml /c /coff lab7dll_20.asm

\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /DEF:lab7dll_20.def lab7dll_20.obj

pause
