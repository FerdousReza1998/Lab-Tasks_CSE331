.model small
.stack 100h
.data 
str db 100 dup('$')
.code
proc main
    mov ax, @data
    mov ds, ax 
    
    mov dl, 0 ;counter
    lea si, str 
    stringInput: 
        mov ah, 1
        int 21h
        cmp al, '$'  ; abc$
        je stop 
        cmp al, 13  ; enter
        je stop
        cmp al, 65
        jl notChar
        cmp al, 90
        jg checkSmallChar
        inc dl
        jmp notChar        
        checkSmallChar: 
        cmp al, 97
        jl notChar
        cmp al, 122
        jg notChar
        inc dl       
        notChar:
            
    inc si
    jmp stringInput 
    stop:
    
    
endp main 
end main

