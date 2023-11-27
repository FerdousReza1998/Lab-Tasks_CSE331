;program to reverse the First three letters of a string  

org 100h

; Printing message -> Enter a string:
mov si, offset array ; Initialize si to point to the start of the 'array' buffer

; Taking inputs ->
mov ah, 9
mov dx, offset msg1 ; Load the address of 'msg1' into dx
int 21h ; Call DOS to display the message

input:

mov ah, 1
int 21h ; Read a character from the standard input
mov [si], al ; Store the character in the 'array'

; Checking for Enter press (ASCII 13) ->
cmp [si], 13
je print_first_three_reversed ; If Enter is pressed, jump to the 'print_first_three_reversed' section

; Incrementing si / index value
inc si

; String size tracking ->
inc s_size ; Increment the string size counter

loop input ; Continue the input loop

print_first_three_reversed:

; Printing message -> "First three characters (reversed): "
mov ah, 9
mov dx, offset msg2 ; Load the address of 'msg2' into dx
int 21h ; Call DOS to display the message

; Pointing to the first character ->
mov si, offset array ; Reset si to the start of the 'array'

; Setting counter value ->
mov cx, 3 ; We want to display the first three characters

print_chars_reversed:
mov ah, 2
mov dl, [si + 2] ; Load the character at [si + 2] (the last character) into dl
int 21h ; Call DOS to display the character

dec si ; Move to the previous character in the 'array'

loop print_chars_reversed ; Repeat the 'print_chars_reversed' loop for the remaining characters

ret ; Return from the program

msg1 db "Enter a string: $" ; Define the message for input
msg2 db 10, 13, "First three characters (reversed): $" ; Define the message for output
array db 50 dup('$') ; Define an array to store the input string

; Initially taking string size = 0
s_size db 0