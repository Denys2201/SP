.586
.model flat, stdcall
option casemap: none

include \masm32\include\windows.inc 
include \masm32\macros\macros.asm 

include \masm32\include\masm32.inc 
include \masm32\include\gdi32.inc 
include \masm32\include\user32.inc 
include \masm32\include\kernel32.inc 

includelib \masm32\lib\masm32.lib 
includelib \masm32\lib\gdi32.lib 
includelib \masm32\lib\user32.lib 
includelib \masm32\lib\kernel32.lib 

.data
A dd 14
B dd 12
S dd 7
AmulA dd 00
titleMsg db 'Практична робота №6', 0
formatMsg db 'Result = %d', 0
bufferMsg db 256 dup(0)
.code
Start:
    mov eax, A
    mul A
    mov AmulA, eax
    
    mov eax, AmulA
    add eax, B
    sub eax, S

    push eax
    push offset formatMsg
    push offset bufferMsg
    call wsprintfA

    push 40h
    push offset titleMsg
    push offset bufferMsg
    push 0
    call MessageBoxA

    push 0
    call ExitProcess
end Start







