;Convert Uppercase string to lowercase

org 100h

; Printing message -> enter a string:
mov si, offset array ; Initialize string index

; Taking inputs
mov ah, 9
mov dx, offset msg1
int 21h

mov cx, 50 ; Set maximum input length

input:
  mov ah, 1
  int 21h
  mov [si], al ; Store character in array

  ; Checking enter press
  cmp [si], 13
  je terminate_string

  ; Incrementing si / index value
  inc si

  ; String size tracking
  inc s_size
loop input

terminate_string:
  mov al, 0 ; Set AL to 0 (null terminator)
  mov [si], al ; Add null terminator to end of string

convert_to_lowercase:
  ; Move si to the first character
  mov si, offset array

  ; Print message 2 -> "lowercase string: "
  mov ah, 9
  mov dx, offset msg2
  int 21h

lowercase_loop:
  ; Check for null terminator
  cmp [si], 0
  je end_lowercase_loop

  ; Check if character is uppercase
  cmp [si], 'A'
  jb print_character
  cmp [si], 'Z'
  ja print_character

  ; Convert uppercase to lowercase
  add [si], 32

print_character:
  ; Print current character
  mov ah, 2
  mov dl, [si]
  int 21h

  ; Move to next character
  inc si
  jmp lowercase_loop

end_lowercase_loop:
  ret

msg1 db "enter a string: $"
msg2 db 10, 13, "lowercase string: $" ; 10 13 new line shortcut
array db 50 dup('$')

; Initially taking string size = 0
s_size db 0
