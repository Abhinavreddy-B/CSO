.global squareOfSums

squareOfSums:
    
    movq $0,%rax            # initialing the answer with 0
    
    movq $1,%r10            # intialise a variable i with 1
    
    cmpq $0,%rdi            # compare N with 0
    jg .loop                # if N>0 go to loop
    
    movq $-1,%rax           # if N<=0 returning -1 to rax
    ret                     # returning
    
    
    .loop:                  # loop
        movq %r10,%r8       # moving the value of i to a temporary variable t
        
        call multoverflow
        call sumoverflow
        
        incq %r10           # i++ , increment i by 1
        
        cmpq %r10,%rdi      # compare N with i
        jge .loop           # if N>=i continue to next iteration
        
        ret                 # if N<i, returning the answer ( Note: answer is always being stored in %rax )

multoverflow:           # multiplication function accounting overflow
    imulq %r8,%r8       # multiply directly (imulq trucates the answer to 64 bit by default)
    
    jo .overflow1       # if overflow occured , go to .overflow1
    ret                 # otherwise return to function call on line 19


.overflow1:             #  If Overflow occured in multiplication
    movq $1,%r11        # move 1 to some registor r11
    shlq $63,%r11       # make %r11 = 1<<63 (2^63 in unsigned is equivalent to the sign bit in signed ints)
    
    subq %r11,%r8       # dropping the sign bit from the multiplication 
                        # (imulq trucates the answer to 64 bit by default , We only have to care about the sign bit)
    ret                 # return to function call on line 19

sumoverflow:            # addition function accounting overflow
    addq %r8,%rax       # Add directly (the function truncates the answer to 64 directly , we only have to account for sign bit)
    
    jo .overflow2       # if overflow occured
    ret


.overflow2:             # If Overflow occured in addition
    movq $1,%r11        # move 1 to some registor r11
    shlq $63,%r11       # make %r11 = 1<<63 (2^63 in unsigned is equivalent to the sign bit in signed ints)
    
    subq %r11,%rax      # dropping the sign bit from the addition 
                        # (addq trucates the answer to 64 bit by default , We only have to care about the sign bit)
    ret
