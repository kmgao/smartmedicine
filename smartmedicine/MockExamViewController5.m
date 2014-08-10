//
//  MockExamViewController5.m
//  smartmedicine
//
//  Created by kmgao on 13-12-30.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "MockExamViewController5.h"

#import "GridScrollView.h"

@interface MockExamViewController5 ()

@end

@implementation MockExamViewController5

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.view.frame = CGRectMake(0, 0, 320, IPHONE_SCREEN_HEIGHT);
    
    UIImage *image = nil;
    image = [UIImage imagePathed:@"bg_secondmenu.png"];
    UIImageView *bgImgage = [[UIImageView alloc] initWithImage:image];
    
    [bgImgage setFrame:self.view.frame];
    [self.view addSubview:bgImgage];
    
    [self.navBar setTitle:@"模拟考试" withColor:[UIColor blackColor]];
    [self.navBar setLeftButton:@"btn_back_normal.png" andHight:@"btn_back_pressed.png"];
    [self.view addSubview:self.navBar];
    
    
    NSArray *btnArrays = [NSArray arrayWithObjects:@"e_01.png",@"e_02.png",@"e_03.png",
                          @"e_04.png",@"e_05.png",@"e_06.png",
                          @"e_07.png",@"e_08.png",@"e_09.png",
                          @"e_10.png",@"e_11.png",@"e_12.png",
                          @"e_13.png",nil];
    
    NSString *btnBgName = @"bg_book.png";//bg_courselist_item@2x
    NSString *gridBgName = @"bg_courselist_item.png";
    
    GridScrollView *gridView = [[GridScrollView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH, 320, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH-kTabNaviBarH)];
    
    [gridView setWithPos:CGPointMake(0, kNAVIGATION_BARH) btnImages:btnArrays btnBgImg:btnBgName rowBg:gridBgName delegate:self];
    [self.view addSubview:gridView];
    
    [self addTabNaviBar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
