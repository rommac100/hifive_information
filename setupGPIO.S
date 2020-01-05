.section .text
.align 2
.globl setupGPIO

#include "memory_map.inc"
#include "gpio.inc"

.equ LED_OFF, 0xFFFFFFFF

# Basic Setup GPIO for an input and an output. 

setupGPIO:
    addi sp, sp, -16            # allocate stack frame
    sw ra, 12(sp)               # store return address

    li t0, GPIO_CTRL_ADDR       # load control address
    li t1, LED_PIN              # load led pin offset
    li t3, BUT_PIN              # load but pin offset
    sw t1, GPIO_OUTPUT_EN(t0)   # Enable output on pin 17
    sw t3, GPIO_INPUT_EN(t3)    # Enable input on pin 16 
    
    li t3, BOTH_PINS            # Load combined pin offset
    not t3, t3                  # Logically nots it for the IOF enable

    sw t3, GPIO_IOF_EN(t0)      # Allows the two desired pins to work as GPIO but keep all other pins functioning using their default IOF Function.
    sw t1, GPIO_OUTPUT_XOR(t0)  # inverts GPIO logic for LED Pin 1= off, 0 = on , Makes it easier to control.
    
    not t3, t3                  # logically nots it combined pin offset. Used to turn off both pins
    sw t3, GPIO_OUTPUT_VAL(t0)  # turns off boths pins but LED pin is the main one that is needed.

    lw ra, 12(sp)               # restore return address
    addi sp,sp, 16              # unallocate stack frame
    ret
