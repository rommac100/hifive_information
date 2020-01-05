# hifive_information
Information and example code for future risc v usage

#Useful Links / Resources:
-  FE310 Datasheet/manual
   https://sifive.cdn.prismic.io/sifive%2F9ecbb623-7c7f-4acc-966f-9bb10ecdb62e_fe310-g002.pdf
-  Hifive1 rev b getting started
   https://sifive.cdn.prismic.io/sifive%2F4f5a7851-1b52-463b-a293-f352036bc809_hifive1b-getting-started-guide_v1.1.pdf
-  RISC V ASM manual
   https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md
-  FE310 Pinout
   https://www.mouser.com/datasheet/2/885/E310-G000-DS-1529740.pdf

Function Descriptions:
- setupGPIO
    Simply setups one button and one led and sets the initial values to off. See gpio.inc for the specific pins in usage.
- setLedState
    Sets a previously setup output pin to a either On or Off. Keep in mind the state is inverted. i.e 1=off, 0=on
- getButState
    Returns the current state of the button, non inverted, i.e 1= high, 0= low.
- setupPWM
    Starts a pwm output on the ledPin. Duty cycle and frequency is determined within the function. 