.MODEL SMALL
.STACK 100H
.DATA
    first dw 00018h, 0000h
    second dw 0010h, 0000h
    result dw 2 dup(0)
    temp dw ?
    msg db "Result: $", 10   
    flag db 0
.CODE
.STARTUP 
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
        mov bx, second[si]    
        sbb al, bl 
        das 
        sbb ah, bh
        mov bl, al
        mov al, ah
        das
        mov bh, al
        mov result[si], bx  
        cont:
        inc si
        inc si   
        loop op    
    mov cx, 2  
    cmp flag, 0
    je l1
    mov dx, '-'
    mov ah, 02h
    int 21h
    l1:
        mov temp, cx
        dec si
        dec si
        mov bx, result[si]
        mov cx, 4
        l2:
            rol bx, 4
            mov dl, bl
            and dl, 0fh
            add dl, 30h
            mov ah, 02h
            int 21h
            loop l2
        mov cx, temp
        loop l1
.EXIT
END

