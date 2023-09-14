org 100h
 
  jmp hello


inpt db 0ah,0dh,"Enter your first String:$"
inpt2 db 0ah,0dh,"Enter your second  String:$"
inpt3 db 0ah,0dh,"After concatenate :$"
msg db 60 dup('$')
msg2 db 60 dup('$')
msg3 db 200 dup('$')
space db " $";
s_size db 0
s_size2 db 0
 
hello:
 
 mov si,offset msg ; assigning array variable to source index registar
 jmp message  
 
message:
 mov ah, 9
   mov dx, offset inpt
   int 21h
    mov ah,2             ;This part will print a message to enter data
      mov dl,0Ah
      int 21h
      mov dl,13
      int 21h
   
   jmp input   ;jump to the input label
 
input:
   
  mov ah,1
  int 21h
  mov [si],al  ;taking input and assigning it to the SI registar,each character of string in different location sequentially.position start from 0
  cmp [si],13
  je hello2     ;jump to the start label when input is complete
  inc si
  inc s_size   ;it will count the size of string  
  Loop input  
 
 
 
  hello2:
 
 mov si,offset msg2 ; assigning array variable to source index registar
 jmp message2  
 
message2:
 mov ah, 9
   mov dx, offset inpt2
   int 21h
    mov ah,2             ;This part will print a message to enter data
      mov dl,0Ah
      int 21h
      mov dl,13
      int 21h
   
   jmp input2   ;jump to the input label
 
input2:
   
  mov ah,1
  int 21h
  mov [si],al  ;taking input and assigning it to the SI registar,each character of string in different location sequentially.position start from 0
  cmp [si],13
  je data     ;jump to the start label when input is complete
  inc si
  inc s_size2   ;it will count the size of string
  Loop input2
     
     data:
     
   mov si,offset msg3
    lea di,msg
    mov ah,s_size
    jmp start
   
   start:
 
 
   mov al,[di]
   mov [si],al  
   cmp s_size,0
   je data2
   inc si        ;move first string to third string msg3
   inc di
   dec s_size
   loop start
   
 
 
    data2:
     
    lea di,msg2
    mov ah,s_size2
    mov al,space        
    mov [si],al
    inc si
    jmp start3
   
   
   start3:
 
 
   mov al,[di]
   mov [si],al  
   cmp s_size2,0           ;move second string to third string msg3
   je start2
   inc si
   inc di
   dec s_size2
   loop start3
   
   
    start2:
   
     mov ah,2            
      mov dl,0Ah
      int 21h
      mov dl,13
      int 21h
        mov ah, 9
   mov dx, offset inpt3
   int 21h  
   
   
    mov ah,2            ;print output
      mov dl,0Ah
      int 21h
      mov dl,13
      int 21h
        mov ah, 9
   mov dx, offset msg3
   int 21h  
   
   
   

   
   
   
 
  ret
