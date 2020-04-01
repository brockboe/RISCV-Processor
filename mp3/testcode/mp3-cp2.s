#  mp3-cp2.s version 1.0
.align 4
.section .text
.globl _start
_start:
    beq x0, x0, ldr_str_test
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    # cache line boundary

ldr_str_test:
   add x8, x0, x0 # addi x8, x0, %lo(DataSeg)
   nop
   nop
   nop
   nop
   nop
   lw x1, %lo(W)(x8)
   lw x3, %lo(Y)(x8)
   # cache line boundary
   lw x2, %lo(X)(x8)
   lw x4, %lo(Z)(x8)
   nop
   sw x1, %lo(Z)(x8)
   sw x2, %lo(Y)(x8)
   sw x3, %lo(X)(x8)
   sw x4, %lo(W)(x8)
   nop
   # cache line boundary
   lw x1, %lo(W)(x8)
   lw x2, %lo(X)(x8)
   lw x3, %lo(Y)(x8)
   lw x4, %lo(Z)(x8)
   beq x0, x0, fetch_stall_test
   nop
   nop
   nop
   # cache line boundary
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   # cache line boundary
   nop
   nop
   nop
   nop
   nop
   nop
   nop
fetch_stall_test:
   add x5, x1, x2
   # cache line boundary
   add x6, x3, x4
   nop
   nop
   nop
   nop
   sw x5, %lo(VICTIM)(x8)
   add x7, x5, x6
   nop
   # cache line boundary
   nop
   nop
   nop
   sw x7, %lo(TOTAL)(x8)
   lw x1, %lo(TOTAL)(x8)
inf:
   beq x0, x0, inf
   nop
   nop
   # cache line boundary
	
.section .rodata
.balign 256
DataSeg:
	nop
	nop
	nop
	nop
	nop
	nop
W:    	.word 0x00000009
X:    	.word 0x00000002
   # cache line boundary

Y: 	.word 0x00000001
Z:  	.word 0x00000003
	nop
	nop
	nop
	nop
	nop
	nop
   # cache line boundary

TOTAL: 	.word 0x00000000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
   # cache line boundary

VICTIM:	.word 0x00000000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
