.model tiny
.data
msg1 db 10, "Enter 8 bit binary number $"
msg2 db 10, "Ascii: $"

.code
.startup

    lea dx, msg1
    mov ah, 09h
    int 21h
    
    mov cx, 8
    input: 
        shl bl, 1
        mov ah, 01h
        int 21h
        sub al, 30h
        add bl, al
        loop input
        
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    mov dl, bl
    mov ah, 02h
    int 21h
