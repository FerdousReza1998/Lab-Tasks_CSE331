.model small
.stack 100h
.data    

mat db 1,2,3
    db 4,5,6
    db 7,8,9
.code 
;Procdure proc  
;    cmp ch, 2 ; if(row==0){sum = sum + arr[row][col] } 
;    jne jump 
;    add dl, [si]  
;    ret
;endp Procdure 

main proc
    mov ax, @data
    mov ds, ax  
    
    ; 00000 H  => 5 
    mov bx, 0
    mov ds, bx
    mov al, 0FH
    mov byte ptr ds:[bx], al    ; store memory
    
    ; fetch => memory
    mov cl, byte ptr ds:[bx]  
    
    
    ; 00001 H  => 2 
    mov bx, 1
    mov al, 2
    mov byte ptr ds:[bx], al ; store memory
    
    ; fetch => memory
    mov ch, byte ptr ds:[bx]  
    
    ; 00002 H  => 3 
    mov bx, 2
    sub cl, ch
    mov byte ptr ds:[bx], cl ; store memory 
    
    
    
    lea si, mat  
    
    ; matrix  
    ;mov ah, 1   ; al => input [5 => 48+5 = 53D [35H]
;    int 21h   
    
    sub al, 48  ; 5X5    
;    for(int row=0;row<al; row++)
;        for(int col=0;col<al; col++)
;        {
;        }


;
;
;    mov dl, 0 ; sum          
;    mov ch, 0  ; row
;    Row:  
;        mov cl, 0   ; col
;        Column: 
;            call Procdure
;            jump: 
;            inc si
;        
;        inc cl
;        cmp cl, al
;        jnz Column
;        
;    inc ch
;    cmp ch, al
;    jnz Row     

    ;mov dl, 0 ; sum          
;    mov ch, 0  ; row
;    Row:  
;        mov cl, 0   ; col
;        Column: 
;            cmp ch, 0 ; if(row==0){sum = sum + arr[row][col] } 
;            jne jump 
;            add dl, [si] 
;            jump: 
;            inc si
;        
;        inc cl
;        cmp cl, al
;        jnz Column
;        
;    inc ch
;    cmp ch, al
;    jnz Row 
    
    
    
endp main
end main  
