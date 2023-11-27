; enter 10 values and find the minimum and maximum value


    org 100h

   
    arr db 10 dup('$')  ;array to store 10 input value
   
    mov si,offset arr   ; assign array variable to source index registar  same as  mov arr[si], al  
			                                                                              

    mov cx,10           ; loop counter is 10 for 10 values
   
    input:
   
	   mov ah,1
	   int 21h     ;this part will take input values and store in memory locations of si registar
	   mov [si],al
	   inc si
	   
    loop input
   
 
    mov ah,2
    mov dl,10
    int 21h      ;print new line
    mov dl,13
    int 21h
   
    mov si,offset arr
    mov cx,10         ;reset si
   
    mov ah,9
    mov dx,offset msg2     ;printing a message
    int 21h    
   

    output:   
    
        mov ah,2
        mov dl,[si]       ;printing all values
        int 21h 
                 
        inc si
           
            mov ah, 2
			mov dl, ' '
			int 21h   
           
   loop output;
 
  
 ;small
    mov ah,2
    mov dl,10
    int 21h       ;newline
    mov dl,13
    int 21h
     
    mov si,offset arr
    mov cx,10
    mov bl,[si] ;keep all value in bl
    mov bh,[si]  ;keep all valuein bh
 
 
   loopx:  

        cmp [si],bl  ;this part will check all value of si with values of bl  less not equal one by one. to calculate minimum  
                      ;bl will hold the minimum value  
        jle update
        
        cmp [si],bh
        jge update2 
                         ;this part will check all value of si with values of bh  less not equal one by one. to calculate maximum
        resume:        ;bh will hold the maximum value
           inc si   
        
   loop loopx

 
     mov ah,9
     mov dx,offset msg3
     int 21h 
  
     mov dl,bl               ;print a message    and printing value of bl minimum
     mov ah,2
     int 21h  
 
 
     mov ah,2
     mov dl,0Ah
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9
     mov dx,offset msg4
     int 21h
   
     mov dl,bh               ;print a message    and printing value of bh. maximum
     mov ah,2
     int 21h
   
     jmp finish

     update:
     mov bl,[si]
     jmp resume
        
     update2:
     mov bh,[si]
     jmp resume  
         
     finish:  
  
     ret
        
 
   msg2 db 'Input values in array are: $'
   msg3 db 'Minimum Number is: $'          ;assign messages to variables
   msg4 db 'Maximum Number is: $'
