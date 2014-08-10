//
//  ClinicalViewController2.m
//  smartmedicine
//
//  Created by kmgao on 13-12-30.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "ClinicalViewController2.h"
#import "GridScrollView.h"
#import "ListViewController.h"

@interface ClinicalViewController2 ()
{
     NSArray *itemTitleArrays;
}
@end

@implementation ClinicalViewController2

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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.view.frame = CGRectMake(0, 0, 320, IPHONE_SCREEN_HEIGHT);
    
    UIImage *image = nil;
    image = [UIImage imagePathed:@"bg_secondmenu.png"];
    UIImageView *bgImgage = [[UIImageView alloc] initWithImage:image];
    
    [bgImgage setFrame:self.view.frame];
    [self.view addSubview:bgImgage];
    
    [self.navBar setTitle:@"临床教程" withColor:[UIColor blackColor]];
    [self.navBar setLeftButton:@"btn_back_normal.png" andHight:@"btn_back_pressed.png"];
    [self.view addSubview:self.navBar];
    
    
    NSArray *btnArrays = [NSArray arrayWithObjects:@"b_01.png",@"b_02.png",@"b_03.png",
                          @"b_04.png",@"b_05.png",@"b_06.png",
                          @"b_07.png",@"b_08.png",@"b_09.png",
                          @"b_10.png",@"b_11.png",@"b_12.png",
                          @"b_13.png",@"b_14.png",nil];
    
    itemTitleArrays = [NSArray arrayWithObjects:@"内科学",@"外科学",@"妇产科",
                       @"儿科",@"诊断学",@"皮肤性病学",
                       @"耳鼻咽喉科",@"眼科",@"急诊医学",
                       @"医学影像",@"精神病学",@"传染病",
                       @"中医学基础",@"中医学病症的诊断与治疗",nil];
    
    NSString *btnBgName = @"bg_book.png";//bg_courselist_item@2x
    NSString *gridBgName = @"bg_courselist_item.png";
    
    GridScrollView *gridView = [[GridScrollView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH, 320, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH-kTabNaviBarH)];
    
    [gridView setWithPos:CGPointMake(0, kNAVIGATION_BARH) btnImages:btnArrays btnBgImg:btnBgName rowBg:gridBgName delegate:self];
    [self.view addSubview:gridView];
    
    [self addTabNaviBar];
}


-(void)clickButtonItem:(int)index
{
    NSArray  *listArray = [[[AppDelegate shareInstance] dataModel] clinicalArray];
    NSDictionary  *listDic = [listArray objectAtIndex:index];
    NSArray    *subArray = [listDic allValues][0];
    
    ListViewController *listController = [[ListViewController alloc] initWithArray:subArray andTitle:itemTitleArrays[index]];
    [self.navigationController pushViewController:listController animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
