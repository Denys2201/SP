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
	fmt db "%c",10,0
.code
start:
	push 'a'
	call CharUpperA
	push eax
    push offset fmt
	call crt_printf
    sub esp, 8
	push 0
	call ExitProcess
end start