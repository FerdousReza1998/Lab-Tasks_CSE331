	;take five integer numbers from user using an array.print all values in reverse order :

	org 100h    


	; message1 : enter the size of the array :

	mov ah, 9
	mov dx, offset msg1
	int 21h  


	; input array size 

	mov ah, 1
	int 21h
	sub al, 48     ; by deafult the size(value) will go to al -> [sub al,48] -> to adjust ascii for user input


	; initiatig loop

	mov cl, al      ; passing the al(value) to cl - counter register
	mov bl, al      ; copying to another register for future use
	mov si, 0       ; initializing the counter from 0 [index_value]

	; new line 

	mov ah, 2
	mov dl, 0dh
	int 21h
	mov dl, 0ah
	int 21h


	; message2 : enter the numbers :

	mov ah, 9
	mov dx, offset msg2
	int 21h

	input: 

			; input numbers :
		
			mov ah, 1
			int 21h
			sub al, 48          ; by default the array values will go to al -> [sub al,48] -> to adjust ascii for user input
			mov array[si], al   ; moving the values one by one to array
			inc si              ; si value adjusting
		
			; printing space 
			
			mov ah, 2
			mov dl, ' '
			int 21h
			
			
	loop input  


	; new line
	mov ah, 2
	mov dl, 0dh
	int 21h
	mov dl, 0ah
	int 21h 


	; reverse massege print
	mov ah, 9
	mov dx, offset msg3
	int 21h


	; reinitilizing the array size in counter register :

	mov cl, bl  ; passing the bl register value (number of inputs) to counter register cl, which was saved in bl for future use

; we can use mov si, 4  but here the index value is static we need it to be dynammic (user input)
;that's why we use bx =bh+bl which will have the index value
	
	mov bh, 0   ; to make bx register = 16 bit, as si cannot take any data from 8 bit register, now bl+bh = bx, whole 16 bit holding the size
	mov si, bx  ; bx = the no. of array size, here the last index value


	;reverse loop :

	reverse:

			dec si  
			
		
			; print every number 
			
			mov ah, 2
			mov dl, array[si]
			add dl, 48
			int 21h
		
			; print space 
			
			mov ah, 2
			mov dl, ' '
			int 21h  
		
		
	loop reverse


	ret

	 
	; array size and value input taking declaration :

	array db 10 dup(?) 


	; messages for understanding :

	msg1  db "enter the size of the array   : $"

	msg2 db "enter all numbers             : $"

	msg3  db "the array in reverse order is: $"