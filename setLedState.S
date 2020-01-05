.section .text
.align 2
.globl setLedState

#include "memory_map.inc"
#include "gpio.inc"
.equ LEDON, 0x1

setLedState:
    addi sp, sp, -16    
    sw ra, 12(sp)

    li t0, GPIO_CTRL_ADDR
    li t3, LED_PIN
    lw t1, GPIO_OUTPUT_VAL(t0)
    
    beqz a0, ledOff
    li t2, LEDON
    beq a0, t2, ledOn
    j exit

ledOn:
    or t1, t1, t3 
    sw t1, GPIO_OUTPUT_VAL(t0)
    j exit

ledOff:
    xor t3, t3, 0xffffffff
    and t1, t1, t3
    sw t1, GPIO_OUTPUT_VAL(t0)

exit:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret