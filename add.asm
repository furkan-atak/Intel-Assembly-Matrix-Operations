segment .text
global addFunction

addFunction:
push ebp
mov ebp,esp
sub esp,20

mov dword [ebp-4], 0    ; stack var1 = counter

mov ecx, [ebp+8]        ; ecx = par1 (matrix1)
mov [ebp-8], ecx        ; stack var2 = matrix1

mov ecx, [ebp+12]       ; ecx = par2 (matrix2)
mov [ebp-12], ecx       ; stack var3 = matrix2

mov ecx, [ebp+16]       ; ebx = par3 (result)
mov [ebp-16], ecx       ; stack var4 = result;
mov edi, [ebp+20]       ; ebp - 8 (var2) = size 
            


loop:
xor eax, eax    
mov esi, [ebp-8]        ; esi = &arr[0]
add eax, [esi]
add esi, 4
mov [ebp-8], esi

mov ecx, [ebp-12]       ; ecx = &arr2[0]
add eax, [ecx]
add ecx, 4
mov [ebp-12],ecx 

mov esi, [ebp-16]       ; ebx = &res[0]
mov [esi], eax
add esi, 4
mov [ebp-16], esi

dec edi
jnz loop


mov esp,ebp
pop ebp
ret