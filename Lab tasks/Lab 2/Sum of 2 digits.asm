;addition operation on two single-digit decimal numbers inputs are given by the user. result will be between 0-9    

 
	org 100h     ;set the origin of the program to address 100h  (by default)

	;  input: read the first digit from the user 
	;  user input  always goes through al (by default)   

	mov ah,1   ; set the function code for input to read character
	int 21h    ; call to read a character                              (by default)  to read input from the user
	mov bl,al  ; move the input value (digit) to bl register
		 
		 
	;  output: print a new line 
	;  (new line command)  
	;  (by default)  

	mov ah,2
	mov dl,10
	int 21h          ;(by default)   (new line command)
	mov dl,13
	int 21h


	;  input: read the second digit from the user  
	;  user input  always goes through al (by default)  

	mov ah,1     ; set the function code for input to read character
	int 21h      ; call to read a character, to read input from the user
	mov bh,al    ; move the input value (digit) to bh register 


	; calculation: add the two digits and store the result in  bl 

	add bl,bh   ;add the contents of bh to bl, result stored in  bl=bh+bl
    sub bl,48   ;if the value is being calculated from the program then sub 48 , here new bl =bh+bl
				; convert the sum bl from ascii to decimal

	;  output: print a new line 
	;  (new line command)  
	;  (by default)  

	mov ah,2
	mov dl,10
	int 21h          ;(by default)   (new line command)
	mov dl,13
	int 21h
	 
	mov ah,2    ;(print command) , set the function code for output 	 
	mov dl,bl     ; move the sum to dl register     
	int 21h       ; to display the value (by default)

	ret           ; return from the program (by default) 


	;by default -- means its a constant rule that will be appiled everytime in a program
	
	
	
	