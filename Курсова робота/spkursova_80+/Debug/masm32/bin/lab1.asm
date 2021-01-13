.586
.model flat, stdcall
option casemap: none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\debug.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\debug.lib

.data
Arr dd 1, 2, 3, 4, 5

.code
start:
    mov ecx, 5
prnt:
    mov eax, [Arr+ecx*4-4]
    PrintDec eax, "Arr value" ;
    dec ecx
    cmp ecx, 0
    jnz prnt
    invoke ExitProcess, NULL
end start
    


