; Read a character from user and check if it is a valid hexadecimal digit or not. 
; Hint: a char is a valid hexadecimal digit if it is one of these characters: 
; '0', '1', ... , '9', 'a', 'b', ... , 'f', 'A','B',...,'F' 

; store 2 in AL register if it's a valid hexadecimal digit
; otherwise strore 2 in AH register.

.model small 
.stack 100h
.data 
d db 'd'
.code
proc main         
    
    mov ax, @data
    mov ds, ax  
    
    mov al, d
    cmp al, 48
    jge above_48
    jl stop 
    
    above_48:
        cmp al, 57
        jle validHexDigit
        cmp al, 65
        jge above_65
        jl stop 
    above_65:
        cmp al, 70
        jle validHexDigit
        jg above_70
    above_70:
        cmp al, 97
        jge above_97
        jl stop
    above_97:
        cmp al, 102
        jle validHexDigit
        jg stop
        
    validHexDigit:
        mov al, 2
        hlt
    stop: 
        mov ah, 2
        hlt
    
endp main
end main