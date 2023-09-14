
;take index size  from user input,  then variables from user input and print it 

	org 100h

	mov ah, 1
	int 21h; taking input for the number of index from the user

	and al, 0fh; does the same shit as add al, 48;     

	mov cl, al
	mov bl, al  ; keeping the value stored in some other place as well, 
	mov si, 0  ; i = 0;
 
    ;here array is taking inputs
	;must use label for starting a loop
	input: 
	
		mov ah, 1 ; for input
		int 21h
		mov arr[si], al   ; value of al register passes to arr[0] 
		inc si
		
	loop input


	mov cx, bx   ;cx is our count register. pass the number of values to cx 
                 ;[using bx to pass the value as cx is a 16 bit reg,
				 ;so the reg passing value to it should also be 16 bit]
				 
	mov si, 0   ;si is again initialized with 0 , so that we can print the inputs or it start from the last si value
	            ;the index value is represented by index registers, e.g. si, bi, di
				
	mov ah, 2 ; printing command: this should be outside the loop

;default code to print a new line

	mov ah, 2
	mov dl, 0dh
	int 21h   
	mov dl, 0ah
	int 21h 

	
	;printing the inputs
	;must use label for starting a loop
	output:                               

		mov dl, arr[si];   
		int 21h; 

		mov dl, ' ' 
		mov ah, 2;      code for space
		int 21h

		inc si; increasing si to iterate through the array index

	loop output; using the label to call the loop

	ret  

	arr db 50 dup(?) ; declaring an array with size 50. 


