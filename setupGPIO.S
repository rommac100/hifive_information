.section .text
.align 2
.globl setupGPIO

#include "memory_map.inc"
#include "gpio.inc"

.equ LED_OFF, 0xFFFFFFFF

setupGPIO:
    addi sp, sp, -16        # allocate stack frame
    sw ra, 12(sp)           # store return address

    li t0, GPIO_CTRL_ADDR   # load control address
    li t1, LED_PIN          # load pin offset
    li t3, BUT_PIN
    sw t1, GPIO_OUTPUT_EN(t0) # Enable output on pin 17
    sw t3, GPIO_INPUT_EN(t3)
    
    li t3, BOTH_PINS
    not t3, t3

    sw t3, GPIO_IOF_EN(t0) # Fixes a GPIO Problem but have to leave pin 1, 2 11 so that serial works.
    li t2, LED_OFF # stores pin location in t2
    sw t1, GPIO_OUTPUT_XOR(t0) # inverts GPIO logic 1= off, 0 = on
    # sw x0, GPIO_OUTPUT_VAL(t0)
    not t3, t3
    sw t3, GPIO_OUTPUT_VAL(t0) # turns off main pin

    lw ra, 12(sp)           # restore return address
    addi sp,sp, 16
    ret
