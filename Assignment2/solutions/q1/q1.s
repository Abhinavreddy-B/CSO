.global func

func:               # main Function
    movq %rdi,%r8   # moving value of N to some variable i
    decq %r8        # i--
    movq %rsp,%r11  # storing the base value of %rsp into %r11
    .loop:          # loop
        movq (%rsi,%r8,8),%r9       # (%rsi,%r8,8)  --- > element at address (inp + 8*i) , 
                                    # i.e the element at ith index of the input array
                                    # copy it to some variable t

        .loop2:                     # inner loop     
            cmpq %r11,%rsp          # stack pointer to initial value of stack pointer
            je .NotThere            # if stack is empty go to line 22
            popq %r10               # oterwise if stack is not empty , pop the top element of the stack 
                                    # say some variable x
            cmpq %r10,%r9           # compare x with t
            jge .loop2              # if t>=x re enter the loop
            pushq %r10              # otherwise if t< x , push x back to the stack,
                                    # i.e invert the effect of line 15
            pushq %r9               # push the value of t to the stack
            movq %r10,(%rdx,%r8,8)  # make the answer at index i of the answer array as x
            jmp .continue           # jump to continue section

        .NotThere:                  # if there was no element in the stack
            pushq %r9               # pus the value of t to the stack
            movq $-1,(%rdx,%r8,8)   # the answer for element at index i is -1
                                    # fall through
        .continue:                  # continue section
            decq %r8                # i--
            cmpq $0,%r8             # compare 0 with i
            jge .loop               # if i>=0 continue to next iteration , otherwise fall through

                        # fall through:
    movq %r11,%rsp      # making the stack pointer point to its initial value
    
    ret                 # return from the function
