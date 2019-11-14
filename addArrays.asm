.model tiny
.data
    arr db 10h, 20h, 30h
    brr db 40h, 50h, 60h
    result db 3 dup(?)
    size dw 3  
    temp dw 0
.code
.startup
    mov cx, size
    mov si, 0
    op:
        mov al, arr[si]
        add al, brr[si]
        mov result[si], al
        inc si
        loop op
        
    mov cx, size
    mov si, 0
    print:
        mov temp, cx
        mov cx, 2
        mov bl, result[si]
        print1:
            rol bl, 4
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
        mov dx, ' '
        mov ah, 02h
        int 21h    
        mov cx, temp
        inc si
        loop print
.exit
end            
                        


