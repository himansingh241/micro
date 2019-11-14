.model tiny
.data
arr dw 1616h, 1010h, 1717h, 1515h, 1000h
size dw 5  
temp dw 0
temp2 dw 0
temp3 dw 0
.code
.startup
    mov cx, 5
    mov si, 0
    outer:
        mov ax, arr[si]
        mov di, si
        add di, 2
        cmp di, 10
        jge finish
        mov temp2, cx
        mov cx, size
        dec cx
        mov size, cx
        inner:
            mov ax, arr[si]
            mov bx, arr[di]
            cmp bx, ax
            jg nochange
            mov dx, ax
            mov arr[si], bx
            mov arr[di], dx
            nochange:
            inc di 
            inc di            
            loop inner
        mov cx, temp2 
        inc si  
        inc si
        loop outer
        finish:
            mov cx, 5
            mov si, 0
            print:  
                mov bx, arr[si]
                mov temp3, cx
                mov cx, 4
                print1:
                    rol bx, 4
                    mov dl, bl
                    and dl, 0fh
                    add dl, 30h
                    cmp dl, 39h
                    jbe print2
                    add dl, 7h
                    print2:
                        mov ah, 02h
                        int 21h
                        loop print1 
                mov dl, ' '
                mov ah, 02h
                int 21h
                mov cx, temp3
                add si, 2
                loop print
.exit
END                           
                
                
                     
                                                       