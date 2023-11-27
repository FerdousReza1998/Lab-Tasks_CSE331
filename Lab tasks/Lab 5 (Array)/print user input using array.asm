
;take index size  from user input,  then variables from user input and print it 

	org 100h

	mov ah, 1
	int 21h  
    sub al,48  ; by default the size(value) will go to al -> [sub al,48] -> to adjust ascii for user input  
	           ; if its being calculated/user-input we sub 48 for decimal convertion

	mov cl, al   ; passing the al(value) to cl - counter register
	mov bl, al   ; copying to another register for future use 
	mov si, 0    ; initializing the counter from 0 [index_value] 
 
    ;here array is taking inputs
	;must use label for starting a loop
	input: 
	
		mov ah, 1 ; for input
		int 21h
		mov arr[si], al   ; value of al register passes to arr[0] 
		inc si
		
	loop input

   
    
	mov cl, bl   ; here every time you use a loop we need to reinitialize counter register , cl = counter register 
	              ;thats why we use bl to pass the value into cl for future
				 
	mov si, 0   ;si is again initialized with 0 , so that we can print the inputs or it start from the last si value
	            ;the index value is represented by index registers, e.g. si, bi, di
				
	    mov ah, 2 ; printing command: this should be outside the loop

;default code to print a new line

	mov ah, 2
	mov dl, 10
	int 21h   
	mov dl, 13
	int 21h 

	
	;printing the inputs
	;must use label for starting a loop
	output:                               

		mov dl, arr[si];   
		int 21h; 

		mov ah, 2
		mov dl, ' '             ;code for space
		int 21h

		inc si; increasing si to iterate through the array index

	loop output; using the label to call the loop

	ret  

	arr db 50 dup(?) ; declaring an array with size 50. 


