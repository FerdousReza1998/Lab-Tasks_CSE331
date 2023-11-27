;reverse a string from user input

org 100h

; printing message -> enter a string: 

mov si, offset array  ; it means si[0] starts by default

; taking inputs -> 
mov ah, 9
mov dx, offset msg1 
int 21h

input:      

            mov ah, 1
            int 21h
            mov [si], al  ;each character initially -> al register -> array

            ;checking enter press ->
            cmp [si], 13

            je reverse 

			; increamenting si / index value
            inc si 

            ; string size tracking ->
            inc s_size 

loop input 

reverse:    

            ; pointing to the last character ->
            dec si            
           
            ; printing message 2 -> "reversed string: "  
            mov ah, 9 
            mov dx, offset msg2
            int 21h 
            
            
            ; setting counter value ->
            mov cl, s_size 
            
            
            jmp print_reversed_string 

     print_reversed_string: 

            mov ah, 2 
            mov dl, [si] 
            int 21h
            
            dec si
            
     loop print_reversed_string

ret  

msg1 db "enter a string: $"
msg2 db 10, 13, "reversed string: $"          ;;10 13 new line er shortcut 
array db 50 dup('$')
 

; initially taking string size = 0
s_size db 0