	;take a input from user then print the Fiboncci series (without div and mult)
										   
	org 100h 

	; printing first message "enter the number you want the fib. of: "
	mov ah, 9
	mov dx, offset msg1
	int 21h 


	; taking the input of: the number you want the fib. of -
	mov ah, 1
	int 21h
	sub al, 48     ; converting ascii -> integer value    

	mov cl, al      ; keeping the value to cl register from user input


	; by default setting value '-1' to register 'bh'
	mov bh, 0ffh    ; initialize with -1                     

	; by default setting value '1' to register 'bl'
	mov bl, 1       ; initialize with  1 


	; printing the second message "the fibonacci series is: "
	mov ah, 9
	mov dx, offset msg2
	int 21h
	 

	; starting fibonacci:

	fibonacci:   

		
				cmp cl,0        ; checking if the input is '0'
				je stop         ; if the the value is 0, then there will be no fib. number. it will jump to 'stop' and end the program 
		   
		
				; if not '0', then check these conditions -> 
				   
				add bh, bl      ; example -> adding 'bl = 1' with 'bh = -1" -> value is = 0
				mov ch, bh      
				add ch, 48     ; ascii conversion to decimal , here 1 -1 are declared that why we add 48


				; printing the current fibonacci number:
				mov ah, 2
				mov dl, ch      
				int 21h
				
				; taking space ->
				mov ah,2
				mov dl, ' '
				int 21h

				; updating values to add  [previous + current]
				mov bh, bl
				mov bl, ch      
				sub bl, 48 
			   
				; decreamenting counter to : example: 5->4->3->2->1
				dec cl
				
				
				; it is the command to loop through, until the cl = 0          
				jnz fibonacci
				
				

	stop:  ; code for stopping
		
				mov ah, 0
				int 16h  
				
				
	ret



	msg1 db 10, 13, "enter the number you want the fib. of: $"
	msg2 db 10, 13, "the fibonacci series is: $"