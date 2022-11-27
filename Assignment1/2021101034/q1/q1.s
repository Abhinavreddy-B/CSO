.global quotient

quotient:
    cmpq $0,%rsi     # comparing denominator with 0
    jne .mainqt     # if not 0 jump to main code
    movq $-1,%rax   # if 0, return -1
    ret             # return
    

.mainqt:
    cmpq $0,%rdi     # compare numerator with 0
    jl .negnumqt    # if less than 0 jump to negative numerator part


    .posnum:                                # positive numerator part
        cmpq $0,%rsi                         # compare denomitor with 0
        jl .posnumnegden                    # if denomitor is <0 jump to positive numerator negative denominator part
            
            
        .posnumposden:                  # positive numerator positive denominator part
            movq $0,%rax                # initialising answer with 0
            
            cmpq %rdi,%rsi               # comparing M with N
            jle .posnumposdenloop       # if N<=M enter the loop
            
            ret                         # if N>M return answer 0
            
            .posnumposdenloop:          # loop
                subq %rsi,%rdi          # make M=M-N
                incq %rax               # increasing the answer by 1
                
                cmpq %rdi,%rsi           # comparing M with N
                jle .posnumposdenloop   # if N<=M enter the loop again
                
                ret                     # if N>M return the answer
        
        
        
        .posnumnegden:                  # positive numerator negative denominator part
            
            movq $0,%rax                # initialising answer with 0
            imulq $-1,%rsi              # making the denomitor positive by multiplying with -1
            
            cmpq %rdi,%rsi               # comparing M and N
            jle .posnumnegdenloop       # if N<=M enter the loop
            
            ret                         # if N>M return answer 0
            
            .posnumnegdenloop:          # loop
                subq %rsi,%rdi          # make M=M-N
                decq %rax               # decreasing the answer by 1
                
                cmpq %rdi,%rsi           # comparing M with N
                jle .posnumnegdenloop   # if N<=M enter the loop again
                
                ret                     # if N>M return the answer
    
    
    
    
    .negnumqt:                              # negative numerator part
        cmpq $0,%rsi                         # compare denomitor with 0
        jl .negnumnegden                    # if denomitor is <0 jump to positive numerator negative denominator part
            
            
        .negnumposden:                  # negative numerator positive denominator part
            movq $0,%rax                # initialising answer with 0
            imulq $-1,%rdi              # making the numerator +ve
            
            cmpq %rdi,%rsi               # comparing M with N
            jle .negnumposdenloop       # if N<=M enter the loop
            
            decq %rax                   # if M>N decrease the answer by 1 (example -3/4 = -1)
            ret                         # return
            
            .negnumposdenloop:          # loop
                subq %rsi,%rdi          # make M=M-N
                decq %rax               # decreasing the answer by 1            
                
                cmpq %rdi,%rsi           # comparing M and N                
                jle .negnumposdenloop   # if N<=M enter the loop again                        
                
                cmpq $0,%rdi             # if N>M , comparing M with 0
                jne .decreaseqt         # if M is not 0,(i.e M (original) is not a perfect multiple of N) jump to corresponding section
                
                ret                     # else if M=0 , i.e M (original) is perfect Multiple of N , return answer
                
                .decreaseqt:            # if M is not 0,(i.e M (original) is not a perfect multiple of N)
                    decq %rax           # decreasing the answer by 1 (example -10/4=-3)
                    ret                 # return answer
        
        
        .negnumnegden:                  # negative numerator negative denominator part
            movq $0,%rax                # initialising answer with 0
            imulq $-1,%rsi              # making the numerator +ve
            imulq $-1,%rdi              # making the denominator +ve
            
            cmpq %rdi,%rsi               # comparing M with N
            jle .negnumnegdenloop       # if N<=M enter the loop
            
            incq %rax                   # if N>M increment the answer by 1 (example -3/-4 = 1)
            ret                         # return answer
            
            
            .negnumnegdenloop:          # loop
                subq %rsi,%rdi          # make M=M-N
                incq %rax               # increasing the answer by 1
                
                cmpq %rdi,%rsi           # comparing M and N  
                jle .negnumnegdenloop   # if N<=M enter the loop again
                
                cmpq $0,%rdi             # if N>M , comparing M with 0
                jne .increaseqt         # if M is not 0,(i.e M is not a perfect multiple of N) jump to corresponding section
                
                ret                     # else if M=0 , i.e M is perfect Multiple of N , return answer
                
                .increaseqt:            # if M is not 0,(i.e M is not a perfect multiple of N)
                    incq %rax           # increasing the answer by 1 (example -10/4=-3)
                    ret                 # return answer


.global remaindr

remaindr:
    
    cmpq $0,%rsi     # comparing denominator with 0
    jne .mainrd     # if not 0 jump to main code
    
    movq $-1,%rax   # if 0, return -1
    ret             # return
    

.mainrd:
    cmpq $0,%rdi     #   compare numerator with 0
    jl .negnumrd    #   if less than 0 jump to negative numerator part
    
    
    
    
    .posnumrd:                              # positive numerator part
        cmpq $0,%rsi                         # compare denomitor with 0
        jl .posnumnegdenrd                  # if denomitor is <0 jump to positive numerator negative denominator part
            
            
            
        .posnumposdenrd:                # positive numerator positive denominator part
            cmpq %rdi,%rsi               # comparing M with N
            jle .posnumposdenlooprd     # if N<=M enter the loop
            
            movq %rdi,%rax              # if N>M  return answer=M
            ret                         # return
            
            .posnumposdenlooprd:        # loop
                subq %rsi,%rdi          # make M=M-N
                
                cmpq %rdi,%rsi           # comparing M with N
                jle .posnumposdenlooprd # if N<=M enter the loop again
                
                movq %rdi,%rax          # if N>M make answer=M
                ret                     # return
        
        
        .posnumnegdenrd:                # positive numerator negative denominator part
            imulq $-1,%rsi              # making the denomitor positive by multiplying with -1
            
            cmpq %rdi,%rsi               # comparing M and N
            jle .posnumnegdenlooprd     # if N<=M enter the loop
            
            movq %rdi,%rax              # if N>M make answer=M
            ret                         # return answer
            
            .posnumnegdenlooprd:        # loop
                subq %rsi,%rdi          # make M=M-N
                
                cmpq %rdi,%rsi           # comparing M with N
                jle .posnumnegdenlooprd # if N<=M enter the loop again
                
                movq %rdi,%rax          # if N>M make answer=M
                ret                     # return


    .negnumrd:                              # negative numerator part
        cmpq $0,%rsi                         # compare denomitor with 0
        jl .negnumnegdenrd                  # if denomitor is <0 jump to positive numerator negative denominator part
            
            
            
        .negnumposdenrd:                # negative numerator positive denominator part
            imulq $-1,%rdi              # making the numerator +ve
            
            cmpq %rdi,%rsi               # comparing M with N
            jle .negnumposdenlooprd     # if N<=M enter the loop
            
            subq %rdi,%rsi              # if M>N make N=N-M ( example -3%4 , M will finally become 3 , and required answer is 1 ( -1*(4) + 1 ) i.e 4-3 )
            movq %rsi,%rax              # move new N value (answer) to %rax for returning 
            ret                         # return
            
            
            .negnumposdenlooprd:        # loop
                subq %rsi,%rdi          # make M=M-N
                
                cmpq %rdi,%rsi           # comparing M and N
                jle .negnumposdenlooprd # if N<=M enter the loop again
                
                cmpq $0,%rdi             # if N>M , comparing M with 0
                jne .decreaserd         # if M is not 0,(i.e M (original) is not a perfect multiple of N) jump to corresponding section
                
                movq $0,%rax            # if M becomes 0 , i.e original M is a perfect multiple of N , return answer=0
                ret                     # return
                
                .decreaserd:            # if M is not 0,(i.e M (original) is not a perfect multiple of N)
                    subq %rdi,%rsi      # if M>N make N=N-M ( example -11%4 , M will finally become 3 , and required answer is 1 ( -3*(4) + 1 ) i.e 4-3 )
                    movq %rsi,%rax      # moving the answer to %rax for returing
                    ret                 # returning
        
        
        .negnumnegdenrd:                # negative numerator negative denominator part
            imulq $-1,%rsi              # making the numerator +ve
            imulq $-1,%rdi              # making the denominator +ve
            
            cmpq %rdi,%rsi               # comparing M with N
            jle .negnumnegdenlooprd     # if N<=M enter the loop
            
            subq %rdi,%rsi              # if M>N make N=N-M ( example -3%-4 , M will finally become 3 , and required answer is 1 ( 1*(-4) + 1 ) i.e 4-3 )
            movq %rsi,%rax              # moving the answer to %rax for returing
            ret                         # returing
            
            
            .negnumnegdenlooprd:        # loop
                subq %rsi,%rdi          # make M=M-N
                cmpq %rdi,%rsi           # comparing M and N
                jle .negnumnegdenlooprd # if N<=M enter the loop again
                
                cmpq $0,%rdi             # if N>M , comparing M with 0
                jne .increaserd         # if M is not 0,(i.e M is not a perfect multiple of N) jump to corresponding section
                
                movq $0,%rax            # else if M=0 , i.e M is perfect Multiple of N , make answer=0
                ret                     # returing
                
                .increaserd:            # if M is not 0,(i.e M is not a perfect multiple of N)
                    subq %rdi,%rsi      # if M>N make N=N-M ( example -11%-4 , M will finally become 3 , and required answer is 1 ( -3*(4) + 1 ) i.e 4-3 )
                    movq %rsi,%rax      # moving the answer to %rax for returing
                    ret                 # returing
