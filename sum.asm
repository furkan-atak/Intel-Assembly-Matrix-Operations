segment .text
global sumFunc

sumFunc:
push ebp
mov ebp,esp
sub esp,12

mov dword [ebp-4], 0    ; stack var1 = sum

mov ecx, [ebp+8]        ; ecx = par1 (matrix1)
mov [ebp-8], ecx        ; stack var2 = matrix1

mov ecx, [ebp+12]       ; ecx = par2 (size)


xor eax, eax            ; clear to return result;     


loop:
mov esi, [ebp-4]    ; esi = sum
mov edi, [ebp-8]    ; edi = &arr[0]
add esi, [edi]      ; esi += arr[0]
mov [ebp-4], esi    ; var1 = sum
add edi,4           ; iterate arr
mov [ebp-8], edi    ; var2 = arr[i++]
dec ecx             ; arr condition check size-- > 0
jnz loop


;mov esi, [ebp-4]    ; esi = sum
;mov edi, [ebp-8]    ; edi = &arr[0]
;add esi, [edi]      ; esi += arr[0]
;mov [ebp-4], esi    ; var1 = 
;mov edi, [edi + eax*4]
;inc eax
;mov ecx, [ebp-12]
;dec ecx
;mov [ebp-12],ecx  
;jnz loop

mov eax, esi
mov esp,ebp
pop ebp
ret