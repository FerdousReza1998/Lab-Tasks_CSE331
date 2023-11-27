; using the Loop instruction to print all 26 alphabets each in a new line

org 100h

mov ah, 2 ; Set output function
mov cx, 26 ; Set loop counter to 26 (number of letters)
mov bl, 'A' ; Initialize character to 'A'

print_loop:
    mov dl, bl ; Move character to DL for printing
    int 21h ; Print character

  mov dl, 10
  mov ah, 2
  int 21h
  mov dl, 13
  int 21h

    int 21h ; Print newline

    inc bl ; Increment character to next letter
    loop print_loop ; Repeat loop until CX reaches 0

mov ah, 4ch ; Set termination function
int 21h ; Terminate program
