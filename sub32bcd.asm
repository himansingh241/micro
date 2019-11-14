.MODEL SMALL
.STACK 100H
.DATA
    first dw 0008h, 0000h
    second dw 0009h, 0000h
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
    jnc l1
    mov dx, '-'
    mov ah, 02h
    int 21h
    mov si, 0
    comp:
        mov ax, 9999h
        mov bx, result[si]
        sub al, bl
        das
        sub ah, bh
        mov bl, al
        mov al, ah
        das
        mov bh, al
        mov result[si], bx
        inc si
        inc si
        loop comp  
    mov si, 0
    mov cx, 2
    stc
    a:
        mov ax, result[si]
        adc al, 0h
        daa
        xchg ah, al
        adc al, 0h
        daa
        xchg ah, al
        mov result[si], ax
        inc si
        inc si
        loop a
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

