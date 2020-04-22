mulsdiv_test.s:
.align 4
.section .text
.globl _start



_start:
      lw x1, num1
      lw x2, num2
      mul x3, x1, x2

      lw x1, negone
      lw x2, two
      mulh x3, x1, x2
      mulhu x3, x1, x2
      mulhsu x3, x1, x2
      mulhsu x3, x2, x1

      lw x1, num2
      lw x2, seven
      div x3, x1, x2
      rem x3, x1, x2

      lw x1, negone
      lw x2, two
      divu x3, x1, x2
      remu x3, x1, x2

done:
      beq x0, x0, done

.section .rodata

big_neg:          .word 0x80000000
five:             .word 0x00000005
seven:            .word 0x00000007
two:              .word 0x00000002
num1:             .word 0x00000423
num2:             .word 0x0000514A
negone:           .word 0xFFFFFFFF
