//
//  GridButtonItem.m
//  smartmedicine
//
//  Created by kmgao on 14-1-1.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "GridButtonItem.h" 

@implementation GridButtonItem
@synthesize delegate;
 


-(id)initWithFrame:(CGRect)frame
            btnBgImg:(NSString*)btnBgImg
            btnImage:(NSString*)btnImg
         btnLigthImg:(NSString*)ligthImg
         bottomLabel:(NSString*)text
              andTag:(int)tag
{
    self = [super initWithFrame:frame];
    
    if(self){
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = tag;
        UIImage *btnBgImgImage = [UIImage imageNamed:btnBgImg];
        [button setBackgroundImage:[UIImage imageNamed:btnImg]  forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:ligthImg]  forState:UIControlStateHighlighted];
        [button setImage:btnBgImgImage forState:UIControlStateNormal];         
     
        [button setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-kTextHeight)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, (frame.size.height-kTextHeight), frame.size.width, kTextHeight)];
        label.backgroundColor = [UIColor clearColor];
        label.text = text;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
    }
    
    return self;
    
}

-(void)buttonClick:(id)sender
{
    if([sender isKindOfClass:[UIButton class]]){
    
        int index = ((UIButton*)sender).tag;
        
        if([self.delegate respondsToSelector:@selector(clickButtonItem:)]){
            [self.delegate clickButtonItem:index];
        }
    }
}




@end
