.386
.model flat, stdcall
option casemap:none

include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\windows.inc
include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\kernel32.inc
include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\masm32.inc
include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\user32.inc 

includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\kernel32.lib
includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\masm32.lib
includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\user32.lib

NULL equ 0
MB_OK equ 0

.data
    LibName db "lab7dll_20.dll",0
    FunctionName db "Process",0 ;
    DllNotFound db "Cannot load library",0
    AppName db "Load explisit Library",0
    NotFound db "TestFunction function not found",0
    ResTitle db "Лабораторна робота №7", 0
    ResMessage db " "
    Message  db  "MaxCharSeries: ", "%d", 0
    Text1 db "abc", 0
    Text2 db "ade", 0

.data?
	hLib dd ?
	TestFunctionAddr dd ?

.code
start:
	invoke LoadLibrary, addr LibName
	.if eax == NULL
            invoke MessageBox, NULL, addr DllNotFound, addr AppName, MB_OK
	.else
		mov hLib,eax
		invoke GetProcAddress, hLib, addr FunctionName
		.if eax == NULL
                invoke MessageBox, NULL, addr NotFound, addr AppName, MB_OK
		.else
                push offset Text1
                push offset Text2
                mov TestFunctionAddr, eax
                call [TestFunctionAddr]
                push ebx
                push offset Message
                push offset ResMessage 
                call wsprintf
                invoke MessageBox, NULL, addr ResMessage, addr ResTitle, MB_OK
            .endif
		invoke FreeLibrary,hLib
	.endif
	invoke ExitProcess,NULL
end start