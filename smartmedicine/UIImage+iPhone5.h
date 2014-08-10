//
//  UIImage+iPhone5.h
//  UIVoice
//
//  Created by Yong on 13-3-18.
//  Copyright (c) 2013年 coson. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImage (iPhone5)

/**
 @功能:直接从NSBundle中读取图片，不会缓存
 @参数:NSString   图片名称，必须代后缀名
 @返回值:图片对象
 */
+(UIImage*)imagePathed:(NSString*)imageName;

@end
