.model small
.stack 100h
.data    

mat db 1,2,3
    db 4,5,6
    db 7,8,9
    db 2,6,8 
    
trans db 4 dup(?)  
      db 4 dup(?)
      db 4 dup(?)
    
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    ; 00000H 
    mov ax, 5
    mov bx, 0000h
    mov ds, bx
    mov word ptr ds:[bx] , ax
    
    ; 00002H 
    mov ax, 3
    mov bx, 0002h
    mov word ptr ds:[bx]  , ax    
    
    
    mov bx, 0000H    ; 00000H
    mov ax,  word ptr ds:[bx] ; 5
    
    mov bx, 0002H    ; 00002H  3
    mov bx,  word ptr ds:[bx]
    
    mul bx ; result dxax
    

        
    
;    
;    
;    lea si, mat   ; 4X3
;    lea di, trans ; 3x4
;                     
;    mov dx, 01h             
;    mov cx, 03H 
;    Row:  
;        mov bl, 04h 
;        Column: 
;            mov al, [si]
;            mov [di], al 
;            inc di
;            add si, 3
;        
;            dec bl
;        cmp bl, 0h
;        jnz Column  
;        
;        lea si, mat
;        add si, dx
;        inc dx
;    loop Row 
    
    
    
endp main
end main  
