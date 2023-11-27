 ;take 3 values from user input and multipies it
 
  org 100h
        
  mov ah,9
  mov dx,offset d
  int 21h
  
 ;first input
  mov ah,1
  int 21h
  
   ;conversion           
  sub al,48
  mov a,ax
                    
  mov ah,9
  mov dx,offset e
  int 21h
 
 ;Second input
  mov ah,1
  int 21h
  
  ;conversion
  sub al,48
  mov b,ax 
  
  mov ah,9
  mov dx,offset f
  int 21h
  
 ;Third input  
  mov ah,1
  int 21h
  
  ;conversion
  sub al,48
  mov c,ax
  
  mov ah,9
  mov dx,offset g
  int 21h
 
 ;multiplication
  mov ax,a
  mul b       ; #a=b*a
  mul c       ;##a=c*#a
 
 
  mov dx,ax
  add dx,48
  mov ah,2      ; print ##a
  int 21h
         
     
  ret    
 
  a dw ?
  b dw ?  
  c dw ?
  d db 'Enter first digit $'
  e db 10,13, 'Enter second digit $'
  f db 10,13, 'Enter third digit $'
  
  g db 10,13,'Result $'
