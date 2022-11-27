.global largestPrimeFactor

largestPrimeFactor: 
    cmpq $0,%rdi     # 0 with N
    jg .main        # if N>0 enter the main code
    
    movq $-1,%rax   # if N<=0 , copy -1 to %rax
    ret             # returing


.main:                  # main code
    
    movq %rdi,%r9       # making a copy of N , and using rdi as variable t
    
    
    .loop:              # loop
        movq %r9,%rax   # move the original value of N to %rax for using idiv
        cqto            # Convert quadword in ​%rax​ to octoword in​ ​%rdx:%rax  
        idivq %rdi      # operating N/t and N%t
        
        decq %rdi       # doing t--, making t ready for the next iteration
        cmpq $0,%rdx     # compare 0 with N%t
        jne .loop       # if N%t!=0 , i.e t does not divide N , continue to next iteration
        
        incq %rdi       # revert the effect of line 21
        
        call checkPrime # check if t is prime
        
        decq %rdi       # doing t--, making t ready for the next iteration
        cmpq $0,%rax     # comparing the output of checkPrime(t)
        je .loop        # if t is not prime continue to next iteration
        
        incq %rdi       # revert the effect of line 29
        movq %rdi,%rax  # move the value of t to %rax (t is the required answer)
        ret             # returning


# using the function from q3
.global checkPrime

checkPrime:
    movq %rdi,%r8       # moving N to some variable t
    cmpq $1,%r8          # comparing t and 1
    jg .maincheckPrime  # if t>1 go to main code 
    
    movq $-1,%rax       # if t<=1 , return invalid response
    ret                 # returing


.maincheckPrime:        # main code
    
    decq %r8            # make t-- , i.e start with t=n-1
    
    .loopcheckPrime:        # loop
        cmpq $1,%r8          # compare t with 1
        je .end             # if t==1, done, N is a prime
        
        movq %rdi,%rax      # if t!=1 , move N to %rax for performing idivq
        cqto                # Convert quadword in ​%rax​ to octoword in​ ​%rdx:%rax 
        idivq %r8           # perform division N/t
        
        decq %r8            # make t ready for next loop by decrementing it
        cmpq $0,%rdx         # compare the remainder ( N%t) with 0
        jne .loopcheckPrime # if remainder = 0 => N is divisible by a t where 1<t<N , i.e N is not prime
        
        movq $0,%rax        # return 0 if N is not prime
        ret                 # return



.end:   # succesfully reached t=1 , i.e N is a prime
    
    movq $1,%rax        # move 1 to %rax for returning
    ret                 # return 
