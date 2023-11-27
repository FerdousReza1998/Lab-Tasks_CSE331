;addition of 4 digits from user , using user-defined variables (with promt msg)

    org 100h
                                                            
    ;First msg
    mov ah,9    
    mov dx,offset msg1  
    int 21h   
                
    mov ah,1
    int 21h    ; 1st input 
    mov a,al   ; moving user input through ""al" register to "a" user-defined variable
         
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h      
                       
    ;Second  msg
    mov ah,9    
    mov dx,offset msg2  
    int 21h
      
    mov ah,1
    int 21h    ; 2nd input 
    mov b,al 
            
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
    int 21h    ; 3rd input 
    mov c,al
      
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h 
                 
    ;Fourth msg
    mov ah,9   ; 
    mov dx,offset msg4  
    int 21h
      
    mov ah,1
    int 21h    ; 4th input 
    mov d,al
      
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h  
         
    ;summations
    mov bl,a        
                   ;here we need to add 'a' and 'b user defined variables 
				   ;because of we cannot do any kind of arithmatic operations with user-defined variables we need register			   
    mov bh,b         
    mov cl,c 
    mov ch,d 	
                                       
    add bl,bh     ;add1 
    sub bl,48     ;if the value is being calculated from the program then sub 48, which is bl=bh+bl
    
    add bl,cl     ;add2
    sub bl,48 
     
    add bl,ch     ;add3
    sub bl,48
             
       
    ;Fifth msg
    mov ah,9   ; 
    mov dx,offset msg5  
    int 21h
              
                                  
    ;for printing all summations :   
    mov ah,2     
    mov dl,bl
    int 21h
                       
    ret
                            
    msg1 db 'Enter First digit: $'         
    msg2 db 'Enter Second digit: $'
    msg3 db 'Enter Third digit: $' 
    msg4 db 'Enter Fourth digit: $'
    msg5 db 'Result            =  $'  
 
            
    ;user-defined varibles               
    a db ?
    b db ?      ;for user input use "?"
    c db ? 
    d db ?    
    
    
    ;dh,ch,cl,al can be use for the summation of more digits   
    ;but for al register you need to avoid (mov al,al) or it will get you error