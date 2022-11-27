.global func

func:
    movq $0,%r11
    movq $2,%r8
    jmp .check
    .loop:
        call checkprime
        cmpq $1,%r10
        je .inc

    .retfrominc:
        incq %r8

    .check:
        cmpq %r8,%rdi
        jg .loop
    
    movq %r11,%rax
    cqto
    idivq %rsi
    movq %rdx,%rax
    ret


.inc:
    addq %r8,%r11
    jmp .retfrominc


checkprime:
    cmpq $1,%r8
    jg .continue
    movq $0,%r10
    ret

.continue:
    movq $2,%r9
    jmp .checkinr
    .loopinr:
        movq %r8,%rax
        cqto
        idivq %r9
        cmpq $0,%rdx
        je .ret0
        incq %r9
    .checkinr:
        cmpq %r9,%r8
        jg .loopinr

    movq $1,%r10
    ret

.ret0:
    movq $0,%r10
    ret
