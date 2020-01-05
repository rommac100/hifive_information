// assumes led pin 17

int setLedState(int state);
int getButState();

#define BUT_PIN 0x00000400


//void setLedOff();
void setupGPIO();

void setupPWM();