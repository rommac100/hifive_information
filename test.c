#include  <stdio.h>
#include "test.h"
#include <time.h>


void delay(int number_of_microseconds){ //not actually number of seconds

// Converting time into multiples of a hundred nS
int hundred_ns = 10 * number_of_microseconds;

// Storing start time
clock_t start_time = clock();

// looping till required time is not achieved
while (clock() < start_time + hundred_ns);

}

int main()
{
    //printNum("test");   
    printf("RED-V Example: Blink2222222\n");
    setupPWM();
    //setupGPIO();
    //setLedState(1);
    /*
    while (1)
    {
        printf("State: %d\n", getButState());
    if (getButState() == 1)
    {
        printf("ONNNNNNN\n");
        setLedState(0);
    }
    else
    {
        printf("Off + GPIO OUTPUT: %d\n",setLedState(1));
    }
    delay(2000000);
    }
    */
    return 0;
}