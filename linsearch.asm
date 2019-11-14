.model tiny
.data
    arr db 10h, 08h, 12h, 17h
    ele db 18h
    msg1 db 10, 13,"Found $"
    msg2 db 10, 13,"Not Found $"
.code
.startup
    mov si, 0
    mov cx, 4
    trav:
        mov al, arr[si]
        cmp al, ele
        je found
        inc si
        cmp si, 4
        jge notFound
        loop trav
        found:
        lea dx, msg1
        mov ah, 09h
        int 21h
        jmp e
        notFound:  
            lea dx, msg2
            mov ah, 09h
            int 21h   
        e:          
.exit
end




