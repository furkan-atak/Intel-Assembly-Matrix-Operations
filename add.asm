segment .text
global addFunction

addFunction:
push ebp
mov ebp,esp
sub esp,20

mov dword [ebp-4], 0    ; stack var1 = counter
mov esi, [ebp-4]

mov ecx, [ebp+8]        ; ecx = par1 (matrix1)
mov [ebp-8], ecx        ; stack var2 = matrix1

mov ecx, [ebp+12]       ; ecx = par2 (matrix2)
mov [ebp-12], ecx       ; stack var3 = matrix2

mov ecx, [ebp+16]       ; ebx = par3 (result)
mov [ebp-16], ecx       ; stack var4 = result;
mov edi, [ebp+20]       ; ebp - 8 (var2) = size 
xor eax, eax                


loop:
mov ecx, [ebp-8]
mov ecx, [ecx+esi*4]
add ecx, esi
mov ebx, ecx
mov ecx, [ecx + eax*4]
mov esi, [esi + eax*4]
mov ebx, [ebx + eax*4]
inc eax
dec edi
jnz loop

mov esp,ebp
pop ebp
ret