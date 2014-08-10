//
//  ClinicalSkillViewController4.m
//  smartmedicine
//
//  Created by kmgao on 13-12-30.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "ClinicalSkillViewController4.h"

#import "GridScrollView.h"
#import "ListViewController.h"
#import "WebViewController.h"

@interface ClinicalSkillViewController4 ()
{
   NSArray *itemTitleArrays;
}
@end

@implementation ClinicalSkillViewController4

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
    
    [self.navBar setTitle:@"临床技能" withColor:[UIColor blackColor]];
    [self.navBar setLeftButton:@"btn_back_normal.png" andHight:@"btn_back_pressed.png"];
    [self.view addSubview:self.navBar];
    
    
    NSArray *btnArrays = [NSArray arrayWithObjects:@"d_01.png",@"d_02.png",@"d_03.png",
                          @"d_04.png",@"d_05.png",@"d_06.png",
                          @"d_07.png",@"d_08.png",@"d_09.png",
                          @"d_10.png",@"d_11.png",nil];
    
    itemTitleArrays = [NSArray arrayWithObjects:@"临床诊断",@"24项临床技能",@"心肺复苏",
                       @"心脏对比听诊",@"心电图",@"CT诊断图库",
                       @"X线诊断图库",@"心电图诊断图库",@"胃镜诊断图库",
                       @"骨髓诊断图库",@"组织病理学图库",nil];
    
    NSString *btnBgName = @"bg_book.png";//bg_courselist_item@2x
    NSString *gridBgName = @"bg_courselist_item.png";
    
    GridScrollView *gridView = [[GridScrollView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH, 320, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH-kTabNaviBarH)];
    
    [gridView setWithPos:CGPointMake(0, kNAVIGATION_BARH) btnImages:btnArrays btnBgImg:btnBgName rowBg:gridBgName delegate:self];
    [self.view addSubview:gridView];
    
    [self addTabNaviBar];
}


-(void)clickButtonItem:(int)index
{
    NSArray  *listArray = [[[AppDelegate shareInstance] dataModel] clinicalSkillArray];
    NSDictionary  *listDic = [listArray objectAtIndex:index];
    NSObject  *obj = [listDic allValues][0];
    if([obj isKindOfClass:[NSArray class]]){
        NSArray    *subArray = [listDic allValues][0];
        ListViewController *listController = [[ListViewController alloc] initWithArray:subArray andTitle:itemTitleArrays[index]];
        [self.navigationController pushViewController:listController animated:YES];
    }
    else if([obj isKindOfClass:[NSString class]]){
        NSLog(@"内容不是数据>>:%@",obj);
        
        WebViewController *webViewCtrl = [[WebViewController alloc] initWithTitle:itemTitleArrays[index]];//10
        [self.navigationController pushViewController:webViewCtrl animated:YES];
        [webViewCtrl openURL:[BUtitle makeURL:(NSString*)obj]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
