//
//  GridScrollView.m
//  smartmedicine
//
//  Created by kmgao on 14-1-1.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "GridScrollView.h"

#define  kColumnNum    3

#define  kRowHeight    8 

#define  kLRGrapWid    20 


@interface GridScrollView()
{
    CGFloat    _contentHeight;
}

@end


@implementation GridScrollView

@synthesize mDelegate;
@synthesize contentHeight = _contentHeight;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setWithPos:(CGPoint) pos btnImages:(NSArray*)btnImgNames btnBgImg:(NSString*)bgName rowBg:(NSString*)rowBg delegate:(id)del
{
    if(btnImgNames == nil || btnImgNames.count <= 0) return ;
 
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.mDelegate = del;
    
    int counts = btnImgNames.count;
    
    int rows = (counts%kColumnNum == 0) ? (counts/kColumnNum) : (counts/kColumnNum + 1);
    
    NSString *imgName = btnImgNames[0];
    UIImage  *firstImage = [UIImage imageNamed:imgName];
    CGSize   firstSize = firstImage.size;
    
    _contentHeight = (120+kRowHeight) * rows;
    
    CGFloat columnGrap = (320-firstSize.width*kColumnNum - kLRGrapWid*2)/(kColumnNum-1);
    
    
    UIImage  *rowBgImg = [UIImage imageNamed:rowBg];
    UIImage  *btnBgImg = [UIImage imageNamed:bgName];
    CGPoint  point = CGPointMake(0,0);
    CGPoint  btnPos = CGPointMake(kLRGrapWid,0);
    int j = 0;
    for(int i = 0 ;i < rows; i++)
    {
        if(j > counts-1) break;
        
        UIImageView  *rowBgView = [[UIImageView alloc] initWithImage:rowBgImg];
//        rowBgView.frame = CGRectMake(0, point.y, 320, rowBgImg.size.height);
         rowBgView.frame = CGRectMake(0, point.y, 320, 120);
        [self addSubview:rowBgView];
        
        NSString  *btnName1 = btnImgNames[j];
        UIButton  *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.tag = j;
        
        button1.frame = CGRectMake(btnPos.x, btnPos.y, btnBgImg.size.width, btnBgImg.size.height);
        
        [button1 setBackgroundImage:btnBgImg forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed:btnName1] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
        
        j++;
        
        if(j > counts-1) break;
        
        btnPos.x += btnBgImg.size.width + columnGrap;
        
        NSString  *btnName2 = btnImgNames[j];
        UIButton  *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.tag = j;
        
        button2.frame = CGRectMake(btnPos.x, btnPos.y, btnBgImg.size.width, btnBgImg.size.height);
        
        [button2 setBackgroundImage:btnBgImg forState:UIControlStateNormal];
        [button2 setImage:[UIImage imageNamed:btnName2] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
        
        j++;
        
       if(j > counts-1) break;
        
        btnPos.x += btnBgImg.size.width + columnGrap;
        
        NSString  *btnName3 = btnImgNames[j];
        UIButton  *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        button3.tag = j;
        
        button3.frame = CGRectMake(btnPos.x, btnPos.y, btnBgImg.size.width, btnBgImg.size.height);
        
        [button3 setBackgroundImage:btnBgImg forState:UIControlStateNormal];
        [button3 setImage:[UIImage imageNamed:btnName3] forState:UIControlStateNormal];
        [button3 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button3];
       
        btnPos.x = kLRGrapWid;
        point.y += 120 + kRowHeight;
        btnPos.y = point.y ;
        j++;
    }
    
//    CGRect _frame = CGRectMake(pos.x, pos.y, 320, self.frame.size.height);
//    [self setFrame:_frame];
    self.contentSize = CGSizeMake(self.frame.size.width, _contentHeight);
}


-(void)clickButton:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if([self.mDelegate respondsToSelector:@selector(clickButtonItem:)]){
        [self.mDelegate clickButtonItem:button.tag];
    }
        
}


@end
