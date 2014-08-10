//
//  GridScrollView.h
//  smartmedicine
//
//  Created by kmgao on 14-1-1.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GridButtonItemDelegate <NSObject>

-(void)clickButtonItem:(int)index;

@end

@interface GridScrollView : UIScrollView

@property(nonatomic,assign) id<GridButtonItemDelegate> mDelegate;

@property(nonatomic)  CGFloat contentHeight;

-(void)setWithPos:(CGPoint) pos btnImages:(NSArray*)btnImgNames btnBgImg:(NSString*)bgName rowBg:(NSString*)rowBg delegate:(id)del;

@end
