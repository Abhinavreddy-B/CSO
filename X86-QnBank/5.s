.global func

func:
    movq $1,%r8
    movq $1,%r9
    .loop:
        movq %r9,%rax
        cqto
        idivq %rdi
        cmpq $0,%rdx
        je .ret
        incq %r8
        imulq %r8,%r9
        jo .ret0
        jmp .loop


.ret:
    movq %r8,%rax
    ret

.ret0:
    movq $-1,%rax
    ret
    