.model small 
.stack 100h
.data 
;        db => Define Byte  (8-bits)
;        dw => Define Word  (16-bits)


;    int a; 
     a db ? 
     
;    int b=5;
     b db 5h 
     
;    const k 5; 
     k equ 5h
     
;    int arr[3];
     arr db ?,?,? 
     len equ $-arr  ; 5-2 => 3 (array size)

;    int arr1[]={1,2,3}
     arr1 db 1h,2h,3h  
     
;    int arr2[100] 
     arr2 db 100 dup(?)
     
;    int arr3[]={1,2,1,2,1,2}
     arr3 db 3 dup(1h,2h)
        
;    char str[100];
     str db 100 dup('$')
      
;    string str1 = "hello\0" 
     str1 db "hello$"
    
.code
proc main
    
    mov ax, @data
    mov ds, ax 
             
;   Write ASM code here
 
    mov al, 0Ah       ;  Ah = 10d
    mov ah, 5d        ;  decimal number
    mov bl, 00001000b ;  00001000b = 8d
    mov bh, 7o        ;  octal number
    
    
endp main
end main