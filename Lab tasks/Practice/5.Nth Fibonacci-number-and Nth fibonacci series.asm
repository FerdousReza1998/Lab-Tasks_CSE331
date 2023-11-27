;program to calculate the Nth Fibonacci number and
; generate the Nth Fibonacci Series.

org 100h

; Display a prompt message to the user: "Enter the last number for the Fibonacci series: "
mov ah, 9
mov dx, offset msg1
int 21h

; Read a single character from the user as input.
mov ah, 1
int 21h

; Convert the ASCII character representing the user's input to an integer by subtracting 48 (the ASCII code for '0').
sub al, 48
mov cl, al

; Initialize registers bh and bl with 0 and 1, respectively, as the first two Fibonacci numbers.
mov bh, 0   ; First Fibonacci number
mov bl, 1   ; Second Fibonacci number

; Display a message to the user: "The Fibonacci series is: "
mov ah, 9
mov dx, offset msg2
int 21h

; Initialize a counter for the loop.
mov dl, 0

fibonacci:
    ; Print the current Fibonacci number (in register bh).
    mov ah, 2
    mov dl, bh
    add dl, 48
    int 21h

    ; Print a space to separate numbers.
    mov ah, 2
    mov dl, ' '
    int 21h

    ; Check if the current Fibonacci number (bh) is greater than or equal to the last number (cl).
    cmp bh, cl
    jae stop

    ; Update the Fibonacci numbers by swapping bh and bl and calculating the next Fibonacci number.
    mov al, bl
    add al, bh
    mov bh, bl
    mov bl, al

    ; Increment the counter.
    inc dl

    ; Continue the loop.
    jmp fibonacci

; Display the last number of the Fibonacci series.
mov ah, 2
mov dl, cl
int 21h

stop:
; End the program
mov ah, 0
int 16h

ret

msg1 db 10, 13, "Enter the last number for the Fibonacci series: $"
msg2 db 10, 13, "The Fibonacci series is: $"