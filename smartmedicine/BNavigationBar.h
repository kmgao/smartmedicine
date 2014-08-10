//
//  BNavigationBar.h
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BNavigationBarDelegate<NSObject>

@optional
-(void)clickLeftButton;
-(void)clickRightButton;
@end


@interface BNavigationBar : UIView

@property(nonatomic,assign) id<BNavigationBarDelegate>  delegate;
@property(nonatomic,readonly) UIButton   *leftButton;
@property(nonatomic,readonly) UIButton   *rightButton; 

-(UILabel*)setTitle:(NSString*)title withColor:(UIColor*)color;
-(void)SetNaviBackground:(NSString*)backImgName;
-(void)setLeftButton:(NSString*)imageName andHight:(NSString*)hightImgName;
-(void)setRightButton:(NSString*)imageName andHight:(NSString*)hightImgName;


@end
