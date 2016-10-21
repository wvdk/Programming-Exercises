/*  
    A modified version of 
    http://www.instructables.com/id/Make-an-accurate-Arduino-clock-using-only-one-wire/

    Uses analog PWM output of 490Hz with a 50% duty cycle to
    keep very accurate time.    
    
    Connect a jumper from Analog pin 0 to Digital Pin 2 (interrupt 0).
    Minutes output to serial monitor
*/

int masterClock = 0; // counts rising edge clock signals
int seconds = 0;
int minutes = 0;

void setup() {
  // Digital Pin 2 is our interrupt, clockCounter function is called when
  // invoked on a RISING clock edge
  attachInterrupt(digitalPinToInterrupt(2), clockCounter, RISING);
  
  analogReference(DEFAULT);

  Serial.begin(9600);
  Serial.println("Starting");

  
  analogWrite(0, 127);   // this starts our PWM 'clock' with a 50% duty cycle
}

void clockCounter() {      // called by interrupt
  Serial.println("Clock counter called by interrupt");

  
  masterClock ++;        // with each clock rise add 1 to masterclock count
  
  if (masterClock == 489) { // 490Hz reached                         
    seconds ++;          // after one 490Hz cycle add 1 second ;)
    masterClock = 0;     // Reset after 1 second is reached
  
    Serial.println(seconds);
   }
   
  return;
}

void loop() {
  if (seconds == 60) {
    minutes++;
    seconds = 0;
    
    Serial.print("Minutes = ");
    Serial.println(minutes);
  }
}
