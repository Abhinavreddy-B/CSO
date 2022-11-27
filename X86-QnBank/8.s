.global func

func:
    movq $0,%r10
    .loop:
        movq $0,%r11
        .loop2:
            movq $0,%r12
            movq $0,%r13
            .loop3:
                movq %r10,%r14
                imulq %r8,%r14
                addq %r12,%r14

                movq (%rdi,%r14,8),%r14

                movq %r12,%r15
                imulq %r9,%r15
                addq %r11,%r15

                movq (%rsi,%r15,8),%r15

                imulq %r14,%r15

                addq %r15,%r13

                incq %r12
                cmpq %r12,%r8
                jg .loop3
                
            
            movq %r10,%r14
            imulq %r9,%r14
            addq %r11,%r14

            movq %r13,(%rdx,%r14,8)

            incq %r11
            cmpq %r11,%r9
            jg .loop2
        
        incq %r10
        cmpq %r10,%rcx
        jg .loop

    ret

        
