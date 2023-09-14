;add three numbers from user input , using user-defined variables (with promt msg)

  org 100h
                       
  ;First msg
  mov ah,9    
  mov dx,offset msg1  
  int 21h
            
  mov ah,1
  int 21h    ;input a
  mov a,al   ; moving user input through ""al" register to "a" user-defined variable 
             
  mov ah,2
  mov dl,10
  int 21h       ;newline
  mov dl,13
  int 21h        
                    
  ;Second  msg
  mov ah,9   ; 
  mov dx,offset msg2  
  int 21h
  
  mov ah,1
  int 21h    ;input b
  mov b,al   ;moving user input through ""al" register to "b" user-defined variable
                 
  mov ah,2
  mov dl,10
  int 21h       ;newline
  mov dl,13
  int 21h   
                                    
  ;Third msg
  mov ah,9   ; 
  mov dx,offset msg3  
  int 21h
  
  mov ah,1
  int 21h    ;input c
  mov c,al
  
  mov ah,2
  mov dl,10
  int 21h       ;newline
  mov dl,13
  int 21h 
                
  mov bl,a      ;because we cannot do any kind of arithmatic operations with user-defined variables 
                ;thats why we shift to registers
  mov bh,b      
  mov cl,c       
  
  add bl,bh    ;add
  sub bl,48    ;if the value is being calculated from the program then sub 48, which is bl=bh+bl          
            
  add bl,cl    ;add
  sub bl,48    ;if the value is being calculated from the program then sub 48 , here new bl =cl+bl
            
  ;Fourth msg
  mov ah,9   ; 
  mov dx,offset msg4  
  int 21h
           
  mov ah,2     ;print sum
  mov dl,bl
  int 21h
          
  ret
                 
  msg1 db 'Enter First digit: $'         
  msg2 db 'Enter Second digit: $'
  msg3 db 'Enter Third digit: $'
  msg4 db 'Result= $'  
        
        
  ;user-defined varibles     
  a db ?
  b db ?      ;for user input use "?"
  c db ?
  
  
  
  