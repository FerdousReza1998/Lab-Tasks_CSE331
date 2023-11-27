org 100h

; prompt the user for the number of digits in the array
mov ah, 9
lea dx, msg1
int 21h

; read the number of digits
mov ah, 1
int 21h
sub al, 48       ; convert the input character to a number
mov bl, al       ; store the number of digits in bl

mov si, 0

; display new lines
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
int 21h

; input loop to read the array from the user
array_input:
    mov ah, 1
    int 21h
    and al, 0fh ; convert from ascii value to real value
    mov arr[si], al
    inc si
    dec bl         ; decrement bl to count remaining digits
    jnz newline_array_input  ; jump to newline_array_input if bl is not zero
    jmp done_array_input

newline_array_input:
    ; display a newline
    mov ah, 2
		mov dl, ' '             ;code for space
		int 21h
		
    jmp array_input

done_array_input:
 
 mov dl, 10
mov ah, 2
int 21h
mov dl, 13
int 21h

; prompt the user for the number to search for
mov ah, 9
lea dx, msg2
int 21h

; read the number to search for
mov ah, 1
int 21h
and al, 0fh ; convert from ascii value to real value
mov dl, al  ; store the number to search for

; set up for searching a number in the array
mov cx, si      ; set cx to the number of elements in the array
mov si, 0
mov ah, 2

; search for the number in the array
search:
    cmp arr[si], dl ; compare the array element with the number
    je found       ; if equal, jump to the found label
    inc si
    loop search

mov dl, 10
mov ah, 2
int 21h
mov dl, 13
int 21h


not_found:
    ; display a message indicating that the number was not found
    mov ah, 9
    lea dx, msg4
    int 21h
    jmp exit
 
 

 
found: 

mov dl, 10
mov ah, 2
int 21h
mov dl, 13
int 21h


    ; display a message indicating that the number was found
    mov ah, 9
    lea dx, msg3
    int 21h

exit:
    ; display a space and exit
    mov dl, ' '
    mov ah, 2
    int 21h

ret

; data section
arr db 50 dup(?)

msg1 db "enter the array size: $"
msg2 db "enter the number to search for: $"
msg3 db "the number was found in the array.$"
msg4 db "the number was not found in the array.$"
