#include <SPI.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <WiFiUDP.h>
#include <NewPing.h>

const char* ssid     = "ssid";
const char* password = "pass";
const String poolId = "pool1";

#define PIN_TRIG 12
#define PIN_ECHO 13
#define MAX_DISTANCE 1000

NewPing sonar(PIN_TRIG, PIN_ECHO, MAX_DISTANCE);

void setup() {
 Serial.begin(115200);    
 WiFi.disconnect(); // Disconnect AP
 WiFi.mode(WIFI_STA);  
 WiFi.begin(ssid, password); // Connect to WIFI network
// Wait for connection
 while (WiFi.status() != WL_CONNECTED) {
  delay(500);
  Serial.println(".");
 }
 Serial.print("Connected to ");
 Serial.println(ssid);
 Serial.print("IP address: ");
 Serial.println(WiFi.localIP());
}

// the IP address of your InfluxDB host
byte host[] = {192, 168, 1, 130};
// the port that the InfluxDB UDP plugin is listening on
int port = 8089; 
long randNumber;
WiFiUDP udp;

float getDistance() {
  float return_distance;
  return_distance = sonar.ping_cm();
  return return_distance;
}

void loop() {
  String line, distance;

  // wait 1 second
  delay(1000);

  // get the current distance from the sensor, to 2 decimal places
  distance = String(getDistance(), 2);

  // concatenate the distance into the line protocol
  line = String("distance,pool_id=" + poolId + " value=" + distance);
  Serial.println(line);

  // send the packet
  Serial.println("Sending UDP packet...");
  udp.beginPacket(host, port);
  udp.print(line);
  udp.endPacket();
}