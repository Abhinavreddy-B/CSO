.global func

func:
    imulq %rsi,%rdx
    movq %rdx,%r11
    movq $0,%r8
    movq $0,%r9
    movq $2,%r10
    jmp .compare
    .loop:
        movq (%rdi,%r8,8),%rax
        cqto
        idivq %r10
        cmpq $0,%rdx
        je .inc
        .retfrominc:
        incq %r8

    .compare:
        cmpq %r8,%r11
        jg .loop    

    movq %r9,%rax
    ret


.inc:
    addq (%rdi,%r8,8),%r9
    jmp .retfrominc
