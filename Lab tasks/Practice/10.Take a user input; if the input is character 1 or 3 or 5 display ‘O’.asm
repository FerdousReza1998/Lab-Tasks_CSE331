
; Take a user input; if the input is character 1 or 3 or 5 display 'O'.
; If it is 2 or 4, display 'E'. If it is anything else, do nothing.

org 100h
  
    mov ah, 9
    lea dx, msg1
    int 21h  
  
; Read user input
mov ah, 1
int 21h

; Check input character
cmp al, '1'
je print_o

cmp al, '3'
je print_o

cmp al, '5'
je print_o

cmp al, '2'
je print_e

cmp al, '4'
je print_e

jmp end_program ; If input is not 1, 3, 5, 2, or 4, do nothing
 

 
print_o: 

mov dl, 10
mov ah, 2
int 21h
mov dl, 13
int 21h 

    mov dl, 'O'
    mov ah, 2
    int 21h
    jmp end_program



print_e: 

mov dl, 10
mov ah, 2
int 21h
mov dl, 13
int 21h 

    mov dl, 'E'
    mov ah, 2
    int 21h
    jmp end_program

end_program:
    mov ah, 4ch
    int 21h
ret 
 
 msg1 db "Enter value: $"