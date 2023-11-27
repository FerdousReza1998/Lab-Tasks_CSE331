 ;take 2 values from user input and multipies it   
 
  org 100h
        
  mov ah,9
  mov dx,offset c
  int 21h
  
 ;first input
  mov ah,1
  int 21h   
  
  ;conversion
  sub al,48
  mov a,ax
                    
  mov ah,9
  mov dx,offset d
  int 21h
  
 ;Second input
  mov ah,1
  int 21h
  
  ;conversion
  sub al,48
  mov b,ax
             
   
  mov ah,9
  mov dx,offset e
  int 21h
 
  ;multiplication
  mov ax,a
  mul b       ; ax=b*ax
 

  mov dx,ax
  add dx,48
  mov ah,2
  int 21h
   
  ret    
 
  a dw ?
  b dw ?
  c db 'Enter first digit $'
  d db 10,13, 'Enter second digit $'
  e db 10,13,'Result $'
