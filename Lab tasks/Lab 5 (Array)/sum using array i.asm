
	;take five integer numbers from user using an array. then find the sum of five integer numbers 

	org 100h


	;message1 : enter the size of the array :

	mov ah, 9
	mov dx, offset msg1
	int 21h


	;input array size 
	mov ah, 1
	int 21h
	sub al, 48  ; by default the size(value) will go to al -> [sub al,48] -> to adjust ascii for user input
	             ; if its being calculated/user-input we sub 48 for decimal convertion

	;initiating loop 

	mov cl, al  ; passing the al(value) to cl - counter register
	mov bl, al  ; copying to another register for future use
	mov si, 0   ; initializing the counter from 0 [index_value] 


	;new line 

	mov ah, 2
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h

	;message2 : enter the numbers :  

	mov ah, 9
	mov dx, offset msg2
	int 21h


	input:  

			;input numbers : 
			
			mov ah, 1
			int 21h
			sub al, 48          ; by default the array values will go to al -> [sub al,48] -> to adjust ascii for user input
			                    ; if its being calculated/user-input we sub 48 for decimal convertion
			
			mov array[si], al   ; moving the values one by one to array
			inc si              ; si value adjusting
		
			;printing space 
			
			mov ah, 2
			mov dl, ' '
			int 21h  
			
			
	loop input    

	;reinitilizing the array size in counter register :

	mov cl, bl  ; passing the bl register value (number of inputs) to counter register cl, which was saved in bl for future use
	mov si, 0   ; reinitilizing the si value from 0 [index_value]     
	mov bh, 0   ;so the bh register does not have any garbage value  (caution)



	;summation loop : 

	sum:  

			add bh, array[si]   ; passing the values one by one from array to bh register
			inc si              ; increamenting the si value [indexes]
			
	loop sum


	;new line  

	mov ah, 2
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h

	;massege3 : summation value :   

	mov ah, 9
	mov dx, offset msg3
	int 21h  


	;printing the sum : 

	mov ah, 2
	add bh, 48   ; as this is not a user given input now, so adjusting ascii by add bh, 48 its a declared value
	mov dl, bh   ; copying the values to dl register to show the result
	int 21h
	 
	 
	ret


	;array size and value input taking declaration :

	array db 5 dup(?)


	; messages for understanding :

	msg1  db "enter the size of the array : $" 

	msg2 db "enter the numbers           : $"

	msg3  db "summation value             : $"