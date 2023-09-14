;addition operation on 8 single-digit decimal numbers  by the user. result will be between 0-9 with promt msg

    org 100H
    
    mov ah,9               ;code for printing string
    mov dx, offset msg1    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
    int 21h 
    
    mov ah, 1 
    int 21h           ;1st input is taken through al into bl
    mov bl, al 
     
    mov ah, 2  
    mov dl, 0dh
    int 21h           ; new line  command
    mov dl, 0ah      
    int 21h
     
    mov ah,9               ;code for printing string
    mov dx, offset msg2    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
    int 21h  
     
    mov ah, 1  
    int 21h           ;2nd input is taken through al into bh
    mov bh, al 
    
    mov ah, 2  
    mov dl, 0dh      
    int 21h           ; new line  command
    mov dl, 0ah
    int 21h


    add bl,bh    ;bl has the sum of 1st and 2nd input     bl=bh+bl   
    sub bl,48    ; convert to decimal 
	             ; if the value is being calculated from the program then sub 48 , here new bl =bh+bl   
	             
     
;if there is too much digits we can just use one register again and again  

     
      mov bh,0       ; reinitialize the register with 0
      add bh,48       ;convert to decimal , because it is declared  so we add 48 
      
      mov ah,9               ;code for printing string
      mov dx, offset msg3    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
      int 21h
       
      mov ah, 1  
      int 21h           ;3rd input 
      mov bh, al
      
      add bl,bh       ; convert to decimal                 
      sub bl,48       ; if the value is being calculated from the program then sub 48 
                              
      mov ah, 2  
      mov dl, 0dh      
      int 21h           ; new line  command
      mov dl, 0ah
      int 21h 
       
                              
      mov bh,0       ; reinitialize the register with 0
      add bh,48       ;convert to decimal , because it is declared  so we add 48 
       
      mov ah,9               ;code for printing string
      mov dx, offset msg4    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
      int 21h 
       
      mov ah, 1  
      int 21h           ; 4th input
      mov bh, al
      
      add bl,bh       ; convert to decimal                 
      sub bl,48       ; if the value is being calculated from the program then sub 48
       
      mov ah, 2  
      mov dl, 0dh      
      int 21h           ; new line  command
      mov dl, 0ah
      int 21h
       
      mov bh,0       ; reinitialize the register with 0
      add bh,48       ;convert to decimal , because it is declared  so we add 48 
       
      mov ah,9               ;code for printing string
      mov dx, offset msg5    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
      int 21h 
       
      mov ah, 1  
      int 21h           ;5th input
      mov bh, al
      
      add bl,bh       ; convert to decimal                 
      sub bl,48       ; if the value is being calculated from the program then sub 48
      
       
      mov ah, 2  
      mov dl, 0dh      
      int 21h           ; new line  command
      mov dl, 0ah
      int 21h
       
      mov bh,0       ; reinitialize the register with 0
      add bh,48       ;convert to decimal , because it is declared  so we add 48 
      
      mov ah,9               ;code for printing string
      mov dx, offset msg6    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
      int 21h
      
      mov ah, 1  
      int 21h           ;6th input
      mov bh, al
        
      add bl,bh       ; convert to decimal                 
      sub bl,48       ; if the value is being calculated from the program then sub 48
        
      mov ah, 2  
      mov dl, 0dh      
      int 21h           ; new line  command
      mov dl, 0ah
      int 21h
        
      mov bh,0       ; reinitialize the register with 0
      add bh,48       ;convert to decimal , because it is declared  so we add 48 
       
      mov ah,9               ;code for printing string
      mov dx, offset msg7    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
      int 21h 
       
      mov ah, 1  
      int 21h           ;7th input
      mov bh, al
      
      add bl,bh       ; convert to decimal                 
      sub bl,48       ; if the value is being calculated from the program then sub 48
          
      mov ah, 2  
      mov dl, 0dh      
      int 21h           ; new line  command
      mov dl, 0ah
      int 21h
          
      mov bh,0       ; reinitialize the register with 0
      add bh,48       ;convert to decimal , because it is declared  so we add 48 
       
      mov ah,9               ;code for printing string
      mov dx, offset msg8    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
      int 21h 
       
      mov ah, 1  
      int 21h           ;8th input
      mov bh, al
      
      add bl,bh       ; convert to decimal                 
      sub bl,48       ; if the value is being calculated from the program then sub 48                       
                              
        
	;now cl has been used up so can just reinitialize the register with 0 then it will ready to use again and again 
	  
    mov ah,2
    mov dl,0DH
    int 21h
    mov dl,0AH
    int 21h
     
    mov ah,9               ;code for printing string
    mov dx, offset msg9    ;msg1 will be print through offset to dx (dx deals with strings which is a 16 bit register) 
    int 21h 
     
    mov ah, 2  
    mov dl, bl         ; bl which is now have the sum of 3 inputs  will be print through dl 
    int 21h    

    ret   
    
      msg1 db 'Enter first digit $'              ;strings are passed through db to msg1  (default rule)
      msg2 db 'Enter second digit $'
      msg3 db 'Enter third digit $'  
      msg4 db 'Enter 4th digit  $'              
      msg5 db 'Enter 5th digit $'
      msg6 db 'Enter 6th digit $'
      msg7 db 'Enter 7th digit $'              
      msg8 db 'Enter 8th digit $'                 
      msg9 db 'Result= $'
    
   ;due to conversion in every steps,i did not have to convert the final summation/result  (its a good practice)
       
   ;but for al register you need to avoid (mov al,al) or it will get you error   
   
   ;
