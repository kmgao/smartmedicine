//
//  UIDevice+screenType.h
//  BaiduPlace
//
//  Created by neusoft on 12-10-9.
//  Copyright (c) 2012 Neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    UIDeviceScreenType_iPhoneStandard         = 1,    // iPhone 1,3,3GS Standard Display  (320x480px)
    UIDeviceScreenType_iPhoneRetina35Inch     = 2,    // iPhone 4,4S Retina Display 3.5"  (640x960px)
    UIDeviceScreenType_iPhoneRetina4Inch      = 3,    // iPhone 5 Retina Display 4"       (640x1136px)
    UIDeviceScreenType_iPadStandard           = 4,    // iPad 1,2 Standard Display        (1024x768px)
    UIDeviceScreenType_iPadRetina             = 5     // iPad 3 Retina Display            (2048x1536px)
}UIDeviceScreenType;

@interface UIDevice (screenType)

+ (UIDeviceScreenType)currentScreenType;

@end
