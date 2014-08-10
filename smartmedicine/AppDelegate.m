//
//  AppDelegate.m
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "NDataModel.h"
#import "LoginViewController.h"

@implementation AppDelegate

@synthesize dataModel=_dataModel;

//- (void)dealloc
//{
//    [_window release];
//    [_viewController release];
//    [super dealloc];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [[BUtitle getInstance] startRead];
    
    _dataModel = [[NDataModel alloc] init];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
//    self.viewController = [[MainViewController alloc] init];
    
    NSString *isAutoLoing = [[NSUserDefaults standardUserDefaults] objectForKey:@"isAutoLogin"];
    if(isAutoLoing && [isAutoLoing isEqualToString:@"1"])
//    if(1)
    {
         self.viewController = [[MainViewController alloc] init];
    }
    else
    {
        self.viewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    UINavigationController  *mainNavi = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [mainNavi setNavigationBarHidden:YES];
    
    self.window.rootViewController = mainNavi;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+(AppDelegate*)shareInstance{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

-(void)OpenURL:(NSURL*)url{
    if(nil == url) return ;
  
    [[UIApplication sharedApplication] openURL:url];
}


@end
