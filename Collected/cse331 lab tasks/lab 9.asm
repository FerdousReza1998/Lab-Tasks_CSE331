.model small
.stack 10h
.data 
arr db 1,2,3,4,5 
len equ $-arr ; 6-1=5  
str db "hello$"   
slen equ $-str 
 
str1 db "hello $"
str2 db "world$"
str3 db 100 dup('$')
.code
proc main
    mov ax, @data
    mov ds, ax 
    
   ; task 7 qsn 1 
   lea si, str1
   lea di, str3
   copyString1:
    cmp [si], '$' 
    je stop 
    mov al, [si]
    mov [di], al
    inc si
    inc di
   jmp  copyString1   
   stop: 
   
   lea si, str2
   copyString2:
    cmp [si], '$' 
    je stop1 
    mov al, [si]
    mov [di], al
    inc si
    inc di
   jmp  copyString2   
   stop1:  
   
   ; print  
   lea dx, str3
   mov ah, 9
   int 21h
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
   
   ;mov ax, 8000h
;   mov bx, 8100h
;   mov cx, 8200h 
;   push ax
;   push bx 
;   pop ax ; ax=8100h
;   push cx 
;      
    ;a=5
    ;for(int i=0;i<len;i++){
;        if(a==arr[i]){
;              dl=1;
;               dh=0;
;                break;}
;           else 
;               dh, 2;
    ; } 
        
        
;    lea si, arr ; 1st address of arr   => 1 2 3 4 5 
;    mov ch, 4 ; a = 4 
;    mov cl, 0 ; i=0
;    loopStart:  
;    
;         cmp ch, [si] ; a == arr[i];
;         jne notEqual ; a != arr[i] => jump notEqual
;         mov dl, 1
;         mov dh, 0  
;         hlt
;         jmp jump
;         
;         notEqual: 
;            mov dh, 2  
;         jump:
;         inc si 
;         
;    inc cl ; i++
;    cmp cl, len  ; i<len
;    jne loopStart ;  
;    
    
    ;for(int i=0;i<str.length();i++)
    ;lea si, str ; 1st address of arr   => hello$ 
;    mov ch, 'o' ; a = 'o' 
;    mov cl, 1 ; i=0
;    loopStart:  
;    
;         cmp ch, [si] ; a == str[i];
;         jne notEqual ; a != str[i] => jump notEqual
;         mov dl, 1
;         mov dh, 0  
;         hlt
;         jmp jump
;         
;         notEqual: 
;            mov dh, 2  
;         jump:
;         inc si 
;         
;    inc cl ; i++
;    cmp cl, slen  ; i<len
;    jne loopStart ;
    
    
    
    
    ; for(int i=0; str[i]!='$';i++)
    ;lea si, str ; 1st address of arr   => hello$ 
;    mov ch, 'o' ; a = 'o' 
;    
;    loopStart:  
;    
;         cmp [si], '$'  ; str[i]!='$'
;         je stop 
;         
;         cmp ch, [si] ; a == arr[i];
;         jne notEqual ; a != arr[i] => jump notEqual
;         mov dl, 1
;         mov dh, 0  
;         hlt
;         jmp jump
;         
;         notEqual: 
;            mov dh, 2  
;         jump:
;         inc si 
; 
;    jmp loopStart ; unconditional
;    stop: 
    
    
endp main
end main