//
//  BaseViewController.m
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "BaseViewController.h"
#import "WebViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize navBar = _navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(void)loadView
//{
//    [super loadView];
//    UIImageView *bgImgView =[[UIImageView alloc] initWithImage:[BUtitle loadImage:@"bg_secondmenu.png"]];
//    [bgImgView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:bgImgView];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIImageView *bgImgView =[[UIImageView alloc] initWithImage:[BUtitle loadImage:@"bg_main_bottom.png"]];
//    [bgImgView setFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:bgImgView];
    
    _navBar = [[BNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, kNAVIGATION_BARH)];
    _navBar.delegate = self;
    [_navBar SetNaviBackground:@"bg_top_bar_2.png"];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    if ( isIOS7 )
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    if(isIOS7)
    {
        self.navigationController.navigationBar.translucent = NO;
        self.view.bounds = CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height );
    }
#endif 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickLeftButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton
{
    //implement by subClass
}


-(void)addTabNaviBar
{ 
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lButton.frame = CGRectMake(0, IPHONE_SCREEN_HEIGHT - kTabNaviBarH, kIPHONE_SCREEN_WIDTH/2, kTabNaviBarH);
    
    
    [lButton setBackgroundImage:[BUtitle loadImage:@"btn_dictionary_normal.png"] forState:UIControlStateNormal];
    [lButton setBackgroundImage:[BUtitle loadImage:@"btn_dictionary_pressed.png"] forState:UIControlStateHighlighted];
    [lButton addTarget:self action:@selector(clickTabNaviLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lButton];
    
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setBackgroundImage:[BUtitle loadImage:@"btn_mencine_normal.png"] forState:UIControlStateNormal];
    [rButton setBackgroundImage:[BUtitle loadImage:@"btn_mencine_pressed.png"] forState:UIControlStateHighlighted];
    rButton.frame = CGRectMake(kIPHONE_SCREEN_WIDTH/2, IPHONE_SCREEN_HEIGHT - kTabNaviBarH, kIPHONE_SCREEN_WIDTH/2, kTabNaviBarH);
    [rButton addTarget:self action:@selector(clickTabNaviRightButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rButton];
    
}

-(void)clickTabNaviButton
{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"功能未启用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alertView show];
    
    //    WebViewController *webCtrl = [[WebViewController alloc] init];
    //    NSString *mURL = @"";
    //    [webCtrl openURL:[NSURL URLWithString:mURL]];
}

-(void)clickTabNaviLeftButton
{
//    WebViewController *webCtrl = [[WebViewController alloc] init];
//    NSString *mURL = @"";
//    [webCtrl openURL:[NSURL URLWithString:mURL]];
    [self clickTabNaviButton];
}
-(void)clickTabNaviRightButton
{
//    WebViewController *webCtrl = [[WebViewController alloc] init];
//    NSString *mURL = @"";
//    [webCtrl openURL:[NSURL URLWithString:mURL]];
     [self clickTabNaviButton];
}


@end
