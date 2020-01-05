.section .text
.align 2
.globl getButState

#include "memory_map.inc"
#include "gpio.inc"

getButState:
    addi sp,sp, -16
    sw ra, 12(sp)

    li t0, GPIO_CTRL_ADDR
    lw a0, GPIO_INPUT_VAL(t0)

    li t1, BUT_PIN
    and a0, a0, t1
    div a0, a0, t1

    addi sp, sp, 16
    ret