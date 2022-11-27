.global func

func:
    movq $0,%r8
    jmp .check
    .loop:
        testq $1,%rdi
        jnz .inc
        .retfrominc:
        shrq %rdi

    .check:
        cmpq $0,%rdi
        jne .loop

    movq $2,%r9
    movq %r8,%rax
    cqto
    idivq %r9
    movq %rdx,%rax
    ret


.inc:
    incq %r8
    jmp .retfrominc
    