.global greatestCommonDivisor

greatestCommonDivisor:
    call checkM         # Function to make M positive
    call checkN         # Function to make N positive

    test %rdi,%rdi      # change Flag bits according to M
    jnz .loop           # If M is not 0 jump to the loop
    
    movq %rsi,%rax      # If M is 0 return the value of N
    ret                 # Return
    
    
    .loop:
        
        test %rdi,%rdi  # Change Flag bits according to M
        jz .exit        # If M is 0 jump to the .exit label
        
        movq %rdi,%r9   # If M is not 0 , Compy M to some temporary Registor
        
        movq %rsi,%rax  # Move N to %rax for using idiv
        cqto            # Convert quadword in ​%rax​ to octoword in​ ​%rdx:%rax
        idivq %r9       # Compute N/M and N%M
        
        movq %rdx,%rdi  # Move N%M to %rdi to use it as new value of M
        movq %r9,%rsi   # Move already stored M to %rsi to use it a new value of N
        
        jmp .loop       # Go to the next iteration


.exit:              # Segment to return the value of N when M becomes 0
    movq %rsi,%rax  # copy the value of N to %rax
    ret             # Return




checkM:             # Funtion to make M positive
    test %rdi,%rdi  # Set flag bits according to M
    jl  .makeMposve # If M < 0 jump to appropriate segment
    
    ret             # else directly return to FUnction call on line no 4

.makeMposve:        # Code Segment executed if M<0
    imulq $-1,%rdi  # Multiply M with -1
    ret             # Return to function call on line no 4

checkN:             # Funtion to make N positive
    test %rsi,%rsi  # Set flag bits according to N
    jl  .makeNposve # If N < 0 jump to appropriate segment
    
    ret             # else directly return to FUnction call on line no 5

.makeNposve:        # Code Segment executed if N<0
    imulq $-1,%rsi  # Multiply N with -1
    ret             # Return to function call on line no 5
