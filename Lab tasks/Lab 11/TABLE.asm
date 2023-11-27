                            org 100h
   
   
   
   mov cl,4
   mov si, offset arr1
   
   
   ;2x1
   ;2x2
   ;2x3
   ;2x4
   
   
   mov count, 1
   
   tab2:
   
       mov ax, count
       mov bx, 2
       mul bx
             
       mov dx,ax
       add dx,48
       mov ah,2
       int 21h
       
       mov si, ax
       
       inc count
       
       loop tab2
       
   
   
   
   mov ah, 2
   mov dl, 10
   int 21h
   mov dl, 13
   int 21h
   
   
   mov cl,3    
   mov count, 1    
       
   tab3:
   
       mov ax, count
       mov bx, 3
       mul bx
             
       mov dx,ax
       add dx,48
       mov ah,2
       int 21h
       
       mov si, ax
       
       inc count
       
       loop tab3
       
       
   
   
   mov ah, 2
   mov dl, 10
   int 21h
   mov dl, 13
   int 21h
       
       
   mov cl,2    
   mov count, 1    
       
   tab4:
   
       mov ax, count
       mov bx, 4
       mul bx
             
       mov dx,ax
       add dx,48
       mov ah,2
       int 21h
       
       mov si, ax
       
       inc count
       
       loop tab4
 
 
     
   
  ;print
 
   
     

     
   
ret
;msg1 db 'Enter the number: $'

a dw 2
b dw 3
c dw 4

count dw 0

arr1 db 10 dup(0)
arr2 db 10 dup(0)
arr3 db 10 dup(0)