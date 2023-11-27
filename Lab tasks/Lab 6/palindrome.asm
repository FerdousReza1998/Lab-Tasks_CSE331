;check a string is palindrome or not 
 
    org 100h
    
    
    jmp hello
    
    msg1 db "this is palindrome!$"            ;assign messages to varibles
    msg2 db "this is not a palindrome!$"
    inpt db 10,13,"Enter your String:$"  
    msg db 60 dup('$')
    s_size db 0
     
    hello:
     
    mov si,offset msg ; assigning array variable to source index registar
    jmp message  
     
    message:
    mov ah, 9
    mov dx, offset inpt
    int 21h     
    
    mov ah,2             ;This part will print a message to enter data
    mov dl,10
    int 21h
    mov dl,13
    int 21h
       
    jmp input   ;jump to the input label
     
    input:
       
       mov ah,1
       int 21h
       mov [si],al  ;taking input and assigning it to the SI registar,each character of string in different location sequentially.position start from 0
       cmp [si],13
       je start     ;jump to the start label when input is complete
       inc si
       inc s_size   ;it will count the size of string
       Loop input
     
    
    start:
    
    
    lea di, msg  ;load input string to di registar
    dec si  ;source index registar point to the last character of string
    
    mov ch,0
    mov cl,s_size  
    cmp cl, 1     ;checking length of string is 1 or not
    je is_palindrome  ; single char is always palindrome!
    
    shr cl, 1     ; divide by 2! RIGHT SHIFT
    
    next_char:   
    
        mov al, [di]
        mov bl, [si]    ;checking all character one by one equal or not using loop .If not equal it will not be a palindrome
        cmp al, bl
        jne not_palindrome
        inc di
        dec si    
        
    loop next_char
    
    
    is_palindrome:  
       ;  the string is "palindrome!"  
     
       mov ah, 9
       mov dx, offset msg
       int 21h
         
       mov ah,2         ;this part print palindrom message
       mov dl,0Ah
       int 21h
       mov dl,13
       int 21h
       
       
       mov ah, 9
       mov dx, offset msg1
       int 21h
       jmp stop
                    
                 
    not_palindrome:
       ;  the string is "not palindrome!"  
       
       mov ah, 9
       mov dx, offset msg
       int 21h
         
       mov ah,2            ;this part pring not palindrome message
       mov dl,0Ah
       int 21h
       mov dl,13
       int 21h
         
       mov ah, 9
       mov dx, offset msg2
       int 21h
       
       
    stop:
    ; wait for any key press:
    
    
    ret