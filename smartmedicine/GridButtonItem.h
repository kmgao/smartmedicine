//
//  GridButtonItem.h
//  smartmedicine
//
//  Created by kmgao on 14-1-1.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTextHeight     30 

@protocol GridButtonItemDelegate <NSObject>

-(void)clickButtonItem:(int)index;

@end

@interface GridButtonItem : UIView

@property(nonatomic,assign) id<GridButtonItemDelegate> delegate;

-(id)initWithFrame:(CGRect)frame
            btnBgImg:(NSString*)btnBgImg
            btnImage:(NSString*)btnImg
         btnLigthImg:(NSString*)ligthImg
         bottomLabel:(NSString*)text
              andTag:(int)tag;


@end
