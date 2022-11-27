.global checkPrime

checkPrime:
    
    
    movq %rdi,%r8   # moving N to some variable t
    cmpq $1,%r8      # comparing t and 1
    jg .main        # if t>1 go to main code 
    
    movq $-1,%rax   # if t<=1 , return invalid response
    ret             # returing


.main:  # main code
    
    decq %r8  # make t-- , i.e start with t=n-1
    
    .loop:              # loop
        cmpq $1,%r8      # compare t with 1
        je .end         # if t==1, done, N is a prime
        
        movq %rdi,%rax  # if t!=1 , move N to %rax for performing idivq
        cqto            # Convert quadword in ​%rax​ to octoword in​ ​%rdx:%rax 
        idivq %r8       # perform division N/t
        
        decq %r8        # make t ready for next loop by decrementing it
        cmpq $0,%rdx     # compare the remainder ( N%t) with 0
        jne .loop       # if remainder = 0 => N is divisible by a t where 1<t<N , i.e N is not prime
        
        movq $0,%rax    # return 0 if N is not prime
        ret             # return


.end:   # succesfully reached t=1 , i.e N is a prime
    movq $1,%rax        # move 1 to %rax for returning
    ret                 # return 
