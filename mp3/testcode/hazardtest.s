# hazardtest.s
#
# tests the hazard and forwarding implementation

.align 4
.section .text
.globl _start
_start:
      # rs1 tests
      # mem => ex

      # wb => x

      # misc
      lw x1, NEGTWO
      addi x1, x1, 10

done:
      beq x0, x0, done

.section .rodata
.balign 256
ONE:    .word 0x00000001
TWO:    .word 0x00000002
NEGTWO: .word 0xFFFFFFFE
TEMP1:  .word 0x00000001
GOOD:   .word 0x600D600D
BADD:   .word 0xBADDBADD
