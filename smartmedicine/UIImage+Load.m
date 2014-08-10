//
//  UIImage+Load.m
//  TalkingFlower
//
//  Created by kmgao on 14-1-3.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "UIImage+Load.h"

@implementation UIImage(Load)

+(UIImage*)LoadImage:(NSString*)imageName
{
    //判断是否为iphone5
    BOOL isiPhone5 = [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO;
    //    图片文件名称
    NSString *strPath = nil;
    UIImage *img = nil;
    if (isiPhone5) { //iPhone5加载图片的特殊处理
        NSString *suffixName  = nil;
        if ([imageName hasSuffix:@".png"]) {
            suffixName = @".png";
        }else if([imageName hasSuffix:@".jpg"]){
            suffixName = @".jpg";
        }
        NSString *filenameString = [imageName substringToIndex:[imageName length] - [suffixName length]];
        strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-568h@2x%@",filenameString,suffixName]];
        if([[NSFileManager defaultManager] fileExistsAtPath:strPath]){
            strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-568h%@",filenameString,suffixName]];
            img = [UIImage imageWithContentsOfFile:strPath];
        }
        else{
           //    避免使用imageWithContentsOfFile:方法找不到图片的情形
            img = [UIImage imageNamed:imageName];
        }
    }else{
        img = [UIImage imageNamed:imageName];
    }
    return img;
}

@end
