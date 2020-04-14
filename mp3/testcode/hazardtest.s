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


      addi x1, x0, 0
      addi x2, x0, 20
loop:
      beq x1, x2, done
      addi x1, x1, 1
      beq x0, x0, loop


      lw x1, NEGTWO
      addi x1, x1, 10
      la x8, EIGHT
      sw x1, 0(x8)
      lw x2, EIGHT


done:
      beq x0, x0, done

.section .rodata
.balign 256
ONE:    .word 0x00000001
TWO:    .word 0x00000002
EIGHT:  .word 0x00000000
NEGTWO: .word 0xFFFFFFFE
TEMP1:  .word 0x00000001
GOOD:   .word 0x600D600D
BADD:   .word 0xBADDBADD
