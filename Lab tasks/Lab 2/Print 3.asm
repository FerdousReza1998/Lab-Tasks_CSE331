	;not case sensitive  

	;this program prints 3

	org 100H         ;Set the origin of the program to address 100H  (by default) 

	mov bl,3        ; Move the value 3 into the BL register 
	   
	add bl,48       ;if the value is already declared  in the program ,  add 48   
					;Convert the value in BL to ASCII by adding 48 
					 
	mov ah,2		; (print command) means this program wants to print something , function code for output		
	mov dl,bl       ; print will be always through dl , Move the value in BL to the DL register to display   
	int 21h         ; to display the value (by default)

	ret             ; Return from the program (by default)       

																																																																											   
					;by default -- means its a constant rule that will be appiled everytime in a program 
					
					