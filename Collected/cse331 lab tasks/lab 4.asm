.model small
.stack 100h
.data
.code
main proc   
;                    ax->1221
;                    palindrom  (loop) 
;                                al, 1
;                                otherwise
;                                al, 0
;                    
;                    char -> hex (0-9)
;                                (A-F)
;                                (a-f)
;                                al, 1
;                                otherwise
;                                al, 0
                    
                    
     
     mov ax, @data
     mov ds, ax
;    inc bl; bl+1
;    dec bl ; bl-1
     
    mov bl, 0 ; counter 
      
;      for(i=0;i<7;i++) ; i=cl=0 
;      for(i=7;i>=0;i--) 
    mov cl, 5
    start:
        
        inc bl
        dec cl
        cmp cl, 0
    jnz start
    
    
     mov al, 5
     cmp al, 0
     je zero
     jg pos
     jl negg 
     
     zero:
         mov al, 0
         hlt
     pos:
         mov al, 1
         hlt
     negg:
         mov al, 2
         hlt
     
     ;level:
;     
;     mov al, 0A8h ;  1010 1000
;     mov ah, 0A8h ;  1010 1000
;     ;sub al, ah  ;   al=al-ah   
;     cmp al, ah ;    al-ah
;     
;     cmp al, ah  ; al-ah
;     je/jz  ; al == ah
;     jg/jnle  ; al > ah
;     jl/jnge  ; al < ah
     
;     jng
;     jnl
;     jnz
    
 
;     jz  ; zf=1
;     js  ; sf=1
;     jp  ; pf=1
;     jo  ; of=1
     
     
     
     
endp main
end main