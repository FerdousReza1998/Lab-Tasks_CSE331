;add three numbers from user input (with promt msg)

  org 100h
 
   mov ah,9               ;code for printing string
   mov dx, offset msg1    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
   int 21h  
 
   mov ah,1
   int 21h    
   mov bl,al      ;here al used a vessel to pass value into bl
   
   
   mov ah,2
   mov dl,0DH
   int 21h
   mov dl,0AH
   int 21h
   
   
   mov ah,9
   mov dx, offset msg2
   int 21h
	
   mov ah,1
   int 21h
   mov bh,al       ;here al used a vessel to pass value into bh
    
   
   mov ah,2
   mov dl,0DH
   int 21h
   mov dl,0AH
   int 21h
   
   mov ah,9
   mov dx, offset msg3
   int 21h
   
   mov ah,1
   int 21h
   mov cl,al        ;here al used a vessel to pass value into cl
   
   mov ah,2
   mov dl,0DH
   int 21h
   mov dl,0AH
   int 21h
   
   add bl,bh
   sub bl,48    ; convert to decimal 
                ; if the value is being calculated from the program then sub 48 , here new bl =bh+bl
   
   add bl,cl
   sub bl,48    ; convert to decimal
                ; if the value is being calculated from the program then sub 48 , here new bl =bl+cl 
   
   mov ah,2
   mov dl,0DH
   int 21h
   mov dl,0AH
   int 21h
 
 
   mov ah,9
   mov dx, offset msg4
   int 21h
   
   mov ah,2
   mov dl,bl    ;Move the value in bl to the dl register to display  (default)
                           							
   int 21h
           

 
  ret  
 
  msg1 db 'Enter first digit $'              ;strings are passed through db to msg1  (default rule)
  msg2 db 'Enter second digit $'
  msg3 db 'Enter third digit $'                  
  msg4 db 'Result= $'
  
  ;because you converted in every step you don't need to convert the final result (line 70)
  
  
  
  