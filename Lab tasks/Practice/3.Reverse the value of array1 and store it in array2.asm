org 100h

; printing message -> enter a string: 
mov si, offset array  ; Input array
mov di, offset array2  ; Reversed array

; taking inputs -> 
mov ah, 9
mov dx, offset msg1 
int 21h

input:      
    mov ah, 1
    int 21h
    mov [si], al  ; Each character initially -> al register -> array1

    ; Checking enter press ->
    cmp [si], 13
    je reverse 

    ; Incrementing si / index value
    inc si 

    ; Incrementing s_size to track string size
    inc s_size 

    jmp input  ; Repeat the input loop

reverse:    
    ; Pointing to the last character in the input array
    dec si

    ; Printing message 2 -> "reversed string: "  
    mov ah, 9 
    mov dx, offset msg2
    int 21h 

    ; Setting counter value for the loop
    mov cl, s_size 

print_reversed_string: 
    mov al, [si]  ; Load a character from the input array1
    mov ah, 0     ; Clear AH
    mov [di], al  ; Store the character in the reversed array->array2
    inc di        ; Move to the next character in the reversed array,array2
    dec si        ; Move to the previous character in the input array,array1
    loop print_reversed_string  ; Repeat until all characters are copied

    ; Printing the reversed string
    mov ah, 9
    mov dx, offset array2
    int 21h 

ret  

msg1 db "enter a string: $"
msg2 db 10, 13, "reversed string: $"  ; 10 13 new line er shortcut 
array db 50 dup('$') 
array2 db 50 dup('$')

; Initially taking string size = 0
s_size db 0