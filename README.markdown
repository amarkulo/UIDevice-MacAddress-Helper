# Description

Here is simple UIDevice category for getting MAC address of Wireless network card (en0) on iOS devices and unique device identifier based on that MAC address.

Unique identifier is hashed from MAC address with SHA256. 

Usage:

- import UIDevice+MacAddress.h and UIDevice+MacAddress.m to your project
- import UIDevice+MacAddress.h to your controller or class
- use [[UIDevice currentDevice] macAddress:@"-"] to get mac address of wlan network card in format AA-BB-CC-DD-EE-FF or use @"" as a delimiter to get clear hex
- use [[UIDevice currentDevice] uniqueDeviceIdentifier] to get unique device identifier that you can use instead of UDID which is deprecated from iOS5.

UDID returned is in the format XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX-XXXXXXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXX

This code works even if Airplane mode is on or if Wi-Fi is off.

# License

MIT license.

# Help

Sample project is included.

If you need help contact me on Twitter https://twitter.com/#!/amarkulo
