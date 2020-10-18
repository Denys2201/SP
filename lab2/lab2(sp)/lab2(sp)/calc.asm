.386 
.model flat, c 
option casemap:none 
PUBLIC calc 
.data 
_T1 dword 0 
_T2 dword 0
_T3 dword 0 
_T4 dword 0
_T5 dword 0
_K EQU 18932020h 
.code
calc PROC 
push ebp 
mov ebp,esp

;T1 = D2*2
mov eax, dword ptr[ebp+12]
mov ecx,4
imul ecx 
mov _T1,eax

;T2 = B2/4 
mov eax, dword ptr [ebp+8]
mov ecx, 4
idiv ecx
mov _T2,eax

;T3 = K+T2
mov eax,_K
add eax,_T2
mov _T3,eax

;T4 = T3-T1
mov eax,_T3
sub eax,_T1
mov _T4,eax

;T5 = T4-E1
mov eax,_T4
sub ax, word ptr[ebp+16]
mov _T5,eax

pop ebp
ret
calc ENDp
END