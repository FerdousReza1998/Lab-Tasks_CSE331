; Write an ASM Program to Check Whether a Number is Palindrome or Not.
; store 2 in AL register if it's a palindrome number
; otherwise strore 2 in AH register.  

.model small 
.stack 100h
.data
n dw 1221  ; 1221d = 04C5h
.code
proc main         
    
    mov ax, @data
    mov ds, ax 
    
;    reverse=0;
;    n=1221;
;    num=n;
;    while(n!=0)
;    {
;        digit = n % 10;
;        reverse = reverse X 10 + digit;
;        n = n / 10;
;    } 
;    if(num==reverse)
;        palindrome number ;
;    else 
;        not palindrome number;
     
    mov cx, 0 ; reverse=0;
    mov ax, n  ; n=1221;
    push ax ; store a copy 
    
    startLoop:
    
        mov bh, 10
        div bh ; ax/bh ; q->al and r->ah
        mov bl, ah ; bl [d=n%10]  ; last digit
        mov ah, 0
        push ax ; push remaining digits  
        mov ax, cx
        mul bh ; al X bh -> ax (result) [reverse X 10]
        mov bh, 0
        add ax, bx ; [reverse = reverse X 10 + d]
        mov cx, ax
        pop ax    ; pop remaining digits
    
    cmp ax, 0   ; while(n!=0)
    jnz startLoop 
    
    cmp cx, n  ; if(num==reverse)
    jne Notpalindrome 
    mov al, 2
    hlt 
    
    Notpalindrome:
        mov ah, 2
        hlt
                   
endp main
end main