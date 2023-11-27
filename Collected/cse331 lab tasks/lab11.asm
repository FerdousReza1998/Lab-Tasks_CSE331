.model small
.stack 100h
.data 
str db "Hello$"   
len equ $-str
.code
proc main
    mov ax, @data
    mov ds, ax  
    
    mov al, 0  ; counter
    lea si, str  
    
    ; LOOP
    mov cx, len  ; i=n;i>0;i--
    loops: 
        cmp [si], '$'
        je next
        
        inc al 
        inc si 
        
        next:
    loop loops
    
    
    
endp main
end main