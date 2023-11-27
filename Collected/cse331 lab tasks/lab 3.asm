.model small
.stack 100h

.data 

f db 41d
days dw 385d

.code

main proc 
     mov ax, @data
     mov ds, ax
     
     
     mov al, 2h
     mov ah, 6h
     
     add al, ah ; al = al + ah
     sub al, ah ; al = al - ah  
     
     mov ax, 1234h
     mov dx, 1234h
     
     mov bx, 0ffffh
     mul bl ; al*bl => ax[result] 
     mul bx ; ax*bx => dxax[result]  
     div bl ; ax/bl [q=al ;  r=ah]  
    div bx ; dxax/bx [q=ax ;  r=dx]
    
                    
                    
      
;     
     
     
endp main
end main