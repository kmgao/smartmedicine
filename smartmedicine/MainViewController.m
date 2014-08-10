//
//  ViewController.m
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "MainViewController.h"
#import "FoundationViewController1.h"
#import "ClinicalViewController2.h"
#import "DiseaseViewController3.h"
#import "ClinicalSkillViewController4.h"
#import "MockExamViewController5.h"
#import "HandbookViewController6.h"
#import "GridButtonItem.h"
#import  "WebViewController.h"

//default 108*108
#define kButtonSize    CGSizeMake(90,90)


@interface MainViewController ()<GridButtonItemDelegate>

@end

@implementation MainViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initLayoutUI];
}

-(void)initLayoutUI
{
    UIImageView *viewBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, IPHONE_SCREEN_HEIGHT)];
    viewBg.image = [UIImage imagePathed:@"bg_main.png"];
  
    [self.view addSubview:viewBg];
    
    UIImageView  *barImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, kNAVIGATION_BARH)];
    barImgView.image = [UIImage imageNamed:@"bg_top_bar_1.png"];
    [self.view  addSubview:barImgView];
    
    UIImage *logimage = [UIImage imageNamed:@"logo.png"];
    UIImageView  *logImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, (kNAVIGATION_BARH - logimage.size.height)/2, logimage.size.width, logimage.size.height)];
    logImgView.image = logimage;
    
    [self.view  addSubview:logImgView];
    
    
    UILabel  *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, kNAVIGATION_BARH)];
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.text =  @"智能医学宝典";
    title.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:title];
    
    CGSize btnSize = CGSizeMake(90, 90+kTextHeight);
    int XX = 30;
    CGRect btnFrame = {{XX,20+kNAVIGATION_BARH},btnSize};
    
    GridButtonItem *item1 = [[GridButtonItem alloc] initWithFrame:btnFrame btnBgImg:@"image1.png" btnImage: @"btn_main_normal.png" btnLigthImg: @"btn_main_pressed.png" bottomLabel:@"基础教程" andTag:1];
    item1.delegate = self;
    [self.view addSubview:item1];
    
    
    btnFrame.origin.x = 320 -btnSize.width - XX;
    GridButtonItem *item2 = [[GridButtonItem alloc] initWithFrame:btnFrame btnBgImg:@"image2.png" btnImage: @"btn_main_normal.png" btnLigthImg: @"btn_main_pressed.png" bottomLabel:@"临床教程" andTag:2];
    item2.delegate = self;
    [self.view addSubview:item2];
    
    btnFrame.origin.x = XX;
    btnFrame.origin.y += btnSize.height + 10;
    GridButtonItem *item3 = [[GridButtonItem alloc] initWithFrame:btnFrame btnBgImg:@"image3.png" btnImage: @"btn_main_normal.png" btnLigthImg: @"btn_main_pressed.png" bottomLabel:@"系统疾病解析" andTag:3];
    item3.delegate = self;
    [self.view addSubview:item3];
    
    btnFrame.origin.x = 320 -btnSize.width - XX;
    GridButtonItem *item4 = [[GridButtonItem alloc] initWithFrame:btnFrame btnBgImg:@"image4.png" btnImage: @"btn_main_normal.png" btnLigthImg: @"btn_main_pressed.png" bottomLabel:@"临床技能" andTag:4];
    item4.delegate = self;
    [self.view addSubview:item4];
    
    btnFrame.origin.x = XX;
    btnFrame.origin.y += btnSize.height + 10;
    GridButtonItem *item5 = [[GridButtonItem alloc] initWithFrame:btnFrame btnBgImg:@"image5.png" btnImage: @"btn_main_normal.png" btnLigthImg: @"btn_main_pressed.png" bottomLabel:@"模拟考试" andTag:5];
    item5.delegate = self;
    [self.view addSubview:item5];
    
    btnFrame.origin.x = 320 -btnSize.width - XX;
    GridButtonItem *item6 = [[GridButtonItem alloc] initWithFrame:btnFrame btnBgImg:@"image6.png" btnImage: @"btn_main_normal.png" btnLigthImg: @"btn_main_pressed.png" bottomLabel:@"临床手册" andTag:6];
    item6.delegate = self;
    [self.view addSubview:item6];     
}


-(void)clickButtonItem:(int)index
{ 
    if(index == 1 ){
        [self button1:nil];
    }
    if(index == 2 ){
       [self button2:nil];
    }
    if(index == 3 ){
        [self button3:nil];
    }
    if(index == 4 ){
        [self button4:nil];
    }
    if(index == 5 ){
//       [self button5:nil];
         [self clickTabNaviButton];
    }
    if(index == 6 ){
       [self button6:nil];
    }    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)button1:(id)sender
{  
   FoundationViewController1 *controler = [[FoundationViewController1 alloc] init];
    [self.navigationController pushViewController:controler animated:YES];
}
-(void)button2:(id)sender
{
    ClinicalViewController2 *controler = [[ClinicalViewController2 alloc] init];
    
    [self.navigationController pushViewController:controler animated:YES];
}
-(void)button3:(id)sender
{
    NSArray  *pArray = [[AppDelegate shareInstance] dataModel].diseaseArray;
    NSDictionary *dic = pArray[0];
    NSString *mTitle = [dic allKeys][0];
    WebViewController *webViewCtrl = [[WebViewController alloc] initWithTitle:mTitle];
    [self.navigationController pushViewController:webViewCtrl animated:YES];
    [webViewCtrl openURL:[BUtitle makeURL:[dic objectForKey:mTitle]]];
}
-(void)button4:(id)sender
{
    ClinicalSkillViewController4 *controler = [[ClinicalSkillViewController4 alloc]init];     
    [self.navigationController pushViewController:controler animated:YES];
}

-(void)button5:(id)sender
{
    MockExamViewController5 *controler = [[MockExamViewController5 alloc] init];
    
    [self.navigationController pushViewController:controler animated:YES];
}
-(void)button6:(id)sender
{
    HandbookViewController6 *controler = [[HandbookViewController6 alloc] init];
    
    [self.navigationController pushViewController:controler animated:YES];

}



@end
