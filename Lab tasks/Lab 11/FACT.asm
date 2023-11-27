org 100h
       
  mov ah,9
  mov dx, offset msg1
  int 21h
       
       
   mov ah,1
   int 21h
   sub al,48
   
     
   
  
   mov cl,al
   mov al,1
 
 
     
   
   
   fac:
   mul cl
   loop fac
   
     
 
   
   mov dl,al
   add dl,48
   mov ah,2
   int 21h
   
     
   
ret
msg1 db 'Enter the number: $'