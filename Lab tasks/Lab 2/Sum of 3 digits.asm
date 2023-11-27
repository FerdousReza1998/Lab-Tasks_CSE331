;addition operation on three single-digit decimal numbers  by the user. result will be between 0-9

    org 100H

    mov ah, 1 
    int 21h           ;1st input is taken through al into bl
    mov bl, al 
     
    ; mov ah, 2  
    ; mov dl, bl         ;when we want to print the user input
    ; int 21h
     
	mov ah,2
	mov dl,10
	int 21h          ;(by default)   (new line command)
	mov dl,13
	int 21h
    
    mov ah, 1  
    int 21h           ;2nd input is taken through al into bh
    mov bh, al 
    
	mov ah,2
	mov dl,10
	int 21h          ;(by default)   (new line command)
	mov dl,13
	int 21h


    mov ah,1
    int 21h
    mov cl,al       ;3rd input is taken through al into cl

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h


    add bl,bh    ;bl has the sum of 1st and 2nd input     bl=bh+bl   
    sub bl,48    ; convert to decimal 
	             ; if the value is being calculated from the program then sub 48 , here new bl =bh+bl 
   
   
    add bl,cl    ;bl has the sum of all 3 inputs , here bl=bl+cl   
    sub bl,48    ; convert to decimal   ;bl has the sum of  sum of all 3 inputs   
       
	   
	mov ah,2
	mov dl,10
	int 21h          ;(by default)   (new line command)
	mov dl,13
	int 21h

    mov ah, 2  
    mov dl, bl         ; bl which is now have the sum of 3 inputs  will be print through dl 
    int 21h    

    ret
    
   ;due to conversion in every steps,i did not have to convert the final summation/result  (its a good practice)
   ;dh,ch,cl,al can be use for the summation of more digits 
       
   ;but for al register you need to avoid (mov al,al) or it will get you error
   
   
   
   