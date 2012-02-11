# Description

Here is simple category for getting MAC address of Wireless network card (en0) on iOS devices.

Usage:

- import UIDevice+MacAddress.h and UIDevice+MacAddress.m to your project
- import UIDevice+MacAddress.h to your controller or class
- use [[UIDevice currentDevice] macAddress:@"-"] to get mac address of wlan network card in format AA-BB-CC-DD-EE-FF or use @"" as a delimiter to get clear hex

This code works even if Airplane mode is on or if Wi-Fi is off.

# License

Use, modify, share and redistribute as you like.

# Help

Sample project is included.

If you need help contact me on Twitter https://twitter.com/#!/amarkulo