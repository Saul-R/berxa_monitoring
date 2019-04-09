#include "NewPing.h"
#include <Process.h>
#include <Bridge.h>

// In centimeters / micro_secs
#define PIN_TRIG 12
#define PIN_ECHO 13
#define MAX_DISTANCE 1000

NewPing sonar(PIN_TRIG, PIN_ECHO, MAX_DISTANCE);

float distance;

void setup() {
  Serial.begin (9600);
  Bridge.begin();
}

void print_distance(float distance) {
  Serial.print("Distance: ");
  if (distance >= 400 || distance <= 2) {
    Serial.println("Out of range");
  }
  else {
    Serial.print(distance);
    Serial.println(" cm");
  }  
}

void loop() {
  Process p;
  String line,distanceStr;
  distance = sonar.ping_cm();
  print_distance(distance);
  distanceStr = String(distance);
  Serial.print(distanceStr);
  if (distance != 0) {
    line = String("python /root/send_udp_package.py " + distanceStr);
    p.runShellCommand(line); 
  }
  delay(500);
}
