import processing.serial.*;

Serial myPort;

void setup() {
  println("Available serial ports:");
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
  println(myPort);
}

void draw() {
  if (myPort.available() > 0) {
    println(myPort.read());
  } else {
    //println("no serial"); 
  }
}