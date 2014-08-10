//
//  BaseViewController.h
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNavigationBar.h"
#import "UIDevice+screenType.h"
#import "UIImage+iPhone5.h"
#import "UIImage+Load.h"


#define isPhone568 ([UIDevice currentScreenType] == UIDeviceScreenType_iPhoneRetina4Inch)
#define isIOS7     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define kIPHONE_SCREEN_WIDTH     320
#define kIPHONE_STATUS_BARH      20
#define kIPHONE_SCREEN_FULLHEIGHT    480
#define kIPHONE_SCREEN_HEIGHT   460
#define kNAVIGATION_BARH   49
#define IPHONE_SCREEN_HEIGHT (isPhone568 ? (568 - kIPHONE_STATUS_BARH): (480-kIPHONE_STATUS_BARH))

#define kTabNaviBarH   44

@interface BaseViewController : UIViewController<BNavigationBarDelegate>

@property(nonatomic,readonly)  BNavigationBar *navBar;

-(void)addTabNaviBar;
-(void)clickTabNaviButton;

@end
