//
//  UIImage+iPhone5.m
//  UIVoice
//
//  Created by Yong on 13-3-18.
//  Copyright (c) 2013年 coson. All rights reserved.
//

#import "UIImage+iPhone5.h"


@implementation UIImage (iPhone5)
/**
 @功能:直接从NSBundle中读取图片，不会缓存
 @参数:NSString   图片名称，必须代后缀名
 @返回值:图片对象
 */
+(UIImage*) imagePathed:(NSString*)imageName
{
//判断是否为iphone5
    BOOL isiPhone5 = [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO;
    
//    图片文件名称
    NSString *strPath = nil;
    if (isiPhone5) { //iPhone5加载图片的特殊处理
        NSString *suffixName  = nil;
        if ([imageName hasSuffix:@".png"]) {
            suffixName = @".png";
        }else if([imageName hasSuffix:@".jpg"]){
            suffixName = @".jpg";
        }
        NSString *filenameString = [imageName substringToIndex:[imageName length] - [suffixName length]];
        strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-568h%@",filenameString,suffixName]];
    }else{
        strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imageName];
    }
    UIImage *img = [UIImage imageWithContentsOfFile:strPath];
    
//    避免使用imageWithContentsOfFile:方法找不到图片的情形
    if (!img)
    {
        img = [UIImage imageNamed:imageName];
    }
    return img;
}

@end
