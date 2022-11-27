.global func

func:
    movq $0,%r8
    movq %rsi,%r9
    .loop:
        movq %r9,%r10
        addq %r8,%r10
        shrq $1,%r10
        cmpq (%rdi,%r10,8),%rdx
        je .exit
        cmpq (%rdi,%r10,8),%rdx
        jl .lesser
        jmp .greater

        .lesser:
            decq %r10
            movq %r10,%r9
            jmp .check

        .greater:
            incq %r10
            movq %r10,%r8
            jmp .check
        
        .check:
            cmpq %r8,%r9
            jge .loop
    
    movq $-1,%rax
    ret

.exit:
    movq %r10,%rax
    ret
