//
//  BNavigationBar.m
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "BNavigationBar.h"

#define kNAVIBAR_H   49

#define kLeftButtonPos    CGRectMake(16,8,33,32)
#define kRightButtonPos   CGRectMake(320-16-50,8,33,32)

@interface BNavigationBar()
{
    UIImageView    *bgImgView;
    UILabel        *titleLable;
    UIButton       *_leftButton;
    UIButton       *_rightButton;
}
@end

@implementation BNavigationBar

@synthesize leftButton= _leftButton,rightButton =_rightButton;

@synthesize delegate;

//
//-(void)dealloc
//{
//    [bgImgView release];
//    [titleLable release];
//    [leftButton release];
//    [rightButton release];
//    [super dealloc];
//}

- (id)initWithFrame:(CGRect)frame
{
    CGRect mFrame = CGRectMake(0, 0, 320, kNAVIBAR_H);
    self = [super initWithFrame:mFrame];
    if (self) {
        bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:bgImgView];
        
        titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [titleLable setBackgroundColor:[UIColor clearColor]];
        [titleLable sizeToFit];
        titleLable.textAlignment = NSTextAlignmentCenter;
        [titleLable setTextColor:[UIColor blackColor]];
        [titleLable setFont:[UIFont boldSystemFontOfSize:16]];
        titleLable.frame = CGRectMake(kLeftButtonPos.origin.x, 0, 320-kLeftButtonPos.origin.x, kNAVIBAR_H);
        [self addSubview:titleLable];       
        
    }
    return self;
}

-(void)clickLButton
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickLeftButton)])
    {
        [self.delegate clickLeftButton];
    }
}

-(void)clickRButton
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickRightButton)])
    {
        [self.delegate clickRightButton];
    }
}


-(UILabel*)setTitle:(NSString*)title withColor:(UIColor*)color
{
    titleLable.text = title;
    if(color != nil)
        [titleLable setTextColor:color];
    return titleLable;
}
-(void)setLeftButton:(NSString*)imageName andHight:(NSString*)hightImgName
{
//    UIImage *img = [BUtitle loadImage:imageName];
//    CGRect _frame = CGRectMake(kLeftButtonPos.origin.x, kLeftButtonPos.origin.y, img.size.width, img.size.height);
    if(_leftButton == nil)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = kLeftButtonPos;
        [_leftButton setBackgroundColor:[UIColor clearColor]];
        [_leftButton addTarget:self action:@selector(clickLButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
    }
    [_leftButton setImage:[BUtitle loadImage:imageName] forState:UIControlStateNormal];
    if(hightImgName)
    {
        [_leftButton setImage:[BUtitle loadImage:hightImgName] forState:UIControlStateHighlighted];
    }
}
-(void)setRightButton:(NSString*)imageName andHight:(NSString*)hightImgName
{
    if(nil == _rightButton)
    {
        _rightButton = [[UIButton alloc] initWithFrame:kRightButtonPos];
        [_rightButton setBackgroundColor:[UIColor clearColor]];
        [_rightButton addTarget:self action:@selector(clickRButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
    }
    [_rightButton setImage:[BUtitle loadImage:imageName] forState:UIControlStateNormal];
    if(hightImgName)
    {
        [_rightButton setImage:[BUtitle loadImage:hightImgName] forState:UIControlStateHighlighted]; 
    }
}

-(void)SetNaviBackground:(NSString*)backImgName
{
    bgImgView.image = [BUtitle loadImage:backImgName];
}



 

@end
