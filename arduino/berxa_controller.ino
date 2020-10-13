#include "NewPing.h"
#include <Process.h>
#include <Bridge.h>

// In centimeters / micro_secs
#define DISTANCE_PIN_TRIG 6
#define DISTANCE_PIN_ECHO 7
#define DISTANCE_MAX_DISTANCE 1000

NewPing sonar(DISTANCE_PIN_TRIG, DISTANCE_PIN_ECHO, DISTANCE_MAX_DISTANCE);

float distance;

void setup() {
  Serial.begin (9600);
  Bridge.begin();
}

void print_distance(float distance) {
  Serial.print("Distance: ");
  if (distance >= 400 || distance <= 2) {
    Serial.print(distance);
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
  line = String("sh /root/send_metric.sh " + distanceStr);
  p.runShellCommand(line);
  delay(500);
}
