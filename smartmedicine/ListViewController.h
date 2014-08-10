//
//  ListViewController.h
//  smartmedicine
//
//  Created by kmgao on 14-1-8.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "BaseViewController.h"

@interface ListViewController : BaseViewController

-(id)initWithArray:(NSArray*)listItems andTitle:(NSString*)title;

-(void)setNaviBarTitle:(NSString *)title;

@property(nonatomic,retain) NSMutableArray  *listItems;
@property(nonatomic,copy)   NSString  *naviTitle;

@end
