.model tiny
.data
    first dw 1234h, 5678h
    second dw 5678h, 1234h
    result dw 2 dup(?)
    msg1 db 10, 13, "Result: $" 
    temp dw 0
.code
.startup  
    lea dx, msg1
    mov ah, 09h
    int 21h                     
    mov si, 0
    mov cx, 2
    do:     
        mov ax, first[si]
        mov bx, second[si]
        adc al, bl
        daa
        mov bl, al
        mov al, ah
        adc al, bh
        daa
        mov bh, al
        mov result[si], bx
        inc si
        inc si
        loop do
    jnc normal
    mov dx, 31h
    mov ah, 02h
    int 21h
    normal:
        mov cx, 2
        mov si, 0
        print:
            mov temp, cx
            mov cx, 4
            mov bx, result[si]
            print1:
                rol bx, 4
                mov dl, bl
                and dl, 0fh
                add dl, 30h
                mov ah, 02h
                int 21h
                loop print1
            mov cx, temp
            inc si
            inc si
            loop print
.exit
end                     
    