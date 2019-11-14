.model tiny
.data   
    first dw 0ffffh, 0ffffh
    second dw 0ffffh, 0ffffh
    result dw 4 dup(0)
    msg db "Result: $"
    temp dw 0

.code
.startup
    lea dx, msg
    mov ah, 09h
    int 21h
    
    mov si, 0h
    mov ax, first[si]
    mul second[si]   
    
    mov result[0h], ax
    mov result[2h], dx
    
    mov ax, first[2h]
    mul second[0h]
    add result[2h], ax
    adc result[4h], dx
    adc result[6h], 0
    
    mov ax, first[0h]
    mul second[2h]
    add result[2h], ax
    adc result[4h], dx
    adc result[6h], 0
    
    mov ax, first[2h]
    mul second[2h]
    add result[4h], ax
    adc result[6h], dx
    
    mov si, 6h
    mov cx, 4h
    mov dx, 0h
    print: 
        mov bx, result[si]
        mov temp, cx
        mov cx, 4
            print1:
            rol bx, 4
            mov dl, bl
            and dl, 0fh
            add dl, 30h
            cmp dl, 39h
            jbe print11
            add dl, 7h
            print11:
                mov ah, 02h
                int 21h
                loop print1
            sub si, 2
            mov cx, temp
            loop print    
         
.exit
END




