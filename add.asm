segment .text
global addFunction

addFunction:
push ebp
mov ebp,esp
sub esp,16


mov ecx, [ebp+8]        ; ecx = par1 (matrix1)
mov [ebp-8], ecx        ; stack var2 = matrix1

mov ecx, [ebp+12]       ; ecx = par2 (matrix2)
mov [ebp-12], ecx       ; stack var3 = matrix2

mov ecx, [ebp+16]       ; ebx = par3 (result)
mov [ebp-16], ecx       ; stack var4 = result;
mov edi, [ebp+20]       ; ebp - 8 (var2) = size 
            


loop:
xor eax, eax            ; clear eax every iteration for addition of 2 matrices
mov esi, [ebp-8]        ; esi = &arr[0] (var1)
add eax, [esi]          ; 0 + value of esi (arr[i])
add esi, 4              ; i++ (integer is 4 bytes)
mov [ebp-8], esi        ; store address of arr[i] in ebp-8 (var2)   

mov ecx, [ebp-12]       ; same process for second array to sum value with eax
add eax, [ecx]
add ecx, 4
mov [ebp-12],ecx 

mov esi, [ebp-16]       ; esi = &res[0]
mov [esi], eax          ; res[i] = eax (sum)
add esi, 4              ; i++
mov [ebp-16], esi       ; store arr new address in ebp-16

dec edi                 ; loop cond size-- > 0
jnz loop


mov esp,ebp
pop ebp
ret