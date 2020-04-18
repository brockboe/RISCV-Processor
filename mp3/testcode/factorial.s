factorial.s:
.align 4
.section .text
.globl _start


# Algorithm Explanation
#
# multiply(multiplier, multiplicand):
#     product = 0
#     while(multiplier > 0):
#           product = product + multiplicand
#           multiplier = multiplier - 1
#     [store product in memory]
#
#
# factorial(a):
#     multiplier = a
#     multiplicand = a - 1
#     input = a - 2
#     multiply(multiplier, multiplicand)
#     result = product
#
#     while(input > 1):
#           multiplier = input
#           multiplicand = result
#           multiply(multiplier, multiplicand)
#           result = product
#           input = input - 1
#
#     [put result into register x1]
#     [loop forever]


_start:
      # note: in the comments the number
      # who's factorial is being computed
      # is called "a", but referred to as
      # "input" in the comments.
      #
      # store our input into argument 1
      # of the multiplication program
      lw x1, a
      la x4, multiplier
      sw x1, 0(x4)

      # store our input - 1 into argument
      # 2 of the multiplication program
      add x1, x1, -1
      la x4, multiplicand
      sw x1, 0(x4)

      # store input - 2 for later use,
      # we will save it because after
      # we compute (input)*(input - 1)
      # we will multiply it by input - 2
      add x1, x1, -1
      la x4, a
      sw x1, 0(x4)

      beq x1, x1, mult_start  # start the multiplication

fact_loop:
      lw x1, product
      lw x2, result
      la x4, result
      sw x1, 0(x4)            # store the multiplication result
                              # as our "rolling" temporary result

      lw x1, a
      xor x4, x4, x4          # set x4 = 0
      add x4, x4, 1           # set x4 = 1
      beq x1, x4, done        # if all that's left to multiply
                              # our rolling result by is 1,
                              # then we can say that we're done
                              # and finish

      lw x1, a                # otherwise keep multiplying
      lw x2, result
      la x3, multiplier
      sw x1, 0(x3)            # give the number to multiply our
                              # current "rolling" product / total
                              # by to the multiplication program
      la x3, multiplicand
      sw x2, 0(x3)            # put our rolling total / product
                              # back into memory for use in multiplying

      add x1, x1, -1          # subtract 1 from our current a because
                              # this is the number we will multiply by
                              # next
      la x3, a
      sw x1, 0(x3)            # store it for future use
      beq x1, x1, mult_start  # jump to the multiplication program


mult_start:
      lw x1, multiplicand     #multiplication argument 1 in x1
      lw x2, multiplier       #multiplication argument 2 in x2
      xor x3, x3, x3          #set x3 = 0
mult_loop:
      # add x1 into x3 for a total
      # number of x2 times. For example,
      # if x1 = 3 and x2 = 2, then we
      # would add x1 to x3 twice
      add x3, x1, x3
      addi x2, x2, -1
      xor x4, x4, x4          #set x4 = 0 for comparison
      bne x2, x4, mult_loop   #check if we're done
mult_done:
      la x4, product          #store the product in memory
      sw x3, 0(x4)
      beq x3, x3, fact_loop   #jump back to our factorial loop


done:
      lw x1, result           #load the result into a register
done_loop:
      beq x1, x1, done_loop   #loop forever

.section .rodata

a:                .word 0x00000007  #The number who's factorial will be calculated
multiplier:       .word 0x00000000  #argument 1 of the multiply function
multiplicand:     .word 0x00000000  #argument 2 of the multiply function
product:          .word 0x00000000  #output from the multiply program
result:           .word 0x00000000  #used to hold the result of the factorial computation
