//
//  UIDevice+MacAddress.h
//
//  Created by Amar Kulo on 2012-02-11.
//  Copyright (c) 2012 iRget Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (MacAddress)

- (NSString *) macAddress:(NSString *)delimiter;
- (NSString *)uniqueDeviceIdentifier; 

@end
