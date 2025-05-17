 .model small
.stack 100h

.data
    candidate1 db 'nawaz$', 13, 10
    candidate2 db 'imran$', 13, 10
    candidate3 db 'jenral asim muneer$', 13, 10
    vote db 0
    prompt db 'Vote for your candidate: 1. nawaz, 2. imran, 3. jenral asim muneer $'
    newline db 13, 10, '$' ; Newline characters (CR LF)
    winner db 'The winner is: $'
    invalid db 'Invalid vote!$', 13, 10

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display the voting prompt
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Read the user's vote
    mov ah, 01h
    int 21h
    sub al, 30h ; Convert ASCII code to 0, 1, 2, or 3
    mov vote, al

    ; Determine the winner
    cmp vote, 1
    je winner_display_nawaz
    cmp vote, 2
    je winner_display_imran
    cmp vote, 3
    je winner_display_muneer

    ; Handle invalid vote
    lea dx, invalid
    mov ah, 09h
    int 21h
    jmp end_program

    ; Display the winner
winner_display_nawaz:
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, winner
    mov ah, 09h
    int 21h

    lea dx, candidate1
    mov ah, 09h
    int 21h
    jmp end_program

winner_display_imran:
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, winner
    mov ah, 09h
    int 21h

    lea dx, candidate2
    mov ah, 09h
    int 21h
    jmp end_program

winner_display_muneer:
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, winner
    mov ah, 09h
    int 21h

    lea dx, candidate3
    mov ah, 09h
    int 21h
    jmp end_program

end_program:
    mov ah, 4ch
    int 21h
main endp
end main
