//
//  HandbookViewController6.m
//  smartmedicine
//
//  Created by kmgao on 13-12-30.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "HandbookViewController6.h"

#import "GridScrollView.h"
#import "WebViewController.h"

@interface HandbookViewController6 ()
{
//    NSArray *itemTitleArrays;
}
@end

@implementation HandbookViewController6

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
    
    [self.navBar setTitle:@"临床手册" withColor:[UIColor blackColor]];
    [self.navBar setLeftButton:@"btn_back_normal.png" andHight:@"btn_back_pressed.png"];
    [self.view addSubview:self.navBar];
    
    
    NSArray *btnArrays = [NSArray arrayWithObjects:@"f_01.png",@"f_02.png",@"f_03.png",
                          @"f_04.png",@"f_05.png",nil];
//    itemTitleArrays = [NSArray arrayWithObjects:@"实习大纲",@"药品目录",@"临床检验",
//                       @"医学人文法规",@"医学中英文对照表",nil];
    
    NSString *btnBgName = @"bg_book.png";//bg_courselist_item@2x
    NSString *gridBgName = @"bg_courselist_item.png";
    
    GridScrollView *gridView = [[GridScrollView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH, 320, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH-kTabNaviBarH)];
    
    [gridView setWithPos:CGPointMake(0, kNAVIGATION_BARH) btnImages:btnArrays btnBgImg:btnBgName rowBg:gridBgName delegate:self];
    [self.view addSubview:gridView];
    
    [self addTabNaviBar];
    
}


-(void)clickButtonItem:(int)index
{
    NSArray  *listArray = [[[AppDelegate shareInstance] dataModel] handleBookArray];
    NSDictionary  *listDic = [listArray objectAtIndex:index];
    NSObject  *obj = [listDic allValues][0];
    if([obj isKindOfClass:[NSString class]]){
        NSLog(@"内容不是数据>>:%@",obj);
        
        WebViewController *webViewCtrl = [[WebViewController alloc] initWithTitle:(NSString*)obj];//10
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
