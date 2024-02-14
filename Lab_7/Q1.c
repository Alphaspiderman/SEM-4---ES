#include <LPC17xx.h>
#define ALLDISP  0x00180000
#define DATAPORT 0x00000ff0
unsigned int j, delay, count = 0, switchcount = 0;
unsigned int disp[16]= {0x000003f0, 0x00000060, 0x000005b0, 0x000004f0, 0x00000660, 0x000006d0, 0x000007d0, 0x00000070, 0x000007f0, 0x000006f0, 0x00000770, 0x000007c0, 0x00000390, 0x000005e0, 0x00000790, 0x00000710};

int main(){
	LPC_PINCON->PINSEL0 = 0x00000000;
	LPC_PINCON->PINSEL1 = 0x00000000;
	LPC_GPIO0->FIODIR = 0x00180ff0;
	while(1){
		LPC_GPIO0->FIOSET |= ALLDISP; // Both Displays
		LPC_GPIO0->FIOCLR = 0x00000ff0;
		LPC_GPIO0->FIOSET = disp[switchcount];
		
		for(j = 0; j < 10; j++){
			for(delay = 0; delay < 100000; delay++);
		}
		
		switchcount++; // Up Counter
		
		if (switchcount == 0x10){
			switchcount = 0;
			LPC_GPIO0->FIOCLR = 0x00180ff0;
		}
	}
}
