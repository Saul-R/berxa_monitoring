# Berxa Fish Farm Monitoring Solution

![Berxa Logo](resources/berxa_logo.png)

This is a project to monitor a fish farm in an automated way.

## [Arduino](arduino)

This folder contains the arduino code for the controller.
Current hardware includes:

- HC-SR04: Ultrasonic sensor to measure distance
- Arduino Yùn

![Breadboard Schematics](resources/arduino_breadboard.png)


## Connecting

The berxa_controller.ino should work after scping the file to the OpenWRT (linux distro for yun).
Berxa_controller_no_push.ino does provide a way to connect to the serial monitor once you're in the OpenWRT (After ssh), this is done with `minicom`.

This package is installed in the linux distro via `opkg update && opgk install minicom`.

Minicom is connected with the bauds specified in the file (9600) and device is /dev/ttyATH0.

Wait for the device to appear in the Arduino IDE network, and use ssh root@192.168.1.150 (or the IP that appears there) to ssh.
You can also upload scripts via Wifi.