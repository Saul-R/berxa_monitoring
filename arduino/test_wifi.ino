#include <SPI.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <WiFiUDP.h>

char ssid[] = "<SSID>";     //  your network SSID (name) 
char pass[] = "<PASSWORD>";    // your network password
int status = WL_IDLE_STATUS;     // the Wifi radio's status

// the IP address of your InfluxDB host
byte host[] = {192, 168, 1, 130};
// the port that the InfluxDB UDP plugin is listening on
int port = 8089;
long randNumber;

WiFiUDP udp;

void setup() {
  // initialize serial port
  Serial.begin(9600);

  // attempt to connect using WPA2 encryption
  Serial.println("Attempting to connect to WPA network...");
  status = WiFi.begin(ssid, pass);

  // if unable to connect, halt
  if ( status != WL_CONNECTED) { 
    Serial.println("Couldn't get a WiFi connection");
    while(true);
  } 
  // if the conneciton succeeded, print network info
  else {
    Serial.println("Connected to network");
    // print your WiFi shield's IP address:
    IPAddress ip = WiFi.localIP();
    Serial.print("IP Address: ");
    Serial.println(ip);

    // print the received signal strength:
    long rssi = WiFi.RSSI();
    Serial.print("signal strength (RSSI):");
    Serial.print(rssi);
    Serial.println(" dBm");
  }
  randomSeed(1);
}

float getDistance() {
  float return_distance;
  randNumber = random(10,20);
  return_distance = (float) randNumber;
  return return_distance;
}

void loop() {
  String line, distance;

  // wait 1 second
  delay(1000);
  
  // get the current temperature from the sensor, to 2 decimal places
  distance = String(getDistance(), 2);

  // concatenate the temperature into the line protocol
  line = String("distance value=" + distance);
  Serial.println(line);
  
  // send the packet
  Serial.println("Sending UDP packet...");
  udp.beginPacket(host, port);
  udp.print(line);
  udp.endPacket();
}