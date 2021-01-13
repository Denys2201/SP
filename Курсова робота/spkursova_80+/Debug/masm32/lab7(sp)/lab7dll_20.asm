.386
.model flat, stdcall
;includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\user32.lib
;includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\kernel32.lib
;includelib C:\sp2019_soft__12345-master\portable_masm32\masm32p\masm32\lib\masm32.lib

.code

DllEntry PROC hInstDLL:DWORD, reason:DWORD, reserved:DWORD
    mov eax, 1
	ret
DllEntry ENDP

Process PROC First:DWORD, Second:DWORD
	push eax
	;push ebx
	push ecx
	push edx
	push edi
	push esi
	
    xor ebx, ebx
    xor edx, edx
	
	mov ebx, 0
	mov edi, First
	mov esi, Second
s_loop:	
	mov ah, byte ptr [edi]
	mov al, byte ptr [esi]
	cmp ah, 0
	je exit
	cmp ah, al
	jne next
	inc ebx
next:	
	inc edi
	inc esi
	jmp s_loop
exit:
	pop esi
	pop edi
	pop edx
	pop ecx
	;pop ebx
	pop eax
	ret
Process ENDP


End DllEntry