.model tiny
.data
    first dw 0002h, 0000h
    second dw 0009h, 0000h
    result dw 2 dup(?)
    temp dw 0     
    flag db 0
.code
.startup 
    mov cx, 2
    mov si, 0     
    mov ax, first[2] 
    mov bx, second[2]
    cmp bx, ax
    clc
    jb op
    cmp bx, ax
    je eq
    mov flag, 1
    jmp op
    eq:   
        mov ax, first[0]
        mov bx, second[0]
        cmp bx, ax
        jbe op1
        mov flag, 1  
    op1:
        clc
    op:
        mov ax, first[si]
        sbb ax, second[si]
        mov result[si], ax
        inc si
        inc si
        loop op
    mov cx, 2  
    cmp flag, 0
    je print
    mov dx, '-'
    mov ah, 02h
    int 21h
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