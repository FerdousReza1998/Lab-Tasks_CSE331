;Create two arrays of size 5. Load one of the arrays with random numbers of your choice. 
;The second array should be kept blank. Copy the contents of the first array into the second array in the same order
;You must not use loops to accomplish this task. [no need to print any array]

org 100h

; First array with random numbers
array1 db 5, 10, 15, 20, 25

; Second array initially blank
array2 db 0, 0, 0, 0, 0

; Copy the contents of the first array into the second array without loops
mov al, array1[0] ; Copy first element
mov array2[0], al

mov al, array1[1] ; Copy second element
mov array2[1], al

mov al, array1[2] ; Copy third element
mov array2[2], al

mov al, array1[3] ; Copy fourth element
mov array2[3], al

mov al, array1[4] ; Copy fifth element
mov array2[4], al

mov ah, 4ch ; Set termination function
int 21h ; Terminate program
