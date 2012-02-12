//
//  UIDevice+MacAddress.m
//
//  Created by Amar Kulo on 2012-02-11.
//  Copyright (c) 2012 iRget Solutions. All rights reserved.
//

#import "UIDevice+MacAddress.h"
#include <net/if_dl.h>
#include <netinet/in.h>
#include <ifaddrs.h>
#import <CommonCrypto/CommonDigest.h>


@implementation UIDevice (MacAddress)

- (NSString *) macAddress:(NSString *)delimiter {
    
    int	result;
	struct ifaddrs	*ifbase, *ifiterator;
	
	result = getifaddrs(&ifbase);
	ifiterator = ifbase;
    NSString *macAddress;
    
    while (!result && (ifiterator != NULL))
	{
        NSString* interface_name = [NSString stringWithFormat:@"%s", ifiterator->ifa_name];

        if ([interface_name isEqualToString:@"en0"] && ifiterator->ifa_addr->sa_family == AF_LINK)
        {
            struct sockaddr_dl* dlAddr;
			dlAddr = (struct sockaddr_dl *)(ifiterator->ifa_addr);
            unsigned char mac_address[6];
            memcpy(mac_address, &dlAddr->sdl_data[dlAddr->sdl_nlen], 6);
            
            macAddress = 
            [NSString stringWithFormat:@"%02X%@%02X%@%02X%@%02X%@%02X%@%02X"
             , mac_address[0], delimiter, mac_address[1], delimiter, mac_address[2], delimiter
             , mac_address[3], delimiter, mac_address[4], delimiter, mac_address[5]];
            
            break;
            
        }

        ifiterator = ifiterator->ifa_next;
    }
    
    return macAddress;
}

- (NSString *)uniqueDeviceIdentifier {
    
    // Create pointer to the string as UTF8
    const char *ptr = [[self macAddress:@""] UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char hashedChars[CC_SHA256_DIGEST_LENGTH];

    // Hash pointer to hashedChars array
    CC_SHA256(ptr, CC_SHA256_DIGEST_LENGTH, hashedChars);
    
    // Convert SHA256 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString string];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        
        [output appendFormat:@"%02x",hashedChars[i]];
        
    } 
    
    // add dashes
    [output insertString:@"-" atIndex:8];
    [output insertString:@"-" atIndex:13];
    [output insertString:@"-" atIndex:18];
    [output insertString:@"-" atIndex:23];
    [output insertString:@"-" atIndex:36];
    [output insertString:@"-" atIndex:49];
    [output insertString:@"-" atIndex:54];
    [output insertString:@"-" atIndex:59];
    [output insertString:@"-" atIndex:64];
    
    return [output uppercaseString];
    
}

@end
