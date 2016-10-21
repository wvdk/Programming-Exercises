#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}

/*
 - LCD RS pin to digital pin 12
 - LCD Enable pin to digital pin 11
 - LCD D4 pin to digital pin 5
 - LCD D5 pin to digital pin 4
 - LCD D6 pin to digital pin 3
 - LCD D7 pin to digital pin 2
 - LCD R/W pin to ground
 - LCD VSS pin to ground
 - LCD VCC pin to 5V
 - 10K resistor:
 - ends to +5V and ground
 - wiper to LCD VO pin (pin 3)

 http://www.arduino.cc/en/Tutorial/LiquidCrystal
 */
