;Write a program that will count the number of characters in a string.

org 100h

; Prompt user to enter a string
mov dx, offset msg ; Load address of prompt message into DX
mov ah, 9
int 21h

mov bl, 0 ; Initialize character count
mov si, offset var1 ; Initialize string index

l1:
    mov ah, 1 ; Read character input
    int 21h

    cmp al, 13 ; Check for carriage return (Enter key)
    je printString

    mov [si], al ; Store character in string
    inc si ; Increment string index
    inc bl ; Increment character count

    jmp l1

printString: 

     mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h  
     
    mov ah, 9
    lea dx, msg1
    int 21h

     
    mov dl, bl ; Move character count to DL for printing
    mov ah, 2
    add dl, 48 ; Convert count to ASCII
    int 21h ; Print character count

mov ah, 4ch ; Terminate program
int 21h

; Embed string data in code segment
msg db 'Enter string: $'  
msg1 db "Number of characters in the strings are: $"
var1 db 100 dup("$") ; String buffer
