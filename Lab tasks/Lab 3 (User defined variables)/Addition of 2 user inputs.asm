;addition of two numbers using user-defined variables 
;one with declared variable , another from user input (no promt msg)
 
  org 100h
 
  mov ah,1
  int 21h       ; input b , from user
  mov b,al
 
 
  mov ah,2
  mov dl,10
  int 21h       ; newline
  mov dl,13
  int 21h
   
  mov bh,a
  mov bl,b      
  add bh,bl      ;addition 
                 ;because we cannot do any kind of arithmatic operations with user-defined variables  ;thats why we shift to registers   
				 ;but we can direcly print the user-defined variables  we don't need registers 

 ; for printing declared variables using user defined variables 
  mov ah,2
  mov dl,a      ;print a ,which is already declared with value 5 ,            
  add dl,48     ;for printing the declared user defined variables we need to add 48 	,  here a = 5          
  int 21h  
 
  
  mov ah, 2   
  mov dl, ' '  ; for printing spaces  (default command)
  int 21h
   
   
  ; for printing user input variables , using user defined variables 
  mov ah,2
  mov dl,b      ;print b here ,       
  int 21h  
 
  
  mov ah, 2 
  mov dl, ' '  ; for printing spaces
  int 21h
   
    
  mov ah,2      
  mov dl,bh     ;print sum
  int 21h
         
         
  ret      
  
  ;user-defined varibles
  a db 5        ;for declared variable 
  b db ?        ;for user input use "?"
  
  
  
  