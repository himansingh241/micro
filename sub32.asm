.model tiny
.data
    first dw 0001h, 1234h
    second dw 0002h, 1000h
    result dw 2 dup(?)
    temp dw 0     
.code
.startup 
    mov cx, 2
    mov si, 0     
    op:
        mov ax, first[si]
        sbb ax, second[si]
        mov result[si], ax
        inc si
        inc si
        loop op
    mov cx, 2  
    print: 
        dec si
        dec si
        mov temp, cx
        mov bx, result[si]  
        mov cx, 4
        print1:
            rol bx, 4
            mov dl, bl
            and dl, 0fh
            add dl, 30h 
            cmp dl, 39h
            jbe normal
            add dl, 7h
            normal:
            mov ah, 02h
            int 21h
            loop print1
        mov cx, temp
        loop print        