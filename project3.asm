INCLUDE Irvine32.inc

    .data
    Array BYTE 1,2,3,4,5,6,7,8,9,10,11,12
    .code
    main PROC
        mov esi, offset array
        mov ecx, 12
        mov eax, 1
        call dumpmem
        Mov ecx, (lengthof array - 1) / 2
        mov eax, 0
        mov ebx, 0
        mov edx, OFFSET Array                                 ; First number of array
        mov edi, OFFSET Array + SIZEOF Array - TYPE array     ; Last Number of array
        
    L1:
        
        mov al,[edx]              ;eax = value at start
        mov bl,[edi]              ;ebx = value at end
        mov [edi],al              ;Store value from start at end
        mov [edx],bl             ;Store value from end at start
        add edx, TYPE array
        sub edi, TYPE array
        LOOP L1

        mov esi, offset array
        mov ecx, 12
        mov eax, 1
        call dumpmem

        exit
    main ENDP
    END main