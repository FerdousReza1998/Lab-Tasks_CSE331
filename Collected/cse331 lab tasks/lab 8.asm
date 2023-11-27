.model small
.stack 100h
.data 
arr db 1,2,3,4,5 
len equ $-arr ; 6-1=5  
str db "hello$"
.code
proc main
    mov ax, @data
    mov ds, ax   
    
    ;mov ax, 0 
;    mov dx, 0
;     
;    mov bl, 5
;    mul bl ;  al*bl = 0*5=0 =>16 bit =>ax   
;    mul bx ;  ax*bx = 0*5=0 =>32 bit =>dxax  
;    
;    div bl ;  ax/bl =   0/5=0 =>8 bit => q=> al and r=>ah  
;    div bx ;  dxax/bx = 0/5=0 =>16 bit => q=> ax and r=>dx
;    
    
    ; conditional jump 
    ;cmp al, ah ;  al = 6 and ah = 5
;    je/jz    ; al == ah
;    jne   ;    al != ah
;    jg/jnle  ; al > ah  al!<=ah
;    jl/jnge  ; al < ah      
     
     
     
     
     
     
    ; loop + arr 
    
    ;for(int i=0;i<len;i++){
;        a = a + arr[i];
    ; }
      
      
      
    ;a=5
    ;for(int i=0;i<len;i++){
;        if(a==arr[i]){
;              dl=1;}
;           else 
;               dh, 2;
    ; } 
        
        
    ;lea si, arr ; 1st address of arr   => 1 2 3 4 5 
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
    
    
     lea si, str ; 1st address of arr   => hello$ 
    mov ch, 'o' ; a = 'o' 
    mov cl, 0 ; i=0
    loopStart:  
    
         cmp [si], '$'
         je stop 
         
         cmp ch, [si] ; a == arr[i];
         jne notEqual ; a != arr[i] => jump notEqual
         mov dl, 1
         mov dh, 0  
         hlt
         jmp jump
         
         notEqual: 
            mov dh, 2  
         jump:
         inc si 
 
    jmp loopStart ; unconditional
    stop: 
    
    
endp main
end main