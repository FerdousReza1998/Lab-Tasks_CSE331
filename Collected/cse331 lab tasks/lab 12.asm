.model small
.stack 100h 
.data 
p db 5
arr db 1,2,3 
str db "hello$"
.code          ; main =>  addTwo => subTwo  
subTwo1 macro
    mov al, 5
    mov ah, 3
    sub al, ah 
endm subTwo1 

subTwo2 macro a, b, c ; a=p; b=string; c=array
    mov al, a 
    lea si, c ; point array 1st index
    mov ah, [si+1] ; ah => 2
    
    lea si, b ; point string 1st index
    mov dl, [si+1] ; dl => e [65h]

endm subTwo2

main proc
    mov ax, @data
    mov ds, ax 
    
    subTwo2 p, str, arr  
    mov cl, 5  ; return address => stack (push) + jump
       
endp main 


subTwo proc
    mov al, 5
    mov ah, 3
    sub al, ah 
    ret  ;  return address => stack (pop=>IP) + jump
endp subTwo
  
addTwo proc
    pop ax 
    pop cx ; a
    pop bx  ; b
    push ax ; address
    add cx, bx 
    call subTwo
    mov ch, 5 
    ret  ;  return address => stack (pop=>IP) + jump
endp addTwo
  

end main 







