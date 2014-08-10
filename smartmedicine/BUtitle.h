//
//  BUtitle.h
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BUtitle : NSObject

+(BUtitle*)getInstance;

+(UIImage*)loadImage:(NSString*)imageName;

+(NSURL*)makeURL:(NSString*)path;

-(void)startRead;

@end
