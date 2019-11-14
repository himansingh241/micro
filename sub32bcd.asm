.MODEL SMALL
.STACK 100H
.DATA
    first dw 00018h, 0000h
    second dw 0010h, 0000h
    result dw 2 dup(0)
    temp dw ?
    msg db "Result: $", 10   
.CODE
.STARTUP 
    mov cx, 2
    mov si, 0 
    op:
        mov ax, first[si]
        mov bx, second[si] 
        mov dx, ax   
        sbb al, bl
        cmp dl, bl 
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

