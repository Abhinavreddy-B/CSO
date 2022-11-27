.global func
func:               # function
    cmpq $1,%rdi    # compare n with 1
    jl .invalid     # if n<1 , go to line 107 , otherwise continue
    
    pushq %r12      # store the previous value of r12 into function stack before using it
    pushq %r13      # store the previous value of r13 into function stack before using it
    pushq %r14      # store the previous value of r14 into function stack before using it
    movq %rdi,%r12  # move the value of n to %r12
    movq %rsi,%r13  # move the value of diff to %r13
    movq %rsi,%r8   # move the value of diff to %r8 ( to hold the value of abs(diff))

    cmpq $0,%r8     # compare diff with 0
    jl .makepos     # if diff<0 jump to line 103
                    # otherwise fall through case:

.retfrommakepos:    # label for makepos to return
    cmpq %r8,%r12   # compare |diff| and n
    jge .continue1  # if n>=|diff| go to line 30
                    # otherwise if n<|diff| that means we cant create such number with difference in sum left and sum right > n
    
    popq %r14       # revert the affect of 6     
    popq %r13       # revert the affect of 7
    popq %r12       # revert the affect of 8
    
    movq $0,%rax    # we can create 0 such numbers, the ans is 0 
    ret             # return


.continue1:         # if n>=|diff| then it is possible to create such number
    
    cmpq $1,%r12    # compare n with 1
    jne .continue2  # if n==1 , continue from line 46
    
    cmpq $0,%r8     # compare |diff| with 0
    jne .continue2  # if n==1 and |diff|!=0 continue from line 46
                    # otherwise if n==1 and |diff|==0
    
    popq %r14       # revert the affect of 6     
    popq %r13       # revert the affect of 7
    popq %r12       # revert the affect of 8
    
    movq $2,%rax    # we can only create 2 such numbers 00 and 11
    ret             # return

.continue2:         # if n!=1|| (n==1 and |diff|!=0)
    cmpq $1,%r12    # compare n with 1
    jne .continue3  # if n!=1 continue from line 60
                    # otherwise if n==1 and |diff|==1 ( since n==1 and |diff|==0 is already taken care on line 36)
                    # n==1 and |diff|>=2 are alredy taken care on line 19
    
    
    popq %r14       # revert the affect of 6     
    popq %r13       # revert the affect of 7
    popq %r12       # revert the affect of 8
    
    movq $1,%rax    # if diff=1, only possible combination is 10 , if diff=-1 only pssible combination is 01
    ret             # return

.continue3:         # if n!=1 and |diff|>=2
    
    decq %r12       # n--;
    incq %r13       # diff++;
    movq $0,%r14    # move answer 0 to variable say x
    
    movq %r12,%rdi  # move n (effectively n-1) to %rdi to pass it as first parameter
    movq %r13,%rsi  # move diff (effectively diff+1) to %rsi to pass it as second parameter
    call func       # call function recursively (effectively f(n-1,diff+1))
    
    addq %rax,%r14  # x+=f(n-1,diff+1)
    
    decq %r13       # diff--;
    
    movq %r12,%rdi  # move n (effectively n-1) to %rdi to pass it as first parameter
    movq %r13,%rsi  # move diff (effectively diff) to %rsi to pass it as second parameter
    call func       # call function recursively (effectively f(n-1,diff))
    
    imulq $2,%rax   
    addq %rax,%r14  # x+=2 * f(n-1,diff)
    
    decq %r13       # diff--;
    movq %r12,%rdi  # move n (effectively n-1) to %rdi to pass it as first parameter
    movq %r13,%rsi  # move diff (effectively diff-1) to %rsi to pass it as second parameter
    call func       # call function recursively (effectively f(n-1,diff-1))
    
    addq %rax,%r14  # x+=f(n-1,diff-1)
    
    movq $1,%r9     # initiating some variable y=1
    salq $63,%r9    # y<<63;  ( to generate 2^63 )
    movq %r14,%rax  # move x to %rax for division
    cqto            # Convert quadword in ​%rax​ to octoword in​ ​%rdx:%rax
    divq %r9       # perform x/k and x%k
    
    movq %rdx,%rax  # mov x%k to %rax
    
    popq %r14       # revert the affect of 6     
    popq %r13       # revert the affect of 7
    popq %r12       # revert the affect of 8
    
    ret             # return x%k


.makepos:               # if %r8 is negative
    imulq $-1,%r8       # multiply %r8 with -1
    jmp .retfrommakepos # jump back to the line where it was stopped

.invalid:           # for invalid input
    movq $-1,%rax   # move -1 to rax
    ret             # return
    