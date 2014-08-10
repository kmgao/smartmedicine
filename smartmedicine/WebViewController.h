//
//  WebViewController.h
//  smartmedicine
//
//  Created by kmgao on 14-1-8.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "BaseViewController.h"

@interface WebViewController : BaseViewController


-(void)openURL:(NSURL*)url;
-(id)initWithTitle:(NSString*)title;

@end
