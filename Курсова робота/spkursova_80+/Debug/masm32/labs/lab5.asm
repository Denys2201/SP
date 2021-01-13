.386
.model flat, stdcall
option casemap: none

include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\user32.inc
include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\kernel32.inc
include C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\include\msvcrt.inc

includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\user32.lib
includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\kernel32.lib
includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\msvcrt.lib

.data
buflen dd 256
char db 'a',0
hello_title db 'Лабораторна робота №5', 0
user_name db 256 dup (0)

.code
start:
    push offset char
    call CharUpperA

    push 40h
    push offset hello_title
    push offset char
    push 0
    call MessageBoxA
    push 0
    call ExitProcess
end start