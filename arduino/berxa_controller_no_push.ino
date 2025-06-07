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
  // Initialize Serial1 for communication with the Linux processor
  Serial1.begin(9600); // Use Serial1 instead of Serial
  while (!Serial1) {
    ; // wait for Serial1 to connect. Required for Leonardo/Yun
  }
  Serial1.println("Arduino Yun ready to send distance data!"); // Add a startup message
  //Bridge.begin(); // Keep Bridge.begin() if you intend to use the Process class later
}

void print_distance(float distance) {
  Serial1.print("Distance: "); // Use Serial1
  if (distance >= 400 || distance <= 2) {
    Serial1.print(distance); // Use Serial1
    Serial1.println(" Out of range"); // Use Serial1
  }
  else {
    Serial1.print(distance); // Use Serial1
    Serial1.println(" cm"); // Use Serial1
  }
}

void loop() {
  Process p;
  String line, distanceStr;
  distance = sonar.ping_cm();
  print_distance(distance);
  distanceStr = String(distance);
  Serial1.print(distanceStr); // Use Serial1
  Serial1.println(); // Add a newline after printing the raw distance for better readability

  // line = String("python /root/send_udp_package.py " + distanceStr);
  // p.runShellCommand(line);

  delay(1000);
}