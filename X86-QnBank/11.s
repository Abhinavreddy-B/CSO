.global func

func:
    movq (%rdi),%r8
    movq $1,%r9
    movq $1,%r10
    .loop:
        cmpq %r8,(%rdi,%r9,8)
        jl .do
        .done:
        incq %r9
        cmpq %r9,%rsi
        jg .loop

    decq %r10
    movq (%rdi,%r10,8),%r11
    movq %r8,(%rdi,%r10,8)
    movq %r11,(%rdi)
    ret

.do:
    movq (%rdi,%r9,8),%r11
    movq (%rdi,%r10,8),%r12
    movq %r12,(%rdi,%r9,8)
    movq %r11,(%rdi,%r10,8)
    incq %r10
    jmp .done
