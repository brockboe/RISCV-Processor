memtest.s:
.align 4
.section .text
.globl _start

_start:

      add x8, x0, x0
      nop
      nop
      nop
      nop
      nop
      nop
      nop


      lb x1, %lo(byte)(x8)
      lbu x1, %lo(byte)(x8)
      lh x1, %lo(half)(x8)
      lhu x1, %lo(half)(x8)
      lw x1, %lo(word)(x8)

      lb x1, %lo(byte)(x8)
      lb x1, %lo(bytetwo)(x8)
      lb x1, %lo(bytethree)(x8)

      lh x1, %lo(half)(x8)
      lh x1, %lo(halftwo)(x8)
      lhu x1, %lo(halftwo)(x8)

      addi x1, x0, 127
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      sb x1, %lo(byte)(x8)
      lb x1, %lo(byte)(x8)

      addi x1, x0, 15
      la x2, half
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      sh x1, %lo(half)(x8)
      lh x1, %lo(half)(x8)

      addi x1, x0, 14
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      sw x1, %lo(word)(x8)
      lw x1, %lo(word)(x8)

done:
      beq x0, x0, done
      nop
      nop
      nop
      nop
      nop
      nop
      nop

misalign:   .byte 0x77
byte:       .byte 0x8A
bytetwo:    .byte 0x97
bytethree:  .byte 0x31
half:       .half 0x800B
halftwo:    .half 0xB00B
word:       .word 0x800000CD
