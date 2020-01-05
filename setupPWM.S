.section .text
.align 2
.globl setupPWM

#include "memory_map.inc"
#include "gpio.inc"
#include "pwm.inc"

.equ PWM_COUNT_VALUE,  0x00000000
.equ PWM_CONFIG_VALUE, 0x0000360F # Corresponds to stick=on, pwmscale=1, zerocmp=1,enalways=1     prev config = 01001000
.equ PWM_COMP_VALUE,   0x0000FFFF

.equ PWM_SCALE, 0x1
.equ PWM_FREQ, 0xFF
.equ PWM_DUTY, 0x32

setupPWM:
    addi sp, sp, -16            # allocate stack frame
    sw ra, 12(sp)               # store return address

    li t0, GPIO_CTRL_ADDR       # load control address
    li t1, LED_PIN              # load pin offset
    sw t1, GPIO_OUTPUT_EN(t0)   # Enable output on pin 16
    sw t1, GPIO_IOF_EN(t0)      # enables secondary actions for gpio
    sw t1, GPIO_IOF_SEL(t0)     # selects PWM Action
    
    

    li t2, PWM_CTRL_ADDR
    li t3, PWM_CONFIG_VALUE
    sw x0, PWM_CONFIG_REG(t2)
    sw t3, PWM_CONFIG_REG(t2)

    li t3, 0x7F
    sw t3, PWM_CMP1_REG(t2)

    li t3, PWM_COUNT_VALUE
    sw t3, PWM_COUNT_REG(t2)

    lw ra, 12(sp)           # restore return address
    addi sp,sp, 16
    ret
