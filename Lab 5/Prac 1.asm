
; print 5 declared variables using array  

	org 100h

	mov cx, 5;   cx is our count register. pass the number of values to cx , value = size of index

	mov si, 0;   the index value is represented by index registers, e.g. si, bi, di

	mov ah, 2 ; printing command: this should be outside the loop

	output: ;must use label for starting the loop

		mov dl, arr[si];
		add dl, 30h; adding 30 to solve ascii value problem   
		int 21h; 

		mov dl, ' ' 
		mov ah, 2    ;code for space (default)
		int 21h

		inc si; increasing si to iterate through the array index

	loop output; using the label to call the loop

	ret

	arr db 1,2,3,4,5 ; array declaration: here 1,2,3,4 and 5 are assigned in the array arr

