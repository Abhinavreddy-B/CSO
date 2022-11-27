.global func

func:
    cmpq $1,%rdx
    je .add
    cmpq $2,%rdx
    je .sub
    cmpq $3,%rdx
    je .divide
    cmpq $4,%rdx
    je .exp
    cmpq $5,%rdx
    je .mod
.invalid:
    movq $-1,%rax
    jmp .exit

.add:
    addq %rsi,%rdi
    movq %rdi,%rax
    jmp .exit

.sub:
    subq %rsi,%rdi
    movq %rdi,%rax
    jmp .exit

.divide:
    movq %rdi,%rax
    cqto
    idivq %rsi
    jmp .exit

.exp:
    cmpq $0,%rsi
    jl .invalid
    movq $1,%rax
    jmp .check
    .loop:
        imulq %rdi,%rax
        decq %rsi
    .check:
        cmpq $0,%rsi
        jg .loop
    
    jmp .exit

.mod:
    movq %rdi,%rax
    cqto
    idivq %rsi
    movq %rdx,%rax
    jmp .exit

.exit:
    movq $1,%r8
    shlq $63,%r8
    cqto
    idivq %r8
    movq %rdx,%rax
    ret
    