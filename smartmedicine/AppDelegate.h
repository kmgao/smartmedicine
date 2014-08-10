//
//  AppDelegate.h
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import <UIKit/UIKit.h>

//apple id: com.sudyhealth.medicine
@class  NDataModel;

@interface AppDelegate : UIResponder <UIApplicationDelegate>


+(AppDelegate*)shareInstance;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) NDataModel *dataModel;


-(void)OpenURL:(NSURL*)url;


@end
