;addition of 4 declared numbers , using user-defined variables  (with promt msg)
    
    org 100h 
    
    ;First msg
    mov ah,9   ; 
    mov dx,offset msg1  
    int 21h
     
     
    mov ah,2
    mov dl,a    ;print of first digit  
	            ;here a is already declared thats why we can direct print it through dl
				;for declared user defined variables we need to add 48
    
    add dl,48   ;for printing the declared user defined variables we need to add 48 				
    int 21h   
     
     
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h       
    
       
    ;Second msg
    mov ah,9   ; 
    mov dx,offset msg2  
    int 21h
     
     
    mov ah,2
    mov dl,b    ;print of 2nd digit
    add dl,48   ;for printing the declared user defined variables we need to add 48 
    int 21h   
     
     
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h  
    
    
    ;Third msg
    mov ah,9   ; 
    mov dx,offset msg3  
    int 21h
      
      
    mov ah,2
    mov dl,c    ;print of third digit
    add dl,48   ;for printing the declared user defined variables we need to add 48 
    int 21h   
     
     
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h 
    
    
    ;Fourth msg
    mov ah,9   ; 
    mov dx,offset msg4  
    int 21h
    
                  
    mov ah,2
    mov dl,d    ;print of fourth digit
    add dl,48   ;for printing the declared user defined variables we need to add 48 
    int 21h   
     
     
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h
    
    
    ;all additions    
    
    mov bl,a
    mov bh,b  
    mov cl,c  
    mov al,d  
     
    add bl,bh     ;addition of 2 digits 
    add bl,cl     ;addition of 3 digits   
    add bl,al     ;addition of 4 digits
     
     
    ;Fifth msg
    mov ah,9   ; 
    mov dx,offset msg5  
    int 21h
     
    ;print sum
    mov ah,2     
    mov dl,bl     ;print of final result
    add dl,48  
    int 21h
                      
    ret
    
    ;user-defined varibles 
    a db 1
    b db 4    ;for declared variable 
    c db 2
    d db 2
      
     
    msg1 db 'Enter First digit   :  $'         
    msg2 db 'Enter Second digit  :  $' 
    msg3 db 'Enter Third digit   :  $' 
    msg4 db 'Enter Fourth digit  :  $'
    msg5 db 'Result             =  $'