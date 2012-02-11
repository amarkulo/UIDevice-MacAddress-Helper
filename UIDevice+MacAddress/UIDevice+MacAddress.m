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


@end
